package com.project.mapper;

import java.util.List;

import com.project.samsam.payang.PayangVO;

public interface PayangMapper {

	// 게시글 목록 조회
	public List<PayangVO> list() throws Exception;

	// 게시글 쓰기
	public void create(PayangVO payang) throws Exception;

	// 게시글 읽기
	public PayangVO read(Integer p_no) throws Exception;
	
	// 게시글 수정
	public void update(PayangVO payang) throws Exception;

	// 게시글 삭제
	public void delete(Integer p_no) throws Exception;
}
