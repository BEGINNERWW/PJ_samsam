package com.project.samsam.myfree;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.MyfreeMapper;

@Service("MyfreeService")
public class MyfreeServiceImpl implements MyfreeService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//프로필, 닉네임 조회
	@Override
	public Member_listVO selectMember(String email) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		Member_listVO member_list = myfreeMapper.selectMember(email);
		return member_list;
	}
	
	//나의 책임분양 조회
	public int ConfirmListCount(String email) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int res = myfreeMapper.ConfirmListCount(email);
		return res;
	}
	
	public List<Myfree_doc_confirmVO> selectConfirm(HashMap<String, Object> hashmap) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		List<Myfree_doc_confirmVO> myfree_doc_confirm = myfreeMapper.selectConfirm(hashmap);
		return myfree_doc_confirm;
	}
	
	//책임 분양 인증 게시글 내역
	public List<Myfree_authVO> selectAuth(String email) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		List<Myfree_authVO> myfree_auth = myfreeMapper.selectAuth(email);
		
		return myfree_auth;
	}
	
	//작성한 책임분양글 목록 조회
	public int DocListCount(String email) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int res = myfreeMapper.DocListCount(email);
		return res;
	}
	
	public List<Myfree_docVO> selectDoc(HashMap<String, Object> hashmap_doc) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		List<Myfree_docVO> myfree_docVO = myfreeMapper.selectDoc(hashmap_doc);
		
		return myfree_docVO;
	}
	
	//환급계좌 입력
	public void updateAccount(Myfree_doc_confirmVO myfree_doc_confirmVO) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int confirm_account = myfreeMapper.updateAccount(myfree_doc_confirmVO);
	}
		
	//환급계좌 삭제
	public void deleteAccount(Myfree_doc_confirmVO myfree_doc_confirmVO) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int delete_account = myfreeMapper.deleteAccount(myfree_doc_confirmVO);
	}
	
	//확정번호가 일치하고 작성한 달이 일치하고 상태가 인증완료인 글의 개수
	public int auth_ok_count(HashMap<String, Object> hashmap) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int auth_ok_count = myfreeMapper.auth_ok_count(hashmap);
		return auth_ok_count;
	}
	
	//확정번호가 일치하고 작성한 달이 일치하고 상태가 검토중인 글의 개수
	public int auth_wait_count(HashMap<String, Object> hashmap) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int auth_wait_count = myfreeMapper.auth_wait_count(hashmap);
		return auth_wait_count;
	}
	
	//책임분양 인증글 작성창 띄우기 - 책임분양 인증현황 테이블 조회
	public Myfree_doc_confirmVO selectConfirm_write(String confirm_no) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		Myfree_doc_confirmVO myfree_doc_confirm_write = myfreeMapper.selectConfirm_write(confirm_no);
		
		return myfree_doc_confirm_write;
	}
	
	
	//책임분양 인증글 작성
	public int insertFree_auth(Myfree_authVO myfree_authVO) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int myfree_auth_write = myfreeMapper.insertFree_auth(myfree_authVO);
		
		return myfree_auth_write;
	}
	
	//책임분양 인증글 조회
	public Myfree_authVO selectAuth_view(int doc_no) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		myfreeMapper.setReadCountUpdate(doc_no);
		Myfree_authVO auth_view = myfreeMapper.selectAuth_view(doc_no);
		
		return auth_view;
	}
	
	//책임분양 인증글 조회
	public Myfree_doc_confirmVO selectConfirm_view(String confirm_no) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		Myfree_doc_confirmVO confirm_view = myfreeMapper.selectConfirm_view(confirm_no);
		
		return confirm_view;
	}
	
	//이미지 파일 업로드
	public void update_fdoc_img(Myfree_doc_confirmVO myfree_doc_confirmVO) {
		MyfreeMapper myfreeMapper = 
				sqlSession.getMapper(MyfreeMapper.class);
		int res = myfreeMapper.update_fdoc_img(myfree_doc_confirmVO);
		
	}
}

