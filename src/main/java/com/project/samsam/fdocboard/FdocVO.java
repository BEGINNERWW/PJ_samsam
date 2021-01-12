package com.project.samsam.fdocboard;




import java.sql.Date;
import java.util.List;

public class FdocVO {
	private int fdoc_no;
	private String fdoc_email;
	private String fdoc_nick;
	private String fdoc_subject;
	private String fdoc_content;
	private Date fdoc_date;
	private int fdoc_readcount;
	private int fdoc_expiry;
	private String fdoc_code;
	private int fdoc_price;
	private String fdoc_big;
	private String fdoc_kindof;
	private List<String> kind_search;
	//private MultipartFile fdoc_Image;
	private String fdoc_thumbnail;
	private String fdoc_loc;
	private List<String> fdoc_search;
	private List<String> kind_loc;
	private int startrow;
	private int endrow;
	private int fdoc_comment;
	public int getFdoc_no() {
		return fdoc_no;
	}
	public void setFdoc_no(int fdoc_no) {
		this.fdoc_no = fdoc_no;
	}
	public String getFdoc_nick() {
		return fdoc_nick;
	}
	public void setFdoc_nick(String fdoc_nick) {
		this.fdoc_nick = fdoc_nick;
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
	public int getFdoc_price() {
		return fdoc_price;
	}
	public void setFdoc_price(int fdoc_price) {
		this.fdoc_price = fdoc_price;
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

	public List<String> getKind_search() {
		return kind_search;
	}
	public void setKind_search(List<String> kind_search) {
		this.kind_search = kind_search;
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
	public String getFdoc_email() {
		return fdoc_email;
	}
	public void setFdoc_email(String fdoc_email) {
		this.fdoc_email = fdoc_email;
	}
	public int getFdoc_comment() {
		return fdoc_comment;
	}
	public void setFdoc_comment(int fdoc_comment) {
		this.fdoc_comment = fdoc_comment;
	}
	
	
}
