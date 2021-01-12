package com.project.samsam.myfree;

import java.sql.Date;

public class Myfree_docVO {
	
	private int fdoc_no; 			// 글번호
	private String fdoc_email; 		// 이메일
	private String fdoc_subject; 	// 제목
	private String fdoc_content; 	// 글 내용
	private Date fdoc_date;			// 작성일
	private int fdoc_readcount;		// 조회수
	private int fdoc_expiry;		// 책임기간
	private String fdoc_code;		// 분양코드
	private int fdoc_pricd;			// 책임비
	private String fdoc_big;		// 동물대분류
	private String fdoc_kindof;		// 품종
	private String fdoc_thumbnail;	// 썸네일
	private String fdoc_loc;		// 지역
	
	
	public int getFdoc_no() {
		return fdoc_no;
	}
	public void setFdoc_no(int fdoc_no) {
		this.fdoc_no = fdoc_no;
	}
	public String getFdoc_email() {
		return fdoc_email;
	}
	public void setFdoc_email(String fdoc_email) {
		this.fdoc_email = fdoc_email;
	}
	public String getFdoc_subject() {
		return fdoc_subject;
	}
	public void setFdoc_subject(String fdoc_subject) {
		this.fdoc_subject = fdoc_subject;
	}
	public String getFdoc_content() {
		return fdoc_content;
	}
	public void setFdoc_content(String fdoc_content) {
		this.fdoc_content = fdoc_content;
	}
	public Date getFdoc_date() {
		return fdoc_date;
	}
	public void setFdoc_date(Date fdoc_date) {
		this.fdoc_date = fdoc_date;
	}
	public int getFdoc_readcount() {
		return fdoc_readcount;
	}
	public void setFdoc_readcount(int fdoc_readcount) {
		this.fdoc_readcount = fdoc_readcount;
	}
	public int getFdoc_expiry() {
		return fdoc_expiry;
	}
	public void setFdoc_expiry(int fdoc_expiry) {
		this.fdoc_expiry = fdoc_expiry;
	}
	public String getFdoc_code() {
		return fdoc_code;
	}
	public void setFdoc_code(String fdoc_code) {
		this.fdoc_code = fdoc_code;
	}
	public int getFdoc_pricd() {
		return fdoc_pricd;
	}
	public void setFdoc_pricd(int fdoc_pricd) {
		this.fdoc_pricd = fdoc_pricd;
	}
	public String getFdoc_big() {
		return fdoc_big;
	}
	public void setFdoc_big(String fdoc_big) {
		this.fdoc_big = fdoc_big;
	}
	public String getFdoc_kindof() {
		return fdoc_kindof;
	}
	public void setFdoc_kindof(String fdoc_kindof) {
		this.fdoc_kindof = fdoc_kindof;
	}
	public String getFdoc_thumbnail() {
		return fdoc_thumbnail;
	}
	public void setFdoc_thumbnail(String fdoc_thumbnail) {
		this.fdoc_thumbnail = fdoc_thumbnail;
	}
	public String getFdoc_loc() {
		return fdoc_loc;
	}
	public void setFdoc_loc(String fdoc_loc) {
		this.fdoc_loc = fdoc_loc;
	}
}
