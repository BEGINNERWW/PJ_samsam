package com.project.samsam.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.CommentMapper;
import com.project.mapper.FdocMapper;
@Service
public class Comment_ServiceImple implements Comment_Service {
	
	@Autowired(required=false) 
	private SqlSession sqlSession;

	@Override
	public int commentInsertService(CommentVO comment) throws Exception {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		comment.setDoc_seq(1);
		commentMapper.commentCount(comment);
		
		return commentMapper.commentInsert(comment);
		
	}

	@Override
	public List<CommentVO> commentListService(CommentVO comment) throws Exception {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		return commentMapper.commentList(comment);
	}

	@Override
	public int commentUpdateService(CommentVO comment) throws Exception {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);

		return commentMapper.commentUpdate(comment);	
		
	}

	@Override
	public int commentDeleteService(CommentVO comment) throws Exception {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		commentMapper.commentSub(comment);
		return commentMapper.commentDelete(comment);
	}

	@Override
	public int deleteCount(CommentVO comment) {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		return commentMapper.DeleteCount(comment);
	}

	@Override
	public int deleteUpdate(CommentVO comment) {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		return commentMapper.DeleteUpdate(comment);
	}

	@Override
	public int commentReflyService(CommentVO comment) throws Exception {
		CommentMapper commentMapper = sqlSession.getMapper(CommentMapper.class);
		commentMapper.commentReflyUpdate(comment);
		commentMapper.commentCount(comment);
		comment.setDoc_seq(comment.getDoc_seq()+1);
		
		return commentMapper.commentRefly(comment);
	}
}
