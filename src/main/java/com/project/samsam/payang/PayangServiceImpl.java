package com.project.samsam.payang;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.PayangMapper;


@Service
public class PayangServiceImpl implements PayangService {

	@Autowired
	private PayangMapper mapper;
	
	@Autowired
	public PayangServiceImpl(SqlSession sqlSession) {
	     this.mapper = sqlSession.getMapper(PayangMapper.class);
	}
	@Override
	public List<PayangVO> list() throws Exception {
		return mapper.list();
	}

	@Override
	public void register(PayangVO payang) throws Exception {
		mapper.create(payang);
	}

	@Override
	public PayangVO read(Integer doc_no) throws Exception {
		return mapper.read(doc_no);
	}

	@Override
	public void modify(PayangVO payang) throws Exception {
		mapper.update(payang);
	}

	@Override
	public void remove(Integer doc_no) throws Exception {
		mapper.delete(doc_no);
	}
	@Override
	public int replyRegister(PayangReplyVO reply) throws Exception {
		return mapper.replyCreate(reply);
	}
	@Override
	public List<PayangReplyVO> replyList(Integer doc_no) throws Exception {
		List<PayangReplyVO> replyList = mapper.replyList(doc_no);
		
		
		for (int i=0; i<replyList.size(); i++) {
			int replyNo = replyList.get(i).getDoc_no();
//			List<PayangReplyVO> rereply = mapper.
		}
		
		return replyList;
	}
	@Override
	public void updateReadCount(PayangVO payang) throws Exception {
		mapper.updateReadCount(payang);
	}
	@Override
	public void replyRemove(Integer doc_cno) throws Exception {
		mapper.replyRemove(doc_cno);
	}
	@Override
	public int replyModify(PayangReplyVO paramVO) {
		return mapper.replyModify(paramVO);
	}
	@Override
	public int rereplyRegister(PayangReplyVO vo) throws Exception {
		System.out.println(vo);
		return mapper.rereplyInsert(vo);
	}

}
