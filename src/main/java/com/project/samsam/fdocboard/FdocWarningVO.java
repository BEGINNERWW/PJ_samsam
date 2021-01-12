package com.project.samsam.fdocboard;

import java.sql.Date;

public class FdocWarningVO {
	private int w_fdoc_no;
	private int w_fdoc_dno;
	private int w_fdoc_cno;
	private String w_fdoc_nick;
	private Date w_fdoc_date;
	private String w_reason;
	private String w_status;
	public int getW_fdoc_no() {
		return w_fdoc_no;
	}
	public void setW_fdoc_no(int w_fdoc_no) {
		this.w_fdoc_no = w_fdoc_no;
	}
	public int getW_fdoc_dno() {
		return w_fdoc_dno;
	}
	public void setW_fdoc_dno(int w_fdoc_dno) {
		this.w_fdoc_dno = w_fdoc_dno;
	}
	public int getW_fdoc_cno() {
		return w_fdoc_cno;
	}
	public void setW_fdoc_cno(int w_fdoc_cno) {
		this.w_fdoc_cno = w_fdoc_cno;
	}
	public String getW_fdoc_nick() {
		return w_fdoc_nick;
	}
	public void setW_fdoc_nick(String w_fdoc_nick) {
		this.w_fdoc_nick = w_fdoc_nick;
	}
	public Date getW_fdoc_date() {
		return w_fdoc_date;
	}
	public void setW_fdoc_date(Date w_fdoc_date) {
		this.w_fdoc_date = w_fdoc_date;
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

	
}
