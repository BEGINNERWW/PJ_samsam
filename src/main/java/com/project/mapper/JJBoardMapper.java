	package com.project.mapper;

import java.util.List;

import com.project.samsam.board.JJABoardVOto;
import com.project.samsam.board.JJBoardVO;
import com.project.samsam.board.JJCommentVO;

public interface JJBoardMapper {
	
	public List<JJBoardVO> getSearch_free_List(String keyword);
	public List<JJBoardVO> getSearch_free_auth(String keyword);
	public List<JJBoardVO> getSearch_commu_List(String keyword);
	public List<JJBoardVO> getSearch_adopt_List(String keyword);
	public List<JJBoardVO> getSearch_adopt_home(String keyword);
	public List<JJBoardVO> getSearch_payang(String keyword);
	public List<JJBoardVO> getSearch_missing(String keyword);
	
	public JJBoardVO getSDetail (int num);
	 
	//myinfo_write handler
		public List<JJABoardVOto> my_boardList (String email);
		public List<JJCommentVO> my_commenList (String email);
}
