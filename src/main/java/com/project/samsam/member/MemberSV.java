package com.project.samsam.member;

import java.util.ArrayList;
import java.util.Map;

public interface MemberSV {

	public MemberVO selectMember(String email);
	public ArrayList<MemberVO> getMemberlist();
	public int updateMember(MemberVO vo);
	public int updateBiz_Member(Biz_memberVO vo);
	public int pwUpdate_M(MemberVO vo);
	public int pwUpdate_BM(Biz_memberVO vo);
	public Biz_memberVO check_auth(Biz_memberVO vo);
	public int pre_insertBiz(Biz_memberVO vo);
	public int pre_updateBiz(String vo);
	public Biz_memberVO selectBizMember(String email);
	public int selectBiz_no(String biz_no);
	public ArrayList<Adopt_BoardVO> getMyAdopt(String adopt_email);
	public int getMyAdoptReply(int adopt_no);
	public ArrayList<BoardlistVO> getWriteList(String email);
	public ArrayList<BoardlistVO> getWriteList1(String email);
	public ArrayList<BoardlistVO> getWriteList2(String email);
	public ArrayList<BoardlistVO> getWriteList3(String email);
	public ArrayList<BoardlistVO> getWriteList4(String email);
	public ArrayList<BoardlistVO> getWriteList5(String email);
	public ArrayList<BoardlistVO> getWriteList6(String email);
	public ArrayList<BoardlistVO> getWriteList7(String email);
	public ArrayList<CommentListVO> getWriteComment(String email);
	public ArrayList<CommentListVO> getWriteComment1(String email);
	public ArrayList<CommentListVO> getWriteComment2(String email);
	public ArrayList<CommentListVO> getWriteComment3(String email);
	public ArrayList<CommentListVO> getWriteComment4(String email);
	public ArrayList<CommentListVO> getWriteComment5(String email);
	public ArrayList<CommentListVO> getWriteComment6(String email);
	public ArrayList<CommentListVO> getWriteComment7(String email);
	
	//join member
	public int joinMember(MemberVO mvo);
	public int k_joinMember (MemberVO mvo);

	public void updateAuthkey(Map<String, String> map);
	public void updateAuthStatus (Map<String, Integer> map);
	
	public int userCheck(MemberVO memberVO);
	
	//jj 0119
	public int idCheck(String email);
	public int nickCheck(String nick);

} 
