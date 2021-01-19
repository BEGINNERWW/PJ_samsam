package com.project.mapper;

import java.util.List;


import com.project.samsam.missing.MissingVO;

public interface MissingMapper {
	
	//게시글 목록
	public List<MissingVO> list() throws Exception;
	
	//게시글 쓰기
	public void create(MissingVO missing) throws Exception;
	
	//게시글 읽기
	public MissingVO read(Integer m_no) throws Exception;
	
	//게시글 수정
	public void update(MissingVO missing) throws Exception;
	
	//게시글 삭제
	public void delete(Integer m_no) throws Exception;
}
