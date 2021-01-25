package com.project.samsam.board;

public class BoardDetailVO {
	private int w_no;
	private String w_email;
	private int w_co_no;
	private int w_doc_no;
	private String w_nick;
	private String w_date;
	private String w_status;
	private String w_reason;
	private String w_category;
	private String w_note;
	
	private int doc_no; 
	private String doc_email;
	private String doc_nick;
	private String doc_subject;
	private String doc_content;
	private String doc_date;
	private int doc_readcount;
	private String category;
	private int doc_comment;
	
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public String getW_email() {
		return w_email;
	}
	public void setW_email(String w_email) {
		this.w_email = w_email;
	}
	public int getW_co_no() {
		return w_co_no;
	}
	public void setW_co_no(int w_co_no) {
		this.w_co_no = w_co_no;
	}
	public int getW_doc_no() {
		return w_doc_no;
	}
	public void setW_doc_no(int w_doc_no) {
		this.w_doc_no = w_doc_no;
	}
	public String getW_nick() {
		return w_nick;
	}
	public void setW_nick(String w_nick) {
		this.w_nick = w_nick;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getW_status() {
		return w_status;
	}
	public void setW_status(String w_status) {
		this.w_status = w_status;
	}
	public String getW_reason() {
		return w_reason;
	}
	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}
	public String getW_category() {
		return w_category;
	}
	public void setW_category(String w_category) {
		this.w_category = w_category;
	}
	public String getW_note() {
		return w_note;
	}
	public void setW_note(String w_note) {
		this.w_note = w_note;
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
	public String getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}
	public int getDoc_readcount() {
		return doc_readcount;
	}
	public void setDoc_readcount(int doc_readcount) {
		this.doc_readcount = doc_readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDoc_comment() {
		return doc_comment;
	}
	public void setDoc_comment(int doc_comment) {
		this.doc_comment = doc_comment;
	}
}
