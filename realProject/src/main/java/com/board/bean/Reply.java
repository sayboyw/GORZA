package com.board.bean;

import java.sql.Date;
//댓글용
public class Reply {

	private String id;
	private String nickName;
	
	//댓글게시판
	private int re_num;
	private int b_num;
	private String re_content;
	private Date re_date;
	private int re_divide;
	private int pageNum;
	private String o_id;//알림용 상대 아이디
	
	
	
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public int getRe_divide() {
		return re_divide;
	}
	public void setRe_divide(int re_divide) {
		this.re_divide = re_divide;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
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
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	
	
}
