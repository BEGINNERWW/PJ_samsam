package com.project.samsam.warning;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.WarningMapper;

@Service
public class Warning_ServiceImple implements Warning_Service {
	@Autowired(required=false) 
	private SqlSession sqlSession;
	
	@Override
	public int warningInsertService(WarningVO vo) {
		WarningMapper warningMapper = sqlSession.getMapper(WarningMapper.class);
		
		return warningMapper.warningInsert(vo);
	}

}
