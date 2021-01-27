package com.project.samsam.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class AnimalApiUtil implements AnimalApi {

	@Override
	public ArrayList<Sido> getSido() throws Exception {
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
        
        StringBuilder sb = getReponse("sido", 1, paramNm, paramVal);
 
        Document a = convertStringToDocument(sb.toString());
        
        ArrayList<Sido> sidoList = getSidoList(a);
        
//        // sidoCode, sidoNm 추출
//        String sido = sb.toString();
//        System.out.println(sido);
//        String[] str1 = sido.split("<items>");
//		String result = str1[1];
//		String[] str2 = result.split("</items>");
//		result = str2[0];
//		String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
//		
//
//		ArrayList<Integer> sidoCode = new ArrayList<Integer>();
//		ArrayList<String> sidoNm = new ArrayList<String>();
//		ArrayList<Sido> sidoList = new ArrayList<Sido>();
//				
//		for (int i = 0; i < str3.length; i++) {
//			if( !str3[i].equals("") ) {
//				// 숫자코드 인지 확인
//				if( str3[i].matches("[+-]?\\d*(\\.\\d+)?") ) {
//					sidoCode.add( Integer.parseInt(str3[i]) );
//					System.out.println("코드 : " + str3[i]);
//				}
//				else {
//					sidoNm.add( str3[i] );
//					System.out.println("이름 : " + str3[i]);
//				}
//			}
//		}
//		
//		for (int i = 0; i < sidoCode.size(); i++) {
//			sidoList.add( new Sido(sidoCode.get(i), sidoNm.get(i) ) );
//		}
		return sidoList;
	}

	private ArrayList<Sido> getSidoList(Document a) {
		ArrayList<Sido> resultList = new ArrayList<Sido>();
    	
    	NodeList items = a.getElementsByTagName("document");
    	items = a.getChildNodes().item(0).getChildNodes().item(1).getChildNodes().item(0).getChildNodes();

    	for (int i=0; i<items.getLength(); i++) {
    		// 모든 items
    		Node item = items.item(i);
    		NodeList b = item.getChildNodes();   
    		Sido sidoItem = new Sido(); 		
    		for (int j=0; j<b.getLength(); j++) {
    			// 각 item별 속성
    			String nodeName = b.item(j).getNodeName();
        		String nodeValue = b.item(j).getChildNodes().item(0).getTextContent();

        		if ("orgCd".equals(nodeName)) {
        			sidoItem.setSidoCode(nodeValue);
        		} else if ("orgdownNm".equals(nodeName)) {
        			sidoItem.setSidoNm(nodeValue);
        		}
    		}
    		
    		resultList.add(sidoItem);
    	}
		return resultList;
	}

	@Override
	public ArrayList<Sigungu> getSiGunGu(String upr_cd) throws Exception {
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		// 실제 변수로 변경할 것
		paramNm.add("upr_cd");
		paramVal.add(upr_cd.toString());
		
		StringBuilder sb = getReponse("sigungu", 2, paramNm, paramVal);
 
        Document a = convertStringToDocument(sb.toString());
        
        ArrayList<Sigungu> siGunGuList = getSigunguList(a);
		 // orgCd, orgdownNm 추출
//        String siGunGu = sb.toString();
//        String[] str1 = siGunGu.split("<items>");
//		String result = str1[1];
//		String[] str2 = result.split("</items>");
//		result = str2[0];
//		String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
//		
//		ArrayList<Integer> orgCode = new ArrayList<Integer>();
//		ArrayList<String> orgDownNm = new ArrayList<String>();
//		ArrayList<Sigungu> siGunGuList = new ArrayList<Sigungu>();
//		
//		int cnt = 0;
//		for (int i = 0; i < str3.length; i++) {
//			if( !str3[i].equals("") ) {
//				cnt++;
//				if( cnt == 3 ) {
//					cnt = 0;
//					continue;
//				}
//				
//				// 숫자코드 인지 확인
//				if( str3[i].matches("[+-]?\\d*(\\.\\d+)?") ) {
//					orgCode.add( Integer.parseInt(str3[i]) );
//					System.out.println("코드 : " + str3[i]);
//				}
//				else {
//					orgDownNm.add(str3[i]);
//					System.out.println("이름 : " + str3[i]);
//				}
//			}
//		}
//		
//		for (int i = 0; i < orgCode.size(); i++) {
//			siGunGuList.add( new Sigungu(orgCode.get(i), orgDownNm.get(i) ) );
//		}
		return siGunGuList;
    }

	private ArrayList<Sigungu> getSigunguList(Document a) {
		ArrayList<Sigungu> resultList = new ArrayList<Sigungu>();
    	
    	NodeList items = a.getElementsByTagName("document");
    	items = a.getChildNodes().item(0).getChildNodes().item(1).getChildNodes().item(0).getChildNodes();

    	for (int i=0; i<items.getLength(); i++) {
    		// 모든 items
    		Node item = items.item(i);
    		NodeList b = item.getChildNodes();
    		Sigungu sigunguItem = new Sigungu();
    		for (int j=0; j<b.getLength(); j++) {
    			// 각 item별 속성
    			String nodeName = b.item(j).getNodeName();
        		String nodeValue = b.item(j).getChildNodes().item(0).getTextContent();

        		if ("orgCd".equals(nodeName)) {
        			sigunguItem.setSigunguCode(nodeValue);
        		} else if ("orgdownNm".equals(nodeName)) {
        			sigunguItem.setSigunguNm(nodeValue);
        		} else if ("uprCd".equals(nodeName)) {
        			sigunguItem.setUprCd(nodeValue);
        		}
    		}
    		resultList.add(sigunguItem);
    	}
		return resultList;
	}

	@Override
	// 개 : 417000 - 고양이 : 422400 - 기타 : 429900
	public ArrayList<AnimalKind> getAnimalKind(String up_kind_cd) throws Exception {
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		// 실제 변수로 변경할 것
		paramNm.add("up_kind_cd");
		paramVal.add(up_kind_cd.toString());
		
		StringBuilder sb = getReponse("kind", 4, paramNm, paramVal);
 
        Document a = convertStringToDocument(sb.toString());
        
        ArrayList<AnimalKind> animalKindList = getAnimalKindList(a);

//		System.out.println("@getAnimalKind ");
//		System.out.println(sb.toString());
//		 // orgCd, orgdownNm 추출
//        String animalKind = sb.toString();
//        String[] str1 = animalKind.split("<items>");
//		String result = str1[1];
//		String[] str2 = result.split("</items>");
//		result = str2[0];
//		String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
//		
//		ArrayList<String> KindCd = new ArrayList<String>();
//		ArrayList<String> KindNm = new ArrayList<String>();
//		ArrayList<AnimalKind> animalKindList = new ArrayList<AnimalKind>();
//		
//		for (int i = 0; i < str3.length; i++) {
//			if( !str3[i].equals("") ) {
//				
//				// 숫자코드 인지 확인
//				if( str3[i].matches("[+-]?\\d*(\\.\\d+)?") ) {
//					KindCd.add( str3[i] );
//					System.out.println("코드 : " + str3[i]);
//				}
//				else {
//					KindNm.add(str3[i]);
//					System.out.println("이름 : " + str3[i]);
//				}
//			}
//		}
//		
//		for (int i = 0; i < KindCd.size(); i++) {
//			animalKindList.add( new AnimalKind(KindCd.get(i), KindNm.get(i) ) );
//		}
		return animalKindList;
    }

	private ArrayList<AnimalKind> getAnimalKindList(Document a) {
		ArrayList<AnimalKind> resultList = new ArrayList<AnimalKind>();
    	
    	NodeList items = a.getElementsByTagName("document");
    	items = a.getChildNodes().item(0).getChildNodes().item(1).getChildNodes().item(0).getChildNodes();

    	for (int i=0; i<items.getLength(); i++) {
    		// 모든 items
    		Node item = items.item(i);
    		NodeList b = item.getChildNodes();   
    		AnimalKind animalKindItem = new AnimalKind(); 		
    		for (int j=0; j<b.getLength(); j++) {
    			// 각 item별 속성
    			String nodeName = b.item(j).getNodeName();
        		String nodeValue = b.item(j).getChildNodes().item(0).getTextContent();

        		if ("kindCd".equals(nodeName)) {
        			animalKindItem.setKindCd(nodeValue);
        		} else if ("KNm".equals(nodeName)) {
        			animalKindItem.setKindNm(nodeValue);
        		}
    		}
    		
    		resultList.add(animalKindItem);
    	}
		return resultList;
	}

	@Override
	public AnimalApiVO getAnimalInfo(String bgnde, String endde, String upkind, String state,
			Integer pageNo, Integer numOfRows, String neuter_yn) throws Exception {
		
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		// 실제 변수로 변경할 것
		paramNm.add("bgnde");
		paramNm.add("endde");
		paramNm.add("upkind");
		paramNm.add("state");
		paramNm.add("pageNo");
		paramNm.add("numOfRows");
		paramNm.add("neuter_yn");
		
		paramVal.add(bgnde);
		paramVal.add(endde);
		paramVal.add(upkind.toString());
		paramVal.add(state);
		paramVal.add(pageNo.toString());
		paramVal.add(numOfRows.toString());
		paramVal.add(neuter_yn);
		
		StringBuilder sb = getReponse("abandonmentPublic", 5, paramNm, paramVal);
        Document a = convertStringToDocument(sb.toString());
        AnimalApiVO apiVO = getAnimalInfoList(a);
		
		return apiVO;
	}
	
	// 보호 동물 정보 가져오기
	@Override
	public AnimalApiVO getAnimalInfo(String bgnde, String endde, String upr_cd, String org_cd, String upkind, String kind, String state,
			Integer pageNo, Integer numOfRows, String neuter_yn) throws Exception {
		
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();
		
		// 실제 변수로 변경할 것
		paramNm.add("bgnde");
		paramNm.add("endde");
		if (upr_cd != null && !"".equals(upr_cd)) {
			paramNm.add("upr_cd");
		}
		if (org_cd != null && !"".equals(org_cd)) {
			paramNm.add("org_cd");
		}
		if (upkind != null && !"".equals(upkind)) {
			paramNm.add("upkind");
		}
		if (kind != null && !"".equals(kind)) {
			paramNm.add("kind");
		}
		paramNm.add("state");
		paramNm.add("pageNo");
		paramNm.add("numOfRows");
		paramNm.add("neuter_yn");
		
		paramVal.add(bgnde);
		paramVal.add(endde);
		if (upr_cd != null && !"".equals(upr_cd)) {
			paramVal.add(upr_cd);
		}
		if (org_cd != null && !"".equals(org_cd)) {
			paramVal.add(org_cd);
		}
		if (upkind != null && !"".equals(upkind)) {
			paramVal.add(upkind);
		}
		if (kind != null && !"".equals(kind)) {
			paramVal.add(kind);
		}
		paramVal.add(state);
		paramVal.add(pageNo.toString());
		paramVal.add(numOfRows.toString());
		paramVal.add(neuter_yn);
		
		StringBuilder sb = getReponse("abandonmentPublic", 5, paramNm, paramVal);
        
        Document a = convertStringToDocument(sb.toString());
		
        AnimalApiVO apiVO = getAnimalInfoList(a);
//		
//		String animalInfo = sb.toString();
//        System.out.println(animalInfo);
//        
//        // 
//        Integer totalCount = Integer.parseInt( animalInfo.split("<totalCount>|</totalCount>")[1] );
//        if( totalCount == 0 ) {
//        	return null;
//        }
//        
//        String[] str1 = animalInfo.split("<items>");
//		String result = str1[1];
//		String[] str2 = result.split("</items>");
//		result = str2[0];
//		String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
//		
//		System.out.println("###########################");
//		int count = 0;
//		AnimalInfo animal = null;
//		ArrayList<AnimalInfo> animalList = new ArrayList<AnimalInfo>();
//		
//		for (int i = 0; i < str3.length; i++) {
//			
//			if( count == 0 ) {
//				animal = new AnimalInfo();
//			}
//			
//			if( !str3[i].equals("") ) {
//				
//				count++;
//				System.out.print(count + ". ");
//				System.out.println(str3[i]);
//				
//				switch (count) {
//				case 1:
//					animal.setAge( str3[i] );
//					break;
//				case 2:
//					animal.setCareAddr( str3[i] );
//					break;
//				case 3:
//					animal.setCareNm(str3[i] );
//					break;
//				case 4:
//					animal.setCareTel(str3[i] );
//					break;
//				case 5:
//					animal.setChargeNm( str3[i] );
//					break;
//				case 6:
//					animal.setColorCd(str3[i] );
//					break;
//				case 7:
//					animal.setDesertionNo(str3[i] );
//					break;
//				case 8:
//					animal.setFilename(str3[i] );
//					break;
//				case 9:
//					animal.setHappenDt(str3[i] );
//					break;
//				case 10:
//					animal.setHappenPlace(str3[i] );
//					break;
//				case 11:
//					animal.setKindCd(str3[i] );
//					break;
//				case 12:
//					animal.setNeuterYn(str3[i] );
//					break;
//				case 13:
//					animal.setNoticeEdt(str3[i] );
//					break;
//				case 14:
//					animal.setNoticeNo(str3[i] );
//					break;
//				case 15:
//					animal.setNoticeSdt(str3[i] );
//					break;
//				case 16:
//					animal.setOfficetel(str3[i] );
//					break;
//				case 17:
//					animal.setOrgNm(str3[i] );
//					break;
//				case 18:
//					animal.setPopfile(str3[i] );
//					break;
//				case 19:
//					animal.setProcessState(str3[i] );
//					break;
//				case 20:
//					animal.setSexCd(str3[i] );
//					break;
//				case 21:
//					animal.setSpecialMark(str3[i] );
//					break;
//				case 22:
//					animal.setWeight(str3[i] );
//					break;
//				default:
//							break;
//				}
//				
//			}
//			
//			if( count == 22 ) {
//				animalList.add(animal);
//				count = 0;
//			}
//		}
//		
//		System.out.println("@AnimalApiUtil");
//		System.out.println("--- 조회한 동물 정보 : ");
//		for (AnimalInfo a : animalList) {
//			System.out.println(a);
//		}
		
		
		return apiVO;
	}
	
	// 보호소 정보 가져오기
	@Override
	public ArrayList<ShelterInfo> getShelterInfo(String upr_cd, String org_cd, Integer pageNo) throws Exception {
		
		ArrayList<String> paramNm = new ArrayList<String>();
		ArrayList<String> paramVal = new ArrayList<String>();

		if (upr_cd != null) {
			paramNm.add("upr_cd");
		}
		if (org_cd != null) {
			paramNm.add("org_cd");
		}
		
		if (upr_cd != null) {
			paramVal.add(upr_cd);
		}
		if (org_cd != null) {
			paramVal.add(org_cd);
		}
		
		// 페이지 정보
		if( pageNo != null) {
			paramNm.add("pageNo");
			paramVal.add(pageNo.toString());
		}
		
		StringBuilder sb = getReponse("shelter", 6, paramNm, paramVal);

//        System.out.println(shelterInfo);
//        String[] str1 = shelterInfo.split("<items>");
//		String result = str1[1];
//		String[] str2 = result.split("</items>");
//		result = str2[0];
//		String[] str3 = result.split("(<\\w+>)|(</\\w+>)");
//		
//		System.out.println("###########################");
//		for (int i = 0; i < str3.length; i++) {
//			System.out.println(str3[i]);
//		}
//		
//		int count = 0;
//		ShelterInfo shelter = null;
//		ArrayList<ShelterInfo> shelterList = new ArrayList<ShelterInfo>();
//		ArrayList<String> careRecNoList = new ArrayList<String>();
//		ArrayList<String> careNmList = new ArrayList<String>();
//		
//		for (int i = 0; i < str3.length; i++) {
//				
//			if( !str3[i].equals("") ) {
//				// 숫자면
//				if( str3[i].matches("[+-]?\\d*(\\.\\d+)?") ) {
//					careRecNoList.add(str3[i]);
//					System.out.println("코드: " + str3[i]);
//				}
//				else {
//					careNmList.add(str3[i]);
//					System.out.println("이름: " + str3[i]);
//				}
//			}
//		}
//		
//		
//		ShelterApiUtil shelterApiUtil = new ShelterApiUtil();
//		for (int i = 0; i < careRecNoList.size(); i++) {
//			shelter = shelterApiUtil.getShelterDetail(careRecNoList.get(i));
//			if( shelter == null )
//				continue;
//			shelterList.add(shelter);
//			System.out.println(i + ". 보호소 상세정보" );
//		}
        
        Document a = convertStringToDocument(sb.toString());

		ArrayList<ShelterInfo> resultList = new ArrayList<>();
		ArrayList<ShelterInfo> shelterList = getShelterInfoList(a);
		ShelterApiUtil shelterApiUtil = new ShelterApiUtil();
		for (int i = 0; i < shelterList.size(); i++) {
			ShelterInfo shelter = shelterApiUtil.getShelterDetail(shelterList.get(i).getCareRegNo());
			if( shelter == null )
				continue;
			resultList.add(shelter);
			System.out.println(i + ". 보호소 상세정보" );
		}
		
		return resultList;
	}
	
	/**
	 * String을 Doucment 객체로 리턴해주는 함수
	 * @param xmlStr
	 * @return
	 */
	private static Document convertStringToDocument(String xmlStr) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  
        DocumentBuilder builder;  
        try  
        {  
            builder = factory.newDocumentBuilder();  
            Document doc = builder.parse( new InputSource( new StringReader( xmlStr ) ) ); 
            return doc;
        } catch (Exception e) {  
            e.printStackTrace();  
        } 
        return null;
    }
	
	/**
	 * Document를 전달받아서 ShelterInfo List로 만들어준다.
	 * 
	 * @param a
	 * @return
	 */
    private static ArrayList<ShelterInfo> getShelterInfoList(Document a) {
    	ArrayList<ShelterInfo> resultList = new ArrayList<ShelterInfo>();
    	
    	NodeList items = a.getElementsByTagName("document");
    	items = a.getChildNodes().item(0).getChildNodes().item(1).getChildNodes().item(0).getChildNodes();

    	for (int i=0; i<items.getLength(); i++) {
    		// 모든 items
    		Node item = items.item(i);
    		NodeList b = item.getChildNodes();   
    		ShelterInfo shelter = new ShelterInfo(); 		
    		for (int j=0; j<b.getLength(); j++) {
    			// 각 item별 속성
    			String nodeName = b.item(j).getNodeName();
        		String nodeValue = b.item(j).getChildNodes().item(0).getTextContent();
        		
        		if ("careRegNo".equals(nodeName)) {
        			shelter.setCareRegNo(nodeValue);
        		} else if ("careNm".equals(nodeName)) {
        			shelter.setCareNm(nodeValue);
        		} else if ("careAddr".equals(nodeName)) {
        			shelter.setCareAddr(nodeValue);
        		} else if ("careTel".equals(nodeName)) {
        			shelter.setCareTel(nodeValue);
        		} else if ("dataStdDt".equals(nodeName)) {
        			shelter.setDataStdDt(nodeValue);
        		} else if ("divisionNm".equals(nodeName)) {
        			shelter.setDivisionNm(nodeValue);
        		} else if ("jibunAddr".equals(nodeName)) {
        			shelter.setJibunAddr(nodeValue);
        		} else if ("orgNm".equals(nodeName)) {
        			shelter.setOrgNm(nodeValue);
        		} else if ("rnum".equals(nodeName)) {
        			shelter.setRnum(nodeValue);
        		}
    		}
    		
    		resultList.add(shelter);
    	}
		return resultList;
	}

	/**
	 * Document를 전달받아서 AnimalInfo List로 만들어준다.
	 * 
	 * @param a
	 * @return
	 */
    private static AnimalApiVO getAnimalInfoList(Document a) {
    	AnimalApiVO apiVO = new AnimalApiVO();
    	ArrayList<AnimalInfo> resultList = new ArrayList<AnimalInfo>();
    	
    	NodeList items = a.getElementsByTagName("document");
    	NodeList bodyChildrens = a.getChildNodes().item(0).getChildNodes().item(1).getChildNodes();
    	items = bodyChildrens.item(0).getChildNodes();
    	int totalCount = 0;
    	
    	
    	for (int i=0; i<bodyChildrens.getLength(); i++) {
    		Node item = bodyChildrens.item(i);
			String nodeName = item.getNodeName();
    		String nodeValue = item.getTextContent();
    		
    		if ("totalCount".equals(nodeName)) {
    			// Body 자식 노드 중  totalCount name값을 지니고 있다면 해당 노드의 value값이 totalCount.
    			totalCount = Integer.parseInt(nodeValue);
    			apiVO.setTotalCount(totalCount);
    		}
    	}

    	for (int i=0; i<items.getLength(); i++) {
    		// 모든 items
    		Node item = items.item(i);
    		NodeList b = item.getChildNodes();   
    		AnimalInfo shelter = new AnimalInfo(); 		
    		for (int j=0; j<b.getLength(); j++) {
    			// 각 item별 속성
    			String nodeName = b.item(j).getNodeName();
        		String nodeValue = b.item(j).getChildNodes().item(0).getTextContent();

        		if ("age".equals(nodeName)) {
        			shelter.setAge(nodeValue);
        		} else if ("careAddr".equals(nodeName)) {
        			shelter.setCareAddr(nodeValue);
        		} else if ("careNm".equals(nodeName)) {
        			shelter.setCareNm(nodeValue);
        		} else if ("careTel".equals(nodeName)) {
        			shelter.setCareTel(nodeValue);
        		} else if ("chargeNm".equals(nodeName)) {
        			shelter.setChargeNm(nodeValue);
        		} else if ("colorCd".equals(nodeName)) {
        			shelter.setColorCd(nodeValue);
        		} else if ("desertionNo".equals(nodeName)) {
        			shelter.setDesertionNo(nodeValue);
        		} else if ("filename".equals(nodeName)) {
        			shelter.setFilename(nodeValue);
        		} else if ("happenDt".equals(nodeName)) {
        			shelter.setHappenDt(nodeValue);
        		} else if ("happenPlace".equals(nodeName)) {
        			shelter.setHappenPlace(nodeValue);
        		} else if ("kindCd".equals(nodeName)) {
        			shelter.setKindCd(nodeValue);
        		} else if ("neuterYn".equals(nodeName)) {
        			shelter.setNeuterYn(nodeValue);
        		} else if ("noticeEdt".equals(nodeName)) {
        			shelter.setNoticeEdt(nodeValue);
        		} else if ("noticeNo".equals(nodeName)) {
        			shelter.setNoticeNo(nodeValue);
        		} else if ("noticeSdt".equals(nodeName)) {
        			shelter.setNoticeSdt(nodeValue);
        		} else if ("officetel".equals(nodeName)) {
        			shelter.setOfficetel(nodeValue);
        		} else if ("orgNm".equals(nodeName)) {
        			shelter.setOrgNm(nodeValue);
        		} else if ("popfile".equals(nodeName)) {
        			shelter.setPopfile(nodeValue);
        		} else if ("processState".equals(nodeName)) {
        			shelter.setProcessState(nodeValue);
        		} else if ("sexCd".equals(nodeName)) {
        			shelter.setSexCd(nodeValue);
        		} else if ("specialMark".equals(nodeName)) {
        			shelter.setSpecialMark(nodeValue);
        		} else if ("weight".equals(nodeName)) {
        			shelter.setWeight(nodeValue);
        		}
    		}
    		
    		resultList.add(shelter);
    	}
    	apiVO.setAnimalInfo(resultList);
		return apiVO;
	}
	
	
	// 요청이름에 맞는 응답 html 반환
	public StringBuilder getReponse(String requestName, int requestNo, ArrayList<String> paramNm, ArrayList<String> paramVal) throws Exception {
		
		StringBuilder urlBuilder = new StringBuilder(baseUrl + requestName); 
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + serviceKey);
        
        // 시도 요청
        if( requestNo == 1 ) {
        	for (int i = 0; i < paramNm.size(); i++) {
        		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8") + "=" + paramVal.get(i) ); 
        	}
        	
        }
        
        // 시군구 요청
        if( requestNo == 2 ) {
        	// &upr_cd=6110000
        	for (int i = 0; i < paramNm.size(); i++) {
        		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8") + "=" + paramVal.get(i) ); 
        	}
        	
        }
        // 유기동물 품종 요청
        if ( requestNo == 4) {
        	for (int i = 0; i < paramNm.size(); i++) {
        		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8")+ "=" + paramVal.get(i));
        	}
        }
        
        // 유기동물 정보 요청
        if( requestNo == 5 ) {
        	
        	for (int i = 0; i < paramNm.size(); i++) {
        		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8") + "=" + paramVal.get(i) ); 
			}
        }
        
        // 보호소 번호/명 요청
        if( requestNo == 6 ) {
        	
        	for (int i = 0; i < paramNm.size(); i++) {
        		urlBuilder.append("&" + URLEncoder.encode(paramNm.get(i), "UTF-8") + "=" + paramVal.get(i) ); 
			}
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
        System.out.println("@AnimalApiUtil - getResponse() - " + requestNo);
        System.out.println(sb.toString());
        
        return sb;
	}

	

	

}
