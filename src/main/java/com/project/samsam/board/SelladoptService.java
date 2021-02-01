package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;


public interface SelladoptService {
	public int SellgetListCount();
	public List<adopt_homeVO> SellgetHomeList(HashMap<String,Integer>hashmap);
	public int SelladoptInsert(adopt_homeVO adopt, HttpSession session);
	public adopt_homeVO Selladopt_homeinfo(int Doc_no);
	public int SellhomeDelete(adopt_homeVO vo);
	public int SelladoptupdateInsert(adopt_homeVO adopt,HttpSession session);
	public int SellFreecouponUpdate(HttpSession session);
	public int SellPaycouponUpdate(HttpSession session);
	

	public int SelladoptreplyCount() throws Exception;
	public List<adopt_homereplyVO>SelladoptreplyService (adopt_homereplyVO adhome) throws Exception;
	public int SelladoptreplyInsertService(adopt_homereplyVO homereply, HttpSession session) throws Exception;
	public int Selladopthomereply_re(adopt_homereplyVO adhome, HttpSession session);
	public int SelladopthomereplyDelete(adopt_homereplyVO adhome);//댓글 삭제
	public List<adopt_homeVO> SellgetSearchList(adopt_homeVO vo);
	public int Selladopthomereplyupdate(adopt_homereplyVO adhome);
	public int SelldeleteCount(int Doc_cno);
	public int SelldeleteUpdate(int doc_cno);
	public int SellgetSearchCount(adopt_homeVO vo);

	
}
