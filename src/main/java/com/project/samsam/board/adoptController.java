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
	
 @RequestMapping("/adopt_write.bo")
   public String boardInsertForm() {
      
      return "JM/adopt_write";
   }
 
 
 
 @RequestMapping("/adoptwrite.bo")
 public String adoptInsert(adopt_homeVO adopt)throws Exception{
	 int res = adoptservice.adoptInsert(adopt);
	 return "redirect:/home_list.bo";
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
	 System.out.println(homelist.get(0).getHome_date());
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
 
 
	@RequestMapping("/home_search.bo")
	public String gethomeSearch_list(Model model, @RequestParam(value="page", required=false, 
	defaultValue="1") int page,adopt_homeVO vo) {
		if(vo.getHome_search()==null && vo.getLoc()==null && vo.getKind_search() ==null) {
			
			return "redirect:/home_list.bo";
		}
		
		int limit=10;
		
		int listcount=adoptservice.getSearchCount(vo);
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		vo.setStartrow(startrow);
		vo.setEndrow(endrow);
		
		
		
		List<adopt_homeVO> homelist = adoptservice.getSearchList(vo);
		
		int maxpage=(int)((double)listcount/limit+0.95); 
		
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = maxpage;
		
		if (endpage>startpage+10-1) endpage=startpage+10-1;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("homelist", homelist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("vo",vo);
		
		
		return "JM/adopt_homelist";
	}
 
 
	@RequestMapping(value = "/home_listAjax.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8") //�������� ����Ʈ�� �ҷ����� ����
	@ResponseBody 
	public List<adopt_homeVO> getHomeListaAjax(Model model,@RequestParam(value="page",required=false,
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
	 System.out.println(homelist.get(0).getHome_date());
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
		System.out.println(adhome.getHome_ref());
		System.out.println(adhome.getHome_no());
		
		
		return replyList;
	}
	
	@RequestMapping(value = "/adopt_replyinsert.bo",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int adopthomepreplyinsert(adopt_homereplyVO adhome)throws Exception{
		
		adhome.setHome_cemail("user");
		return adoptservice.adoptreplyInsertService(adhome);
	}
	
	@RequestMapping("/adopt_replyReinsert.bo")
	@ResponseBody
	public int adopthomereply_re(adopt_homereplyVO adhome) throws Exception{
		
		System.out.println(adhome.getHome_ccontent());
		adhome.setHome_cemail("user");
		return adoptservice.adopthomereply_re(adhome);
		
	}
	
	
	@RequestMapping("/homereply_delete.bo") 
	@ResponseBody
	public int adopthomereplyDelete(adopt_homereplyVO adhome) throws Exception{
		return adoptservice.adopthomereplyDelete(adhome);
		
	}
	
	
	
	
}
