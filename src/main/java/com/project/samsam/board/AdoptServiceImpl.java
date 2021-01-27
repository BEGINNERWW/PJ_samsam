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

import com.project.mapper.adopt_homeMapper;


@Service("adoptService")
public class AdoptServiceImpl implements AdoptService {

	 @Autowired
	 private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
	    int res = adoptMapper.getListCount();
		return res;
	}

	@Override
	public List<adopt_homeVO> getHomeList(HashMap<String, Integer> hashmap) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		List<adopt_homeVO> homelist = adoptMapper.getHomeList(hashmap);
		return homelist;
	}

	@Override
	public adopt_homeVO adopt_homeinfo(int num) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.setReadCountUpdate(num);
		adopt_homeVO adopt = adoptMapper.adopt_homeinfo(num);
		return adopt;
	}

	@Override
	public int adoptInsert(adopt_homeVO adopt,HttpSession session) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
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
		imgTag = imgTag.substring(0, index2+3);
		
		
		adopt.setDoc_email((String)session.getAttribute("email"));
		adopt.setDoc_nick((String)session.getAttribute("nick"));
		adopt.setDoc_thumbnail(imgTag);
	
		adopt.setDoc_img("aa");
		
	    int res = adoptMapper.adoptInsert(adopt);
		return res;
	     
	   
	}
	
	
	public int adoptupdateInsert(adopt_homeVO adopt,HttpSession session) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
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
		imgTag = imgTag.substring(0, index2);
		
		
		adopt.setDoc_thumbnail(imgTag);
		adopt.setDoc_email((String)session.getAttribute("email"));
		adopt.setDoc_nick((String)session.getAttribute("nick"));
		adopt.setDoc_img("aa");
	    int res = adoptMapper.adoptupdateInsert(adopt);
		return res;
	     
	   
	}




	@Override
	public int adoptreplyCount() throws Exception {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		return adoptMapper.adoptreplyCount();
	}

	@Override
	public List<adopt_homereplyVO> adoptreplyService(adopt_homereplyVO homereply) throws Exception {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		return adoptMapper.adopthomereplyList(homereply);
	}

	@Override
	public int adoptreplyInsertService(adopt_homereplyVO homereply,HttpSession session) throws Exception {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.adopthomereplyspace(homereply);
		adoptMapper.ReplycountService(homereply);
		
		System.out.println((String)session.getAttribute("email"));
		System.out.println(123456);
		homereply.setDoc_email((String)session.getAttribute("email"));
		homereply.setDoc_nick((String)session.getAttribute("nick"));
		
		homereply.setDoc_seq(homereply.getDoc_seq()+1);
		return adoptMapper.adoptreplyInsert(homereply);
		
	}


	@Override
	public int adopthomereply_re(adopt_homereplyVO adhome,HttpSession session) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.adopthomereplyspace(adhome);
		adoptMapper.ReplycountService(adhome);
		
		adhome.setDoc_email((String)session.getAttribute("email"));
		adhome.setDoc_nick((String)session.getAttribute("nick"));
		adhome.setDoc_seq(adhome.getDoc_seq()+1);
		adhome.setDoc_lev(adhome.getDoc_lev()+1);
		int res = adoptMapper.adopthomereply_re(adhome);
		
		return res;
	}

	@Override
	public int adopthomereplyDelete(adopt_homereplyVO adhome) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.replycountupdate(adhome);
		System.out.println(adhome.getDoc_no());
		return adoptMapper.replyDelete(adhome);
	}

	

	@Override //필터 검색시 리스트로드
	public List<adopt_homeVO> getSearchList(adopt_homeVO vo) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
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
		
		List<adopt_homeVO> home_list = adoptMapper.getSearchList(vo);
		System.out.println("5");
		System.out.println(home_list.size());
		System.out.println("5");
		System.out.println(vo.getEndrow());
		System.out.println(vo.getStartrow());
		
		return home_list;
	}

	@Override // 댓글 수정
	public int adopthomereplyupdate(adopt_homereplyVO comment) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		System.out.println(comment.getDoc_content());
		String home_ccontent = comment.getDoc_content();
		
		home_ccontent = home_ccontent.replace("\r\n","<br>");
		comment.setDoc_content(home_ccontent);
		int res = adoptMapper.adopthomereplyupdate(comment);
		System.out.println(comment.getDoc_cno());
		System.out.println(comment.getDoc_cno());
		System.out.println(res);
		return adoptMapper.adopthomereplyupdate(comment);
	}

	@Override
	   public int deleteCount(int doc_cno) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
	      return adoptMapper.DeleteCount(doc_cno);
	   }

	@Override
	   public int deleteUpdate(int doc_cno) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
	      return adoptMapper.DeleteUpdate(doc_cno);
	   }

	@Override
	public int homeDelete(adopt_homeVO vo) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.HomeDeleteComment(vo);
		return adoptMapper.homeDelete(vo);
	}

	

}
