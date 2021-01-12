package com.project.samsam.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public int adoptInsert(adopt_homeVO adopt) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = adopt.getHome_content();
		Matcher match = pattern.matcher(content); 
		String imgTag = null;
		if(match.find()){ 
		    imgTag = match.group(0); 
		}
		adopt.setHome_thumbnail(imgTag);
		adopt.setHome_nick("user");
		adopt.setHome_email("user");
		adopt.setHome_img("aa");
	    int res = adoptMapper.adoptInsert(adopt);
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
	public int adoptreplyInsertService(adopt_homereplyVO homereply) throws Exception {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		
		return adoptMapper.adoptreplyInsert(homereply);
	}


	@Override
	public int adopthomereply_re(adopt_homereplyVO adhome) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		adoptMapper.adopthomereplyspace(adhome);
		adhome.setHome_seq(adhome.getHome_seq()+1);
		adhome.setHome_lev(adhome.getHome_lev()+1);
		int res = adoptMapper.adopthomereply_re(adhome);
		
		return res;
	}

	@Override
	public int adopthomereplyDelete(adopt_homereplyVO adhome) {
		adopt_homeMapper adoptMapper =  sqlSession.getMapper(adopt_homeMapper.class);
		return adoptMapper.replyDelete(adhome);
	}

	@Override
	public int adoptreplyUpdateService(adopt_homereplyVO homereply) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public adopt_homeVO boardModifyForm(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSearchCount(adopt_homeVO vo) {
		// TODO Auto-generated method stub
		return 0;
		
	}

	@Override
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
		if(vo.getHome_search()==null) {
			ArrayList <String> none2 = new ArrayList<String>();
			none2.add("none");
			vo.setHome_search(none2);
		}
		
		List<adopt_homeVO> fdoc_list = adoptMapper.getSearchList(vo);
		
		
		return fdoc_list;
	}

}
