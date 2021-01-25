package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.hospital.Hospital_mapVO;

public interface HospitalMapper {
	
	
	public int reviewListCount(String place_id);
	public List<Hospital_mapVO> select_review(HashMap<String, Object> hashmap);
	
	public int insert_review(Hospital_mapVO hospital_mapVO);
	
	public Hospital_mapVO hospital_info(int review_num);
	
	public int delete_review(int review_num);
}
