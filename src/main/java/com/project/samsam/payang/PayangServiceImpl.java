package com.project.samsam.payang;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PayangServiceImpl implements PayangService {

	@Autowired
	private PayangMapper mapper;
	
	@Override
	public List<PayangVO> list() throws Exception {
		return mapper.list();
	}

	@Override
	public void register(PayangVO payang) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PayangVO read(Integer p_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(PayangVO payang) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Integer p_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
