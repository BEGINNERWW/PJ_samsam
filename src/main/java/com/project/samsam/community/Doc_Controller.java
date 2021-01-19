package com.project.samsam.community;


import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.samsam.fdocboard.FdocReflyVO;
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
	
	@ResponseBody
	@RequestMapping(value="/doccomment_insert.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceInsert(DocReflyVO comment, HttpSession session) throws Exception{
		//comment.setFdoc_CNick((String)session.getAttribute("id"));
		
		comment.setCo_nick("2");
		
		return DocService.commentInsertService(comment);
	}
	
	@ResponseBody
	@RequestMapping(value="/doccomment_list.bo", produces="application/json;charset=UTF-8")
	private List<DocReflyVO> mCommentServiceList(@RequestParam int co_doc_no) throws Exception{
		
		List<DocReflyVO> comment_list = DocService.commentListService(co_doc_no);
		
		
		return comment_list;
	
	}
	
	@ResponseBody
	@RequestMapping(value="/doccomment_update.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceUpdateProc(DocReflyVO comment) throws Exception{
		
		return DocService.commentUpdateService(comment);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/doccomment_refly.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceReflyInsert(DocReflyVO comment) throws Exception{
		comment.setCo_nick("2");
		
		return DocService.commentReflyService(comment);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/doccomment_delete.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceDelete(DocReflyVO vo) throws Exception{
		
		if(vo.getCo_lev() != 0) {
			return DocService.commentDeleteService(vo);
		}else {
			
			int res = DocService.deleteCount(vo.getCo_no());
			
			if(res == 1) {
				return DocService.commentDeleteService(vo);
			}else {
				
				
				return DocService.deleteUpdate(vo.getCo_no());
			}
			
		}
	}
	@RequestMapping(value = "/doc_update.bo", method = RequestMethod.GET)
	public String doc_update(@RequestParam(value="doc_no", required=true) int doc_no,Model model) {
		DocVO vo = DocService.getView(doc_no);
		model.addAttribute("vo",vo);
		
		
		return "js/doc_update";
	}
	
	@RequestMapping(value = "/doc_updateinsert.bo", method = RequestMethod.POST)
	public String doc_updateinsert(DocVO vo,Model model) throws Exception {
		
		vo.setDoc_email("123@gmail.net");
		int res = DocService.boardUpdate(vo);
		
		return "redirect:/docdetail.bo?doc_no="+vo.getDoc_no();
	}
	
	@RequestMapping(value = "/doc_delete.bo", method = RequestMethod.GET)
	public String doc_delete(DocVO vo) {
		DocService.boardDelete(vo);
		
		
		return "redirect:/doclist.bo";
	}

}
