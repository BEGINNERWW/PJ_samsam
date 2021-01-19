package com.project.samsam.missing;

import java.util.Date;

public class MissingVO {
	private int m_no; 
	private String m_email; 
	private String m_nick;
	private String m_name;
	private String m_gender;
	private String m_big_name;
	private String m_kind;
	private String m_age;
	private String m_sido;
	private String m_sigungu;
	private String m_address;
	private String m_subject;
	private String m_content;
	private Date m_date;
	private Date m_upd_date;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_big_name() {
		return m_big_name;
	}
	public void setM_big_name(String m_big_name) {
		this.m_big_name = m_big_name;
	}
	public String getM_kind() {
		return m_kind;
	}
	public void setM_kind(String m_kind) {
		this.m_kind = m_kind;
	}
	public String getM_age() {
		return m_age;
	}
	public void setM_age(String m_age) {
		this.m_age = m_age;
	}
	public String getM_sido() {
		return m_sido;
	}
	public void setM_sido(String m_sido) {
		this.m_sido = m_sido;
	}
	public String getM_sigungu() {
		return m_sigungu;
	}
	public void setM_sigungu(String m_sigungu) {
		this.m_sigungu = m_sigungu;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_subject() {
		return m_subject;
	}
	public void setM_subject(String m_subject) {
		this.m_subject = m_subject;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public Date getM_upd_date() {
		return m_upd_date;
	}
	public void setM_upd_date(Date m_upd_date) {
		this.m_upd_date = m_upd_date;
	}
	@Override
	public String toString() {
		return "MissingVO [m_no=" + m_no + ", m_email=" + m_email + ", m_nick=" + m_nick + ", m_name=" + m_name
				+ ", m_gender=" + m_gender + ", m_big_name=" + m_big_name + ", m_kind=" + m_kind + ", m_age=" + m_age
				+ ", m_sido=" + m_sido + ", m_sigungu=" + m_sigungu + ", m_address=" + m_address + ", m_subject="
				+ m_subject + ", m_content=" + m_content + ", m_date=" + m_date + ", m_upd_date=" + m_upd_date + "]";
	}
}
