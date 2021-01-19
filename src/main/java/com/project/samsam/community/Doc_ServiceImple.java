package com.project.samsam.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.DocMapper;
import com.project.mapper.FdocMapper;



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

	@Override
	public int commentInsertService(DocReflyVO comment) throws Exception {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		comment.setCo_seq(1);
		docMapper.commentCount(comment);
		//String fdoc_ccontent = comment.getFdoc_ccontent();
		//fdoc_ccontent = fdoc_ccontent.replace("\r\n","<br>");//�ٹٲ� ġȯ
		//comment.setFdoc_ccontent(fdoc_ccontent);
		
		return docMapper.commentInsert(comment);
	}

	@Override
	public List<DocReflyVO> commentListService(int doc_no) throws Exception {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		
		return docMapper.commentList(doc_no);
	}

	@Override
	public int commentUpdateService(DocReflyVO comment) throws Exception {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
	
		return docMapper.commentUpdate(comment);
	}

	@Override
	public int commentReflyService(DocReflyVO comment) throws Exception {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		docMapper.commentReflyUpdate(comment);
		docMapper.commentCount(comment);
		comment.setCo_seq(comment.getCo_seq()+1);
		
		return docMapper.commentRefly(comment);
	}

	@Override
	public int commentDeleteService(DocReflyVO comment) throws Exception {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		docMapper.commentSub(comment);
		return docMapper.commentDelete(comment);
	}

	@Override
	public int deleteCount(int doc_cno) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		return docMapper.DeleteCount(doc_cno);
	}

	@Override
	public int deleteUpdate(int doc_cno) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		return docMapper.DeleteUpdate(doc_cno);
	}

	@Override
	public int boardUpdate(DocVO vo) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		
		return docMapper.DocUpdate(vo);
	}

	@Override
	public int boardDelete(DocVO vo) {
		DocMapper docMapper = sqlSession.getMapper(DocMapper.class);
		docMapper.DocDeleteComment(vo);
		return docMapper.DocDelete(vo);
	}

}
