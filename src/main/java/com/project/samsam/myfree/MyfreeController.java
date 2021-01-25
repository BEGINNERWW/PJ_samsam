package com.project.samsam.myfree;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
		public String mypage_free_auth(Model model, HttpSession session, @RequestParam(value="page", required=false,
		defaultValue="1")int page, @RequestParam(value="page_doc", required=false, defaultValue="1")int page_doc) throws Exception {
		
		//Member_listVO
		String email = (String)session.getAttribute("email");
		Member_listVO member_listVO = MyfreeService.selectMember(email);
		
		//Myfree_authVO
		List<Myfree_authVO> myfree_authVO = MyfreeService.selectAuth(email);
		
		
		
		//책임분양 관리 페이징 처리
		//1페이지에 1개
		int limit=1;
		int listcount = MyfreeService.ConfirmListCount(email);
		
		int startrow=(page-1) + 1;
		int endrow=(page-1) + 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		hashmap.put("email", email);
		//Myfree_doc_confirmVO
		List<Myfree_doc_confirmVO> myfree_doc_confirmVO = MyfreeService.selectConfirm(hashmap);
		
		//총 페이지수
		int maxpage = (int)((double)listcount/limit+0.95);
		
		//현재 페이지에서 보여줄 시작 페이지 수
		int startpage = 1;
		
		//현재 페이지에서 보여줄 마지막 페이지 수
		int endpage = (int)((double)listcount/limit+0.95);
		
		
		
		// 작성한 책임분양글 페이징 처리
		// 한 페이지에 5개
		int limit_doc = 5;
		int listcount_doc = MyfreeService.DocListCount(email);
		
		int startrow_doc=(page_doc-1)*5 + 1;
		int endrow_doc=startrow_doc+limit_doc-1;
		
		HashMap<String, Object> hashmap_doc = new HashMap<String, Object>();
		hashmap_doc.put("startrow_doc", startrow_doc);
		hashmap_doc.put("endrow_doc", endrow_doc);
		hashmap_doc.put("email", email);
		
		//Myfree_doc
		List<Myfree_docVO> myfree_docVO = MyfreeService.selectDoc(hashmap_doc);
		
		//총 페이지수
		int maxpage_doc = (int)((double)listcount_doc/limit_doc+0.95);
				
		//현재 페이지에서 보여줄 시작 페이지 수
		int startpage_doc = (((int) ((double)page_doc / 5 + 0.9)) - 1) * 5 + 1;;
				
		//현재 페이지에서 보여줄 마지막 페이지 수
		int endpage_doc = (int)((double)listcount_doc/limit_doc+0.95);

		
		
		
		model.addAttribute("member_listVO", member_listVO);
		model.addAttribute("myfree_authVO", myfree_authVO);
		
		//책임분양 관리
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("myfree_doc_confirmVO", myfree_doc_confirmVO);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		//작성한 책임분양글
		model.addAttribute("page_doc", page_doc);
		model.addAttribute("listcount_doc", listcount_doc);
		model.addAttribute("myfree_docVO", myfree_docVO);
		model.addAttribute("maxpage_doc", maxpage_doc);
		model.addAttribute("startpage_doc", startpage_doc);
		model.addAttribute("endpage_doc", endpage_doc);
		
		
		return "JunYoung/mypage_free_auth";
	}
	
	
	
	//환급계좌 입력
	@RequestMapping("/updateAccount.me")
	public String updateAccount(Myfree_doc_confirmVO myfree_doc_confirmVO) throws Exception {
			
		MyfreeService.updateAccount(myfree_doc_confirmVO);
			
		return "redirect:/myfree_auth.me";
	}
		
	//@환급계좌 삭제
	@RequestMapping("/deleteAccount.me")
	public String deleteAccount(Myfree_doc_confirmVO myfree_doc_confirmVO) throws Exception {
			
		MyfreeService.deleteAccount(myfree_doc_confirmVO);
			
		return "redirect:/myfree_auth.me";
	}
	
	//책임분양 인증글 작성창 띄우기
	@RequestMapping("/write_auth_form.me")
		public String write_auth(Model model, Myfree_doc_confirmVO confirm_list, HttpSession session) throws Exception {
		
		String email = (String)session.getAttribute("email");
		Member_listVO member_listVO = MyfreeService.selectMember(email);
		
		String confirm_no = confirm_list.getConfirm_no();
		
		Myfree_doc_confirmVO myfree_doc_confirm_write = MyfreeService.selectConfirm_write(confirm_no);
		
		
		//인증글 1달에 한번 제한.
		
			//sysdate에서 달(month) 추출
		
			SimpleDateFormat format = new SimpleDateFormat("MM");
			String sys_month = format.format(System.currentTimeMillis());
			String auth_ok = "인증완료";
			String auth_wait="검토중";
			
			//확정번호가 일치하고 작성한 달이 일치하고 상태가 인증완료인 글의 개수
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("fadoc_confirm_no", confirm_no);
			hashmap.put("sys_month", sys_month);
			hashmap.put("auth_ok", auth_ok);
			hashmap.put("auth_wait", auth_wait);
			
			
			int ok_count = MyfreeService.auth_ok_count(hashmap);
			
			//확정번호가 일치하고 작성한 달이 일치하고 상태가 검토중인 글의 개수
			int wait_count = MyfreeService.auth_wait_count(hashmap);
			
			int auth_count;
			
			if (ok_count > 0) {
				auth_count = 1;
			}
			else if (wait_count > 0) {
				auth_count = 2;
			}
			else {
				auth_count =3;
			}
		
		model.addAttribute("auth_count", auth_count);
		model.addAttribute("member_listVO", member_listVO);
		model.addAttribute("myfree_doc_confirm_write", myfree_doc_confirm_write);
		model.addAttribute("msg_ok", "이번 달 인증을 이미 완료하셨습니다.");
		model.addAttribute("msg_wait", "관리자가 인증글을 검토중입니다.");
		model.addAttribute("url", "myfree_auth.me");
		
		if (auth_count == 1) {
			return "JunYoung/auth_ok";
		}
		else if (auth_count==2) {
			return "JunYoung/auth_wait";
		}
		else {
			return "JunYoung/write_free_auth_form";
		}
	}
	
	//책임분양 인증글 작성
	@RequestMapping("/write_auth.me")
	public String write_auth(Myfree_authVO myfree_authVO) throws Exception {
		
		int res = MyfreeService.insertFree_auth(myfree_authVO);

		return "redirect:/myfree_auth.me";
		
	}
	
	//썸머노트 이미지 업로드
		@ResponseBody
		@PostMapping("/auth_img.me")
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
	
	//책임분양 인증글 조회
	@RequestMapping("/free_auth_view.me")
		public String free_auth_view(@RequestParam(value="doc_no", required=true) int doc_no, Model model) {
		
		Myfree_authVO auth_view = MyfreeService.selectAuth_view(doc_no);
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
		
		return "JunYoung/customer_service";
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
		return "redirect:/myfree_auth.me";
	}
	
}
