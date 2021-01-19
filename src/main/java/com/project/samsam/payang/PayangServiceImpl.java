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
	public PayangVO read(Integer p_no) throws Exception {
		return mapper.read(p_no);
	}

	@Override
	public void modify(PayangVO payang) throws Exception {
		mapper.update(payang);
	}

	@Override
	public void remove(Integer p_no) throws Exception {
		mapper.delete(p_no);
	}

}
