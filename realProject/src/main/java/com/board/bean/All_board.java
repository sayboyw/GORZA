package com.board.bean;

import java.sql.Date;
//일반게시판
public class All_board {

	private String id;
	private String nickName;
	
	//게시판 공통
	private int b_num;
	private String b_title;
	private String b_content;
	private int b_divide;
	private String hashtag;
	private int likeC;
	private Date date;
	
	//일반 게시판
	private Date b_date;
	private int num; //구분자 용 스크랩/포스트
	private int pageNum;
	
	//사진 통합
	private int ap_num;
	private String oriName;
	private String sysName;
	private int ap_divide;
	private String ap_path;
	private int ap_pkNum;
	
	//브랜드 게시판
	private String br_sit;
	private String br_divide;
	private String br_color;
	private String br_brand;
	private Date br_date;
	
	
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	public int getB_divide() {
		return b_divide;
	}
	public void setB_divide(int b_divide) {
		this.b_divide = b_divide;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getLikeC() {
		return likeC;
	}
	public void setLikeC(int likeC) {
		this.likeC = likeC;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAp_num() {
		return ap_num;
	}
	public void setAp_num(int ap_num) {
		this.ap_num = ap_num;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getAp_divide() {
		return ap_divide;
	}
	public void setAp_divide(int ap_divide) {
		this.ap_divide = ap_divide;
	}
	public String getAp_path() {
		return ap_path;
	}
	public void setAp_path(String ap_path) {
		this.ap_path = ap_path;
	}
	public int getAp_pkNum() {
		return ap_pkNum;
	}
	public void setAp_pkNum(int ap_pkNum) {
		this.ap_pkNum = ap_pkNum;
	}
	public String getBr_sit() {
		return br_sit;
	}
	public void setBr_sit(String br_sit) {
		this.br_sit = br_sit;
	}
	public String getBr_divide() {
		return br_divide;
	}
	public void setBr_divide(String br_divide) {
		this.br_divide = br_divide;
	}
	public String getBr_color() {
		return br_color;
	}
	public void setBr_color(String br_color) {
		this.br_color = br_color;
	}
	public String getBr_brand() {
		return br_brand;
	}
	public void setBr_brand(String br_brand) {
		this.br_brand = br_brand;
	}
	public Date getBr_date() {
		return br_date;
	}
	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}
}
