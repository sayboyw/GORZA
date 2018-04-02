package com.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.board.bean.B_board;
import com.board.bean.Notice;
import com.board.bean.Photo;
import com.board.bean.QnaB;
import com.board.bean.Reply;


@Repository
public interface qnDao {

	// 문의사항 목록
	int getBoardCount(); // 문의사항 목록페이징
	List<QnaB> questionBoardList(int pageNum); // 문의사항 목록리스트

	QnaB getContents2(int b_num); // 문의사항 상세보기
	String qnabPhoto(int b_num); // 문의사항 상세보기 파일
	
	int qnabSend1(QnaB qnab); // 문의사항 글쓰기 통합 board에 담기
	int qnabSend2(QnaB qnab); // 문의사항 글쓰기2 문의 qnab에 담기
	int qnabSend3(Photo photo);  // 문의사항 글쓰기2 문의 파일 담기

	int bReqDel(int b_num); // 문의사항 글삭제하기
	List<Photo> filebReqDelList(int b_num); // 문의사항 글삭제하기 파일리스트
	int filebReqDel(int b_num); // 문의사항 파일삭제하기
	
	// 문의사항 답글
	int qnabReSend1(QnaB qnab); // 문의사항 답글쓰기 통합 board에 담기
	int qnabReSend2(QnaB qnab); // 문의사항 답글쓰기2 통합 qnab에 담기
	int qnabReSend3(Photo photo); // 문의사항 답글 파일넣기
	
	// 문의사항 수정하기
	int aQuestionUpdate(B_board board); // 문의사항 수정하기
	int aQuestionUpdate2(QnaB qnab);
	int questionfileUpdate(Photo photo); // 문의사항 파일수정하기
	
	// 공지사항 목록
	int noticeBoardCount(); // 공지사항 페이징
	List<Notice> noticeBoardList(int pageNum); // 공지사항 목록리스트
	
	void hitUp(int no_num); // 공지사항 조회수

	Notice getContents(int no_num); // 공지사항 상세보기
	String noticePhoto(int no_num); // 공지사항 상세보기 파일보기
	
	List<Photo> getFileList(int no_num); // 공지사항 글삭제하기 파일리스트
	int fileDelete(int no_num); // 공지사항 파일삭제하기
	int aNoticeDel(int no_num); // 공지사항 글삭제하기

	int noticeSend(Notice notice); // 공지사항 글쓰기
	int noticeSend2(Photo photo); // 공지사항 글쓰기 파일넣기
	
	int aNoticeUpdate(Notice notice); // 공지사항 수정하기
	int noticefileUpdate(Photo photo); // 공지사항 파일수정하기
	
	// 댓글기능
	List<Reply> qnabReply(Reply reply);//문의사항 댓글 리스트 가져오기
	
	void qnabReplyDel(Reply reply); //댓글 삭제 기능
	
	int qnabReplyCount(int b_num); // 댓글 개수 가져오기

	void qnaReInsert(Reply reply); //댓글 작성 기능
	
	int noticefileUpdateChk(Photo photo); // 파일 있는지 체크
	
	
}
