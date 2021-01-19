package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.board.adopt_homeVO;
import com.project.samsam.board.adopt_homereplyVO;


public interface adopt_homeMapper {
	public int getListCount();
	public List<adopt_homeVO>getHomeList(HashMap<String,Integer>hashmap);
	public adopt_homeVO adopt_homeinfo(int num);
	public int adoptInsert(adopt_homeVO adopt);
	public int boardReplyupdate(adopt_homeVO board);
	public int boardReply(adopt_homeVO board);
	public int boardModify(adopt_homeVO modifyboard);
	public int boardDelete(int num);
	public void setReadCountUpdate(int num);
	public int isBoardWriter(HashMap<String,String>hashmap);
	
	//대댓글
	public int adoptreplyCount() throws Exception;
	public List<adopt_homereplyVO>adopthomereplyList(adopt_homereplyVO homereply) throws Exception;
	public int adoptreplyInsert(adopt_homereplyVO homereply) throws Exception;
	public int adopthomereplyspace(adopt_homereplyVO adhome);
	public int adopthomereply_re(adopt_homereplyVO adhome);
	public int replyDelete(adopt_homereplyVO adhome);
	public List<adopt_homeVO> getSearchList(adopt_homeVO vo);
	public int adopthomereplyupdate(adopt_homereplyVO comment);
	public int DeleteCount(int home_cno);
	public int DeleteUpdate(int home_cno);
}
