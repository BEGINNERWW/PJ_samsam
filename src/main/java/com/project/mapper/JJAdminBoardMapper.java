package com.project.mapper;

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
	public List<BoardDetailVO> find_w_List(JJABoardVO abvo);
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
    public String getCategory(int w_no);
    public int update_hide(JJWarningVO wvo);
    public int update_keep(JJWarningVO wvo);
    //어드민 게시글 뷰 MODAL 상태처리 끝

}

