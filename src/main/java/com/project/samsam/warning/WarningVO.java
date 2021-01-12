package com.project.samsam.warning;

import java.sql.Date;

public class WarningVO {
	private int w_no;
	private String w_email;
	private int w_co_no;
	private int w_doc_no;
	private String w_nick;
	private Date w_date;
	private String w_reason;
	private String w_status;
	private String w_category;
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
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public String getW_reason() {
		return w_reason;
	}
	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}
	public String getW_status() {
		return w_status;
	}
	public void setW_status(String w_status) {
		this.w_status = w_status;
	}
	public String getW_category() {
		return w_category;
	}
	public void setW_category(String w_category) {
		this.w_category = w_category;
	}
}
