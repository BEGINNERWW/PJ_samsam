package com.project.samsam.payang;

import java.util.Date;

public class PayangReplyVO {
	
	private int doc_cno; 
	private int doc_no; 
	private String doc_email; 
	private String doc_nick;
	private String doc_content;
	private String doc_secret;
	private Date doc_date;
	private Date doc_upd_date;
	private String doc_date_fmt;
	
	// 수정 삭제
	private String btnModify;
	private String btnRemove;
	
	
	
	public String getBtnModify() {
		return btnModify;
	}
	public void setBtnModify(String btnModify) {
		this.btnModify = btnModify;
	}
	public String getBtnRemove() {
		return btnRemove;
	}
	public void setBtnRemove(String btnRemove) {
		this.btnRemove = btnRemove;
	}
	public String getDoc_date_fmt() {
		return doc_date_fmt;
	}
	public void setDoc_date_fmt(String doc_date_fmt) {
		this.doc_date_fmt = doc_date_fmt;
	}
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
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public String getDoc_secret() {
		return doc_secret;
	}
	public void setDoc_secret(String doc_secret) {
		this.doc_secret = doc_secret;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
	}
	public Date getDoc_upd_date() {
		return doc_upd_date;
	}
	public void setDoc_upd_date(Date doc_upd_date) {
		this.doc_upd_date = doc_upd_date;
	}
	@Override
	public String toString() {
		return "PayangReplyVO [doc_cno=" + doc_cno + ", doc_no=" + doc_no + ", doc_email=" + doc_email + ", doc_nick="
				+ doc_nick + ", doc_content=" + doc_content + ", doc_secret=" + doc_secret + ", doc_date=" + doc_date
				+ ", doc_upd_date=" + doc_upd_date + "]";
	}
	
	
	
}
