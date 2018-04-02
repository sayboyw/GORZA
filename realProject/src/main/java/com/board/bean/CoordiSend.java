package com.board.bean;

import java.sql.Date;

//제휴회사 코디 보내기
public class CoordiSend {

	private String id;
	private String nickName;
	
	//제휴회사 코디 보내기
	private int cd_num;
	private String cd_title;
	private String cd_content;
	private String cd_sit;
	private String[] cd_sitAll;
	private int cd_read;
	private Date cd_date;
	
	
	
	public int getCd_read() {
		return cd_read;
	}
	public void setCd_read(int cd_read) {
		this.cd_read = cd_read;
	}
	public Date getCd_date() {
		return cd_date;
	}
	public void setCd_date(Date cd_date) {
		this.cd_date = cd_date;
	}
	public String getCd_sit() {
		return cd_sit;
	}
	public void setCd_sit(String cd_sit) {
		this.cd_sit = cd_sit;
	}
	public String[] getCd_sitAll() {
		return cd_sitAll;
	}
	public void setCd_sitAll(String[] cd_sitAll) {
		this.cd_sitAll = cd_sitAll;
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
	public int getCd_num() {
		return cd_num;
	}
	public void setCd_num(int cd_num) {
		this.cd_num = cd_num;
	}
	public String getCd_title() {
		return cd_title;
	}
	public void setCd_title(String cd_title) {
		this.cd_title = cd_title;
	}
	public String getCd_content() {
		return cd_content;
	}
	public void setCd_content(String cd_content) {
		this.cd_content = cd_content;
	}
	
	
}
