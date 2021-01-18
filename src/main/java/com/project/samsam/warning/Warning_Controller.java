package com.project.samsam.warning;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





@Controller
public class Warning_Controller {
	
	@Autowired
	private Warning_Service WarningService;
	
	@ResponseBody
	@RequestMapping(value="/fdoc_warning.bo",produces="application/json;charset=UTF-8")
	private int warningInsert(WarningVO vo, HttpSession session,@RequestParam(value="etc_reason",required=false) String etc_reason) throws Exception{
		//comment.setFdoc_CNick((String)session.getAttribute("id"));
		if(etc_reason != null) {
			vo.setW_reason(etc_reason);
		}
		vo.setW_nick("2");
		vo.setW_status("대기중");
		vo.setW_category("책임");
		vo.setW_note("처리 대기중입니다");
		return WarningService.warningInsertService(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/doc_warning.bo",produces="application/json;charset=UTF-8")
	private int docInsert(WarningVO vo, HttpSession session,@RequestParam(value="etc_reason",required=false) String etc_reason) throws Exception{
		//comment.setFdoc_CNick((String)session.getAttribute("id"));
		if(etc_reason != null) {
			vo.setW_reason(etc_reason);
		}
		vo.setW_nick("2");
		vo.setW_status("대기중");
		vo.setW_category("커뮤니티");
		vo.setW_note("처리 대기중입니다");
		return WarningService.warningInsertService(vo);
	}

}
