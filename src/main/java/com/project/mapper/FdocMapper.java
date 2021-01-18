package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.fdocboard.FdocReflyVO;
import com.project.samsam.fdocboard.FdocVO;
import com.project.samsam.fdocboard.FdocWarningVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;




public interface FdocMapper {
	public int FdocInsert(FdocVO vo);
	public int getListCount();
	public List<FdocVO> getFdocList(HashMap<String,Integer> hashmap);
	public void setReadCountUpdate(int fdoc_no);
	public FdocVO getView(int fdoc_no);

	public int commentInsert(FdocReflyVO comment) throws Exception;
	public List <FdocReflyVO> commentList(int fdoc_no) throws Exception;
	public int commentUpdate(FdocReflyVO comment) throws Exception;
	public int commentDelete(FdocReflyVO comment) throws Exception;
	public int commentReflyUpdate(FdocReflyVO comment) throws Exception;
	public int commentRefly(FdocReflyVO comment) throws Exception;

	public int getSearchCount(FdocVO vo);
	public List<FdocVO> getSearchList(FdocVO vo);

	public int warningInsert(FdocWarningVO vo);
	public int payInsert(Myfree_doc_confirmVO vo);
	
	public void commentCount(FdocReflyVO comment);
	public int FdocDelete(FdocVO vo);
	public int FdocDeleteComment(FdocVO vo);
	public int DeleteCount(int fdoc_cno);
	public int DeleteUpdate(int fdoc_cno);
	public int FdocUpdate(FdocVO vo);
	public void commentSub(FdocReflyVO comment);
	
}
