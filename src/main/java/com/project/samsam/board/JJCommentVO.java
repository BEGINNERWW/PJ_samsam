package com.project.samsam.board;

public class JJCommentVO {
	private int doc_cno;
	private int doc_no;
	private String doc_email;
	private String doc_nick;
	private String doc_date;
	private String doc_content;
	private int doc_secret;
	private int doc_ref;
	private int doc_lev;
	private int doc_seq;
	 
	public int getDoc_ref() {
		return doc_ref;
	}
	public void setDoc_ref(int doc_ref) {
		this.doc_ref = doc_ref;
	}
	public int getDoc_lev() {
		return doc_lev;
	}
	public void setDoc_lev(int doc_lev) {
		this.doc_lev = doc_lev;
	}
	public int getDoc_seq() {
		return doc_seq;
	}
	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}
	private int co_count;
	
	
	public int getDoc_cno() {
		return doc_cno;
	}
	public void setDoc_cno(int doc_cno) {
		this.doc_cno = doc_cno;
	}
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
	public String getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public int getDoc_secret() {
		return doc_secret;
	}
	public void setDoc_secret(int doc_secret) {
		this.doc_secret = doc_secret;
	}
	
	public int getCo_count() {
		return co_count;
	}
	public void setCo_count(int co_count) {
		this.co_count = co_count;
	}
	
}