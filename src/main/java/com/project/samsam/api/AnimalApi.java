package com.project.samsam.api;

import java.util.ArrayList;

public interface AnimalApi {
	
	String baseUrl = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/";
	String serviceKey = "=5Ern8aw33VcOcSQOtvZctJL%2Fts0%2BlkWF44wrlicCom%2BtHN5GBj2nE2eYllAz5Zaq10sQ8LRzqFG4S5QgYLZvhg%3D%3D";

	// 시도 
	public ArrayList<Sido> getSido() throws Exception;
	
	// 시/군/구
	public ArrayList<Sigungu> getSiGunGu(String upr_cd) throws Exception;
	
	// 축종
	// 축종코드 - 개 : 417000 - 고양이 : 422400 - 기타 : 429900
	public ArrayList<AnimalKind> getAnimalKind(String up_kind_cd) throws Exception;
	
	// 유기동물 정보
	public AnimalApiVO getAnimalInfo( String bgnde, String endde, String upkind, String state, Integer pageNo, Integer numOfRows, String neuter_yn  ) throws Exception;
	public AnimalApiVO getAnimalInfo( String bgnde, String endde,String upr_cd, String org_cd, String upkind, String kind, String state, Integer pageNo, Integer numOfRows, String neuter_yn  ) throws Exception;
	
	// 보호소 정보
	public ArrayList<ShelterInfo> getShelterInfo( String upr_cd, String org_cd, Integer pageNo ) throws Exception;
	
	
	
}
