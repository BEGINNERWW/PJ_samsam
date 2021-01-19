package com.project.samsam.shelter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.samsam.api.AnimalApiUtil;
import com.project.samsam.api.AnimalInfo;
import com.project.samsam.api.AnimalKind;
import com.project.samsam.api.PageInfo;
import com.project.samsam.api.ShelterApiUtil;
import com.project.samsam.api.ShelterInfo;
import com.project.samsam.api.Sido;
import com.project.samsam.api.Sigungu;


@Controller
@RequestMapping("/SJ")
public class ShelterController {

	// 보호 동물 찾기 화면
	@RequestMapping(value = "/pet_list", method = RequestMethod.GET)
	public String petList(Model model) throws Exception {

		AnimalApiUtil animalUtil = new AnimalApiUtil();
		
		// 날짜
		Calendar calendar = Calendar.getInstance();
		String year = "yyyy";
		
		SimpleDateFormat yyyy = new SimpleDateFormat(year);
		year = yyyy.format(calendar.getTime());
		
		// 연초~연말 (default)
		String firstDate = year + "0101";
		String lastDate = year + "1231";
		
		model.addAttribute("firstDate", firstDate);
		model.addAttribute("lastDate", lastDate);
		System.out.println("@petList()");
		System.out.println(firstDate);
		System.out.println(lastDate);
		
		// 보호 동물 정보
		ArrayList<AnimalInfo> animalList = animalUtil.getAnimalInfo(firstDate, lastDate, 417000, "notice", 1, 10, "Y");
		model.addAttribute("animalList", animalList);
		
		// 시도
		ArrayList<Sido> sido = animalUtil.getSido();
		model.addAttribute("sido", sido);

		return "SJ/pet_list";
	}
	
	@RequestMapping(value = "/pet_detail", method = RequestMethod.GET)
	public String petDetail(Model model, AnimalInfo animalInfo) throws Exception {
		
		System.out.println("@ShelterController - petDetail() ");
		System.out.println(animalInfo);
		
		model.addAttribute("animalInfo", animalInfo);
		
		return "SJ/pet_detail";
	}
	
	
	// 보호소 찾기 화면
	@RequestMapping(value = "/shelter_list", method = RequestMethod.GET)
	public String shelterList(Model model) throws Exception {

		AnimalApiUtil animalUtil = new AnimalApiUtil();

		ArrayList<Sido> sido = animalUtil.getSido();

		model.addAttribute("sido", sido);
		//
		
		return "/SJ/shelter_list";
	}

	// 시군구 요청
	@RequestMapping(value = "/SiGunGu", method = RequestMethod.POST)
	public List<Sigungu> getSiGunGuList(Model model, int sidoCode) throws Exception{
		
		AnimalApiUtil animalUtil = new AnimalApiUtil();
		
		
		List<Sigungu> siGunGuList = animalUtil.getSiGunGu(sidoCode);
		for (Sigungu sigungu : siGunGuList) {
			System.out.println(sigungu.getSigunguNm());
		}
		model.addAttribute("sigungu", siGunGuList);
		
		return siGunGuList;
	}
	
	// 축종 요청
	@RequestMapping(value = "/animalKind", method = RequestMethod.POST)
	public List<AnimalKind> getAnimalKindList(Model model, int upKindCode) throws Exception{
		
		AnimalApiUtil animalUtil = new AnimalApiUtil();
		
		List<AnimalKind> animalKindList = animalUtil.getAnimalKind(upKindCode);
		
		for (AnimalKind animalKind : animalKindList) {
			System.out.println(animalKind);
		}
		model.addAttribute("animalkind", animalKindList);
		
		return animalKindList;
	}
	
	
	// (필터)유기동물리스트  요청
	@RequestMapping(value = "/animalInfoList", method = RequestMethod.POST)
	public List<AnimalInfo> getAnimalList(Model model, String bgnde, String endde, Integer sido, Integer siGunGu, Integer upKind, Integer kind ) throws Exception{
		
		AnimalApiUtil animalUtil = new AnimalApiUtil();
		
		// '-' 제거하기
		bgnde = bgnde.replaceAll("-", "");
		endde = endde.replaceAll("-", "");
		
		System.out.println("@ShelterController ");
		System.out.println("bgnde : " + bgnde);
		System.out.println("endde : " + endde);
		System.out.println("sido : " + sido);
		System.out.println("siGunGu : " + siGunGu);
		System.out.println("upKind : " + upKind);
		System.out.println("kind : " + kind);
		
		// 보호 동물 정보
		ArrayList<AnimalInfo> animalList = animalUtil.getAnimalInfo(bgnde, endde, sido, siGunGu, upKind, kind, "notice", 1, 10, "Y");
		model.addAttribute("animalList", animalList);
		
		return animalList;
	}
	
	// 보호소 리스트 요청
	@RequestMapping(value = "/shelterList", method = RequestMethod.GET)
	public List<ShelterInfo> getShelterList(Model model, Integer sidoCode, Integer siGunGuCode, Integer pageNo) throws Exception {
		
		AnimalApiUtil animalUtil = new AnimalApiUtil();
		ShelterApiUtil shelterUtil = new ShelterApiUtil();
		
		System.out.println("sidoCode : "+ sidoCode);
		System.out.println("siGunGuCode : "+ siGunGuCode);
		
		// 보호소 정보
		ArrayList<ShelterInfo> shelterList = null;
		
		// 페이지 정보
		PageInfo pageInfo = null;
		
		// 시도 : 전체
		if( sidoCode == 0 ) {
			shelterList = shelterUtil.getAllShelterDetail(pageNo);
			pageInfo = shelterUtil.getPageInfo(pageNo);
		} else {
			shelterList = animalUtil.getShelterInfo(sidoCode, siGunGuCode, pageNo);
		}
		
		System.out.println("################ pageInfo ######################");
		System.out.println(pageInfo);
		
		int totalCount;
		int numOfRows;
		int startNo = 1;
		int maxNo = 1;
		int endNo = 1;
		
		if( pageInfo != null ) {
			
			totalCount = pageInfo.getTotalCount();
			numOfRows =  pageInfo.getNumOfRows();
			startNo = pageInfo.getPageNo();
			maxNo = ( totalCount / numOfRows ) + 1;
			endNo = 0;
			
			if( startNo + numOfRows - 1 > maxNo ) {
				endNo = maxNo;
			} else {
				endNo = startNo + numOfRows - 1;
			}
			
			pageInfo.setStartNo(startNo);
			pageInfo.setEndNo(endNo);
			pageInfo.setMaxNo(maxNo);
		}
		
		model.addAttribute("pageInfo", pageInfo);
		
		// model
		model.addAttribute("shelterList", shelterList);
		
		
		if( pageNo == null )
			model.addAttribute("pageNo", 1);
		else 
			model.addAttribute("pageNo", pageNo);
		
		return shelterList;
	}
	
	
	
	
	
	
	
	
	

	
}
