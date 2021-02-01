package com.project.samsam.payang;

import java.util.Date;

public class PayangVO {
	private int doc_no; 
	private String doc_email; 
	private String doc_nick;
	private String doc_name;
	private String doc_gender;
	private String doc_big_name;
	private String doc_kind;
	private String doc_age;
	private String doc_sido;
	private String doc_sigungu;
	private String doc_address;
	private String doc_subject;
	private String doc_content;
	private Date doc_date;
	private Date doc_upd_date;
	private int doc_readcount;
	// 댓글 개수
		private int reply_count;
		
	public int getDoc_readcount() {
		return doc_readcount;
	}
	public void setDoc_readcount(int doc_readcount) {
		this.doc_readcount = doc_readcount;
	}
	
	
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	private String thumbnail;
	
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
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_gender() {
		return doc_gender;
	}
	public void setDoc_gender(String doc_gender) {
		this.doc_gender = doc_gender;
	}
	public String getDoc_big_name() {
		return doc_big_name;
	}
	public void setDoc_big_name(String doc_big_name) {
		this.doc_big_name = doc_big_name;
	}
	public String getDoc_kind() {
		return doc_kind;
	}
	public void setDoc_kind(String doc_kind) {
		this.doc_kind = doc_kind;
	}
	public String getDoc_age() {
		return doc_age;
	}
	public void setDoc_age(String doc_age) {
		this.doc_age = doc_age;
	}
	public String getDoc_sido() {
		return doc_sido;
	}
	public void setDoc_sido(String doc_sido) {
		this.doc_sido = doc_sido;
	}
	public String getDoc_sigungu() {
		return doc_sigungu;
	}
	public void setDoc_sigungu(String doc_sigungu) {
		this.doc_sigungu = doc_sigungu;
	}
	public String getDoc_address() {
		return doc_address;
	}
	public void setDoc_address(String doc_address) {
		this.doc_address = doc_address;
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
	public Date getDoc_upd_date() {
		return doc_upd_date;
	}
	public void setDoc_upd_date(Date doc_upd_date) {
		this.doc_upd_date = doc_upd_date;
	}
	@Override
	public String toString() {
		return "PayangVO [doc_no=" + doc_no + ", doc_email=" + doc_email + ", doc_nick=" + doc_nick + ", doc_name="
				+ doc_name + ", doc_gender=" + doc_gender + ", doc_big_name=" + doc_big_name + ", doc_kind=" + doc_kind
				+ ", doc_age=" + doc_age + ", doc_sido=" + doc_sido + ", doc_sigungu=" + doc_sigungu + ", doc_address="
				+ doc_address + ", doc_subject=" + doc_subject + ", doc_content=" + doc_content + ", doc_date="
				+ doc_date + ", doc_upd_date=" + doc_upd_date + ", doc_readcount=" + doc_readcount + ", reply_count="
				+ reply_count + ", thumbnail=" + thumbnail + "]";
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	
	
}
