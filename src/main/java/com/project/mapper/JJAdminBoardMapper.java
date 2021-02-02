package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.project.samsam.board.BoardDetailVO;
import com.project.samsam.board.JJABoardVO;
import com.project.samsam.board.JJABoardVOto;
import com.project.samsam.board.JJADModalVO;
import com.project.samsam.board.JJCommentVO;
import com.project.samsam.board.JJWarningVO;
import com.project.samsam.member.MemberVO;

public interface JJAdminBoardMapper {
		
	public List<JJABoardVOto> findList(JJABoardVO abvo);
	public List<JJABoardVOto> findList_auth(JJABoardVO abvo);  //auth
	public List<BoardDetailVO> find_w_List(JJABoardVO abvo);
	public List<BoardDetailVO> find_w_List_auth(JJABoardVO abvo);	//auth
	//어드민 게시글 검색
	
	public MemberVO ad_member (	JJADModalVO movo);
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
    //어드민 게시글 뷰 MODAL 상태처리 끝
    
    //
    public int getListCount ( JJABoardVO abvo);
	public List<JJABoardVOto> getdocList (HashMap<String, Object> hashmap);

}

