package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;


public interface AdoptService {
	public int getListCount();
	public List<adopt_homeVO> getHomeList(HashMap<String,Integer>hashmap);
	public int adoptInsert(adopt_homeVO adopt, HttpSession session);
	public adopt_homeVO adopt_homeinfo(int Doc_no);
	public int homeDelete(adopt_homeVO vo);
	public int adoptupdateInsert(adopt_homeVO adopt,HttpSession session);
	
	

	public int adoptreplyCount() throws Exception;
	public List<adopt_homereplyVO>adoptreplyService (adopt_homereplyVO adhome) throws Exception;
	public int adoptreplyInsertService(adopt_homereplyVO homereply, HttpSession session) throws Exception;
	public int adopthomereply_re(adopt_homereplyVO adhome, HttpSession session);
	public int adopthomereplyDelete(adopt_homereplyVO adhome);//댓글 삭제
	public List<adopt_homeVO> getSearchList(adopt_homeVO vo);
	public int adopthomereplyupdate(adopt_homereplyVO adhome);
	public int deleteCount(int Doc_cno);
	public int deleteUpdate(int Doc_cno);
	
	
	
	
	
	
	
		
	
}
