package com.project.samsam.missing;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.MissingMapper;
import com.project.samsam.missing.MissingReplyVO;
import com.project.samsam.missing.MissingVO;
import com.project.samsam.payang.PayangReplyVO;

@Service
public class MissingServiceImpl implements MissingService {

	@Autowired
	private MissingMapper mapper;
	
	@Autowired
	public MissingServiceImpl(SqlSession sqlSession) {
	     this.mapper = sqlSession.getMapper(MissingMapper.class);
	}
	@Override
	public List<MissingVO> list() throws Exception {
		return mapper.list();
	}

	@Override
	public void register(MissingVO missing) throws Exception {
		mapper.create(missing);
	}

	@Override
	public MissingVO read(Integer doc_no) throws Exception {
		return mapper.read(doc_no);
	}

	@Override
	public void modify(MissingVO missing) throws Exception {
		mapper.update(missing);
	}

	@Override
	public void remove(Integer doc_no) throws Exception {
		mapper.delete(doc_no);
	}
	@Override
	public int replyRegister(MissingReplyVO reply) throws Exception {
		return mapper.replyCreate(reply);
	}
	@Override
	public List<MissingReplyVO> replyList(Integer doc_no) throws Exception {
		return mapper.replyList(doc_no);
	}
	@Override
	public void updateReadCount(MissingVO missing) throws Exception {
		mapper.updateReadCount(missing);
		
	}
	@Override
	public void replyRemove(Integer doc_cno) throws Exception {
		mapper.replyRemove(doc_cno);
		
	}
	@Override
	public int replyModify(MissingReplyVO paramVO) {
		return mapper.replyModify(paramVO);
	}
	



}
