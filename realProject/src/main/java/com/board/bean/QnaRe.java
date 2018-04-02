package com.board.bean;

import java.sql.Date;

//문의하기 답글용 게시판
public class QnaRe {

	private String id;
	private String nickName;
	
	//문의하기 답글용 테이블
	private int rpre_seq;
	private String rpre_title;
	private String rpre_content;
	private Date rpre_date;
	
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
	public int getRpre_seq() {
		return rpre_seq;
	}
	public void setRpre_seq(int rpre_seq) {
		this.rpre_seq = rpre_seq;
	}
	public String getRpre_title() {
		return rpre_title;
	}
	public void setRpre_title(String rpre_title) {
		this.rpre_title = rpre_title;
	}
	public String getRpre_content() {
		return rpre_content;
	}
	public void setRpre_content(String rpre_content) {
		this.rpre_content = rpre_content;
	}
	public Date getRpre_date() {
		return rpre_date;
	}
	public void setRpre_date(Date rpre_date) {
		this.rpre_date = rpre_date;
	}
	
	
}
