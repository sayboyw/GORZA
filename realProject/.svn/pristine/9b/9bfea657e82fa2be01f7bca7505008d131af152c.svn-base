package com.board.dao;

import java.util.Map;

import java.util.ArrayList;

import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.CoordiSend;
import com.board.bean.Photo;
import com.board.bean.Req_msg;

public interface CompanyDao {

	int bannerSend1(Banner_Board bannerBoard);

	int bannerSend2(Banner_Board bannerBoard);

	int bannerSend3(Photo photo);

	Req_msg grabParameter(String id);		//아마 관리자꺼 작업한 듯 

	int cRequest(Req_msg req);

	int cUpdate(String id);
	
	int cSend(CoordiSend cSend);//코디 게시글 등록

	void codyFileInsert(Photo photo); //코디 자료 등록(다중 파일 업로드)

	/////////////////////////////////////////////////////////////////////////////////////
	
	int cProChk(String id); //프로필 있나 체크

	void cProInsert(Map<String, String> fMap); //프로필 없으면 입력

	void cProUpdate(Map<String, String> fMap); //프로필 있으면 수정

	int cUpdateNor(C_member cMember); //공통 테이블 수정

	int cUpdateCm(C_member cMember); // 고유 테이블 수정

	C_member cNormalInfo(String id); //공통 테이블 정보

	C_member cUniquInfo(String id); // 고유 테이블 정보


	ArrayList<Object> getLikeRank(String id);	//좋아요로 랭크
	
	ArrayList<Object> getReplyRank(String id);	//댓글수로 랭크

}
