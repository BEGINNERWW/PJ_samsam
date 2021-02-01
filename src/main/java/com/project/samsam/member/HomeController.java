package com.project.samsam.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class HomeController {

	@Autowired
	private MemberSV memberSV;
	@Autowired
	JavaMailSender mailSender; 

	@RequestMapping(value = "/pw_find.me", method = RequestMethod.GET)
	public String pw_find() {

		return "YM/pw_find";
	}

	@RequestMapping(value = "/pw_auth.me")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String)request.getParameter("email");
		String name = (String)request.getParameter("name");
		System.out.println("request email : " + email);
		System.out.println("request name : " + name);

		MemberVO vo = memberSV.selectMember(email);
		
	
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getName().equals(name)) {
			session.setAttribute("email", vo.getEmail());

			System.out.println("���Ϲ߼� to :" + (String)session.getAttribute("id") );
			String setfrom = "ivedot@naver.com"; // naver 
			String tomail = email; //받는사람
			String title = "[삼삼하개] 비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "삼삼하개 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("YM/pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("YM/pw_find");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("YM/pw_find");
			return mv;
		}

		/*
		 * response.setContentType("text/html; charset=utf-8"); PrintWriter writer =
		 * response.getWriter();
		 * writer.println("<script>alert('�̸����� �߼۵Ǿ����ϴ�. ������ȣ�� �Է����ּ���'); </script>");
		 * writer.flush();
		 * 
		 */

	} //비밀번호 메일인증

	@RequestMapping(value = "/pw_set.me", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
			@RequestParam(value = "num") String num) throws IOException{
		
		if(email_injeung.equals(num)) {
			return "YM/pw_new";
		}
		else {
			return "YM/pw_find";
		}
	}
	
	@RequestMapping(value = "/pw_new.me", method = RequestMethod.POST)
	public String pw_new(MemberVO vo, HttpSession session) throws IOException{
		System.out.println("session email : " + session.getAttribute("email"));
		System.out.println("pw : " + vo.getPw());
		int result = memberSV.pwUpdate_M(vo);
		if(result == 1) {
			return "jj/loginForm";
		}
		else {
			System.out.println("pw_update"+ result);
			return "YM/pw_new";
		}
	}
	@RequestMapping(value = "/mypage.me")
	  public String mypage(HttpSession session) {
	    String biz_email = (String)session.getAttribute("email");
	    System.out.println("마이페이지 분류 :" + memberSV.selectMember(biz_email).getGrade());
	    if(memberSV.selectMember(biz_email).getGrade().equals("관리자")) {
	      System.out.println("관리잔데!!!");

	      return "redirect:/admin_main.me";
	    }
	    else if(memberSV.selectBizMember(biz_email) == null) {
	      System.out.println("bizcheck selectBizmemeber : " + null);
	      return "redirect:/myfree_auth.me";
	    }
	    else {
	      return "redirect:/cominfo_main.do";
	    }
	}	
	@RequestMapping(value = "/myinfo_check.me")
	public String myinfo_check() {

		return "YM/myinfo_check";
	}

	@RequestMapping(value = "/myinfo_member.me")
	public String myinfo_member(MemberVO vo, HttpSession session, Model model) throws Exception {
		System.out.println("myinfo id "+vo.getEmail());
		System.out.println("myinfo pw"+vo.getPw());
		
		MemberVO res = memberSV.selectMember(vo.getEmail());
				
		if(res.getPw().equals(vo.getPw())) {
			System.out.println("session id :" +session.getAttribute("id"));
			System.out.println("res.getPhone :" + res.getPhone());

			model.addAttribute("MemberVO", res);
			return "YM/myinfo_member";
		}else {
			      return "YM/myinfo_check";
			    }
	}	
	
	@RequestMapping(value = "/myinfo_update.do" , produces="application/json; charset=UTF-8")
	@ResponseBody
		public Map<String, String> myinfo_update(MemberVO vo) {
		Map<String, String> result = new HashMap<String, String>();
	
		try {
			memberSV.updateMember(vo);
			result.put("res", "OK");
		}catch(Exception e) {
			System.out.println("update member : " + e.getMessage());
			result.put("res", "FAIL");
			result.put("message", "Failure");
		}
		
		return result;
	}
	@RequestMapping(value = "/myinfo_auth.me")
		public String myinfo_auth(HttpSession session) {
			String biz_email = (String)session.getAttribute("email");
			
			if(memberSV.selectBizMember(biz_email) == null) {
				System.out.println("bizcheck selectBizmemeber : " + null);
				return "YM/myinfo_auth";
			}else {
				return "YM/myinfo_already";
			}
	}
	@RequestMapping(value = "/biz_check.do", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> biz_check(Biz_memberVO bo) {
		Map<String, String> result = new HashMap<String, String>();
		System.out.println("biz no : "+ bo.getBiz_no());
		int res = 0;
		try {
				Biz_memberVO biz_com1 = memberSV.check_auth(bo);
				String biz_com = bo.getBiz_com();
				
				if(biz_com1.getBiz_name().equals(biz_com)) {
					System.out.println("biz_com : "+ biz_com1 + "입력한사업장 :"+bo.getBiz_com());
					res = memberSV.selectBiz_no(bo.getBiz_no());
					if(res == 0) {
					result.put("res", "OK");
					}else {
					result.put("res", "dont");
					}
				}
				else {
					result.put("res", "dont");
				}
								
		}catch(Exception e) {
			System.out.println("biz_check error : " + e.getMessage());
			result.put("res", "FAIL");
			result.put("message", "Failure");
		}
			
	return result;
}
	@RequestMapping("/pre_auth.me") 
	public String pre_auth(Biz_memberVO bo, HttpSession session) throws Exception {
		try {
		MultipartFile mf = bo.getFile();
		
		Biz_memberVO biz = new Biz_memberVO();
		biz.setBiz_com(bo.getBiz_com());
		biz.setBiz_no(bo.getBiz_no());
		biz.setBiz_email((String)session.getAttribute("email"));

		MemberVO vo = memberSV.selectMember(biz.getBiz_email());
		
		String uploadPath = "C:\\Project\\upload\\";

		if(mf.getSize() != 0) {
    		String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
    		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));     
        	mf.transferTo(new File(uploadPath + mf.getOriginalFilename())); //  transferTo
        	biz.setBiz_img(mf.getOriginalFilename());
        	biz.setBiz_add(vo.getLocal());
        	biz.setBiz_name(vo.getName());
        	biz.setStatus(1);

        	int result = memberSV.pre_insertBiz(biz);
        	int res = memberSV.pre_updateBiz(biz.getBiz_email());
    		
        	if(result == 1) {
        		return "YM/myinfo_already";
        	}else {
        		return "YM/myinfo_auth";
        	}
		}else { 
			System.out.println("pre_auth error");  
			
        	return "YM/myinfo_auth";
		}
		
		}catch(Exception e) {
			System.out.println("pre_auth error:" + e.getMessage());
			return "YM/myinfo_auth";
		}
	} 
	@RequestMapping(value = "/cominfo_main.do")
	public String cominfo_main(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		
		MemberVO mvo = memberSV.selectMember(email);
		Biz_memberVO vo = memberSV.selectBizMember(email);
		System.out.println("vo.getfree_coupon :" + vo.getFree_coupon());
		ArrayList<Adopt_BoardVO> bvo = memberSV.getMyAdopt(email);
		
		ArrayList<Adopt_BoardVO> new_bvo = new ArrayList<Adopt_BoardVO>();
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		if(bvo != null) {
		for(Adopt_BoardVO bo : bvo) {
			int res = memberSV.getMyAdoptReply(bo.getDoc_no());
			map.put(bo.getDoc_no(), res);
			new_bvo.add(bo);
			}
		}
		model.addAttribute("MemberVO", mvo);
		model.addAttribute("Biz_memberVO", vo);
		model.addAttribute("Adopt_list", new_bvo);
		model.addAttribute("map_count", map);

		return "YM/cominfo_pay";
	}
	
	@RequestMapping(value = "/cominfo_list.me")
	public String cominfo_list(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		System.out.println("email "+ email );
		
		
		ArrayList<BoardlistVO> b_listal = memberSV.getWriteList1(email);
		if(b_listal != null ) {
			model.addAttribute("b_listal", b_listal);
		}
		ArrayList<CommentListVO> c_listal = memberSV.getWriteComment1(email);
		if(c_listal != null ) {
			model.addAttribute("c_listal", c_listal);
		}
		ArrayList<BoardlistVO> b_listfd = memberSV.getWriteList2(email);
		if(b_listfd != null ) {
			model.addAttribute("b_listfd", b_listfd);
		}
		ArrayList<CommentListVO> c_listfd = memberSV.getWriteComment2(email);
		if(c_listfd != null ) {
			model.addAttribute("c_listfd", c_listfd);
		}
		ArrayList<BoardlistVO> b_listfa = memberSV.getWriteList3(email);
		if(b_listfa != null ) {
			model.addAttribute("b_listfa", b_listfa);
		}
		ArrayList<CommentListVO> c_listfa = memberSV.getWriteComment3(email);
		if(c_listfa != null ) {
			model.addAttribute("c_listfa", c_listfa);
		}
		ArrayList<BoardlistVO> b_listah = memberSV.getWriteList4(email);
		if(b_listah != null ) {
			model.addAttribute("b_listah", b_listah);
		}
		ArrayList<CommentListVO> c_listah = memberSV.getWriteComment4(email);
		if(c_listah != null ) {
			model.addAttribute("c_listah", c_listah);
		}
		ArrayList<BoardlistVO> b_listco = memberSV.getWriteList5(email);
		if(b_listco != null ) {
			model.addAttribute("b_listco", b_listco);
		}
		ArrayList<CommentListVO> c_listco = memberSV.getWriteComment5(email);
		if(c_listco != null ) {
			model.addAttribute("c_listco", c_listco);
		}
		ArrayList<BoardlistVO> b_listp = memberSV.getWriteList6(email);
		if(b_listp != null ) {
			model.addAttribute("b_listp", b_listp);
		}
		ArrayList<CommentListVO> c_listp = memberSV.getWriteComment6(email);
		if(c_listp != null ) {
			model.addAttribute("c_listp", c_listp);
		}
		ArrayList<BoardlistVO> b_listm = memberSV.getWriteList7(email);
		if(b_listm != null ) {
			model.addAttribute("b_listm", b_listm);
		}
		ArrayList<CommentListVO> c_listm = memberSV.getWriteComment7(email);
		if(c_listm != null ) {
			model.addAttribute("c_listm", c_listm);
		}
		
		return "YM/cominfo_write";
	}
	
	@RequestMapping(value = "/cominfo_member.me")
	public String cominfo_member(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		
		MemberVO vo = memberSV.selectMember(email);
		Biz_memberVO bvo = memberSV.selectBizMember(email);
		
		model.addAttribute("MemberVO", vo);
		model.addAttribute("Biz_memberVO", bvo);
		
		return "YM/cominfo_member";
	}
	
}
