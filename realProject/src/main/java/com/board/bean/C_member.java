package com.board.bean;

import java.sql.Date;

//기업회원
public class C_member {

		private String id;
		private String pw;
		private String pw1;
		private String pw2;
		private String nickName;
		private String intro;
		private String clause;
		private String emailAll;
		private String email1;
		private String email2;
		private String email;
		private int state;
		
		// 기업 고유정보
		private String c_name;
		private String c_num;
		private String c_num2;
		private int c_agree;
		private String approval_status;
		private int approval_key;
		
		//회원리스트 뽑아오기용
		private Date ban_start;
		private Date ban_stop;
		private int datechk;
		
		// 프로필사진
		private int pf_num;
		private String oriName;
		private String sysName;
		
		private int success;
		
		
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getSuccess() {
			return success;
		}
		public void setSuccess(int success) {
			this.success = success;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getPw1() {
			return pw1;
		}
		public void setPw1(String pw1) {
			this.pw1 = pw1;
		}
		public String getPw2() {
			return pw2;
		}
		public void setPw2(String pw2) {
			this.pw2 = pw2;
		}
		public String getNickName() {
			return nickName;
		}
		public void setNickName(String nickName) {
			this.nickName = nickName;
		}
		public String getIntro() {
			return intro;
		}
		public void setIntro(String intro) {
			this.intro = intro;
		}
		public String getClause() {
			return clause;
		}
		public void setClause(String clause) {
			this.clause = clause;
		}
		public String getEmailAll() {
			return emailAll;
		}
		public void setEmailAll(String emailAll) {
			this.emailAll = emailAll;
		}
		public String getEmail1() {
			return email1;
		}
		public void setEmail1(String email1) {
			this.email1 = email1;
		}
		public String getEmail2() {
			return email2;
		}
		public void setEmail2(String email2) {
			this.email2 = email2;
		}
		public int getState() {
			return state;
		}
		public void setState(int state) {
			this.state = state;
		}
		public String getC_name() {
			return c_name;
		}
		public void setC_name(String c_name) {
			this.c_name = c_name;
		}
		public String getC_num() {
			return c_num;
		}
		public void setC_num(String c_num) {
			this.c_num = c_num;
		}
		public String getC_num2() {
			return c_num2;
		}
		public void setC_num2(String c_num2) {
			this.c_num2 = c_num2;
		}
		public int getC_agree() {
			return c_agree;
		}
		public void setC_agree(int c_agree) {
			this.c_agree = c_agree;
		}
		public String getApproval_status() {
			return approval_status;
		}
		public void setApproval_status(String approval_status) {
			this.approval_status = approval_status;
		}
		public int getApproval_key() {
			return approval_key;
		}
		public void setApproval_key(int approval_key) {
			this.approval_key = approval_key;
		}
		public Date getBan_start() {
			return ban_start;
		}
		public void setBan_start(Date ban_start) {
			this.ban_start = ban_start;
		}
		public Date getBan_stop() {
			return ban_stop;
		}
		public void setBan_stop(Date ban_stop) {
			this.ban_stop = ban_stop;
		}
		public int getDatechk() {
			return datechk;
		}
		public void setDatechk(int datechk) {
			this.datechk = datechk;
		}
		public int getPf_num() {
			return pf_num;
		}
		public void setPf_num(int pf_num) {
			this.pf_num = pf_num;
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
		
		
		
		
		
		
		
		
}
