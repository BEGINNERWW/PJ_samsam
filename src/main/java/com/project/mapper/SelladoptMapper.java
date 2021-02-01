package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.board.adopt_homeVO;
import com.project.samsam.board.adopt_homereplyVO;


public interface SelladoptMapper {
	public int SellgetListCount();
	public List<adopt_homeVO>SellgetHomeList(HashMap<String,Integer>hashmap);
	public adopt_homeVO Selladopt_homeinfo(int num);
	public int SelladoptInsert(adopt_homeVO adopt);
	public int SellboardReplyupdate(adopt_homeVO board);
	public int SellboardReply(adopt_homeVO board);
	public int SellboardDelete(int num);
	public void SellsetReadCountUpdate(int num);
	public int SellisBoardWriter(HashMap<String,String>hashmap);
	public int SellhomeDelete(adopt_homeVO vo);
	public int SelladoptupdateInsert(adopt_homeVO adopt);
	public int SellFreecouponUpdate(String email);
	public int SellPaycouponUpdate(String email);
	public int SellgetSearchCount(adopt_homeVO vo);
	
	//댓글
	public int SelladoptreplyCount() throws Exception;
	public List<adopt_homereplyVO>SelladopthomereplyList(adopt_homereplyVO homereply) throws Exception;
	public int SelladoptreplyInsert(adopt_homereplyVO homereply) throws Exception;
	public int Selladopthomereplyspace(adopt_homereplyVO adhome);
	public int Selladopthomereply_re(adopt_homereplyVO adhome);
	public int SellreplyDelete(adopt_homereplyVO adhome);
	public List<adopt_homeVO> SellgetSearchList(adopt_homeVO vo);
	public int Selladopthomereplyupdate(adopt_homereplyVO comment);
	public int SellDeleteCount(int doc_cno);
	public int SellDeleteUpdate(int doc_cno);
	public void SellReplycountService(adopt_homereplyVO homereply);
	public void SellHomeDeleteComment(adopt_homeVO vo);
	public void Sellreplycountupdate(adopt_homereplyVO adhome);
	
	
	
	
	
	
}
