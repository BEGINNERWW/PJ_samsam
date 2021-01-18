package com.project.samsam.community;

import java.util.List;



public interface Doc_Service {
	public int boardInsert(DocVO vo);
	public int getListCount();
	public List<DocVO> getDocList(DocVO vo);
	public DocVO getView(int doc_no);
	public int commentInsertService(DocReflyVO comment) throws Exception;
	public List <DocReflyVO> commentListService(int doc_no) throws Exception;
	public int commentUpdateService(DocReflyVO comment) throws Exception;
	public int commentReflyService(DocReflyVO comment) throws Exception;
	public int commentDeleteService(DocReflyVO comment) throws Exception;
	public int deleteCount(int doc_cno);
	public int deleteUpdate(int doc_cno);
	public int boardUpdate(DocVO vo);
	public int boardDelete(DocVO vo);
}
