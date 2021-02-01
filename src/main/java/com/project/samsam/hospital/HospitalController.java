package com.project.samsam.hospital;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HospitalController {
	
	@Autowired 
	private HospitalServiceImpl HospitalService;
	
	@RequestMapping("hospital_map.me") 
		public String hospital_map() throws Exception {
			return "JunYoung/hospital_map";
		}
	

	//리뷰 불러오기
	@RequestMapping("select_review.bo")
	public String select_review(Hospital_mapVO hospital_mapVO, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page)
		 throws Exception {
		
		String place_id = hospital_mapVO.getPlace_id();
		String place_name = hospital_mapVO.getPlace_name();
		String address_name = hospital_mapVO.getAddress_name();
		String place_phone = hospital_mapVO.getPlace_phone();
		String place_url = hospital_mapVO.getPlace_url();
		String place_email = hospital_mapVO.getPlace_email();
		
		//한 페이지에 5개
		int limit = 5;
		int listcount = HospitalService.reviewListCount(place_id);
				
		int startrow=(page-1)*5 + 1;
		int endrow=startrow+limit-1; 
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		hashmap.put("place_id", place_id);
		List<Hospital_mapVO> review_list = HospitalService.select_review(hashmap);
		
		//별점의 총합을 구하기 위함
		List<Hospital_mapVO> select_star = HospitalService.select_star(place_id);
		
		int star_rating_sum = 0;
		
		for (int i=0; i < select_star.size(); i++) {
			Hospital_mapVO star_sum = (Hospital_mapVO)select_star.get(i);
			
			star_rating_sum += star_sum.getStar_rating();
		}
		
		float star_rating_avg = ((float)star_rating_sum/(float)listcount);
		
		//총 페이지수
		int maxpage = (int)((double)listcount/limit+0.95);
		
		//현재 페이지에서 보여줄 시작 페이지 수
		int startpage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;;
				
		//현재 페이지에서 보여줄 마지막 페이지 수
		int endpage = (int)((double)listcount/limit+0.95);
		
		
		model.addAttribute("hospital_mapVO", review_list);
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		
		model.addAttribute("place_id", place_id);
		model.addAttribute("place_name", place_name);
		model.addAttribute("address_name", address_name);
		model.addAttribute("place_phone", place_phone);
		model.addAttribute("place_url", place_url);
		model.addAttribute("place_email", place_email);
		model.addAttribute("star_rating_avg", star_rating_avg);
		
		return "JunYoung/hospital_review";
	}
	//리뷰 작성
		@RequestMapping("write_review.bo") 
		public String write_review(Hospital_mapVO hospital_mapVO, Model model) throws Exception {
			
			String place_id = hospital_mapVO.getPlace_id();
			String place_name = hospital_mapVO.getPlace_name();
			String address_name = hospital_mapVO.getAddress_name();
			String place_phone = hospital_mapVO.getPlace_phone();
			String place_url = hospital_mapVO.getPlace_url();
			int star_rating = hospital_mapVO.getStar_rating();
			String place_email = hospital_mapVO.getPlace_email();
			
			String place_review = hospital_mapVO.getPlace_review();
			
			if (place_review == null || place_review == "") {
				hospital_mapVO.setPlace_review(" ");
			}
			
			int res = HospitalService.insert_review(hospital_mapVO);
			
			model.addAttribute("place_id", place_id);
			model.addAttribute("place_name", place_name);
			model.addAttribute("address_name", address_name);
			model.addAttribute("place_phone", place_phone);
			model.addAttribute("place_url", place_url);
			model.addAttribute("star_rating", star_rating);
			model.addAttribute("place_email", place_email);
			
			return "redirect:/select_review.bo";
			
		}
		
		@RequestMapping("delete_review.bo")
		public String delete_review(Hospital_mapVO hospital_mapVO, Model model) throws Exception {
			int review_num = hospital_mapVO.getReview_num();
			String address_name = hospital_mapVO.getAddress_name();
			
			Hospital_mapVO hospital_info = HospitalService.hospital_info(review_num);
			
			String place_id =hospital_info.getPlace_id();
			String place_name = hospital_info.getPlace_name();
			String place_phone = hospital_info.getPlace_phone();
			String place_url = hospital_info.getPlace_url();
			String place_email = hospital_info.getPlace_email();
			
			model.addAttribute("place_id", place_id);
			model.addAttribute("place_name", place_name);
			model.addAttribute("address_name", address_name);
			model.addAttribute("place_phone", place_phone);
			model.addAttribute("place_url", place_url);
			model.addAttribute("place_email", place_email);
			
			int res = HospitalService.delete_review(review_num);
			
			return "redirect:/select_review.bo";
		}
}
