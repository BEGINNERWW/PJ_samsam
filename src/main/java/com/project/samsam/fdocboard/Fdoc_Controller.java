package com.project.samsam.fdocboard;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.samsam.myfree.Myfree_doc_confirmVO;







@Controller
public class Fdoc_Controller {

	@Autowired
	private Fdoc_Service FdocService;
	
	@RequestMapping(value = "/my_free_auth.bo", method = RequestMethod.GET)
	public String my_free() {
		
		return "my_free";
	}
	@RequestMapping(value = "/home.bo", method = RequestMethod.GET)
	public String home() {
		return "board";
		//return "fdoc_list";
		//return "redirect:/fdoclist.bo";
	}
	@RequestMapping(value = "/fdocform.bo", method = RequestMethod.GET)
	public String fdoc_Form() {
		
		return "js/fdoc_form";
	}
	
	@RequestMapping("/fdoclist.bo")
	public String getFdoclist(Model model, @RequestParam(value="page", required=false, 
	defaultValue="1") int page,HttpSession session) {
		int limit=10;
		
		int listcount=FdocService.getListCount();
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		HashMap<String,Integer> hashmap = new HashMap<String,Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow",endrow);
		List<FdocVO> fdoclist = FdocService.getFdocList(hashmap);
		//�� ������ ��
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��
   		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("fdoclist", fdoclist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		session.removeAttribute("default_option");
		session.removeAttribute("detail_option");
		
		return "js/fdoc_list";
	}
	
	@RequestMapping("/fdoc_write.bo")
	public String FdocInsert(FdocVO vo) throws Exception {
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = vo.getFdoc_content();
		Matcher match = pattern.matcher(content);
		String fdoc_thumbnail = null;
		String uploadPath = "C:\\Project\\upload\\"; //�ܺ� �н� �����ޱ⶧����  ,�ٲٰ������ server.xml ��������
		
		if(match.find()){ // �̹��� �±׸� ã�Ҵٸ�,,
		    fdoc_thumbnail = match.group(0); // �� ���� �߿� ù��° �̹��� �±׸� �̾ƿ�.
		}
	
		int index1 =fdoc_thumbnail.lastIndexOf("/");
		fdoc_thumbnail = fdoc_thumbnail.substring(index1+1);
		int index2 = fdoc_thumbnail.lastIndexOf(".");
		int index3 = fdoc_thumbnail.indexOf("\"");
		String fileExt = fdoc_thumbnail.substring(index2+ 1,index3).trim();
		fdoc_thumbnail = fdoc_thumbnail.substring(0, index2);
		//MultipartFile mf = vo.getFdoc_Image();
		
		
		//if(mf.getSize()!=0) {
		//String originalFileExtension = mf.getOriginalFilename();
		//int index = originalFileExtension.lastIndexOf(".");
		//String fileName = originalFileExtension.substring(0,index);
		//String fileExt = originalFileExtension.substring(index + 1);
		
		//String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		//�������ּҿ� ���� ����        
            
            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));     
        //mf.transferTo(new File(uploadPath+storedFileName)); // ����ó�� ��� �ʿ���.
        String fullPath = uploadPath+fdoc_thumbnail+"."+fileExt;
        System.out.println(fullPath);
        makeThumbnail(uploadPath,fullPath,fdoc_thumbnail,fileExt);
		String fdoc_ThumbNail = "THUMB_"+fdoc_thumbnail;
        vo.setFdoc_thumbnail(fdoc_ThumbNail);
		vo.setFdoc_email("123@gmail.net");
		vo.setFdoc_nick("작성자");
		int res = FdocService.boardInsert(vo);
		
		
		return "redirect:/fdoclist.bo";
		
	}
	//pom.xml �߰�
	private void makeThumbnail(String uploadpath,String filePath, String fileName, String fileExt) throws Exception {
		// ����� �������Ϸκ��� BufferedImage ��ü�� �����մϴ�. 
		BufferedImage srcImg = ImageIO.read(new File(filePath)); 
		//int dw = 300, dh = 210;  // ������� �ʺ�� ���� �Դϴ�. 
		int dw = 500, dh = 300;  // ������� �ʺ�� ���� �Դϴ�. 
		int ow = srcImg.getWidth(); // ���� �̹����� �ʺ�� ���� �Դϴ�.
		int oh = srcImg.getHeight(); // ���� �ʺ� �������� �Ͽ� ������� ������ ���̸� ����մϴ�. 
		//int pd = 0;
	    //if(ow > oh) {
	 	//pd = (int)(Math.abs((dh * ow / (double)dw) - oh) / 2d);
	    //} else {
		//pd = (int)(Math.abs((dw * oh / (double)dh) - ow) / 2d);
	    //}
	    //srcImg = Scalr.pad(srcImg, pd, Color.WHITE, Scalr.OP_ANTIALIAS);
	    
	    //ow = srcImg.getWidth(); 
		//oh = srcImg.getHeight();
		
		int nw = ow; 
		int nh = (ow * dh) / dw; // ���� ���̰� �������� ���ٸ� crop�� �ȵǹǷ�  ���� ���̸� �������� ������� ������ �ʺ� ����մϴ�. 
		if(nh > oh) { 
			nw = (oh * dw) / dh;
			nh = oh; 
		} // ���� ũ��� �����̹����� ������� crop �մϴ�. 
		BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh); // crop�� �̹����� ������� �����մϴ�. 
		BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,250);
		//BufferedImage destImg = Scalr.resize(cropImg, dw, dh); // ������� �����մϴ�. �̹��� �̸� �տ� "THUMB_" �� �ٿ� ǥ���߽��ϴ�. 
		String thumbName = uploadpath + "THUMB_" + fileName; 
		File thumbFile = new File(thumbName); 
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile); 
		
	
	}

		
	@ResponseBody
	@PostMapping("/image.bo")
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String uploadPath = "C:\\Project\\upload\\";
		PrintWriter out = response.getWriter();
		String originalFileExtension = file.getOriginalFilename();
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		System.out.println("storedFileName : " + storedFileName);
		file.transferTo(new File(uploadPath+storedFileName));
		out.println("/springfileupload1/upload/"+storedFileName);
		out.close();
		
	}
	
	@RequestMapping("/fdocdetail.bo")
	public String fdocView(@RequestParam(value="fdoc_no", required=true) int fdoc_no,@RequestParam(value="page", required=false,defaultValue="1")int page, Model model) {
		FdocVO vo = FdocService.getView(fdoc_no);
		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		return "js/fdoc_view";
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_insert.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceInsert(FdocReflyVO comment, HttpSession session) throws Exception{
		//comment.setFdoc_CNick((String)session.getAttribute("id"));
		
		comment.setFdoc_cnick("2");
		
		return FdocService.commentInsertService(comment);
	}
	@ResponseBody
	@RequestMapping(value="/comment_list.bo", produces="application/json;charset=UTF-8")
	private List<FdocReflyVO> mCommentServiceList(@RequestParam int fdoc_no) throws Exception{
		
		List<FdocReflyVO> comment_list = FdocService.commentListService(fdoc_no);
		
		return comment_list;
	
	}
	@ResponseBody
	@RequestMapping(value="/comment_update.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceUpdateProc(FdocReflyVO comment) throws Exception{
		
		return FdocService.commentUpdateService(comment);
		
	}
	@ResponseBody
	@RequestMapping(value="/comment_delete.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceDelete(FdocReflyVO vo) throws Exception{
		
		if(vo.getFdoc_lev() != 0) {
			return FdocService.commentDeleteService(vo);
		}else {
			
			int res = FdocService.deleteCount(vo.getFdoc_cno());
			
			if(res == 1) {
				return FdocService.commentDeleteService(vo);
			}else {
				
				
				return FdocService.deleteUpdate(vo.getFdoc_cno());
			}
			
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_refly.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceReflyInsert(FdocReflyVO comment) throws Exception{
		comment.setFdoc_cnick("2");
		
		return FdocService.commentReflyService(comment);
		
	}

	
	@RequestMapping("/fdoc_search.bo")
	public String getFdocSearch_list(Model model, @RequestParam(value="page", required=false, 
	defaultValue="1") int page,FdocVO vo) {
		if(vo.getFdoc_search()==null && vo.getKind_loc()==null && vo.getKind_search() ==null) {
			
			return "redirect:/fdoclist.bo";
		}
		
		int limit=10;
		
		int listcount=FdocService.getSearchCount(vo);
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		vo.setStartrow(startrow);
		vo.setEndrow(endrow);
		
		
		
		List<FdocVO> fdoclist = FdocService.getSearchList(vo);
		//�� ������ ��
   		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��
   		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("fdoclist", fdoclist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("vo",vo);
		
		
		return "js/fdoc_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/pay_insert.bo",produces="application/json;charset=UTF-8")
	private int warningInsert(Myfree_doc_confirmVO vo) throws Exception{
		System.out.println(vo.getConfirm_no());
		
		return FdocService.payInsertService(vo);
	}
	
	@RequestMapping(value = "/fdoc_delete.bo", method = RequestMethod.GET)
	public String fdoc_delete(FdocVO vo) {
		FdocService.boardDelete(vo);
		
		
		return "redirect:/fdoclist.bo";
	}
	
	@RequestMapping(value = "/fdoc_update.bo", method = RequestMethod.GET)
	public String fdoc_update(@RequestParam(value="fdoc_no", required=true) int fdoc_no,Model model) {
		FdocVO vo = FdocService.getView(fdoc_no);
		model.addAttribute("vo",vo);
		
		
		return "js/fdoc_update";
	}
	
	@RequestMapping(value = "/fdoc_updateinsert.bo", method = RequestMethod.POST)
	public String fdoc_updateinsert(FdocVO vo,Model model) throws Exception {
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = vo.getFdoc_content();
		Matcher match = pattern.matcher(content);
		String fdoc_thumbnail = null;
		String uploadPath = "C:\\Project\\upload\\"; 
		
		if(match.find()){
		    fdoc_thumbnail = match.group(0); 
		}
	
		int index1 =fdoc_thumbnail.lastIndexOf("/");
		fdoc_thumbnail = fdoc_thumbnail.substring(index1+1);
		int index2 = fdoc_thumbnail.lastIndexOf(".");
		int index3 = fdoc_thumbnail.indexOf("\"");
		String fileExt = fdoc_thumbnail.substring(index2+ 1,index3).trim();
		fdoc_thumbnail = fdoc_thumbnail.substring(0, index2);
		
        String fullPath = uploadPath+fdoc_thumbnail+"."+fileExt;
        System.out.println(fullPath);
        makeThumbnail(uploadPath,fullPath,fdoc_thumbnail,fileExt);
		String fdoc_ThumbNail = "THUMB_"+fdoc_thumbnail;
        vo.setFdoc_thumbnail(fdoc_ThumbNail);
		vo.setFdoc_email("123@gmail.net");
		int res = FdocService.boardUpdate(vo);
		
		return "redirect:/fdocdetail.bo?fdoc_no="+vo.getFdoc_no();
	}
}


