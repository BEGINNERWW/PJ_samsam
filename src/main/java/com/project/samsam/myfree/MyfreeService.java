package com.project.samsam.myfree;

import java.util.List;

import com.project.samsam.myfree.Member_listVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;
import com.project.samsam.myfree.Myfree_authVO;
import com.project.samsam.myfree.Myfree_docVO;

public interface MyfreeService {
	
		//프로필, 닉네임 조회
		public Member_listVO selectMember(String email);
		
		
		//나의 책임분양 조회
		public List<Myfree_doc_confirmVO> selectConfirm(String email);
		
		
		//책임 분양 인증 게시글 내역
		public List<Myfree_authVO> selectAuth(String email);
		
		
		//작성한 책임분양글 목록 조회
		public List<Myfree_docVO> selectDoc(String email);
		
		//환급계좌 입력
		void insertAccount(Myfree_doc_confirmVO myfree_doc_confirmVO);
		
		//책임분양 인증글 작성창 띄우기 - 책임분양인증현황 테이블 조회
		public Myfree_doc_confirmVO selectConfirm_write(String confirm_no);
		
		//책임분양 인증글 작성
		public int insertFree_auth(Myfree_authVO myfree_authVO);
		
		//책임분양 인증글 조회
		public Myfree_authVO selectAuth_view(int fadoc_no);
		public Myfree_doc_confirmVO selectConfirm_view(String confirm_no);
		
		//이미지 파일 업로드
		public void update_fdoc_img(Myfree_doc_confirmVO myfree_doc_confirmVO);
}

