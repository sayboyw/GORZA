package com.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.board.bean.B_board;

import com.board.bean.Alert;
import com.board.bean.BanMember;
import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.Follow;
import com.board.bean.N_Board;
import com.board.bean.N_member;
import com.board.bean.QnaB;

//member dao 용 인터페이스
public interface ImemberDao {
	
	@Autowired
	SqlSession sqlSession = null;
	
	int getSecurittyPwd(N_member nmember); //암호화 비밀번호체크
	
	N_member mLogin(N_member nmember);//로그인 체크(일단 임시)

	BanMember getBanInfo(String id);//정지정보내용 가져오기

	int getBanChk(String id);//정지관련정보 체크
	
	C_member cMemberInfo(String string);//기업정보 가져오기
	
	N_member nMemberInfo(String id);//일반회원 정보 가져오기
	
	String getid(String nickName);//아이디가져오기

	int getfollowerC(String id);//팔로워수띄우기

	List getfollowinglist(String id);//팔로잉 리스트

	void followCancle(String id);//팔로우취소

	String getoid(String nickName);//상대아이디 가져오기
	

	int getfollowingC(String id);

	List getfollowlist(String id);
	

	


	
	

	int followChk(C_member cMember);//팔로우 했는지 체크하기
	//////////////////////////////////////////////////////////////////////////////////////

/*
	int access(Member member);

	Member getMemberInfo(String m_id);

	int memberInsert(Member member) throws Exception;

	String getSecurittyPwd(String m_id);*/

	void follow(Follow follow);//팔로우 하기
	
	void followingCancle(Follow follow);//팔로잉 삭제 (내가 한거)

	int reportBoardInsert(QnaB qnab);//신고할때 공통게시글 입력

	int mReport(QnaB qnab);//신고테이블 입력
	
	N_member allInfo(String nickName); // 개인정보 가져오기
	
	int getFollowFollowMe(Follow follow);//맞팔 상태 체크
	
/////////////////////////////////////////////////////////////////////////////////////////////
	
	List<Banner_Board> mainBannerList();//메인화면 배너리스트 출력
	
	List<B_board> mainBrandList();//메인화면 브랜드 게시판 인기순 리스트 출력(3개)
	
	List<N_Board> mainNormalList();//메인화면 일반 게시판 인기순 리스트 출력(3개)

	int mUpdate(N_member nMember);

	int mUpdate2(N_member nMember);

	int proChk(String id); //프로필 사진 있는지 체크

	void proInsert(Map<String, String> fMap); //프로필 사진 등록

	void proUpdate(Map<String, String> fMap); //프로필 업데이트

	int alertCount(String id);//알림 카운트 가져오기

	int memberLeave(String id);

	int myPagebanChk(String id);

	int memberWelcome(String id);
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	ArrayList<Alert> alertBList(String id); //알림 리스트
	
	ArrayList<Follow> alertFList(String id); //알림용 팔로우 리스트
	
	void alertBUpdate(String id); //알림용 읽음 표시
	
	void alertFUpdate(String id); //팔로우 읽음 표시
	
	String getPfofile(String id); //해당 프로필 사진 가져오기

	String getBphoto(int b_num); // 해당 게시글 사진 가져오기
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//ID 중복확인
		int idChk(String id);
		
		//닉네임 중복확인
		int nickChk(String nickname);
		
		//일반 회원가입
		int mJoinFm(N_member n_member);
		
		int mJoinFm2(N_member n_member);
		
		int mJoinProfile(N_member n_member); //프로필 사진 등록(회원가입시)

		//기업명 중복확인
		
		int comNickChk(String nickname);
		
		//기업 회원가입
		int comJoinI(C_member c_member);
		
		int comJoinI2(C_member c_member);
		
		int mComJoinP(C_member c_member); //프로필 사진 등록(회원가입시)
		
		//기업회원 이메일 인증 여부
		/*int confirm(C_member c_member);*/

		//아이디 찾기
		public List<String> find_id(N_member nMember);
		
		@Transactional
		//비밀번호 수정
		default int update_pw(N_member n_member) throws Exception {
			return sqlSession.update("update_pw", n_member);
		}
		
		//비번 찾을 때 가입 된 이메일과 같은지 체크
		int emailChk(String string);
		
		//비밀번호 찾기 질문 확인(미완
		int pwqChk(String pw_q);
		
		//비밀번호 찾기 답변 확인(미완
		int pwaChk(String pw_a);

		

		
	
	
	
	
	
	
	
	
}
