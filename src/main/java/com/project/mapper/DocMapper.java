package com.project.mapper;

import java.util.List;

import com.project.samsam.community.DocReflyVO;
import com.project.samsam.community.DocVO;





public interface DocMapper {
	
	public int DocInsert(DocVO vo);
	public int getListCount();
	public List<DocVO> getDocList(DocVO vo);
	public void setReadCountUpdate(int fdoc_no);
	public DocVO getView(int doc_no);
	public void commentCount(DocReflyVO comment);
	public int commentInsert(DocReflyVO comment) throws Exception;
	public List <DocReflyVO> commentList(int doc_no) throws Exception;
	public int commentUpdate(DocReflyVO comment) throws Exception;
	public int commentReflyUpdate(DocReflyVO comment) throws Exception;
	public int commentRefly(DocReflyVO comment) throws Exception;
	public void commentSub(DocReflyVO comment);
	public int commentDelete(DocReflyVO comment) throws Exception;
	public int DeleteCount(int doc_cno);
	public int DeleteUpdate(int doc_cno);
	public int DocUpdate(DocVO vo);
	public int DocDeleteComment(DocVO vo);
	public int DocDelete(DocVO vo);
}