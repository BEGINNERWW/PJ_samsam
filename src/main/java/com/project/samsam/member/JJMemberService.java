package com.project.samsam.member;

import java.util.ArrayList;
import java.util.Map;

public interface JJMemberService {
	public int userCheck(JJMemberVO memberVO);
	public JJMemberVO idCheck(String emailch);
	public ArrayList<JJMemberVO> getMemberlist();
	public int deleteMember(JJMemberVO memberVO);
	
	//인서트 멤버
	public int joinMember(JJMemberVO memberVO);
	//일반 회원가입 이메일 링크 인증
	public void updateAuthkey(Map<String, String> map);
	public void updateAuthStatus (Map<String, Integer> map);
	//īī�� ȸ������
	public int k_joinMember (JJMemberVO mvo);
	public JJMemberVO selectMember (String email);
	public Biz_memberVO selectBizMember (String biz_email);
}
