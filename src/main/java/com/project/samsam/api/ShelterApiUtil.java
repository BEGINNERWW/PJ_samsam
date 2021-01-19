package com.project.samsam.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class ShelterApiUtil implements ShelterApi {

	// 보호소 상세정보 개별 조회
	@Override
	public ShelterInfo getShelterDetail(String care_rec_cd) throws Exception {
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		paramNm.add("care_reg_no");
		
		paramVal.add(care_rec_cd);
        
        StringBuilder sb = getReponse("shelterInfo", paramNm, paramVal);
		
        String shelterInfo = sb.toString();
        
        // 정보가 없으면
        if( !shelterInfo.contains("<items>") ) {
        	return null;
        }
        System.out.println("******** (get) shelterInfo");
        System.out.println(shelterInfo);
        String[] str1 = shelterInfo.split("<items>");
		String result = str1[1];
		String[] str2 = result.split("</items>");
		result = str2[0];
		
		System.out.println("*************** str2");
		System.out.println(result);
		
		// String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
		
		int count = 0;
		ShelterInfo shelter = new ShelterInfo();
		// ArrayList<ShelterInfo> shelterIList = new ArrayList<ShelterInfo>();
		
		// 보호소 번호
		shelter.setCareRecNo(care_rec_cd);
		
		if( result.contains("<careAddr>") ) {
			String careAddr = result.split("<careAddr>|</careAddr>")[1];
			shelter.setCareAddr(careAddr);
			System.out.println("careAddr : " + careAddr);
		}
		if( result.contains("<careNm>") ) {
			String careNm = result.split("<careNm>|</careNm>")[1];
			shelter.setCareNm(careNm);
			System.out.println("careNm : " + careNm);
		}
		if( result.contains("<careTel>") ) {
			String careTel = result.split("<careTel>|</careTel>")[1];
			shelter.setCareTel(careTel);
			System.out.println("careTel : " + careTel);
		}
		if( result.contains("<dataStdDt>") ) {
			String dataStdDt = result.split("<dataStdDt>|</dataStdDt>")[1];
			shelter.setDataStdDt(dataStdDt);
			System.out.println("dataStdDt : " + dataStdDt);
		}
		if( result.contains("<divisionNm>") ) {
			String divisionNm = result.split("<divisionNm>|</divisionNm>")[1];
			shelter.setDivisionNm(divisionNm);
			System.out.println("divisionNm : " + divisionNm);
		}
		if( result.contains("<jibunAddr>") ) {
			String jibunAddr = result.split("<jibunAddr>|</jibunAddr>")[1];
			shelter.setJibunAddr(jibunAddr);
			System.out.println("jibunAddr : " + jibunAddr);
		}
		if( result.contains("<orgNm>") ) {
			String orgNm = result.split("<orgNm>|</orgNm>")[1];
			shelter.setOrgNm(orgNm);
			System.out.println("orgNm : " + orgNm);
		}
		if( result.contains("<rnum>") ) {
			String rnum = result.split("<rnum>|</rnum>")[1];
			shelter.setRnum(rnum);
			System.out.println("rnum : " + rnum);
		}
		
		
		return shelter;
	}
	
	


	// 보호소 상세정보 전체 조회
	@Override
	public ArrayList<ShelterInfo> getAllShelterDetail(Integer pageNo) throws Exception {
		
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		if( pageNo != null ) {
			paramNm.add("pageNo");
			paramVal.add(pageNo.toString());
		}
		
        StringBuilder sb = getReponse("shelterInfo", paramNm, paramVal);
		
        String shelterInfo = sb.toString();
        
        // 정보가 없으면
        if( !shelterInfo.contains("<items>") ) {
        	return null;
        }
        System.out.println("******** (get) shelterInfo");
        System.out.println(shelterInfo);
        String[] str1 = shelterInfo.split("<items>");
		String result = str1[1];
		String[] str2 = result.split("</items>");
		result = str2[0];
		
		System.out.println("*************** str2");
		System.out.println(result);
		
		// String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
		
		ArrayList<ShelterInfo> shelterIList = new ArrayList<ShelterInfo>();
		
		// pageNo
		String[] pageNoArr = shelterInfo.split("<pageNo>|</pageNo>");
		
		// numOfRows
		String[] numOfRowsArr = shelterInfo.split("<numOfRows>|</numOfRows>");
		
		// totalCount
		String[] totalCountArr = shelterInfo.split("<totalCount>|</totalCount>");
		
		System.out.println("현재 페이지 수 : " + pageNoArr[1]);
		System.out.println("페이지당 건 수 : " + numOfRowsArr[1]);
		System.out.println("전체 건수 : " + totalCountArr[1]);
		
		// 각 아이템 요소
		String[] shelterArr = result.split("<item>|</item>");
		
		
		for (int i = 0; i < shelterArr.length; i++) {
			ShelterInfo shelter = new ShelterInfo();
			
			if( !shelterArr[i].equals("") ) {
			
				if( shelterArr[i].contains("<careAddr>") ) {
					String careAddr = shelterArr[i].split("<careAddr>|</careAddr>")[1];
					shelter.setCareAddr(careAddr);
					System.out.println("careAddr : " + careAddr);
				}
				if( shelterArr[i].contains("<careNm>") ) {
					String careNm = shelterArr[i].split("<careNm>|</careNm>")[1];
					shelter.setCareNm(careNm);
					System.out.println("careNm : " + careNm);
				}
				if( shelterArr[i].contains("<careTel>") ) {
					String careTel = shelterArr[i].split("<careTel>|</careTel>")[1];
					shelter.setCareTel(careTel);
					System.out.println("careTel : " + careTel);
				}
				if( shelterArr[i].contains("<dataStdDt>") ) {
					String dataStdDt = shelterArr[i].split("<dataStdDt>|</dataStdDt>")[1];
					shelter.setDataStdDt(dataStdDt);
					System.out.println("dataStdDt : " + dataStdDt);
				}
				if( shelterArr[i].contains("<divisionNm>") ) {
					String divisionNm = shelterArr[i].split("<divisionNm>|</divisionNm>")[1];
					shelter.setDivisionNm(divisionNm);
					System.out.println("divisionNm : " + divisionNm);
				}
				if( shelterArr[i].contains("<jibunAddr>") ) {
					String jibunAddr = shelterArr[i].split("<jibunAddr>|</jibunAddr>")[1];
					shelter.setJibunAddr(jibunAddr);
					System.out.println("jibunAddr : " + jibunAddr);
				}
				if( shelterArr[i].contains("<orgNm>") ) {
					String orgNm = shelterArr[i].split("<orgNm>|</orgNm>")[1];
					shelter.setOrgNm(orgNm);
					System.out.println("orgNm : " + orgNm);
				}
				if( shelterArr[i].contains("<rnum>") ) {
					String rnum = shelterArr[i].split("<rnum>|</rnum>")[1];
					shelter.setRnum(rnum);
					System.out.println("rnum : " + rnum);
				}
				shelterIList.add(shelter);
			
			}
		}
		
		
		return shelterIList;
	}
	
	
	@Override
	public PageInfo getPageInfo( Integer pageNo ) throws Exception {
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		if( pageNo != null ) {
			paramNm.add("pageNo");
			paramVal.add(pageNo.toString());
		}
		
        StringBuilder sb = getReponse("shelterInfo", paramNm, paramVal);
		
        String shelterInfo = sb.toString();
        
        // 정보가 없으면
        if( !shelterInfo.contains("<items>") ) {
        	return null;
        }
        System.out.println("******** (get) shelterInfo");
        System.out.println(shelterInfo);
        String[] str1 = shelterInfo.split("<items>");
		String result = str1[1];
		String[] str2 = result.split("</items>");
		result = str2[0];
		
		System.out.println("*************** str2");
		System.out.println(result);
		
		// String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
		
		ArrayList<ShelterInfo> shelterIList = new ArrayList<ShelterInfo>();
		
		// pageNo
		String[] pageNoArr = shelterInfo.split("<pageNo>|</pageNo>");
		pageNo =  Integer.parseInt( pageNoArr[1] );
		
		// numOfRows
		String[] numOfRowsArr = shelterInfo.split("<numOfRows>|</numOfRows>");
		Integer nomOfRows =  Integer.parseInt( numOfRowsArr[1] );
		
		// totalCount
		String[] totalCountArr = shelterInfo.split("<totalCount>|</totalCount>");
		Integer totalCount =  Integer.parseInt( totalCountArr[1] );
		
		System.out.println("현재 페이지 수 : " + pageNoArr[1]);
		System.out.println("페이지당 건 수 : " + numOfRowsArr[1]);
		System.out.println("전체 건수 : " + totalCountArr[1]);
		
		PageInfo page = new PageInfo(pageNo, nomOfRows, totalCount);
		
		return page;
	}

	
	
	
	// 요청이름에 맞는 응답 html 반환
	public StringBuilder getReponse(String requestName, ArrayList<String> paramNm, ArrayList<String> paramVal) throws Exception {
		
		StringBuilder urlBuilder = new StringBuilder(baseUrl + requestName); 
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + serviceKey);
    
    	for (int i = 0; i < paramNm.size(); i++) {
    		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8") + "=" + paramVal.get(i) ); 
    	}
      
        System.out.println(urlBuilder.toString());
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        
        // 응답코드 200~300 이면,  404 등 에러인지 확인
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        return sb;
	}





	
}
