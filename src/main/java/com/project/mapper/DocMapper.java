package com.project.mapper;

import java.util.List;

import com.project.samsam.community.DocVO;


public interface DocMapper {
	
	public int DocInsert(DocVO vo);
	public int getListCount();
	public List<DocVO> getDocList(DocVO vo);
	public void setReadCountUpdate(int fdoc_no);
	public DocVO getView(int doc_no);
}
