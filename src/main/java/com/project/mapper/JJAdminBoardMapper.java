package com.project.mapper;

import java.util.List;

import com.project.samsam.board.ABoardVO;
import com.project.samsam.board.ABoardVOto;
import com.project.samsam.board.ADModalVO;
import com.project.samsam.board.CommentVO;
import com.project.samsam.board.WarningVO;
import com.project.samsam.member.MemberVO;

public interface JJAdminBoardMapper {
		
	public List<JJABoardVOto> findList(JJABoardVO abvo);
	public List<JJABoardVOto> find_w_List(JJABoardVO abvo);
	//어드민 게시글 검색
	
	public MemberVO ad_view_m (	JJADModalVO mvo);
    public JJABoardVOto ad_view_b (JJADModalVO mvo);
    public List<JJCommentVO> ad_view_cList (JJADModalVO mvo);
    public JJCommentVO ad_view_ccount (JJADModalVO mvo);
    public List<JJWarningVO> ad_view_wList (JJADModalVO mvo);
    public JJWarningVO ad_view_wcount (JJADModalVO mvo);
	  //어드민 게시글 뷰 Modal
	

}
