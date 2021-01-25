package com.project.samsam.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.samsam.fdocboard.FdocReflyVO;





@Controller
public class Comment_Controller {
	@Autowired
	private Comment_Service CommentService;
	
	
	@ResponseBody
	@RequestMapping(value="/comment_insert.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceInsert(CommentVO comment, HttpSession session) throws Exception{
		comment.setDoc_nick((String)session.getAttribute("nick"));
		comment.setDoc_email((String)session.getAttribute("email"));
		
		
		
		return CommentService.commentInsertService(comment);
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_list.bo", produces="application/json;charset=UTF-8")
	private List<CommentVO> mCommentServiceList(CommentVO comment) throws Exception{
		
		List<CommentVO> comment_list = CommentService.commentListService(comment);
		
		return comment_list;
	
	}
	@ResponseBody
	@RequestMapping(value="/comment_update.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceUpdateProc(CommentVO comment) throws Exception{
		
		return CommentService.commentUpdateService(comment);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_delete.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceDelete(CommentVO vo) throws Exception{
		
		if(vo.getDoc_lev() != 0) {
			return CommentService.commentDeleteService(vo);
		}else {
			
			int res = CommentService.deleteCount(vo);
			
			if(res == 1) {
				return CommentService.commentDeleteService(vo);
			}else {
				
				
				return CommentService.deleteUpdate(vo);
			}
			
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/comment_refly.bo",produces="application/json;charset=UTF-8")
	private int mCommentServiceReflyInsert(CommentVO comment,HttpSession session) throws Exception{
		comment.setDoc_nick((String)session.getAttribute("nick"));
		comment.setDoc_email((String)session.getAttribute("email"));
		return CommentService.commentReflyService(comment);
		
	}

}
