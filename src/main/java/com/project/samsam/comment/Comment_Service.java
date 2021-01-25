package com.project.samsam.comment;

import java.util.List;

import com.project.samsam.fdocboard.FdocReflyVO;



public interface Comment_Service {
	public int commentInsertService(CommentVO comment) throws Exception;
	public List <CommentVO> commentListService(CommentVO comment) throws Exception;
	public int commentUpdateService(CommentVO  comment) throws Exception;
	public int commentDeleteService(CommentVO comment) throws Exception;
	public int deleteCount(CommentVO comment);
	public int deleteUpdate(CommentVO comment);
	public int commentReflyService(CommentVO comment) throws Exception;
}
