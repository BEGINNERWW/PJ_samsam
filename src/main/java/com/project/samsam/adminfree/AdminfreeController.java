package com.project.samsam.adminfree;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.samsam.myfree.Myfree_authVO;
import com.project.samsam.myfree.Myfree_doc_confirmVO;

@Controller
public class AdminfreeController {

	@Autowired
	private AdminfreeServiceImpl AdminfreeService;
	
	
	//관리자 페이지 책임분양
	@RequestMapping("/adminfree_auth.me")
	public String getAuthlist(Model model, @RequestParam(value="page", required=false, 
	defaultValue="1") int page) { 
		int limit=10;	

		int listcount=AdminfreeService.getListCount();	
		
		int startrow = (page-1)*10+1;
		int endrow=startrow+limit-1;
		HashMap<String, Integer> hashmap =
				new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<Myfree_authVO> authlist = AdminfreeService.getAuthList(hashmap);	//getBoardList에 hashmap을 파라미터로 전달한다.
		
		
		//총 페이지 수
	int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리. 글이 1개라도 있으면 1페이지이기 때문에.
	//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
	int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
	int endpage = maxpage;
	
	if (endpage>startpage+10-1) endpage=startpage+10-1;	//endpage를 재조정하는 작업. 하단에 들어갈 페이지 조정.
	
	model.addAttribute("page", page);
	model.addAttribute("listcount", listcount);
	model.addAttribute("authlist", authlist);
	model.addAttribute("maxpage", maxpage);
	model.addAttribute("startpage", startpage);
	model.addAttribute("endpage", endpage);

	return "adminpage/adminpage";
	}
	
	
	
	//관리자 페이지 상세보기
	@RequestMapping("/free_auth_datail.me")
	public String free_auth_detail(Model model, Myfree_authVO auth_list) throws Exception {
		int fadoc_no = auth_list.getFadoc_no();
		Myfree_authVO myfree_auth_detail_re_re = AdminfreeService.selectAuth_detail_re_re(fadoc_no);
		
		String confirm_no = myfree_auth_detail_re_re.getFadoc_confirm_no();

		Myfree_doc_confirmVO myfree_doc_confirm_detail = AdminfreeService.selectConfirm_detail(confirm_no);
		
		List<Myfree_authVO> myfree_auth_detail = AdminfreeService.selectAuth_detail(confirm_no);

		
		model.addAttribute("myfree_doc_confirm_detail", myfree_doc_confirm_detail);
		model.addAttribute("myfree_auth_detail", myfree_auth_detail);
		
		return "admin_free_auth_detail";
	}
	
	//책임글 인증 완료
	@RequestMapping("/free_auth_ok.me")
	public String update_auth_ok(Myfree_authVO myfree_authVO) throws Exception {
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_ok(fadoc_no);
		
		return "redirect:/adminfree_auth.me";
	}
	
	//책임글 재인증 필요
	@RequestMapping("/free_auth_re.me")
	public String update_auth_re(Myfree_authVO myfree_authVO) throws Exception {
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_re(fadoc_no);
		
		return "redirect:/adminfree_auth.me";
	}
	
	//책임글 반려
	@RequestMapping("/free_auth_no.me")
	public String update_auth_no(Myfree_authVO myfree_authVO) throws Exception {
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_no(fadoc_no);
		
		return "redirect:/adminfree_auth.me";
	}
	
	//책임글 상세보기 인증 완료
	@RequestMapping("/free_auth_detail_ok.me")
	public ModelAndView update_auth_detail_ok(Myfree_authVO myfree_authVO) throws Exception {
		ModelAndView result = new ModelAndView();
		
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_ok(fadoc_no);
		
		Myfree_authVO myfree_auth_detail_re_re = AdminfreeService.selectAuth_detail_re_re(fadoc_no);	//myfree_doc_confirmVO 조회하기위해 필요
		String confirm_no = myfree_auth_detail_re_re.getFadoc_confirm_no();
		
		List<Myfree_authVO> myfree_auth_detail_re = AdminfreeService.selectAuth_detail_re(confirm_no);
		Myfree_doc_confirmVO myfree_doc_confirm_detail_re = AdminfreeService.selectConfirm_detail_re(confirm_no);
		
		
		result.addObject("myfree_doc_confirm_detail", myfree_doc_confirm_detail_re);
		result.addObject("myfree_auth_detail", myfree_auth_detail_re);
		result.setViewName("admin_free_auth_detail");
		
		return result;
	}
	
	//책임글 상세보기 재인증 필요
	@RequestMapping("/free_auth_detail_re.me")
	public ModelAndView update_auth_detail_re(Myfree_authVO myfree_authVO) throws Exception {
		ModelAndView result = new ModelAndView();
		
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_re(fadoc_no);
		
		Myfree_authVO myfree_auth_detail_re_re = AdminfreeService.selectAuth_detail_re_re(fadoc_no);	//myfree_doc_confirmVO 조회하기위해 필요
		String confirm_no = myfree_auth_detail_re_re.getFadoc_confirm_no();
		
		List<Myfree_authVO> myfree_auth_detail_re = AdminfreeService.selectAuth_detail_re(confirm_no);
		Myfree_doc_confirmVO myfree_doc_confirm_detail_re = AdminfreeService.selectConfirm_detail_re(confirm_no);
		
		result.addObject("myfree_doc_confirm_detail", myfree_doc_confirm_detail_re);
		result.addObject("myfree_auth_detail", myfree_auth_detail_re);
		result.setViewName("admin_free_auth_detail");
		
		return result;
	}
	
	//책임글 상세보기 반려
	@RequestMapping("/free_auth_detail_no.me")
	public ModelAndView update_auth_detail_no(Myfree_authVO myfree_authVO) throws Exception {
		ModelAndView result = new ModelAndView();
		
		int fadoc_no = myfree_authVO.getFadoc_no();
		int res = AdminfreeService.update_auth_no(fadoc_no);
		
		Myfree_authVO myfree_auth_detail_re_re = AdminfreeService.selectAuth_detail_re_re(fadoc_no);	//myfree_doc_confirmVO 조회하기위해 필요
		String confirm_no = myfree_auth_detail_re_re.getFadoc_confirm_no();
		
		List<Myfree_authVO> myfree_auth_detail_re = AdminfreeService.selectAuth_detail_re(confirm_no);
		Myfree_doc_confirmVO myfree_doc_confirm_detail_re = AdminfreeService.selectConfirm_detail_re(confirm_no);
		
		result.addObject("myfree_doc_confirm_detail", myfree_doc_confirm_detail_re);
		result.addObject("myfree_auth_detail", myfree_auth_detail_re);
		result.setViewName("admin_free_auth_detail");
		
		return result;
	}
	
	
}
