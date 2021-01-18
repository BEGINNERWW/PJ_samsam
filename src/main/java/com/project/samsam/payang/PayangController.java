package com.project.samsam.payang;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/SJ/payang")
public class PayangController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayangController.class);
	
	@Autowired
	private PayangService service;
	
	// 파양 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		model.addAttribute("list",service.list());
	}
	
	// 파양 글쓰기 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception{
		
		
	}
	
	// 파양 글쓰기 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, PayangVO payangVO) throws Exception{
		logger.info("@PayangController");
		logger.info(payangVO.toString());
		service.register(payangVO);
		
		model.addAttribute("list",service.list());
		return "SJ/payang/list";
	}
	 
	
	// 파양 글읽기 화면
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void registerForm(Model model, Integer p_no) throws Exception{
		model.addAttribute("payang",service.read(p_no) );
		
	}
	
	
	// 파양 글수정 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm(Model model, Integer p_no) throws Exception{
		model.addAttribute("payang",service.read(p_no) );
		
	}
	
	
	// 파양 글수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, PayangVO payang) throws Exception{
		logger.info(payang.toString());
		service.modify(payang);
		
		model.addAttribute("list",service.list());
		return "SJ/payang/list";
	}
	
	
	// 파양 글삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(Model model, Integer p_no) throws Exception{
		
		service.remove(p_no);
		
		model.addAttribute("list",service.list());
		return "SJ/payang/list";
	}
	
}

















