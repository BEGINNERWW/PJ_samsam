package com.project.samsam.myfree;

import java.sql.Date;


public class Myfree_doc_confirmVO {

	private String confirm_no;				// 확정번호
	private int confirm_fdoc_no;			// 글번호
	private String confirm_fdoc_s_email;	// 분양자
	private String confirm_fdoc_r_email;	// 피분양자
	private String confirm_fdoc_code;		// 분양코드
	private int confirm_fdoc_expiry;		// 책임기간
	private String confirm_fdoc_price;		// 책임비
	private Date confirm_s_date;			// 책임시작일
	private Date confirm_e_date;			// 책임만료일
	private String confirm_account;			// 환급계좌번호
	private String confirm_fdoc_kindof;		// 품종
	private String confirm_fdoc_img;		// 이미지
	
	
	public String getConfirm_no() {
		return confirm_no;
	}
	public void setConfirm_no(String confirm_no) {
		this.confirm_no = confirm_no;
	}
	public int getConfirm_fdoc_no() {
		return confirm_fdoc_no;
	}
	public void setConfirm_fdoc_no(int confirm_fdoc_no) {
		this.confirm_fdoc_no = confirm_fdoc_no;
	}
	public String getConfirm_fdoc_s_email() {
		return confirm_fdoc_s_email;
	}
	public void setConfirm_fdoc_s_email(String confirm_fdoc_s_email) {
		this.confirm_fdoc_s_email = confirm_fdoc_s_email;
	}
	public String getConfirm_fdoc_r_email() {
		return confirm_fdoc_r_email;
	}
	public void setConfirm_fdoc_r_email(String confirm_fdoc_r_email) {
		this.confirm_fdoc_r_email = confirm_fdoc_r_email;
	}
	public String getConfirm_fdoc_code() {
		return confirm_fdoc_code;
	}
	public void setConfirm_fdoc_code(String confirm_fdoc_code) {
		this.confirm_fdoc_code = confirm_fdoc_code;
	}
	public int getConfirm_fdoc_expiry() {
		return confirm_fdoc_expiry;
	}
	public void setConfirm_fdoc_expiry(int confirm_fdoc_expiry) {
		this.confirm_fdoc_expiry = confirm_fdoc_expiry;
	}
	public String getConfirm_fdoc_price() {
		return confirm_fdoc_price;
	}
	public void setConfirm_fdoc_price(String confirm_fdoc_price) {
		this.confirm_fdoc_price = confirm_fdoc_price;
	}
	public Date getConfirm_s_date() {
		return confirm_s_date;
	}
	public void setConfirm_s_date(Date confirm_s_date) {
		this.confirm_s_date = confirm_s_date;
	}
	public Date getConfirm_e_date() {
		return confirm_e_date;
	}
	public void setConfirm_e_date(Date confirm_e_date) {
		this.confirm_e_date = confirm_e_date;
	}
	public String getConfirm_account() {
		return confirm_account;
	}
	public void setConfirm_account(String confirm_account) {
		this.confirm_account = confirm_account;
	}
	
	public String getConfirm_fdoc_kindof() {
		return confirm_fdoc_kindof;
	}
	public void setConfirm_fdoc_kindof(String confirm_fdoc_kindof) {
		this.confirm_fdoc_kindof = confirm_fdoc_kindof;
	}
	public String getConfirm_fdoc_img() {
		return confirm_fdoc_img;
	}
	
	public void setConfirm_fdoc_img(String confirm_fdoc_img) {
		this.confirm_fdoc_img = confirm_fdoc_img;
	}
	
	
}
