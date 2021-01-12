package com.project.samsam.member;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.MemberMapper;
@Service("memberService")
public class JJMemberServiceImpl implements JJMemberService {
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int k_joinMember (JJMemberVO mvo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res =memberMapper.k_joinMember(mvo);
		return res;
		//카카오 회원가입
	}
	@Override
	public int joinMember(JJMemberVO memberVO) {
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.joinMember(memberVO);
		return res;
	} //회원가입
	
	@Override
	public JJMemberVO selectMember (String email) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		JJMemberVO mvo = memberMapper.selectMember(email);
		return mvo;
	}
	@Override
	public Biz_memberVO selectBizMember (String biz_email) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		Biz_memberVO bmvo =memberMapper.selectBizMember(biz_email);
		return bmvo;
	}
	
	
	//

	@Override
	public int userCheck(JJMemberVO memberVO) {
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.userCheck(memberVO);
		return res;
	}
	@Override
	public JJMemberVO idCheck(String emailch) {
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		JJMemberVO membercheck = memberMapper.idCheck(emailch);
		return membercheck;

	}

	@Override
	public ArrayList<JJMemberVO> getMemberlist() {
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		ArrayList<JJMemberVO> member_list =new ArrayList<JJMemberVO>();
		member_list = memberMapper.getMemberlist();
		return member_list;
	}

//	@Override
//	public MemberVO selectMember(MemberVO memberVO) {
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		MemberVO member  = memberMapper.selectMember(memberVO);
//			
//		return member;
//	}

	@Override
	public int deleteMember(JJMemberVO memberVO) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.deleteMember(memberVO); 
		
		return res;
	}
	
	@Override
	public void updateAuthkey ( Map<String, String> map){
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateAuthkey(map);
		
	}
	@Override
	public void updateAuthStatus ( Map<String, Integer> map){
		MemberMapper memberMapper =sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateAuthStatus(map);
	}

}
