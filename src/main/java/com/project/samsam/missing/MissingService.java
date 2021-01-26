package com.project.samsam.missing;

import java.util.List;

public interface MissingService {
	// 게시글 목록 조회
		public List<MissingVO> list() throws Exception;
		
		// 게시글 쓰기
		public void register(MissingVO missing) throws Exception;
		
		// 게시글 읽기
		public MissingVO read(Integer doc_no) throws Exception;
		
		// 게시글 수정
		public void modify(MissingVO missing) throws Exception;
		
		// 게시글 삭제
		public void remove(Integer doc_no) throws Exception;
		
		// 댓글 쓰기
		public int replyRegister(MissingReplyVO reply) throws Exception;
		
		// 댓글 목록 조회
		public List<MissingReplyVO> replyList(Integer doc_no) throws Exception;
}