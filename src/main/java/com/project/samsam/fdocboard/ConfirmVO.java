package com.project.samsam.fdocboard;

import java.sql.Date;

public class ConfirmVO {
	
	private int doc_no;// 湲�踰덊샇
	private String fadoc_nick;// �옉�꽦�옄
	private String fadoc_subject;	// �젣紐�
	private String fadoc_content;	// 湲��궡�슜
	private Date fadoc_date;		// �옉�꽦�씪
	private int fadoc_readcount;	// 議고쉶�닔
	private String confirm_fdoc_img; //�씠誘몄�
	private int doc_comment;
	private String fadoc_r_email;
	
	public String getFadoc_nick() {
		return fadoc_nick;
	}
	public void setFadoc_nick(String fadoc_nick) {
		this.fadoc_nick = fadoc_nick;
	}
	public String getFadoc_subject() {
		return fadoc_subject;
	}
	public void setFadoc_subject(String fadoc_subject) {
		this.fadoc_subject = fadoc_subject;
	}
	public String getFadoc_content() {
		return fadoc_content;
	}
	public void setFadoc_content(String fadoc_content) {
		this.fadoc_content = fadoc_content;
	}
	public Date getFadoc_date() {
		return fadoc_date;
	}
	public void setFadoc_date(Date fadoc_date) {
		this.fadoc_date = fadoc_date;
	}
	public int getFadoc_readcount() {
		return fadoc_readcount;
	}
	public void setFadoc_readcount(int fadoc_readcount) {
		this.fadoc_readcount = fadoc_readcount;
	}
	
	public String getConfirm_fdoc_img() {
		return confirm_fdoc_img;
	}
	public void setConfirm_fdoc_img(String confirm_fdoc_img) {
		this.confirm_fdoc_img = confirm_fdoc_img;
	}
	
	public String getFadoc_r_email() {
		return fadoc_r_email;
	}
	public void setFadoc_r_email(String fadoc_r_email) {
		this.fadoc_r_email = fadoc_r_email;
	}
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	public int getDoc_comment() {
		return doc_comment;
	}
	public void setDoc_comment(int doc_comment) {
		this.doc_comment = doc_comment;
	}

}
