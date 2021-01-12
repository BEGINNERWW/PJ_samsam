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
		vo.setDoc_nick("2");//���� ���̵� ����
		vo.setDoc_email("gmail.com");//���� �̸��� ����
		DocService.boardInsert(vo);
		
		return "redirect:/doclist.bo";
		
	}
	@RequestMapping(value = "/docform.bo", method = RequestMethod.GET)
	public String doc_Form() {
		
		return "js/doc_form";
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
		//�� ������ ��
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��
   		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("doclist", doclist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
	
		return "js/doc_list";
	}
	@RequestMapping("/docdetail.bo")
	public String fdocView(@RequestParam(value="doc_no", required=true) int doc_no,@RequestParam(value="page", required=false,defaultValue="1")int page, Model model) {
		DocVO vo = DocService.getView(doc_no);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		return "js/doc_view";
	}
	

}
