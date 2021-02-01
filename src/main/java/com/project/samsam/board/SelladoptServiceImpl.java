package com.project.samsam.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.mapper.SelladoptMapper;
import com.project.samsam.board.adopt_homeVO;


@Service("SelladoptService")
public class SelladoptServiceImpl implements SelladoptService {

	 @Autowired
	 private SqlSession sqlSession;
	
	@Override
	public int SellgetListCount() {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
	    int res = adoptMapper.SellgetListCount();
		return res;
	}

	@Override
	public List<adopt_homeVO> SellgetHomeList(HashMap<String, Integer> hashmap) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		List<adopt_homeVO> homelist = adoptMapper.SellgetHomeList(hashmap);
		
		return homelist;
	}

	@Override
	public adopt_homeVO Selladopt_homeinfo(int num) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		adoptMapper.SellsetReadCountUpdate(num);
		adopt_homeVO adopt = adoptMapper.Selladopt_homeinfo(num);
		return adopt;
	}

	@Override
	public int SelladoptInsert(adopt_homeVO adopt,HttpSession session) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		
		String content = adopt.getDoc_content();
		Matcher match = pattern.matcher(content); 
		String imgTag = null;
		
		if(match.find()){ 
		    imgTag = match.group(0); 
		}
		
		int index1 =imgTag.lastIndexOf("/");
		imgTag = imgTag.substring(index1+1);
		int index2 = imgTag.lastIndexOf(".");
		imgTag = imgTag.substring(0, index2+4);
		
		
		adopt.setDoc_email((String)session.getAttribute("email"));
		adopt.setDoc_nick((String)session.getAttribute("nick"));
		adopt.setDoc_thumbnail(imgTag);
		adopt.setDoc_img("aa");
		
		
	    int res = adoptMapper.SelladoptInsert(adopt);

	
		
		return res;
	     
	   
	}
	
	
	public int SelladoptupdateInsert(adopt_homeVO adopt,HttpSession session) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		
		String content = adopt.getDoc_content();
		Matcher match = pattern.matcher(content); 
		String imgTag = null;
		
		if(match.find()){ 
		    imgTag = match.group(0); 
		}
		
		int index1 =imgTag.lastIndexOf("/");
		imgTag = imgTag.substring(index1+1);
		int index2 = imgTag.lastIndexOf(".");
		imgTag = imgTag.substring(0, index2+4);
		
		
		adopt.setDoc_thumbnail(imgTag);
		adopt.setDoc_email((String)session.getAttribute("email"));
		adopt.setDoc_nick((String)session.getAttribute("nick"));
		adopt.setDoc_img("aa");
	    int res = adoptMapper.SelladoptupdateInsert(adopt);
		return res;
	     
	   
	}
	
	@Override
	public int SellgetSearchCount(adopt_homeVO vo) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		
		if(vo.getKind_search()==null) {
			ArrayList <String> none = new ArrayList<String>();
			none.add("none");
			vo.setKind_search(none);
		}
		if(vo.getKind_loc()==null) {
			ArrayList <String> none1 = new ArrayList<String>();
			none1.add("none");
			vo.setKind_loc(none1);
		}
		if(vo.getDoc_search()==null) {
			ArrayList <String> none2 = new ArrayList<String>();
			none2.add("none");
			vo.setDoc_search(none2);
		}
		
		return adoptMapper.SellgetSearchCount(vo);
	}


	@Override
	public int SelladoptreplyCount() throws Exception {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		return adoptMapper.SelladoptreplyCount();
	}

	@Override
	public List<adopt_homereplyVO> SelladoptreplyService(adopt_homereplyVO homereply) throws Exception {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		return adoptMapper.SelladopthomereplyList(homereply);
	}

	@Override
	public int SelladoptreplyInsertService(adopt_homereplyVO homereply,HttpSession session) throws Exception {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		adoptMapper.Selladopthomereplyspace(homereply);
		adoptMapper.SellReplycountService(homereply);
		
		System.out.println((String)session.getAttribute("email"));
		System.out.println(123456);
		homereply.setDoc_email((String)session.getAttribute("email"));
		homereply.setDoc_nick((String)session.getAttribute("nick"));
		
		homereply.setDoc_seq(homereply.getDoc_seq()+1);
		return adoptMapper.SelladoptreplyInsert(homereply);
		
	}


	@Override
	public int Selladopthomereply_re(adopt_homereplyVO adhome,HttpSession session) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		adoptMapper.Selladopthomereplyspace(adhome);
		adoptMapper.SellReplycountService(adhome);
		
		adhome.setDoc_email((String)session.getAttribute("email"));
		adhome.setDoc_nick((String)session.getAttribute("nick"));
		adhome.setDoc_seq(adhome.getDoc_seq()+1);
		adhome.setDoc_lev(adhome.getDoc_lev()+1);
		int res = adoptMapper.Selladopthomereply_re(adhome);
		
		return res;
	}

	@Override
	public int SelladopthomereplyDelete(adopt_homereplyVO adhome) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		adoptMapper.Sellreplycountupdate(adhome);
		System.out.println(adhome.getDoc_no());
		return adoptMapper.SellreplyDelete(adhome);
	}

	

	@Override //필터 검색시 리스트로드
	public List<adopt_homeVO> SellgetSearchList(adopt_homeVO vo) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		if(vo.getKind_search()==null) {
			ArrayList <String> none = new ArrayList<String>();
			none.add("none");
			vo.setKind_search(none);
		}
		if(vo.getKind_loc()==null) {
			ArrayList<String> none1 = new ArrayList<String>();
			none1.add("none");
			vo.setKind_loc(none1);
		}
		if(vo.getDoc_search()==null) {
			ArrayList <String> none2 = new ArrayList<String>();
			none2.add("none");
			vo.setDoc_search(none2);
		}
		
		List<adopt_homeVO> home_list = adoptMapper.SellgetSearchList(vo);
		System.out.println("5");
		System.out.println(home_list.size());
		System.out.println("5");
		System.out.println(vo.getEndrow());
		System.out.println(vo.getStartrow());
		
		return home_list;
	}

	@Override // 댓글 수정
	public int Selladopthomereplyupdate(adopt_homereplyVO comment) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		System.out.println(comment.getDoc_content());
		String home_ccontent = comment.getDoc_content();
		
		home_ccontent = home_ccontent.replace("\r\n","<br>");
		comment.setDoc_content(home_ccontent);
		int res = adoptMapper.Selladopthomereplyupdate(comment);
		System.out.println(comment.getDoc_cno());
		System.out.println(comment.getDoc_cno());
		System.out.println(res);
		return adoptMapper.Selladopthomereplyupdate(comment);
	}

	@Override
	   public int SelldeleteCount(int doc_cno) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
	      return adoptMapper.SellDeleteCount(doc_cno);
	   }

	@Override
	   public int SelldeleteUpdate(int doc_cno) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
	      return adoptMapper.SellDeleteUpdate(doc_cno);
	   }

	@Override
	public int SellhomeDelete(adopt_homeVO vo) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		adoptMapper.SellHomeDeleteComment(vo);
		return adoptMapper.SellhomeDelete(vo);
	}

	@Override
	public int SellFreecouponUpdate(HttpSession session) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		String email = (String)session.getAttribute("email");
		
		return adoptMapper.SellFreecouponUpdate(email);
		
	}

	@Override
	public int SellPaycouponUpdate(HttpSession session) {
		SelladoptMapper adoptMapper =  sqlSession.getMapper(SelladoptMapper.class);
		String email = (String)session.getAttribute("email");
		
		return adoptMapper.SellPaycouponUpdate(email);
		
	}

	

}
