package com.project.samsam.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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









@Controller
public class adoptController {

@Autowired
private AdoptService adoptservice;


//작성폼을 뛰워주는 동작
 @RequestMapping("/adopt_write.bo")
   public String boardInsertForm() {
      
      return "JM/adopt_write";
   }
 
 //수정폼
 
 @RequestMapping(value = "/homeupdate.bo", method = RequestMethod.GET)
	public String fdoc_update(@RequestParam(value="num", required=true) int num,Model model) {
		adopt_homeVO vo = adoptservice.adopt_homeinfo(num);
		model.addAttribute("vo",vo);
		
		
		return "JM/WriteUpdateview";
	}
 
 
 @RequestMapping(value = "/home_delete.bo", method = RequestMethod.GET)
 public String home_delete(adopt_homeVO vo) {
	 adoptservice.homeDelete(vo);
	 
	 return "redirect:/home_list.bo";
	}

 
 //작성값을 인서트해주는 동작
 @RequestMapping("/adoptwrite.bo")
 public String adoptInsert(adopt_homeVO adopt,HttpSession session)throws Exception{
	 int res = adoptservice.adoptInsert(adopt,session);
	 return "redirect:/home_list.bo";
 }
 
 @RequestMapping("/home_update.bo")
 public String adoptupdateInsert(adopt_homeVO adopt)throws Exception{
	 
	 int res = adoptservice.adoptupdateInsert(adopt);
	 
	 return "redirect:/adopthomeview.bo?num="+adopt.getDoc_no();
 }
 
 
 @RequestMapping("/home_list.bo") 
 public String getHomeList(Model model,@RequestParam(value="page",required=false,
 		defaultValue="1")int page) {
	 int limit=10;
	 
	 int listcount=adoptservice.getListCount();
	 
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	 
	 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
	 hashmap.put("startrow",startrow);
	 hashmap.put("endrow",endrow);
	 List<adopt_homeVO>homelist = adoptservice.getHomeList(hashmap);
	 
	 if(homelist.size()!=0) {
	 System.out.println(homelist.get(0).getDoc_date());
	 }
	 int maxpage = (int)((double)listcount/limit+0.95);
	 
	 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
	 
	 int endpage = maxpage;
	 
	 if(endpage>startpage+10-1)endpage = startpage+10-1;
	 
	 model.addAttribute("page",page);
	 model.addAttribute("listcount",listcount);
	 model.addAttribute("homelist",homelist);
	 model.addAttribute("maxpage",maxpage);
	 model.addAttribute("startpage",startpage);
	 model.addAttribute("endpage",endpage);
	 
	 return "JM/adopt_homelist";
 }
 
 
 
 	//리스트 생성
	@RequestMapping(value = "/home_listAjax.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8") //�������� ����Ʈ�� �ҷ����� ����
	@ResponseBody 
	public List<adopt_homeVO> getHomeListAjax(Model model,adopt_homeVO vo,@RequestParam(value="page",required=false,
		defaultValue="1")int page) {
	 int limit=10;
	 
	
	 int listcount=adoptservice.getListCount();
	 
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	 
	 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
	 hashmap.put("startrow",startrow);
	 hashmap.put("endrow",endrow);
	 List<adopt_homeVO>homelist = adoptservice.getHomeList(hashmap);
	 
	 if(homelist.size()!=0) {
	 System.out.println(homelist.get(0).getDoc_date());
	 }
	 int maxpage = (int)((double)listcount/limit+0.95);
	 
	 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
	 
	 int endpage = maxpage;
	 
	 if(endpage>startpage+10-1)endpage = startpage+10-1;
	 
	 model.addAttribute("page",page);
	 model.addAttribute("listcount",listcount);
	 model.addAttribute("homelist",homelist);
	 model.addAttribute("maxpage",maxpage);
	 model.addAttribute("startpage",startpage);
	 model.addAttribute("endpage",endpage);
	
	 return homelist;
	}
	
	
	//검색후 리스트생성
	@RequestMapping(value = "/home_search.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8") //�������� ����Ʈ�� �ҷ����� ����
	@ResponseBody 
	public List<adopt_homeVO> getHomeListSearch(Model model,adopt_homeVO vo,@RequestParam(value="page",required=false,
		defaultValue="1")int page) {
	 int limit=10;
	 
	
	 int listcount=adoptservice.getListCount();
	 
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	
	
	 vo.setStartrow(startrow);
	 vo.setEndrow(endrow);
	 
	 
	 List<adopt_homeVO>homelist = adoptservice.getSearchList(vo);
	 
	 if(homelist.size()!=0) {
	 System.out.println(homelist.get(0).getDoc_date());
	 }
	 int maxpage = (int)((double)listcount/limit+0.95);
	 
	 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
	 
	 int endpage = maxpage;
	 
	 if(endpage>startpage+10-1)endpage = startpage+10-1;
	 
	 model.addAttribute("page",page);
	 model.addAttribute("listcount",listcount);
	 model.addAttribute("homelist",homelist);
	 model.addAttribute("maxpage",maxpage);
	 model.addAttribute("startpage",startpage);
	 model.addAttribute("endpage",endpage);
	 model.addAttribute("vo",vo);
	 System.out.println("77");
	 System.out.println(homelist.size());
	 return homelist;
	}
	
	@RequestMapping("/adopthomeview.bo")
	public String adopt_homeinfo(@RequestParam(value="num",required=true)int num,Model model){
		adopt_homeVO adopt = adoptservice.adopt_homeinfo(num);
		model.addAttribute("adopt", adopt);
		
		return "JM/adopt_homeview";
	}
	
	@RequestMapping(value = "/adopt_replylist.bo",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<adopt_homereplyVO> adoptviewList(adopt_homereplyVO adhome)throws Exception{
		List<adopt_homereplyVO> replyList = adoptservice.adoptreplyService(adhome);	
		
		return replyList;
	}   
	
	@RequestMapping(value = "/adopt_replyinsert.bo",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int adopthomepreplyinsert(adopt_homereplyVO adhome)throws Exception{
		System.out.println(1111112);
		System.out.println(adhome.getDoc_secret());
		adhome.setDoc_nick("user");
		return adoptservice.adoptreplyInsertService(adhome);
	}
	
	@RequestMapping("/adopt_replyReinsert.bo")
	@ResponseBody
	public int adopthomereply_re(adopt_homereplyVO adhome) throws Exception{
		
		adhome.setDoc_nick("user");
		return adoptservice.adopthomereply_re(adhome);
		
	}
	
	

	@RequestMapping("/comment_update.bo") 
	@ResponseBody
	public int adopthomereplyupdate(adopt_homereplyVO adhome) throws Exception{
		System.out.println(adhome.getDoc_content());
		System.out.println("테스트");
		return adoptservice.adopthomereplyupdate(adhome);
		
	}
	
	

	
   @ResponseBody
   @RequestMapping(value="/homereply_delete.bo",produces="application/json;charset=UTF-8")
   private int adopthomereplyDelete(adopt_homereplyVO vo) throws Exception{
      
      if(vo.getDoc_lev() != 0) {
         return adoptservice.adopthomereplyDelete(vo);
      }else {
         
         int res = adoptservice.deleteCount(vo.getDoc_cno());
         
         if(res == 1) {
            return adoptservice.adopthomereplyDelete(vo);
         }else {
            
            return adoptservice.deleteUpdate(vo.getDoc_cno());
         }
         
      }
   }
	
	
	
	
	
	
	
}
