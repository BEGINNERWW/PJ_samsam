package com.project.samsam.adminfree;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.myfree.Myfree_authVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;

public interface AdminfreeService {
	//책임분양 인증글 목록
	public int getListCount();
	public List<Myfree_authVO> getAuthList(HashMap<String, Integer> hashmap);
	
	//책임분양 확정번호 클릭 상세보기
	public Myfree_doc_confirmVO selectConfirm_detail(String confirm_no);
	public List<Myfree_authVO> selectAuth_detail(String confirm_no);
	
	public Myfree_authVO selectAuth_detail_re_re(int fadoc_no);				//상세보기 페이지 redirect할 때 사용
	public List<Myfree_authVO> selectAuth_detail_re(String confirm_no);			//상세보기 페이지 redirect할 때 사용
	public Myfree_doc_confirmVO selectConfirm_detail_re(String confirm_no);	//상세보기 페이지 redirect할 때 사용
	
	//책임분양 인증상태
	public int update_auth_ok(int fadoc_no);
	public int update_auth_re(int fadoc_no);
	public int update_auth_no(int fadoc_no);
}
