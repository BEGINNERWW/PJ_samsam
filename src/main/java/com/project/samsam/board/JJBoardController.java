package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.samsam.member.MemberVO;


@Controller
public class JJBoardController {

	@Autowired
	private JJBoardService boardService; // BoardService빈객체가 만들어져있어야 한다
	
	@RequestMapping("/home_search.me")
	public String getSearchlist(@RequestParam(value="keyword", required= true, defaultValue="")String keyword, Model model){
			//커뮤니티
			List<JJBoardVO> c_list = boardService.getSearch_commu_List(keyword);
		try {
			if(c_list != null) {
				model.addAttribute("community",c_list); 
			}
			else{
				System.out.println("community");
			}
		}
		catch(Exception e) {
			System.out.println("검색 에러(커뮤니티) : " + e.getMessage());
		}
		//분양
		List<JJBoardVO> a_list = boardService.getSearch_adopt_List(keyword);
		try {
			if(a_list != null) {
				model.addAttribute("adopt_list",a_list); 
			}
			else{
				System.out.println("adopt_list");
			}
		}
		catch(Exception e) {
			System.out.println("검색 에러(분양) : " + e.getMessage());
		}
		//책임분양
		List<JJBoardVO> f_list = boardService.getSearch_free_List(keyword);
		try {
			if(f_list != null) {
				model.addAttribute("free_doc",f_list); 
			}
			else{
				System.out.println("free_doc");
			}
		}
		catch(Exception e) {
			System.out.println("검색 에러(책임분양) : " + e.getMessage());
		}
		
           return "jj/ho_search_list";
        
	}
	
	@RequestMapping("/s_board_detail.bo")
	public String getSDetail(@RequestParam(value ="b_no", required = true) int b_no, Model model) {
		try {
		JJBoardVO bvo = boardService.getSDetail(b_no);

		model.addAttribute("bvo", bvo);
		System.out.println("글보기"+bvo);
		}catch(Exception e) {
			e.getMessage();
		}
		return "jj/ho_search_view";
	}
	//홈페이지 원본 글이동   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>a href 이동을 위한 메소드 수정필요
	
////////////////////////////	
	//관리자 페이지 컨트롤러
	
	@RequestMapping("/adminboard.do")
	public String adminboard() throws Exception {
		return "jj/admin_board";
	}
	

	
	@RequestMapping(value="/boardFind.do",
						produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<JJABoardVOto> getAFindList(@RequestBody JJABoardVO abvo) throws Exception {
		System.out.println("startDate : " + abvo.getStartDate());
		System.out.println("startDate : " + abvo.getEndDate());
		System.out.println("startDate : " + abvo.getKeyword());
		System.out.println("startDate : " + abvo.getKategorie());
		List<JJABoardVOto> list = boardService.findList(abvo);
		System.out.println(3);

		System.out.println(2);
		return list;
		}
	//어드민 게시글관리 일반리스트 함수
	
	@RequestMapping(value="/boardWFind.do",
			produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<JJABoardVOto> getFindWList(@RequestBody JJABoardVO abvo) throws Exception {
		System.out.println("startDate : " + abvo.getStartDate());
		System.out.println("startDate : " + abvo.getEndDate());
		System.out.println("startDate : " + abvo.getKeyword());
		System.out.println("startDate : " + abvo.getKategorie());
		System.out.println("kind : " + abvo.getKind());
		List<JJABoardVOto> list = boardService.find_w_List(abvo);
		System.out.println(3);

		System.out.println(2);
		return list;
		}
	//어드민 게시글관리 신고리스트 함수 
	////////////////////
	//어드민 게시글 view  함수
	
	@RequestMapping(value="/admin_b_detail.do",
			produces="application/json;charset=utf-8")
	@ResponseBody
	public Map<String,Object> map (@RequestBody JJADModalVO mvo) throws Exception{
		System.out.println("컨트롤러 board_detail.do");
		Map<String,Object> map = new HashMap<String, Object>(); 
		System.out.println("카테고리 : "+ mvo.getCategory());
		MemberVO vo = boardService.adModalView_m(mvo);
		if(vo != null) {
			System.out.println("vo.grade : " +vo.getGrade());
			map.put("MemberVO", vo);
		}
		else {
			System.out.println("modal MemberVO null");
		}
		JJABoardVOto bvo = boardService.adModalView_b(mvo);
		if(bvo != null) {
			String category=mvo.getCategory();
			if(category.equals("community")) {
				bvo.setCategory("커뮤니티");
				map.put("ABoardVOto", bvo);
			}
			else{
				bvo.setCategory("분양게시판");
				map.put("ABoardVOto", bvo);
			}
		}
		else {
			System.out.println("modal ABoardVOto null");
		}
		
		List<JJCommentVO> cList = boardService.adModalView_c(mvo);
		if(cList != null) {
			map.put("cList", cList);
		}
		else {
			System.out.println("modal cList null");
		}
		JJCommentVO co_count = boardService.adModalView_ccount(mvo);
		if(co_count != null) {
			map.put("CommentVO", co_count);
		}
		else {
			System.out.println("modal ccount null");
		}
		
		List<JJWarningVO> wList = boardService.adModalView_w(mvo);
		if(wList != null) {
			map.put("wList", wList);
		}
		else {
			System.out.println("modal cList null");
		}
		JJWarningVO wcount = boardService.adModalView_wcount(mvo);
		if(wcount != null) {
			map.put("WarningVO", wcount);
		}
		else {
			System.out.println("modal wcount null");
		}
		
		System.out.println(map);
		return map;
	}
	
	//어드민 게시글 view  함수 끝
	

}
