package com.project.samsam.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.JJAdminBoardMapper;
import com.project.mapper.JJBoardMapper;
import com.project.samsam.member.MemberVO;

@Service("boardService")
public class JJBoardServiceImpl implements JJBoardService {

	@Autowired // Myb atis(ibatis) ���̺귯���� �����ϴ� Ŭ����
	private SqlSession sqlSession;
 
	 @Override  
	  public List<JJBoardVO> getSearch_free_auth(String keyword){
	    JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
	    List<JJBoardVO> a_list = boardMapper.getSearch_free_auth(keyword);
	    return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_adopt_home(String keyword){
	    JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
	    List<JJBoardVO> a_list = boardMapper.getSearch_adopt_home(keyword);
	    return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_payang(String keyword){
	    JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
	    List<JJBoardVO> a_list = boardMapper.getSearch_payang(keyword);
	    return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_missing(String keyword){
	    JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
	    List<JJBoardVO> a_list = boardMapper.getSearch_missing(keyword);
	    return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_commu_List(String keyword){
		  JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		  List<JJBoardVO> a_list = boardMapper.getSearch_commu_List(keyword);
		  return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_adopt_List(String keyword){
		  JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		  List<JJBoardVO> a_list = boardMapper.getSearch_adopt_List(keyword);
		  return a_list;
	  }
	  @Override
	  public List<JJBoardVO> getSearch_free_List(String keyword){
		  JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		  List<JJBoardVO> a_list = boardMapper.getSearch_free_List(keyword);
		  return a_list;
	  }
	  
	  

	@Override
	public JJBoardVO getSDetail(int num) {
		JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		JJBoardVO board = boardMapper.getSDetail(num);
		return board;
	}
	// 홈페이지 검색 뷰 끝
		//getSDetail 수정할 필요있음 : 해당 원본글로 이동
	
	
	
	
	@Override
	public List<JJABoardVOto> findList(JJABoardVO abvo){
		JJAdminBoardMapper adminMapper =sqlSession.getMapper(JJAdminBoardMapper.class);
		List<JJABoardVOto> list = adminMapper.findList(abvo);
		List<JJABoardVOto> newlist = new ArrayList<JJABoardVOto>();
		
		for(JJABoardVOto vo :list) {
			vo.setCategory(abvo.getCategory());
			newlist.add(vo);
			System.out.println("서비스임플"+vo.getDoc_nick() + "카테고리 : " + vo.getCategory());
		}
		return newlist;
	}
	@Override
	public List<JJABoardVOto> findList_auth(JJABoardVO abvo){
		JJAdminBoardMapper adminMapper =sqlSession.getMapper(JJAdminBoardMapper.class);
		List<JJABoardVOto> list = adminMapper.findList_auth(abvo);
		
		return list;
	}
	@Override
    public List<BoardDetailVO> find_w_List(JJABoardVO abvo){
		JJAdminBoardMapper adminMapper =sqlSession.getMapper(JJAdminBoardMapper.class);
		List<BoardDetailVO> Wlist =adminMapper.find_w_List(abvo); 
		for(BoardDetailVO vo :Wlist) {
			System.out.println("서비스임플"+vo.getDoc_nick() + "카테고리 : " + vo.getW_status());
		}
		return Wlist;
    }
	@Override
	public List<BoardDetailVO> find_w_List_auth(JJABoardVO abvo){
		JJAdminBoardMapper adminMapper =sqlSession.getMapper(JJAdminBoardMapper.class);
		List<BoardDetailVO> Wlist =adminMapper.find_w_List_auth(abvo); 
		
		return Wlist;
	}
	//어드민 게시글 관리 
	
	public MemberVO ad_member (JJADModalVO movo){
		JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
		MemberVO mvo = adminMapper.ad_member(movo);
		System.out.println("서비스임플 ad_member:"+mvo);
		return mvo;
		
	}
     public JJABoardVOto ad_board (JJADModalVO movo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJABoardVOto bvo = adminMapper.ad_board(movo);
 		return  bvo;
     }
     
     public List<JJCommentVO> ad_cList (JJADModalVO movo){
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 List<JJCommentVO> cList =(List<JJCommentVO>) adminMapper.ad_cList(movo);
    	 return  cList;
     }
     public JJCommentVO ad_cccount(JJADModalVO movo){
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJCommentVO co_count = adminMapper.ad_cccount(movo);
    	 System.out.println(co_count);			
 		return  co_count;
     }
     
     public List<JJWarningVO> w_docList(JJADModalVO movo){
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 List<JJWarningVO> w_docList =(List<JJWarningVO>) adminMapper.w_docList(movo);
 		return  w_docList;
     }
     public List<JJWarningVO> w_coList(JJADModalVO movo){
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 List<JJWarningVO> w_coList =(List<JJWarningVO>) adminMapper.w_coList(movo);
 		return  w_coList;
     }
     public JJWarningVO ad_wcount(JJADModalVO movo){
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJWarningVO w_count = adminMapper.ad_wcount(movo);
 		return  w_count;
     }
	  //어드민 게시글 뷰  
     
     public JJWarningVO wvo(JJADModalVO movo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJWarningVO wvo = adminMapper.wvo(movo);
    	 return wvo;
     }
     public JJCommentVO covo(JJADModalVO movo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJCommentVO covo = adminMapper.covo(movo);
    	 return covo;
     }
     //어드민 게시글 뷰 MODAL
     
      
     public JJWarningVO getCategory(int w_no) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 JJWarningVO category=adminMapper.getCategory(w_no);
    	 return category; 
     }
     public int update_auth(JJWarningVO wvo) {
    	 System.out.println("wVO hide : " + wvo.getW_no());
    	 System.out.println("status : " + wvo.getW_status() + "w_no : " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.update_auth(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     public int update_wcount(JJWarningVO wvo) {
    	 System.out.println("wVO hide : " + wvo.getW_no());
    	 System.out.println("status : " + wvo.getW_status() + "w_no : " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.update_wcount(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     public int update_wcountfa(JJWarningVO wvo) {
    	 System.out.println("wVO hide : " + wvo.getW_no());
    	 System.out.println("status : " + wvo.getW_status() + "w_no : " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.update_wcountfa(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     public int update_cocount(JJWarningVO wvo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.update_cocount(wvo);
    	 System.out.println("cocount res : " + res);
    	 return res;
     }
     public int DeleteUpdate(JJWarningVO wvo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.DeleteUpdate(wvo);
    	 System.out.println("cocount res : " + res);
    	 return res;
     }
     public int DeleteCount(JJWarningVO wvo) {
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.DeleteCount(wvo);
    	 System.out.println("cocount res : " + res);
    	 return res;
     }

     public int update_blur(JJWarningVO wvo) {
    	 System.out.println("wVO keep: " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.update_blur(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     public int status_b_delete(JJWarningVO wvo) {
    	 System.out.println("wVO status_delete: " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.status_b_delete(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     public int status_c_delete(JJWarningVO wvo) {
    	 System.out.println("wVO status_delete: " + wvo.getW_no());
    	 JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
    	 int res = adminMapper.status_c_delete(wvo);
    	 System.out.println("res : " + res);
    	 return res;
     }
     //어드민 게시글 뷰 모달 상태처리 끝

   //myinfo write handler
	  	public List<JJABoardVOto> myinfo_write (String email){
	  		JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		   	 List<JJABoardVOto> b_list = boardMapper.my_boardList(email);
		   	 return b_list;
	  	}
	 //myinfo comment handler
	  	public List<JJCommentVO> myinfo_comment(String email){
	  		JJBoardMapper boardMapper = sqlSession.getMapper(JJBoardMapper.class);
		   	 List<JJCommentVO> c_list = boardMapper.my_commenList(email);
		   	 return c_list;
	  	}
	  	
	  	//수정중////
	  	public int getListCount ( JJABoardVO abvo) {
	  		JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
	  		int res = adminMapper.getListCount(abvo);
	  		return res;
	  	}
    	public List<JJABoardVOto> getdocList (HashMap<String, Object> hashmap){
    		JJAdminBoardMapper adminMapper = sqlSession.getMapper(JJAdminBoardMapper.class);
	  		List<JJABoardVOto> list = adminMapper.getdocList(hashmap);
	  		return list;
    	}
}
