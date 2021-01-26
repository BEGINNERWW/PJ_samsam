package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;


public interface AdoptService {
	public int getListCount();
	public List<adopt_homeVO> getHomeList(HashMap<String,Integer>hashmap);
	public int adoptInsert(adopt_homeVO adopt);
	public adopt_homeVO adopt_homeinfo(int home_no);
	public int homeDelete(adopt_homeVO vo);
	public int adoptupdateInsert(adopt_homeVO adopt);
	
	

	public int adoptreplyCount() throws Exception;
	public List<adopt_homereplyVO>adoptreplyService (adopt_homereplyVO adhome) throws Exception;
	public int adoptreplyInsertService(adopt_homereplyVO homereply) throws Exception;
	public int adopthomereply_re(adopt_homereplyVO adhome);
	public int adopthomereplyDelete(adopt_homereplyVO adhome);//댓글 삭제
	public List<adopt_homeVO> getSearchList(adopt_homeVO vo);
	public int adopthomereplyupdate(adopt_homereplyVO adhome);
	public int deleteCount(int home_cno);
	public int deleteUpdate(int home_cno);
	
	
	
	
		
	
}
