package com.board.bean;
//좋아요 스크랩
public class Lisc {

	private String id;
	private String nickName;
	
	//	좋아요/스크랩
	private int sl_seq;
	private int b_num;
	private int divide;
	private int num;//해제 입력 구분용
	private String o_id;//알림용 상대 아이디
	
	
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getSl_seq() {
		return sl_seq;
	}
	public void setSl_seq(int sl_seq) {
		this.sl_seq = sl_seq;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getDivide() {
		return divide;
	}
	public void setDivide(int divide) {
		this.divide = divide;
	}
	
	
}
