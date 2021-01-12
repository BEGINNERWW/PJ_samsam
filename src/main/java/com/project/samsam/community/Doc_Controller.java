package com.project.samsam.community;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.samsam.fdocboard.FdocVO;




@Controller
public class Doc_Controller {
	@Autowired
	private Doc_Service DocService;
	
	@RequestMapping("/doc_write.bo")
	public String DocInsert(DocVO vo) throws Exception {
		vo.setDoc_nick("2");//세션 아이디 저장
		vo.setDoc_email("gmail.com");//세션 이메일 저장
		DocService.boardInsert(vo);
		
		return "redirect:/doclist.bo";
		
	}
	@RequestMapping(value = "/docform.bo", method = RequestMethod.GET)
	public String doc_Form() {
		
		return "doc_form";
	}
	
	@RequestMapping("/doclist.bo")
	public String getFdoclist(Model model, @RequestParam(value="page", required=false, 
	defaultValue="1") int page,HttpSession session,DocVO vo) {
		int limit=20;
		
		int listcount=DocService.getListCount();
		
		int startrow = (page-1)*20+1;
		int endrow = startrow+limit-1;
		
		//HashMap<String,Integer> hashmap = new HashMap<String,Integer>();
		//hashmap.put("startrow", startrow);
		//hashmap.put("endrow",endrow);
		vo.setStartrow(startrow);
		vo.setEndrow(endrow);
		List<DocVO> doclist = DocService.getDocList(vo);
		//총 페이지 수
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("doclist", doclist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
	
		return "doc_list";
	}
	@RequestMapping("/docdetail.bo")
	public String fdocView(@RequestParam(value="doc_no", required=true) int doc_no,@RequestParam(value="page", required=false,defaultValue="1")int page, Model model) {
		DocVO vo = DocService.getView(doc_no);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		return "doc_view";
	}
	

}
