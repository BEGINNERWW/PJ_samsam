package com.project.samsam.myfree;

import java.sql.Date;

public class Myfree_docVO {
	
	private int doc_no; 			// 글번호
	private String doc_email; 		// 이메일
	private String doc_nick;			// 닉네임
	private String doc_subject; 	// 제목
	private String doc_content; 	// 글 내용
	private Date doc_date;			// 작성일
	private int doc_readcount;		// 조회수
	private int doc_expiry;		// 책임기간
	private String doc_code;		// 분양코드
	private int doc_price;			// 책임비
	private String doc_big;		// 동물대분류
	private String doc_kindof;		// 품종
	private String doc_thumbnail;	// 썸네일
	private String doc_loc;		// 지역
	private int doc_comment;		// 댓글수
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	public String getDoc_email() {
		return doc_email;
	}
	public void setDoc_email(String doc_email) {
		this.doc_email = doc_email;
	}
	public String getDoc_nick() {
		return doc_nick;
	}
	public void setDoc_nick(String doc_nick) {
		this.doc_nick = doc_nick;
	}
	public String getDoc_subject() {
		return doc_subject;
	}
	public void setDoc_subject(String doc_subject) {
		this.doc_subject = doc_subject;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
	}
	public int getDoc_readcount() {
		return doc_readcount;
	}
	public void setDoc_readcount(int doc_readcount) {
		this.doc_readcount = doc_readcount;
	}
	public int getDoc_expiry() {
		return doc_expiry;
	}
	public void setDoc_expiry(int doc_expiry) {
		this.doc_expiry = doc_expiry;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public int getDoc_price() {
		return doc_price;
	}
	public void setDoc_price(int doc_price) {
		this.doc_price = doc_price;
	}
	public String getDoc_big() {
		return doc_big;
	}
	public void setDoc_big(String doc_big) {
		this.doc_big = doc_big;
	}
	public String getDoc_kindof() {
		return doc_kindof;
	}
	public void setDoc_kindof(String doc_kindof) {
		this.doc_kindof = doc_kindof;
	}
	public String getDoc_thumbnail() {
		return doc_thumbnail;
	}
	public void setDoc_thumbnail(String doc_thumbnail) {
		this.doc_thumbnail = doc_thumbnail;
	}
	public String getDoc_loc() {
		return doc_loc;
	}
	public void setDoc_loc(String doc_loc) {
		this.doc_loc = doc_loc;
	}
	public int getDoc_comment() {
		return doc_comment;
	}
	public void setDoc_comment(int doc_comment) {
		this.doc_comment = doc_comment;
	}
	
}
