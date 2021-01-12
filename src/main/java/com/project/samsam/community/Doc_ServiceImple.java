package com.project.samsam.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.DocMapper;


@Service
public class Doc_ServiceImple implements Doc_Service {
	@Autowired(required=false) 
	private SqlSession sqlSession;

	@Override
	public int boardInsert(DocVO vo) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		int res = docMapper.DocInsert(vo);
		
		return res;
	}

	@Override
	public int getListCount() {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		return docMapper.getListCount();
	}

	@Override
	public List<DocVO> getDocList(DocVO vo) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);

		return docMapper.getDocList(vo);
	}

	@Override
	public DocVO getView(int doc_no) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		docMapper.setReadCountUpdate(doc_no);
		DocVO vo = docMapper.getView(doc_no);
		return vo;
	}

}
