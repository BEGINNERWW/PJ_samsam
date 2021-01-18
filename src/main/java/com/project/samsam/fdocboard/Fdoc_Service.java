package com.project.samsam.fdocboard;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.myfree.Myfree_doc_confirmVO;

public interface Fdoc_Service {
	public int boardInsert(FdocVO vo);
	public int getListCount();
	public List<FdocVO> getFdocList(HashMap<String,Integer> hashmap);
	public FdocVO getView(int fdoc_no);
	//���
	public int commentInsertService(FdocReflyVO comment) throws Exception;
	public List <FdocReflyVO> commentListService(int fdoc_no) throws Exception;
	public int commentUpdateService(FdocReflyVO comment) throws Exception;
	public int commentDeleteService(FdocReflyVO comment) throws Exception;
	public int commentReflyService(FdocReflyVO comment) throws Exception;
	//�˻�
	public int getSearchCount(FdocVO vo);
	public List<FdocVO> getSearchList(FdocVO vo);
	//�Ű�
	public int warningInsertService(FdocWarningVO vo);
	public int payInsertService(Myfree_doc_confirmVO vo);
	public int boardDelete(FdocVO vo);
	public int deleteCount(int fdoc_cno);
	public int deleteUpdate(int fdoc_cno);
	public int boardUpdate(FdocVO vo);
}
