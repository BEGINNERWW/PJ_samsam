package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.samsam.member.Biz_memberVO;
import com.project.samsam.member.MemberSV;
import com.project.samsam.member.MemberVO;









@Controller
public class SelladoptController {

@Autowired
private SelladoptService adoptservice;

@Autowired
private MemberSV memberSV;


//작성폼을 뛰워주는 동작
 @RequestMapping("/Selladopt_write.bo")
   public String boardInsertForm(adopt_homeVO vo,Model model) {
	 
	 
	 model.addAttribute("vo",vo);
     return "JM/Sadopt_write";
   }
 
 //수정폼
 
 @RequestMapping(value = "/Sellhomeupdate.bo", method = RequestMethod.GET)
	public String home_update(@RequestParam(value="num", required=true) int num,Model model) {
		adopt_homeVO vo = adoptservice.Selladopt_homeinfo(num);
		
		model.addAttribute("vo",vo);
		
		
		return "JM/Swriteupdateview";
	}
 
 
 @RequestMapping(value = "/Sellhome_delete.bo", method = RequestMethod.GET)
 public String home_delete(adopt_homeVO vo) {
	 adoptservice.SellhomeDelete(vo);
	 
	 return "redirect:/selladopt_list.bo";
	}

 
 //작성값을 인서트해주는 동작
 @RequestMapping("/Selladoptwrite.bo")
 public String adoptInsert(adopt_homeVO adopt,HttpSession session)throws Exception{
	 
	 int res = adoptservice.SelladoptInsert(adopt,session);
	 
	 if(adopt.getCoupon()==0) {
		 adoptservice.SellFreecouponUpdate(session);
	 } 
	 else{
		 adoptservice.SellPaycouponUpdate(session);	 
	 }
	 return "redirect:/selladopt_list.bo";
 }
 
 @RequestMapping("/Sellhome_update.bo")
 public String adoptupdateInsert(adopt_homeVO adopt,HttpSession session)throws Exception{
	 
	 int res = adoptservice.SelladoptupdateInsert(adopt,session);
	 
	 return "redirect:/Selladopthomeview.bo?num="+adopt.getDoc_no();
 }
 
 
 @RequestMapping("/selladopt_list.bo") 
 public String getHomeList(Model model,HttpSession session,@RequestParam(value="page",required=false,
 		defaultValue="1")int page) {
	 
	 
	 String email = (String)session.getAttribute("email");
	
	 
	 int limit=10;
	 
	 int listcount=adoptservice.SellgetListCount();
	 
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	 
	 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
	 hashmap.put("startrow",startrow);
	 hashmap.put("endrow",endrow);
	 List<adopt_homeVO>homelist = adoptservice.SellgetHomeList(hashmap);
	
	 if(homelist.size()!=0) {
	 System.out.println(homelist.get(0).getDoc_date());
	 }
	 int maxpage = (int)((double)listcount/limit+0.95);
	 
	 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
	 
	 int endpage = maxpage;
	 
	 if(endpage>startpage+10-1)endpage = startpage+10-1;
	 
	 
	 if(email != null){
		MemberVO mvo = memberSV.selectMember(email);
		if(mvo.getGrade().equals("사업자")){
		 Biz_memberVO bmvo = memberSV.selectBizMember(email);
		 model.addAttribute("Biz_memberVO",bmvo);
		
	 }
		 model.addAttribute("mvo" , mvo);
	}
	 
	
	 model.addAttribute("page",page);
	 model.addAttribute("listcount",listcount);
	 model.addAttribute("homelist",homelist);
	 model.addAttribute("maxpage",maxpage);
	 model.addAttribute("startpage",startpage);
	 model.addAttribute("endpage",endpage);
	 
	 return "JM/Sadopt_list";
 }
 
 
 
 
 
 	//리스트 생성
	@RequestMapping(value = "/Sellhome_listAjax.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<adopt_homeVO> getHomeListAjax(Model model,adopt_homeVO vo,HttpSession session,@RequestParam(value="page",required=false,
		defaultValue="1")int page) {
	 int limit=10;
	 
	
	 int listcount=adoptservice.SellgetListCount();
	 
	 
	
	
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	 
	 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
	 hashmap.put("startrow",startrow);
	 hashmap.put("endrow",endrow);
	 List<adopt_homeVO>homelist = adoptservice.SellgetHomeList(hashmap);
	 
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
	
	@RequestMapping(value = "/Selllistcount.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody 
	public HashMap<String,Integer> listcount(adopt_homeVO vo,@RequestParam(value="page",required=false,
	defaultValue="1")int page){
		 int limit=10;
		 
		 int listcount=adoptservice.SellgetListCount();
		 
		 int startrow = (page-1)*10+1;
		 int endrow = startrow+limit-1;
		 
		 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
		 hashmap.put("startrow",startrow);
		 hashmap.put("endrow",endrow);
		 
		
		 int maxpage = (int)((double)listcount/limit+0.95);
		 
		 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
		 
		 int endpage = maxpage;
		 
		 if(endpage>startpage+10-1)endpage = startpage+10-1;
		 hashmap.put("page", page);
		 hashmap.put("listcount", listcount);
		 hashmap.put("maxpage", maxpage);
		 hashmap.put("startpage", startpage);
		 hashmap.put("endpage", endpage);
		 
			 
		 return hashmap;
		
	}
	
	@RequestMapping(value = "/SellSearchlistcount.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody 
	public HashMap<String,Integer> Searchlistcount(adopt_homeVO vo,@RequestParam(value="page",required=false,
	defaultValue="1")int page){
		 int limit=10;
		 
		 int listcount=adoptservice.SellgetSearchCount(vo);
		 
		 int startrow = (page-1)*10+1;
		 int endrow = startrow+limit-1;
		 
		 HashMap<String,Integer>hashmap = new HashMap<String,Integer>();
		 hashmap.put("startrow",startrow);
		 hashmap.put("endrow",endrow);
		 
		
		 int maxpage = (int)((double)listcount/limit+0.95);
		 
		 int startpage = (((int)((double)page/10+0.9))-1)*10+1;
		 
		 int endpage = maxpage;
		 
		 if(endpage>startpage+10-1)endpage = startpage+10-1;
		 hashmap.put("page", page);
		 hashmap.put("listcount", listcount);
		 hashmap.put("maxpage", maxpage);
		 hashmap.put("startpage", startpage);
		 hashmap.put("endpage", endpage);
		 
			 
		 return hashmap;
		
	}
	
	
	
	
	
	
	
	
	//검색후 리스트생성
	@RequestMapping(value = "/Sellhome_search.bo",method=RequestMethod.POST,produces="application/json;charset=UTF-8") //�������� ����Ʈ�� �ҷ����� ����
	@ResponseBody 
	public List<adopt_homeVO> getHomeListSearch(Model model,adopt_homeVO vo,@RequestParam(value="page",required=false,
		defaultValue="1")int page) {
	 int limit=10;
	 
	
	 int listcount=adoptservice.SellgetListCount();
	 
	 int startrow = (page-1)*10+1;
	 int endrow = startrow+limit-1;
	
	
	 vo.setStartrow(startrow);
	 vo.setEndrow(endrow);
	 
	 
	 List<adopt_homeVO>homelist = adoptservice.SellgetSearchList(vo);
	 
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
	 
	 

	 System.out.println(homelist.size());
	 return homelist;
	}
	
	
	
	@RequestMapping("/Selladopthomeview.bo")
	public String adopt_homeinfo(@RequestParam(value="num",required=true)int num,Model model){
		adopt_homeVO adopt = adoptservice.Selladopt_homeinfo(num);
		model.addAttribute("adopt", adopt);
		
		return "JM/Sadoptview";
	}
	
	@RequestMapping(value = "/Selladopt_replylist.bo",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<adopt_homereplyVO> adoptviewList(adopt_homereplyVO adhome)throws Exception{
		List<adopt_homereplyVO> replyList = adoptservice.SelladoptreplyService(adhome);	
		
		return replyList;
	}   
	
	@RequestMapping(value = "/Selladopt_replyinsert.bo",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int adopthomepreplyinsert(adopt_homereplyVO adhome,HttpSession session)throws Exception{
		
		
		return adoptservice.SelladoptreplyInsertService(adhome,session);
	}
	
	@RequestMapping("/Selladopt_replyReinsert.bo")
	@ResponseBody
	public int adopthomereply_re(adopt_homereplyVO adhome,HttpSession session) throws Exception{
		
		
		return adoptservice.Selladopthomereply_re(adhome,session);
		
	}
	
	

	@RequestMapping("/Sellreply_update.bo") 
	@ResponseBody
	public int adopthomereplyupdate(adopt_homereplyVO adhome) throws Exception{
		
		return adoptservice.Selladopthomereplyupdate(adhome);
		
	}
	
	

	
   @ResponseBody
   @RequestMapping(value="/Sellhomereply_delete.bo",produces="application/json;charset=UTF-8")
   private int adopthomereplyDelete(adopt_homereplyVO vo) throws Exception{
      
      if(vo.getDoc_lev() != 0) {
         return adoptservice.SelladopthomereplyDelete(vo);
      }else {
         
         int res = adoptservice.SelldeleteCount(vo.getDoc_cno());
         
         if(res == 1) {
            return adoptservice.SelladopthomereplyDelete(vo);
         }else {
            
            return adoptservice.SelldeleteUpdate(vo.getDoc_cno());
         }
         
      }
   }
	
	
	
	
	
	
	
}
