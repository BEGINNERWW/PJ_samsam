package com.project.samsam.hospital;

import java.util.HashMap;
import java.util.List;

public interface HospitalService {
	
	
	public int reviewListCount(String place_id);
	public List<Hospital_mapVO> select_review(HashMap<String, Object> hashmap);
	
	public List<Hospital_mapVO> select_star(String place_id);
	
	public int insert_review(Hospital_mapVO hospital_mapVO);
	
	public Hospital_mapVO hospital_info(int review_num);
	
	public int delete_review(int review_num);
}
