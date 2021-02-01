package com.project.samsam.missing;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.samsam.api.AnimalApiUtil;
import com.project.samsam.api.Sido;
import com.project.samsam.comment.CommentVO;
import com.project.samsam.member.MemberSV;
import com.project.samsam.member.MemberVO;
import com.project.utils.UploadFileUtils;

@Controller
@RequestMapping("/SJ/missing")
public class MissingController {

	private static final Logger logger = LoggerFactory.getLogger(MissingController.class);

	@Autowired
	private MissingService service;

	@Autowired
	private MemberSV memberService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 파양 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<MissingVO> list = service.list();
		for (int i = 0; i < list.size(); i++) {
			String content = list.get(i).getDoc_content();
			Matcher match = pattern.matcher(content);
			String fdoc_thumbnail = null;

			if (match.find()) { // �̹��� �±׸� ã�Ҵٸ�,,
				fdoc_thumbnail = match.group(0); // �� ���� �߿� ù��° �̹��� �±׸� �̾ƿ�.
			}
			if (fdoc_thumbnail != null) {
				// 썸네일이 존재할 경우 추출
				int index1 = fdoc_thumbnail.lastIndexOf("/");
				fdoc_thumbnail = fdoc_thumbnail.substring(index1 + 1);
				int index2 = fdoc_thumbnail.lastIndexOf(".");
				int index3 = fdoc_thumbnail.indexOf("\"");
				String fileExt = fdoc_thumbnail.substring(index2 + 1, index3).trim();
				fdoc_thumbnail = fdoc_thumbnail.substring(0, index2);
				String fullPath = uploadPath + fdoc_thumbnail + "." + fileExt;
				System.out.println(fullPath);

				fullPath = "\\" + fullPath.split("resources")[1];
				System.out.println(fullPath);

				fullPath = fullPath.replaceAll("\\\\", "/");
				System.out.println(fullPath);

				list.get(i).setThumbnail(fullPath);
			}
		}

		model.addAttribute("list", list);
	}

	// 파양 글쓰기 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(Model model, HttpSession session) throws Exception {
		String email = (String) session.getAttribute("email");

		// 로그인 안되어 있을 때
		if (email == null) {
			return "redirect:/loginForm.me";
		} else {
			MemberVO member = memberService.selectMember(email);
			model.addAttribute("nick", member.getNick());
		}

		// 시도
		AnimalApiUtil animalUtil = new AnimalApiUtil();
		ArrayList<Sido> sido = animalUtil.getSido();
		for (Sido s : sido) {
			System.out.println(s.getSidoNm());
		}

		model.addAttribute("sido", sido);

		return "SJ/missing/register";

	}

	// 파양 글쓰기 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, MissingVO missingVO) throws Exception {
		logger.info("@MissingController");
		logger.info(missingVO.toString());
		service.register(missingVO);

		model.addAttribute("list", service.list());

		return "redirect:/SJ/missing/list";
	}

	// 파양 글읽기 화면
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void registerForm(Model model, Integer doc_no) throws Exception {
		MissingVO missing = service.read(doc_no);
		model.addAttribute("missing", missing);
		service.updateReadCount(missing);

	}

	// 파양 글수정 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm(Model model, Integer doc_no) throws Exception {
		model.addAttribute("missing", service.read(doc_no));

	}

	// 파양 글수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, MissingVO missing) throws Exception {
		logger.info(missing.toString());
		service.modify(missing);

		model.addAttribute("list", service.list());
		return "SJ/missing/list";
	}

	// 파양 글삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(Model model, Integer doc_no) throws Exception {

		service.remove(doc_no);

		model.addAttribute("list", service.list());
		return "SJ/missing/list";
	}

	// 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/comment_insert", method = RequestMethod.POST)
	public int replyRegister(Model model, MissingReplyVO reply) throws Exception {

		return service.replyRegister(reply);
	}

	// 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/recomment_insert", method = RequestMethod.POST)
	public int rereplyRegister(Model model, MissingReplyVO reply) throws Exception {

		return service.rereplyRegister(reply);
	}

	// 댓글 조회
	@RequestMapping(value = "/comment_list", method = RequestMethod.GET)
	public String replyList(Model model, Integer doc_no, HttpSession session) throws Exception {

		// 로그인 사용자 email
		String loginEmail = (String) session.getAttribute("email");
		// 게시글 작성자 email
		MissingVO missing = service.read(doc_no);
		String writerEmail = missing.getDoc_email();

		//
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<MissingReplyVO> replyList = service.replyList(doc_no);

		// 등록일자 포맷
		for (int i = 0; i < replyList.size(); i++) {
			String formatDate = format.format(replyList.get(i).getDoc_date());
			replyList.get(i).setDoc_date_fmt(formatDate);

			// 게시글 작성자는 댓글 삭제가능
			if (loginEmail != null && loginEmail.equals(writerEmail)) {
				replyList.get(i).setBtnRemove("삭제");
			}

			// 댓글 작성자 email
			String replyEmail = replyList.get(i).getDoc_email();
			// 댓글 작성자 이면 수정, 삭제 가능
			if (loginEmail != null && loginEmail.equals(replyEmail)) {
				replyList.get(i).setBtnModify("수정");
				replyList.get(i).setBtnRemove("삭제");

			}

		}

		for (int i = 0; i < replyList.size(); i++) {

			// 게시글 작성자는 비밀댓글/댓글 모두 조회 가능
			if (loginEmail != null && loginEmail.equals(writerEmail))
				break;

			// 비밀댓글
			if (replyList.get(i).getDoc_secret().equals("Y")) {

				// 댓글 작성자 eamil
				String replyEmail = replyList.get(i).getDoc_email();

				// 비밀 댓글작성자이면 조회 가능
				if (loginEmail != null && loginEmail.equals(replyEmail))
					continue;
				else
					replyList.remove(i);
			}
		}

		Map<Integer, MissingReplyVO> map = new HashMap<>();

		for (MissingReplyVO vo : replyList) {
			vo.setRereList(new ArrayList<MissingReplyVO>());
			map.put(vo.getDoc_cno(), vo);
		}
		for (MissingReplyVO vo : replyList) {
			if (vo.getDoc_lev() != 0) {
				map.get(vo.getDoc_ref()).getRereList().add(vo);
			}
			System.out.println(vo);
		}

		model.addAttribute("reply", replyList);
		model.addAttribute("doc_no", doc_no);

		return "SJ/missing/reply_list";
	}

	// 댓글 삭제
	@RequestMapping(value = "/comment_remove", method = RequestMethod.GET)
	public String replyRemove(Model model, Integer doc_no, Integer doc_cno, HttpSession session) throws Exception {

		System.out.println("doc_no : " + doc_no);
		System.out.println("doc_cno : " + doc_cno);
		// 댓글 삭제
		service.replyRemove(doc_cno);

		return "SJ/missing/reply_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_refly.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceReflyInsert(MissingReplyVO rereplyVO,HttpSession session) throws Exception{
		rereplyVO.setDoc_nick((String)session.getAttribute("nick"));
		rereplyVO.setDoc_email((String)session.getAttribute("email"));
		return service.rereplyRegister(rereplyVO);
		
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/comment_modify", method = RequestMethod.GET)
	public String replyModify(Model model, @ModelAttribute MissingReplyVO paramVO, HttpSession session)
			throws Exception {

		System.out.println("doc_no : " + paramVO.getDoc_no());
		System.out.println("doc_cno : " + paramVO.getDoc_cno());
		System.out.println("doc_content : " + paramVO.getDoc_content());
		// 댓글 수정
		int resultCnt = service.replyModify(paramVO);

		if (resultCnt > 0) {
			// 정상 처리
			return "00";
		} else {
			// 처리 에러
			return "99";
		}
	}

	// 썸머노트 이미지 업로드
	@ResponseBody
	@PostMapping("/send_image")
	public void auth_image(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		PrintWriter out = response.getWriter();

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		out.println("/resource" + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		out.close();
	}
}
