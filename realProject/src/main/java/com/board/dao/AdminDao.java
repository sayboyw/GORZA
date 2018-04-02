package com.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.board.bean.BanMember;
import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.CoordiSend;
import com.board.bean.N_member;
import com.board.bean.Photo;
import com.board.bean.QnaB;
import com.board.bean.Req_msg;

@Repository
public interface AdminDao {

	List<BanMember> aBanInfo1();	//밴 테이블에 있는 회원들 탈퇴가 아닌회원
	
	List<BanMember> aBanInfo2();	//밴 테이블에 있는 회원들 탈퇴상태인 회원
	
	List<N_member> exceptMem();	//전체멤버중 밴 기록 없는 사람 출력
//여기까지 전체회원 리스트
	List<N_member> aMemberSearch(String keyword);		//밴기록 없는 일반회원 검색

	List<BanMember> aMemberSearch2(String keyword);	//밴기록 있는 일반회원 검색
	
	List<BanMember> aMemberSearch3();		//밴기록 있는 일반회원 전체
	
	List<BanMember> aMemberSearch4(String keyword);		//밴상태인 회원 중 검색

	List<BanMember> aMemberSearch5();		//밴상태인 회원

	List<BanMember> aMemberSearch6(String keyword);		//탈퇴 상태인 회원 중 검색

	List<BanMember> aMemberSearch7();		//탈퇴 상태인 회원

	int getBoardCount();	//게시글 갯수

	List<Banner_Board> getBoardList(Banner_Board bannerBoard);		//개시글 불러오기

	int bannerUpdate(int ba_num);

	List<Req_msg> getAllianceList();

	int approval(String id);

	int rejection(String id);
	
	List<QnaB> getReportList();//신고함 리스트 가져오기

	List<QnaB> aReportRecord(QnaB qnab); //신고 대상자의 당한 내역

	QnaB aReportDetail(QnaB qnab); //신고 내역 상세보기

	String getNickname(String id); //신고자 닉네임 가져오기
	
	void reportBoardDel(String b_num);//공통 게시글 삭제

	void reportQnaDel(String b_num);//신고/문의 하기 쪽 삭제

	int banCount(String id);		//밴 횟수구하기
	
	int aMemberBan(BanMember banMember);		//회원정지 1
	
	int aMemberBan2(BanMember banMember);	//회원정지 2

	int aMemberBan3(BanMember banMember);	//회원정지 3
	
	int aMemberRemove(BanMember banMember);			//회원정지풀어주기

	List<BanMember> banDetail(BanMember banMember);	//정지상세내역

	List<C_member> exceptCMem();			//밴 기록없는 기업회원
	
	List<C_member> aCBanInfo();				//밴 기록있는 기업회원

	int aCMemberBan(BanMember banMember);		//기업회원 영구정지

	int aCMemberCancel(BanMember banMember);		//기업회원 정지 해제
	
	int aComListCount(BanMember banMember);	//삭제할 기업회원의 글 수

	int recordDelete(BanMember banMember);		//기업회원 글 삭제

	List<C_member> cMemSearch(String keyword);			//밴 기록없는 기업회원 검색
	
	List<BanMember> cMemSearch2(String keyword);	//밴기록 있는 기업회원 검색
	
	List<BanMember> cMemSearch3();							//밴기록 있는 일반기업회원 전체

	List<BanMember> cMemSearch4(String keyword);	//밴상태인 기업회원 검색

	/////////////////////////////////////////////////////////////////////////////////////////////
		
	List<CoordiSend> aComCodyList();// 제휴회사 코디 리스트 가져오기
	
	List<Photo> aComCodyDetail(CoordiSend coordisend); //제휴회사 코디 상세보기

	void aCodyReadUpdate(CoordiSend coordisend); //코디 리스트 읽음 표시

	List<C_member> getList();
	
///////////////////////////////////////////////////////////////////////////////////////////////
	
	List<Banner_Board> getBannerIng();//진행중 리스트
	
	List<Banner_Board> getBannerFuture();//진행 예정 리스트
	
	List<Banner_Board> getBannerEnd();//종료된 리스트
	
	int bannerBdel(int b_num); //공통 테이블 배너 삭제
	
	int bannerDel(int ba_num); //배너 삭제하기
	
	int bannerChk(int b_num); //해당 b_num에 딸려있는 배너 개수 가져오기

	void reqDel(String id);		//제휴신청온거 거절하면 c_request 테이블에서 튜플 지우기

	CoordiSend aComCodyD(CoordiSend coordisend);

/*	List<B_board> brandDetail(bnum);*/
	// bnum값 보내줘야함
	
}
