package com.project.samsam.fdocboard;




import java.sql.Date;
import java.util.List;

public class FdocVO {
	private int doc_no;
	private String doc_email;
	private String doc_nick;
	private String doc_subject;
	private String doc_content;
	private Date doc_date;
	private int doc_readcount;
	private int doc_expiry;
	private String doc_code;
	private int doc_price;
	private String doc_big;
	private String doc_kindof;
	private List<String> kind_search;
	//private MultipartFile fdoc_Image;
	private String doc_thumbnail;
	private String doc_loc;
	private List<String> fdoc_search;
	private List<String> kind_loc;
	private int startrow;
	private int endrow;
	private int doc_comment;
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
	public int getDoc_expiry() {
		return doc_expiry;
	}
	public void setDoc_expiry(int doc_expiry) {
		this.doc_expiry = doc_expiry;
	}
	public String getDoc_code() {
		return doc_code;
	}
	public void setDoc_code(String doc_code) {
		this.doc_code = doc_code;
	}
	public int getDoc_price() {
		return doc_price;
	}
	public void setDoc_price(int doc_price) {
		this.doc_price = doc_price;
	}
	public String getDoc_big() {
		return doc_big;
	}
	public void setDoc_big(String doc_big) {
		this.doc_big = doc_big;
	}
	public String getDoc_kindof() {
		return doc_kindof;
	}
	public void setDoc_kindof(String doc_kindof) {
		this.doc_kindof = doc_kindof;
	}
	public List<String> getKind_search() {
		return kind_search;
	}
	public void setKind_search(List<String> kind_search) {
		this.kind_search = kind_search;
	}
	public String getDoc_thumbnail() {
		return doc_thumbnail;
	}
	public void setDoc_thumbnail(String doc_thumbnail) {
		this.doc_thumbnail = doc_thumbnail;
	}
	public String getDoc_loc() {
		return doc_loc;
	}
	public void setDoc_loc(String doc_loc) {
		this.doc_loc = doc_loc;
	}
	public List<String> getFdoc_search() {
		return fdoc_search;
	}
	public void setFdoc_search(List<String> fdoc_search) {
		this.fdoc_search = fdoc_search;
	}
	public List<String> getKind_loc() {
		return kind_loc;
	}
	public void setKind_loc(List<String> kind_loc) {
		this.kind_loc = kind_loc;
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
	public int getDoc_comment() {
		return doc_comment;
	}
	public void setDoc_comment(int doc_comment) {
		this.doc_comment = doc_comment;
	}

	
}
