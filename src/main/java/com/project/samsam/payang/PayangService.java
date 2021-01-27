package com.project.samsam.payang;

import java.util.List;


public interface PayangService {

	
	// 게시글 목록 조회
	public List<PayangVO> list() throws Exception;
	
	// 게시글 쓰기
	public void register(PayangVO payang) throws Exception;
	
	// 게시글 읽기
	public PayangVO read(Integer doc_no) throws Exception;
	
	// 게시글 수정
	public void modify(PayangVO payang) throws Exception;
	
	// 게시글 삭제
	public void remove(Integer doc_no) throws Exception;
	
	// 댓글 쓰기
	public int replyRegister(PayangReplyVO reply) throws Exception;
	
	// 댓글 목록 조회
	public List<PayangReplyVO> replyList(Integer doc_no) throws Exception;
	
	// 조회수 증가
	public void updateReadCount(PayangVO payang) throws Exception;
	
	// 댓글 삭제
	public void replyRemove(Integer doc_cno) throws Exception;
	
	//수정
	public int replyModify(PayangReplyVO paramVO);
	
	
}
