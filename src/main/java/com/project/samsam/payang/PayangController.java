package com.project.samsam.payang;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.utils.UploadFileUtils;


@Controller
public class PayangController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayangController.class);
	
	@Autowired
	private PayangService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 파양 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		
		List<PayangVO> list = service.list();
		for (int i=0; i<list.size(); i++) {
			String content = list.get(i).getDoc_content();
			Matcher match = pattern.matcher(content);
			String fdoc_thumbnail = null;
			
			if(match.find()){ // �̹��� �±׸� ã�Ҵٸ�,,
			    fdoc_thumbnail = match.group(0); // �� ���� �߿� ù��° �̹��� �±׸� �̾ƿ�.
			}
			if (fdoc_thumbnail != null) {
				// 썸네일이 존재할 경우 추출
				int index1 =fdoc_thumbnail.lastIndexOf("/");
				fdoc_thumbnail = fdoc_thumbnail.substring(index1+1);
				int index2 = fdoc_thumbnail.lastIndexOf(".");
				int index3 = fdoc_thumbnail.indexOf("\"");
				String fileExt = fdoc_thumbnail.substring(index2+ 1,index3).trim();
				fdoc_thumbnail = fdoc_thumbnail.substring(0, index2);   
		        String fullPath = uploadPath+fdoc_thumbnail+"."+fileExt;
		        System.out.println(fullPath);
		        
		        fullPath = "\\" + fullPath.split("resources")[1];
		        System.out.println(fullPath);
		        
		        fullPath = fullPath.replaceAll("\\\\", "/");
		        System.out.println(fullPath);
		        
		        list.get(i).setThumbnail(fullPath);
			}
		}

		model.addAttribute("list",list);
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
	public void registerForm(Model model, Integer doc_no) throws Exception{
		model.addAttribute("payang",service.read(doc_no) );
		
	}
	
	
	// 파양 글수정 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm(Model model, Integer doc_no) throws Exception{
		model.addAttribute("payang",service.read(doc_no) );
		
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
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(Model model, Integer doc_no) throws Exception{
		
		service.remove(doc_no);
		
		model.addAttribute("list",service.list());
		return "SJ/payang/list";
	}
	
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/comment_insert", method = RequestMethod.POST)
	public int replyRegister(Model model, PayangReplyVO reply) throws Exception {
		
		return service.replyRegister(reply); 
	}
	
	// 댓글 등록
	@RequestMapping(value = "/comment_list", method = RequestMethod.GET)
	public String replyList(Model model, Integer doc_no) throws Exception {
		
		model.addAttribute("reply", service.replyList(doc_no));
		
		
		return "SJ/payang/reply_list";
	}
	
	//썸머노트 이미지 업로드
	@ResponseBody
	@PostMapping("/send_image")
	public void auth_image(MultipartFile file, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		PrintWriter out = response.getWriter();
		
		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		out.println("/resource" + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		out.close();
	}
}

















