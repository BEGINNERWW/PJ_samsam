package com.project.samsam.adminfree;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.AdminfreeMapper;
import com.project.samsam.adminfree.AdminfreeService;
import com.project.samsam.myfree.Myfree_authVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;

@Service("AdminfreeService")
public class AdminfreeServiceImpl implements AdminfreeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		int res = adminfreeMapper.getListCount();
		return res;
	}
	
	@Override
	public List<Myfree_authVO> getAuthList(HashMap<String, Integer> hashmap) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		List<Myfree_authVO> free_auth_list = adminfreeMapper.getAuthList(hashmap);
		return free_auth_list;
	}
	
	@Override
	public Myfree_doc_confirmVO selectConfirm_detail(String confirm_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		Myfree_doc_confirmVO myfree_doc_confirm_detail = adminfreeMapper.selectConfirm_detail(confirm_no);
		return myfree_doc_confirm_detail;
	}
	 
	
	@Override
	public List<Myfree_authVO> selectAuth_detail(String confirm_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		List<Myfree_authVO> myfree_auth_datail = adminfreeMapper.selectAuth_detail(confirm_no);
		
		return myfree_auth_datail;
	}
	
	@Override
	public Myfree_authVO selectAuth_detail_re_re(int fadoc_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		Myfree_authVO myfree_auth_datail_re_re = adminfreeMapper.selectAuth_detail_re_re(fadoc_no);
		
		return myfree_auth_datail_re_re;
	}
	
	@Override
	public List<Myfree_authVO> selectAuth_detail_re(String confirm_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		List<Myfree_authVO> myfree_auth_datail_re = adminfreeMapper.selectAuth_detail_re(confirm_no);
		
		return myfree_auth_datail_re;
	}
	
	@Override
	public Myfree_doc_confirmVO selectConfirm_detail_re(String confirm_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		Myfree_doc_confirmVO myfree_doc_confirm_detail_re = adminfreeMapper.selectConfirm_detail_re(confirm_no);
		return myfree_doc_confirm_detail_re;
	}
	
	
	@Override
	public int update_auth_ok(int fadoc_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		int res = adminfreeMapper.update_auth_ok(fadoc_no);
		return res;
	}
	
	@Override
	public int update_auth_re(int fadoc_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		int res = adminfreeMapper.update_auth_re(fadoc_no);
		return res;
	}
	
	@Override
	public int update_auth_no(int fadoc_no) {
		AdminfreeMapper adminfreeMapper = 
				sqlSession.getMapper(AdminfreeMapper.class);
		int res = adminfreeMapper.update_auth_no(fadoc_no);
		return res;
	}
	
	
	
	
	
	
}
