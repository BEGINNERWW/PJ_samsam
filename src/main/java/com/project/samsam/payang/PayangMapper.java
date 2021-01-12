package com.project.samsam.payang;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PayangMapper {
	
	// 게시글 목록 조회
	public List<PayangVO> list() throws Exception;
	
	
}
