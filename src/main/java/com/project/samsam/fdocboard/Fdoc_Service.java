package com.project.samsam.fdocboard;

import java.util.HashMap;
import java.util.List;

public interface Fdoc_Service {
	public int boardInsert(FdocVO vo);
	public int getListCount();
	public List<FdocVO> getFdocList(HashMap<String,Integer> hashmap);
	public FdocVO getView(int fdoc_no);
	//댓글
	public int commentInsertService(FdocReflyVO comment) throws Exception;
	public List <FdocReflyVO> commentListService(int fdoc_no) throws Exception;
	public int commentUpdateService(FdocReflyVO comment) throws Exception;
	public int commentDeleteService(int fdoc_cno) throws Exception;
	public int commentReflyService(FdocReflyVO comment) throws Exception;
	//검색
	public int getSearchCount(FdocVO vo);
	public List<FdocVO> getSearchList(FdocVO vo);
	//신고
	public int warningInsertService(FdocWarningVO vo);
	public int payInsertService(Myfree_doc_confirmVO vo);
}
