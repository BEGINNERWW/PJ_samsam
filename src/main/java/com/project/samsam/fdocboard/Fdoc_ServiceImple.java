package com.project.samsam.fdocboard;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.FdocMapper;
import com.project.samsam.myfree.Myfree_doc_confirmVO;


@Service
public class Fdoc_ServiceImple implements Fdoc_Service {

	@Autowired(required=false) 
	private SqlSession sqlSession;
	
	@Override
	public int boardInsert(FdocVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		String fdoc_Code = Fdoc_Code();
		vo.setFdoc_code(fdoc_Code);
		int res = fdocMapper.FdocInsert(vo);
		return res;
	}
	
	public String Fdoc_Code() {
		
		
	    final char[] code_array = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
	                                    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
	                                    'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
	    
	    Random random = new Random(System.currentTimeMillis());
	    StringBuffer buf = new StringBuffer();
	    
	    for(int i = 0; i< 8; i++) {
	    	buf.append(code_array[random.nextInt(code_array.length)]);
	    }
	    
	    return buf.toString();
	
	}

	@Override
	public int getListCount() {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		int res = fdocMapper.getListCount();
		
		return res;
	}

	@Override
	public List<FdocVO> getFdocList(HashMap<String, Integer> hashmap) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		List<FdocVO> fdoc_list = fdocMapper.getFdocList(hashmap);
		return fdoc_list;
	}

	@Override
	public FdocVO getView(int fdoc_no) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		fdocMapper.setReadCountUpdate(fdoc_no);
		FdocVO vo = fdocMapper.getView(fdoc_no);
		return vo;
		
	}

	@Override
	public int commentInsertService(FdocReflyVO comment) throws Exception {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		comment.setFdoc_seq(1);
		fdocMapper.commentCount(comment);
		//String fdoc_ccontent = comment.getFdoc_ccontent();
		//fdoc_ccontent = fdoc_ccontent.replace("\r\n","<br>");//�ٹٲ� ġȯ
		//comment.setFdoc_ccontent(fdoc_ccontent);
		
		return fdocMapper.commentInsert(comment);
	}

	@Override
	public List<FdocReflyVO> commentListService(int fdoc_no) throws Exception {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		return fdocMapper.commentList(fdoc_no);
	}

	@Override
	public int commentUpdateService(FdocReflyVO comment) throws Exception {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		String fdoc_ccontent = comment.getFdoc_ccontent();
		fdoc_ccontent = fdoc_ccontent.replace("\r\n","<br>");//�ٹٲ� ġȯ
		comment.setFdoc_ccontent(fdoc_ccontent);
		return fdocMapper.commentUpdate(comment);
	}

	@Override
	public int commentDeleteService(FdocReflyVO comment) throws Exception {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		fdocMapper.commentSub(comment);
		return fdocMapper.commentDelete(comment);
	}

	@Override
	public int commentReflyService(FdocReflyVO comment) throws Exception {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		fdocMapper.commentReflyUpdate(comment);
		fdocMapper.commentCount(comment);
		comment.setFdoc_seq(comment.getFdoc_seq()+1);
		
		return fdocMapper.commentRefly(comment);
	}

	@Override
	public int getSearchCount(FdocVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		
		if(vo.getKind_search()==null) {
			ArrayList <String> none = new ArrayList<String>();
			none.add("none");
			vo.setKind_search(none);
		}
		if(vo.getKind_loc()==null) {
			ArrayList <String> none1 = new ArrayList<String>();
			none1.add("none");
			vo.setKind_loc(none1);
		}
		if(vo.getFdoc_search()==null) {
			ArrayList <String> none2 = new ArrayList<String>();
			none2.add("none");
			vo.setFdoc_search(none2);
		}
		
		return fdocMapper.getSearchCount(vo);
	}

	@Override
	public List<FdocVO> getSearchList(FdocVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
	
		if(vo.getKind_search()==null) {
			ArrayList <String> none = new ArrayList<String>();
			none.add("none");
			vo.setKind_search(none);
		}
		if(vo.getKind_loc()==null) {
			ArrayList <String> none1 = new ArrayList<String>();
			none1.add("none");
			vo.setKind_loc(none1);
		}
		if(vo.getFdoc_search()==null) {
			ArrayList <String> none2 = new ArrayList<String>();
			none2.add("none");
			vo.setFdoc_search(none2);
		}
		
		List<FdocVO> fdoc_list = fdocMapper.getSearchList(vo);
		
		
		return fdoc_list;
	}

	@Override
	public int warningInsertService(FdocWarningVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		
		return fdocMapper.warningInsert(vo);
	}

	@Override
	public int payInsertService(Myfree_doc_confirmVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		
		return fdocMapper.payInsert(vo);
	}

	@Override
	public int boardDelete(FdocVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		fdocMapper.FdocDeleteComment(vo);
		return fdocMapper.FdocDelete(vo);
	}

	@Override
	public int deleteCount(int fdoc_cno) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		return fdocMapper.DeleteCount(fdoc_cno);
	}

	@Override
	public int deleteUpdate(int fdoc_cno) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		return fdocMapper.DeleteUpdate(fdoc_cno);
	}

	@Override
	public int boardUpdate(FdocVO vo) {
		FdocMapper fdocMapper = sqlSession.getMapper(FdocMapper.class);
		
		return fdocMapper.FdocUpdate(vo);
	}

	

}
