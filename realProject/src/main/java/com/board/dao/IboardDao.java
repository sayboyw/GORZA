package com.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.board.bean.B_board;

import com.board.bean.All_board;
import com.board.bean.Lisc;

import com.board.bean.N_Board;
import com.board.bean.Photo;
import com.board.bean.PopSearch;
import com.board.bean.Reply;
import com.board.bean.Search;

//게시판 dao용
public interface IboardDao {



	
	List<N_Board> getLikeBoardList(int pageNum); //일반 인기순 게시글 리스트
	
	List<N_Board> getNewBoardList(int pageNum); //일반 최신순 게시글 리스트
	
	int getAllBoard();//일반게시글 페이징 용 게시판 개수(codyShare)
	
	int getComCount(int b_num); // 댓글 개수 가져오기
	
	String getPhotoShow(int b_num); //화면에 보여줄 사진경로 가져오기
	
	String getPfofile(String id); //프로필 사진 가져오기
	
	N_Board getNorContents(int b_num);//상세보기 일반글

	List<Reply> getReplyList(Reply reply);//댓글 리스트 가져오기
	
	int getLikeChk(N_Board nBoard); //로그인한 사람이 좋아요 눌렀는지 체크

	int getScrabChk(N_Board nBoard); //로그인한 사람이 스크랩 눌렀는지 체크
	
	void likeInsert(Lisc lisc); // 좋아요 하기

	void likeDel(Lisc lisc); // 좋아요 해제

	void scrapInsert(Lisc lisc); // 스크랩 하기

	void scrapDel(Lisc lisc); // 스크랩 해제

	void bReplyWrite(Reply reply); //댓글 작성 기능

	void bReplyDel(Reply reply); //댓글 삭제 기능
	
//////////////////////////////////////////////////////////////////
int bWrite(N_Board board);//일반글 작성하기(공통 게시글)

int bWriteNBoard(N_Board board);//일반 고유 게시판 정보에 등록

int fileInsert(Map<String, String> fMap);//사진통합 테이블 등록
///////////////////////////////////////////////////////////////
List<N_Board> mPostList(String id);//포스트 리스트 가져오기

List<N_Board> mScrapList(String id); //스크랩 리스트 가져오기

//////////////////////////////////////////////////////////////////////

ArrayList<All_board> searchNormal(String search); //검색에 해당하는 일반게시글 인기순 리스트 뽑아오기

ArrayList<All_board> searchBrand(String search); //검색에 해당하는 브랜드게시글 인기순 리스트 뽑아오기

B_board getBrdContents(int b_num);//기업 글 상세보기

///////////////////////////////////////////////////////////////////////////////////////////////
	
int chkSearch(String search); //이미 테이블에 값이 있는지 체크

void insertSearch(String search); // 없으면 테이블에 입력

void updateSearch(String search); //있으면 횟수 증가

List<PopSearch> getPopList();//인기 검색어 리스트

////////////////////////////////////////////////////////////////////////////////////////////

int bDel(int b_num); //게시글 삭제기능

//////////////////////////////////////////////////////////////////////////////////////////////

int bUpdate(All_board allBoard); // 글 수정하기 

int bUpdateNBoard(All_board allBoard); //일반 게시판 고유정보 글 수정하기

int fileUpdate(Map<String, String> fMap); //게시판 사진 수정하기

//////////////////////////////////////////////////////////////////////////////////////////////

int fileDel(int ap_pkNum); //파일 삭제하기


///////////////////////////////////////////////////////////////////////////////////////////////

void likeAlertIn(Lisc lisc); //좋아요 알림용 값 넣기

void likeAlertDel(Lisc lisc); //좋아요 해제시 알림 데이터에서 지우기

void scrapAlertIn(Lisc lisc); //스크랩 알림 값 넣기

void scrapAlertDel(Lisc lisc); // 스크랩 해제시 알림 값 지우기

void bReplyAlertIn(Reply reply); //댓글 작성시 알림 값 넣기

void bReplyAlertDel(Reply reply);//댓글 삭제시 알림 값 지우기

////////////////////////////////////////////////////////// 브랜드 게시판

List<B_board> getBrandLikeBoardList(int pageNum);	//좋아요 순

List<B_board> getBrandNewBoardList(int pageNum);	//최신 순

int getBrandBoard();			//브랜드 게시판 게시글 수

int getLikeChk(B_board bBoard);	//좋아요 수

int getScrabChk(B_board bBoard);	//스크랩여부 확인

int brandFileDel(int b_num);		//브랜드 게시판 사진 삭제

int bUpdatebBoard(All_board allBoard);

	//관리자가 브랜드 게시판에 글 작성
int boardWrite1(B_board board);

int boardWrite2(B_board board);

void boardWrite3(Photo photo);

String getId(String brand);		//기업꺼 아이디 찾아오기

List<B_board> overlapSearch(Search search);

List<B_board> multiSearch(Map<String, Object> rMap);

int getAllBrBoard(); // 전체 게시글 개수 가져오기


	


/*
	List<Board> getBoardList(int pageNum);

	Board getContents(int bnum);

	void viewUp(int bnum);

	List<Reply> getReplyList(int bnum);

	int replyInsert(Reply reply);

	int getBoardCount();
	
	public int replyDelete(int bnum) throws Exception;
	
	public int boardDelete(int bnum) throws Exception;

	int boardInsert(Board board);

	int fileInsert(Attach attach);

	List<Attach> getFileList(int bnum);

	public int fileDelete(int bnum) thrbows Exception;*/

	

}
