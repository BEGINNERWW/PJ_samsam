package com.project.samsam.board;

import java.util.HashMap;
import java.util.List;

import com.project.samsam.member.MemberVO;

public interface JJBoardService {
	  
	  public List<JJBoardVO> getSearch_commu_List(String keyword);
	  public List<JJBoardVO> getSearch_adopt_List(String keyword);
	  public List<JJBoardVO> getSearch_free_List(String keyword);
	  public List<JJBoardVO> getSearch_free_auth(String keyword);
	  public List<JJBoardVO> getSearch_adopt_home(String keyword);
	  public List<JJBoardVO> getSearch_payang(String keyword);
	  public List<JJBoardVO> getSearch_missing(String keyword);
	   
	  
	  public JJBoardVO getSDetail(int num);
	  //홈페이지 메인 검색 함수
	  
     
      
      public MemberVO ad_member (JJADModalVO movo);
      public JJABoardVOto ad_board (JJADModalVO movo);
      
      public List<JJCommentVO> ad_cList (JJADModalVO movo);
      public JJCommentVO ad_cccount (JJADModalVO movo);
      
      public List<JJWarningVO> w_docList (JJADModalVO movo);
      public List<JJWarningVO> w_coList (JJADModalVO movo);
      public JJWarningVO ad_wcount (JJADModalVO movo);
	  //어드민 게시글 뷰 
      
      public JJWarningVO wvo(JJADModalVO movo);
      public JJCommentVO covo(JJADModalVO movo);
      //어드민 게시글 뷰 MODAL
      
      
      public JJWarningVO getCategory(int w_no);
      public int update_auth(JJWarningVO wvo);
      public int update_wcount(JJWarningVO wvo);
      public int update_wcountfa(JJWarningVO wvo);
      public int update_cocount(JJWarningVO wvo);
      public int DeleteUpdate(JJWarningVO wvo);
      public int DeleteCount(JJWarningVO wvo);

      public int update_blur(JJWarningVO wvo);
      public int status_b_delete(JJWarningVO wvo);
      public int status_c_delete(JJWarningVO wvo);
      //어드민 게시글 뷰 모달 상태처리
      
    //myinfo write handler
    	public List<JJABoardVOto> myinfo_write (String email);
    	public List<JJCommentVO> myinfo_comment (String email);
    	
    	
    	 public List<JJABoardVOto> findList(JJABoardVO abvo);
    	 public List<JJABoardVOto> findList_auth(JJABoardVO abvo);
         public List<BoardDetailVO> find_w_List(JJABoardVO abvo);
         public List<BoardDetailVO> find_w_List_auth(JJABoardVO abvo);
         //어드민 게시글관리 검색 함수
         
    	
	  
}
