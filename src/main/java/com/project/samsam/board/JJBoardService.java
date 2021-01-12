package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.member.MemberVO;

public interface JJBoardService {
	  
	  public List<JJBoardVO> getSearch_commu_List(String keyword);
	  public List<JJBoardVO> getSearch_adopt_List(String keyword);
	  public List<JJBoardVO> getSearch_free_List(String keyword);
	  
	  
	  public JJBoardVO getSDetail(int num);
	  //홈페이지 메인 검색 함수
	  
      public List<JJABoardVOto> findList(JJABoardVO abvo);
      public List<JJABoardVOto> find_w_List(JJABoardVO abvo);
      //어드민 게시글관리 검색 함수
      
      
      
      public MemberVO adModalView_m (JJADModalVO membervo);
      public JJABoardVOto adModalView_b (JJADModalVO membervo);
      
      public List<JJCommentVO> adModalView_c (JJADModalVO membervo);
      public JJCommentVO adModalView_ccount (JJADModalVO mvo);
      
      public List<JJWarningVO> adModalView_w (JJADModalVO membervo);
      public JJWarningVO adModalView_wcount (JJADModalVO membervo);
	  //어드민 게시글 뷰 Modal
      
	  
}
