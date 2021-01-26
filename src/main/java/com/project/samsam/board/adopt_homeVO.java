package com.project.samsam.board;

import java.sql.Date;
import java.util.List;

public class adopt_homeVO {
	private int home_no;
	private String home_email;
	private String home_nick;
	private Date home_date;
	private String loc;
	private int home_readcount;
	private int replycount;
	private String home_img;
	private String home_phone;
	private String home_subject;
	private String home_price;
	private String home_content;
	private String big_name;
	private String kindof;
	private String home_thumbnail;
	private List<String>kind_search;
	private List<String>home_search;
	private List<String>kind_loc;
	private int startrow;
	private int endrow;

	public int getHome_no() {
		return home_no;
	}
	public void setHome_no(int home_no) {
		this.home_no = home_no;
	}
	public String getHome_nick() {
		return home_nick;
	}
	public void setHome_nick(String home_nick) {
		this.home_nick = home_nick;
	}
	public Date getHome_date() {
		return home_date;
	}
	public void setHome_date(Date home_date) {
		this.home_date = home_date;
	}
	public int getHome_readcount() {
		return home_readcount;
	}
	public void setHome_readcount(int home_readcount) {
		this.home_readcount = home_readcount;
	}
	public String getHome_img() {
		return home_img;
	}
	public void setHome_img(String home_img) {
		this.home_img = home_img;
	}
	public String getHome_phone() {
		return home_phone;
	}
	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}
	public String getHome_subject() {
		return home_subject;
	}
	public void setHome_subject(String home_subject) {
		this.home_subject = home_subject;
	}
	public String getHome_price() {
		return home_price;
	}
	public void setHome_price(String home_price) {
		this.home_price = home_price;
	}
	public String getHome_content() {
		return home_content;
	}
	public void setHome_content(String home_content) {
		this.home_content = home_content;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	public String getKindof() {
		return kindof;
	}
	public void setKindof(String kindof) {
		this.kindof = kindof;
	}
	public String getHome_thumbnail() {
		return home_thumbnail;
	}
	public void setHome_thumbnail(String home_thumbnail) {
		this.home_thumbnail = home_thumbnail;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public List<String> getKind_search() {
		return kind_search;
	}
	public void setKind_search(List<String> kind_search) {
		this.kind_search = kind_search;
	}
	public List<String> getHome_search() {
		return home_search;
	}
	public void setHome_search(List<String> home_search) {
		this.home_search = home_search;
	}
	public List<String> getKind_loc() {
		return kind_loc;
	}
	public void setKind_loc(List<String> kind_loc) {
		this.kind_loc = kind_loc;
	}
	public String getHome_email() {
		return home_email;
	}
	public void setHome_email(String home_email) {
		this.home_email = home_email;
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
	public int getReplycount() {
		return replycount;
	}
	public void setgetReplycount(int replycount) {
		this.replycount = replycount;
	}
	
	
}