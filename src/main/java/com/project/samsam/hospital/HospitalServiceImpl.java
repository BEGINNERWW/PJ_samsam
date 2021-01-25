package com.project.samsam.hospital;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.HospitalMapper;
@Service("HospitalService")
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int reviewListCount(String place_id) {
		HospitalMapper hospitalMapper = 
				sqlSession.getMapper(HospitalMapper.class);
		int res = hospitalMapper.reviewListCount(place_id);
		return res;
	}
	
	@Override
	public List<Hospital_mapVO> select_review(HashMap<String, Object> hashmap) {
		HospitalMapper hospitalMapper = 
				sqlSession.getMapper(HospitalMapper.class);
		List<Hospital_mapVO> review_list = hospitalMapper.select_review(hashmap);
		return review_list;
	}
	
	public int insert_review(Hospital_mapVO hospital_mapVO) {
		HospitalMapper hospitalMapper = 
				sqlSession.getMapper(HospitalMapper.class);
		int write_review = hospitalMapper.insert_review(hospital_mapVO);
		
		return write_review;
	}
	
	public Hospital_mapVO hospital_info(int review_num) {
		HospitalMapper hospitalMapper = 
				sqlSession.getMapper(HospitalMapper.class);
		Hospital_mapVO hospital_info = hospitalMapper.hospital_info(review_num);
		return hospital_info;
	}
	public int delete_review(int review_num) {
		HospitalMapper hospitalMapper = 
				sqlSession.getMapper(HospitalMapper.class);
		int delete_review = hospitalMapper.delete_review(review_num);
		
		return delete_review;
	}

}
