package com.board.bean;

import java.sql.Date;

//신고.문의하기 게시판

public class QnaB {

	private String id;
	private String nickName;
	
	//게시판 공통
	private int b_num;
	private String b_title;
	private String b_content;
	
	//신고 문의 게시판
	private String rp_reason;
	private int rp_divide;
	private Date rp_date;
	private String rp_oid;
	
	private int upper_num;
	private int group_num;
	private String write_id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getRp_reason() {
		return rp_reason;
	}
	public void setRp_reason(String rp_reason) {
		this.rp_reason = rp_reason;
	}
	public int getRp_divide() {
		return rp_divide;
	}
	public void setRp_divide(int rp_divide) {
		this.rp_divide = rp_divide;
	}
	public Date getRp_date() {
		return rp_date;
	}
	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}
	public String getRp_oid() {
		return rp_oid;
	}
	public void setRp_oid(String rp_oid) {
		this.rp_oid = rp_oid;
	}
	public int getUpper_num() {
		return upper_num;
	}
	public void setUpper_num(int upper_num) {
		this.upper_num = upper_num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}

	
	
}
