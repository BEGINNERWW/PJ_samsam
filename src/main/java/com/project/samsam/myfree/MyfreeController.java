package com.project.samsam.myfree;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.utils.UploadFileUtils;


@Controller
public class MyfreeController {
	
	@Autowired
	private MyfreeServiceImpl MyfreeService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//마이페이지 책임분양
	@RequestMapping("/myfree_auth.me")
		public String mypage_free_auth(Model model, HttpSession session) throws Exception {
		
		//Member_listVO
		String email = (String)session.getAttribute("email");
		Member_listVO member_listVO = MyfreeService.selectMember(email);
		
		//Myfree_doc_confirmVO
		List<Myfree_doc_confirmVO> myfree_doc_confirmVO = MyfreeService.selectConfirm(email);
		
		
		//Myfree_authVO
		List<Myfree_authVO> myfree_authVO = MyfreeService.selectAuth(email);
		
		//Myfree_doc
		List<Myfree_docVO> myfree_docVO = MyfreeService.selectDoc(email);
		
		model.addAttribute("member_listVO", member_listVO);
		model.addAttribute("myfree_doc_confirmVO", myfree_doc_confirmVO);
		model.addAttribute("myfree_authVO", myfree_authVO);
		model.addAttribute("myfree_docVO", myfree_docVO);
		
		return "JunYoung/mypage_free_auth";
	}
	
	//환급계좌 입력
	@RequestMapping(value="/insertAccount.me", method=RequestMethod.POST, 
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertAccount(Myfree_doc_confirmVO myfree_doc_confirmVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			MyfreeService.insertAccount(myfree_doc_confirmVO);
			
			retVal.put("res", "OK");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
		}
		return retVal;
	}
	
	//책임분양 인증글 작성창 띄우기
	@RequestMapping("/write_auth_form.me")
		public String write_auth(Model model, Myfree_doc_confirmVO confirm_list, HttpSession session) throws Exception {
		
		String email = (String)session.getAttribute("email");
		Member_listVO member_listVO = MyfreeService.selectMember(email);
		
		String confirm_no = confirm_list.getConfirm_no();
		
		Myfree_doc_confirmVO myfree_doc_confirm_write = MyfreeService.selectConfirm_write(confirm_no);
		
		
		model.addAttribute("member_listVO", member_listVO);
		model.addAttribute("myfree_doc_confirm_write", myfree_doc_confirm_write);
		
		return "JunYoung/write_free_auth_form";
	}
	
	//책임분양 인증글 작성
	@RequestMapping("/write_auth.me")
	public String write_auth(Myfree_authVO myfree_authVO) throws Exception {
		
		int res = MyfreeService.insertFree_auth(myfree_authVO);

		return "redirect:/myfree_auth.me";
		
	}
	
	//책임분양 인증글 조회
	@RequestMapping("/free_auth_view.me")
		public String free_auth_view(@RequestParam(value="fadoc_no", required=true) int fadoc_no, Model model) {
		
		Myfree_authVO auth_view = MyfreeService.selectAuth_view(fadoc_no);
		String confirm_no = auth_view.getFadoc_confirm_no();
		Myfree_doc_confirmVO confirm_view = MyfreeService.selectConfirm_view(confirm_no);
		
		model.addAttribute("auth_view", auth_view);
		model.addAttribute("confirm_view", confirm_view);
		
		return "JunYoung/free_auth_view";
	}
	
	//고객센터
	@RequestMapping("/customer_service.me")
	public String customer_service(Model model, HttpSession session) throws Exception { 
		//String email = (String)session.getAttribute("email");
		//Member_listVO member_listVO = MyfreeService.selectMember(email);
		
		//model.addAttribute("member_listVO", member_listVO);
		
		return "customer_service";
	}
	
	//책임분양 사진 수정하기.
	@RequestMapping(value = "/fileUpload.me", method = RequestMethod.POST)
	public String fileUpload(Myfree_doc_confirmVO myfree_doc_confirmVO, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		myfree_doc_confirmVO.setConfirm_fdoc_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		MyfreeService.update_fdoc_img(myfree_doc_confirmVO);
		System.out.println("1");
		return "redirect:/myfree_auth.me";
	}
	
}
