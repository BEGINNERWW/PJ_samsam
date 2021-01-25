package com.project.mapper;

import java.util.List;

import com.project.samsam.comment.CommentVO;
import com.project.samsam.fdocboard.FdocReflyVO;
import com.project.samsam.fdocboard.FdocVO;

public interface CommentMapper {
	
	public void commentCount(CommentVO comment);
	public int commentInsert(CommentVO comment) throws Exception;
	public List <CommentVO> commentList(CommentVO comment) throws Exception;
	public int commentUpdate(CommentVO comment) throws Exception;
	public void commentSub(CommentVO comment);
	public int commentDelete(CommentVO comment) throws Exception;
	public int DeleteCount(CommentVO comment);
	public int DeleteUpdate(CommentVO comment);
	public int commentReflyUpdate(CommentVO comment) throws Exception;
	public int commentRefly(CommentVO comment) throws Exception;
}
