package com.project.samsam.hospital;

import java.util.Date;

public class Hospital_mapVO {
	
	private String place_id;		// 가게 아이디
	private String place_name;		// 상호
	private String address_name;	// 주소
	private String place_phone;		// 전화번호
	private String place_url;		// 상세정보 주소
	private String place_review;	// 리뷰
	private int review_num;		// 글번호
	private Date place_date;		// 작성일
	private String place_nick;		// 작성자
	private int star_rating;		//별점
	private String place_email;
	
	public String getPlace_id() {
		return place_id;
	}
	public void setPlace_id(String place_id) {
		this.place_id = place_id;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getPlace_phone() {
		return place_phone;
	}
	public void setPlace_phone(String place_phone) {
		this.place_phone = place_phone;
	}
	public String getPlace_url() {
		return place_url;
	}
	public void setPlace_url(String place_url) {
		this.place_url = place_url;
	}
	public String getPlace_review() {
		return place_review;
	}
	public void setPlace_review(String place_review) {
		this.place_review = place_review;
	}
	public Date getPlace_date() {
		return place_date;
	}
	public void setPlace_date(Date place_date) {
		this.place_date = place_date;
	}
	public String getPlace_nick() {
		return place_nick;
	}
	public void setPlace_nick(String place_nick) {
		this.place_nick = place_nick;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getStar_rating() {
		return star_rating;
	}
	public void setStar_rating(int star_rating) {
		this.star_rating = star_rating;
	}
	public String getPlace_email() {
		return place_email;
	}
	public void setPlace_email(String place_email) {
		this.place_email = place_email;
	}
}
