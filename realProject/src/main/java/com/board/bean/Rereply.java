package com.board.bean;

import java.sql.Date;
//대댓글용
public class Rereply {

	private String id;
	private String nickName;
	
	//대댓글 게시판
	private int rere_num;
	private int re_num;
	private String rere_content;
	private Date rere_date;
	private int rere_divide;
	private int pageNum;
	
	
	public int getRere_divide() {
		return rere_divide;
	}
	public void setRere_divide(int rere_divide) {
		this.rere_divide = rere_divide;
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
	public int getRere_num() {
		return rere_num;
	}
	public void setRere_num(int rere_num) {
		this.rere_num = rere_num;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRere_content() {
		return rere_content;
	}
	public void setRere_content(String rere_content) {
		this.rere_content = rere_content;
	}
	public Date getRere_date() {
		return rere_date;
	}
	public void setRere_date(Date rere_date) {
		this.rere_date = rere_date;
	}
	
	
}
