package com.project.samsam.api;

import java.util.ArrayList;

public interface ShelterApi {

	String baseUrl = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/";
	String serviceKey = "=5Ern8aw33VcOcSQOtvZctJL%2Fts0%2BlkWF44wrlicCom%2BtHN5GBj2nE2eYllAz5Zaq10sQ8LRzqFG4S5QgYLZvhg%3D%3D";
	
	
	// 보호소 상세 정보 전체 조회
	public ArrayList<ShelterInfo> getAllShelterDetail( Integer pageNo ) throws Exception;
	
	// 보호소 상세 정보 개별 조회
	public ShelterInfo getShelterDetail( String care_rec_cd ) throws Exception;
	
	
	// 페이지 정보 조회
	public PageInfo getPageInfo( Integer pageNo ) throws Exception;
	
	
	
}
