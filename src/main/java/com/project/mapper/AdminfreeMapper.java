package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.myfree.Myfree_authVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;

public interface AdminfreeMapper {
	
	// 페이징처리
	public int getListCount();
	// 목록 조회
	public List<Myfree_authVO> getAuthList(HashMap<String, Integer> hashmap);
	
	//인증글 상세보기
	public Myfree_doc_confirmVO selectConfirm_detail(String confirm_no);
	public List<Myfree_authVO> selectAuth_detail(String confirm_no);
	
	//인증글 상세보기 redirect
	public Myfree_authVO selectAuth_detail_re_re(int fadoc_no);
	public List<Myfree_authVO> selectAuth_detail_re(String confirm_no);
	public Myfree_doc_confirmVO selectConfirm_detail_re(String confirm_no);
	
	//책임분양 인증글 상태변화
	public int update_auth_ok(int fadoc_no);
	public int update_auth_re(int fadoc_no);
	public int update_auth_no(int fadoc_no);
}
