package com.project.samsam.community;

import java.util.List;




public interface Doc_Service {
	public int boardInsert(DocVO vo);
	public int getListCount();
	public List<DocVO> getDocList(DocVO vo);
	public DocVO getView(int doc_no);
}
