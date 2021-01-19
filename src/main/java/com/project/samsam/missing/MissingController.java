package com.project.samsam.missing;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/SJ/missing")
public class MissingController {

	private static final Logger logger = LoggerFactory.getLogger(MissingController.class);
	
	@Autowired
	private MissingService service;
	
	//실종 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		model.addAttribute("list", service.list());
	}
	
	// 실종 글쓰기 화면
	@RequestMapping(value= "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception{
		
	}
	
	//실종 글쓰기 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, MissingVO missingVO) throws Exception{
		logger.info("@MissingController");
		logger.info(missingVO.toString());
		service.register(missingVO);
		
		model.addAttribute("list",service.list());
		return "SJ/missing/list";
	}
	
	//실종 글 읽기 화면
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void registerForm(Model model, Integer m_no) throws Exception{
		
	}
}
