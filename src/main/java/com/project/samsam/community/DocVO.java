package com.project.samsam.community;

import java.sql.Date;

public class DocVO {
	
	private int doc_no;
	private String doc_email;
	private String doc_nick;
	private String doc_subject;
	private String doc_content;
	private Date doc_date;
	private int doc_readcount;
	private int doc_comment;
	private int startrow;
	private int endrow;
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
	public int getDoc_comment() {
		return doc_comment;
	}
	public void setDoc_comment(int doc_comment) {
		this.doc_comment = doc_comment;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	
	

}
