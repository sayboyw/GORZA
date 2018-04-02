package com.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.BanMember;
import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.CoordiSend;
import com.board.bean.N_member;
import com.board.bean.Photo;
import com.board.bean.QnaB;
import com.board.bean.Req_msg;
import com.board.dao.AdminDao;
import com.board.userClass.MediaUtils;
import com.board.userClass.Paging;



@Component
public class AdminMM {

	@Autowired
	private AdminDao aDao;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	@Autowired
	HttpServletRequest request;

	Map<String,List> nmMap ;
	Date date = new Date(System.currentTimeMillis());
	
	//관리자 -> 전체회원 리스트 출력
	public Map<String, List> aMemberListF(N_member nmember) {
		int state= nmember.getState();
	/*닉네임, 자기소개 출력해옴*/

		//밴 멤버 빈 읽어오기
		List<BanMember> bMemList1 = aDao.aBanInfo1();		//밴 테이블에 있는 회원들 탈퇴가 아닌회원
		List<BanMember> bMemList2 = aDao.aBanInfo2();		//밴 테이블에 있는 회원들 탈퇴상태인 회원
		System.out.println("bMemList1 : "+bMemList1);
		System.out.println("bMemList2 : "+bMemList2);
		List<N_member> exceptList = aDao.exceptMem();	//밴 테이블에 값이 존재하지 않는 회원
		System.out.println("차집합 출력 "+ exceptList);
		int bMemList1Num = bMemList1.size();	// 밴 테이블에 담긴 회원들의 수1
		int bMemList2Num = bMemList2.size();	// 밴 테이블에 담긴 회원들의 수2
		int exceptListNum = exceptList.size();
		List newList = new ArrayList(); //통합 할 리스트 객체화
		int dateChk; 		//날짜확인용변수 + 과정
		
		if(bMemList1Num !=0 && bMemList2Num !=0){	//리스트 2개다 있는경우
			for(int i=0;i<bMemList1.size();i++){
				System.out.println("날짜출력 "+bMemList1.get(i).getBan_stop());
				if(bMemList1.get(i).getBan_stop() != null){
					dateChk = date.compareTo(bMemList1.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					bMemList1.get(i).setDatechk(dateChk);
				}
			}
			for(int i=0;i<bMemList2.size();i++){
				System.out.println("날짜출력2 "+bMemList2.get(i).getBan_stop());
				dateChk = date.compareTo(bMemList2.get(i).getBan_stop());
				System.out.println("날짜 비교값2 : "+ dateChk);
			}
			newList.addAll(bMemList1);	// 통합 리스트에 담아주기
			newList.addAll(bMemList2);
			newList.addAll(exceptList);
			newList.add(0,bMemList1Num);		//통합 리스트에 리스트의 사이즈 넣어줌 
			newList.add(1,bMemList2Num);
			newList.add(2,exceptListNum);
			
		}else if(bMemList1Num!=0 && bMemList2Num==0 ){
			for(int i=0;i<bMemList1.size();i++){
				System.out.println("날짜출력 "+bMemList1.get(i).getBan_stop());
				if(bMemList1.get(i).getBan_stop() != null){
					dateChk = date.compareTo(bMemList1.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					bMemList1.get(i).setDatechk(dateChk);
				}
			}
			newList.addAll(bMemList1);	
			newList.addAll(exceptList);
			newList.add(0,bMemList1Num);
			newList.add(1,exceptListNum);
		}else if(bMemList1Num==0 && bMemList2Num!=0){
			for(int i=0;i<bMemList2.size();i++){
				System.out.println("날짜출력2 "+bMemList2.get(i).getBan_stop());
				dateChk = date.compareTo(bMemList2.get(i).getBan_stop());
				System.out.println("날짜 비교값2 : "+ dateChk);
				bMemList2.get(i).setDatechk(dateChk);
				newList.addAll(bMemList2);
				newList.addAll(exceptList);
				newList.add(0,bMemList2Num);
				newList.add(1,exceptListNum);
			}
		}else{
			newList.addAll(exceptList);
			newList.add(0,exceptListNum);
		}
		
		System.out.println("통합리스트 : " + newList);
		nmMap = new HashMap<String,List>();
		nmMap.put("newList", newList);	//통합 리스트를 맵에 담기

		System.out.println("전부 담긴 nmMap : "+ nmMap);
		
		return nmMap;
	}

	//회원검색
	public Map<String, List> aMemberSearch(N_member nmember, String member_ban, String keyword) {
		int listSize;
		int listSize2;
		int dateChk; 		//날짜확인용변수
		nmMap = new HashMap<String,List>();
		
		List<N_member> sList ;
		List<BanMember> sList2 ;
		List newList = new ArrayList(); //통합 할 리스트 객체화
		System.out.println("멤버타입 : "+member_ban);
		System.out.println("검색어 : "+keyword);
		
		if(member_ban.equals("normal") ){	//일반회원 검색
			
			if(keyword != null){	// 키워드가 있을 때
				sList = aDao.aMemberSearch(keyword);	//밴기록 없는 일반회원 검색
				sList2 = aDao.aMemberSearch2(keyword);	//밴기록 있는 일반회원 검색
				listSize = sList.size();
				listSize2 = sList2.size();
				
				if(listSize2 !=0){
					System.out.println("밴기록있는 회원리스트");
					for(int i=0;i<sList2.size();i++){
						System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
						dateChk = date.compareTo(sList2.get(i).getBan_stop());
						System.out.println("날짜 비교값 : "+ dateChk);
						sList2.get(i).setDatechk(dateChk);
					}
					newList.add(0,listSize);
					newList.add(1,listSize2);
					newList.addAll(sList);
					newList.addAll(sList2);
				}else{
					System.out.println("밴기록없는 목록중 검색 리스트 : "+listSize);
					newList.add(0,listSize);
					newList.addAll(sList);
				}
				
			}else{	
				System.out.println("일반 전체 출력");
				sList = aDao.exceptMem();		//밴기록 없는 일반회원 전체
				sList2 = aDao.aMemberSearch3();	//밴기록 있는 일반회원 전체
				listSize = sList.size();
				listSize2 = sList2.size();
				
				if(listSize2 !=0){
					for(int i=0;i<sList2.size();i++){
						System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
						dateChk = date.compareTo(sList2.get(i).getBan_stop());
						System.out.println("날짜 비교값 : "+ dateChk);
						sList2.get(i).setDatechk(dateChk);
					}
					newList.add(0,listSize);
					newList.add(1,listSize2);
					newList.addAll(sList);
					newList.addAll(sList2);
				}else{
					newList.add(0,listSize);
					newList.addAll(sList);
				}

			}
		}else if(member_ban.equals("banned") ){	//정지회원
			if(keyword != null){	// 키워드가 있을 때
				System.out.println("정지 회원중 검색");
				sList2 = aDao.aMemberSearch4(keyword);	//밴상태인 회원 중 검색
				listSize2 = sList2.size();
				
				for(int i=0;i<sList2.size();i++){
					System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
					dateChk = date.compareTo(sList2.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					sList2.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize2);
				newList.addAll(sList2);
			}else{	
				System.out.println("정지 회원전체");
				sList2 = aDao.aMemberSearch5();	//밴상태인 회원
				listSize2 = sList2.size();
				
				for(int i=0;i<sList2.size();i++){
					System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
					dateChk = date.compareTo(sList2.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					sList2.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize2);
				newList.addAll(sList2);
			}
		}else if(member_ban.equals("leave") ){	//탈퇴회원
			if(keyword != null){	// 키워드가 있을 때
				System.out.println("탈퇴 회원중 검색");
				sList2 = aDao.aMemberSearch6(keyword);	//탈퇴 상태인 회원 중 검색
				listSize2 = sList2.size();
				
				for(int i=0;i<sList2.size();i++){
					System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
					dateChk = date.compareTo(sList2.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					sList2.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize2);
				newList.addAll(sList2);
			}else{	
				System.out.println("탈퇴 회원전체");
				sList2 = aDao.aMemberSearch7();	//탈퇴 상태인 회원
				listSize2 = sList2.size();
				
				for(int i=0;i<sList2.size();i++){
					System.out.println("날짜출력 "+sList2.get(i).getBan_stop());
					dateChk = date.compareTo(sList2.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					sList2.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize2);
				newList.addAll(sList2);
			}
		}
		nmMap.put("newList", newList);
		return nmMap;
	}

	//회원정지
	public Map<String, Object> aMemberBan(BanMember banMember) {
		Map<String, Object> banMap = new HashMap<String, Object>();
		int bcnt ;
		int result;
		bcnt = aDao.banCount(banMember.getId());
		System.out.println("현재 정지횟수: "+bcnt);
		if(bcnt==0){
			result = aDao.aMemberBan(banMember);	//1회차
		}else if(bcnt==1){
			result = aDao.aMemberBan2(banMember);	//2회차
		}else{
			result = aDao.aMemberBan3(banMember);	//3회차 영구정지
		}
		banMap.put("result",result);

		return banMap;
	}
	
	//회원 정지 풀어주기
	public Map<String, Object> aMemberRemove(BanMember banMember) {
		System.out.println("정지 해제하기");
		Map<String, Object> removeMap = new HashMap<String, Object>();
		int result;
		String msg="회원 정지 해지에 실패하였습니다.";
		result = aDao.aMemberRemove(banMember);
		System.out.println("결과값 : "+result);
		if(result==1){
			msg= "회원정지 해지에 성공하였습니다.";
			
		}else{
			
		}
		removeMap.put("msg",msg);
		removeMap.put("result",result);
		return removeMap;
	}
	//정지내역 가져오기
	public Map<String, List> banDetail(BanMember banMember) {
		System.out.println("정지내역 상세보기");
		Map<String, List> detailMap = new HashMap<String, List>();
		List<BanMember> List ;
		List = aDao.banDetail(banMember);

		detailMap.put("List", List);
		return detailMap;
	}
	
	//배너 리스트 가져오기
	public Map<String, Object> aBannerList() {
		
		Map<String, Object> bannerMap = new HashMap<String, Object>();
		Banner_Board bannerBoard = new Banner_Board();
		List<Banner_Board> bannerlist=null;
		//처음 시작할때는 페이지 1 
		int pageNum= (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;	
		System.out.println("원하는 페이지 번호 pageNum="+pageNum);
		/*페이징 관련*/
		int maxNum = aDao.getBoardCount();		//total Count
		System.out.println("게시글 갯수 : "+maxNum);
		Paging paging = new Paging(maxNum, pageNum, 10, 3, "aBannerF");
		String boardPaging = paging.makeHtmlPaging();		
		bannerBoard.setPageNum(pageNum);
		
		bannerlist=aDao.getBoardList(bannerBoard);		//게시글 리스트로 뽑아오기
		
		System.out.println("게시글 리스트");
		System.out.println(bannerlist.size());
		//System.out.println("0번 주소 : "+bannerlist.get(0).getAp_path());

		bannerMap.put("boardPaging", boardPaging);
		bannerMap.put("bannerList",bannerlist);
		return bannerMap;
	}
	
	//배너 업데이트
	public ModelAndView aBannerUpdate(int banum[]) {
		System.out.println("배너 업데이트 서비스");
		System.out.println("banum크기 : "+banum.length);
		
		String msg="배너 업데이트에 실패하였습니다.";
		String view="aBannerF";
		mav = new ModelAndView();
		int a=0;
		int ba_num;
		for(int i=0;i<banum.length;i++){
			ba_num= banum[i];
			a=aDao.bannerUpdate(ba_num);
			System.out.println("업데이트 성공여부 : "+a);
		}
		if(a==1){
			msg="배너 업데이트에 성공하였습니다.";
			view="aComAskF";
		}
		
		mav.addObject("msg",msg);
		mav.setViewName(view);
		return mav;
	}
	
	//제휴신청 리스트 가져오기
	public Map<String, Object> AllianceList() {
		System.out.println("제휴 리스트 가져오기 서비스");
		
		Map<String, Object>  reqMap = new HashMap<String, Object>();
		Req_msg req= new Req_msg();
		List<Req_msg> reqlist=null;
		
		reqlist=aDao.getAllianceList();
		System.out.println("제휴 신청 리스트");
		System.out.println(reqlist.size());
		reqMap.put("reqlist",reqlist);
		
		return reqMap;
	}
	//제휴 신청 처리
	public ModelAndView comReqUpdate(String id, String divide) {
		mav= new ModelAndView();
		String view ="aComAskF";
		String msg="작업 실패";
		if(divide.equals("1")) {	//승인
			if(aDao.approval(id)==1) {
				msg="제휴신청 승인에 성공하였습니다.";
			}
		}else {						//거절
			if(aDao.rejection(id)==1) {
				aDao.reqDel(id);
				msg="제휴신청 거절을 완료했습니다.";
			}
		}
		mav.addObject("msg",msg);
		mav.setViewName(view);
		return mav;
	}

	//신고함 리스트 가져오기
		public Map<String, List<QnaB>> getReportList() {
			
			Map<String, List<QnaB>> map= new HashMap<String, List<QnaB>>();
			
			List<QnaB> reportList= aDao.getReportList();
			
			map.put("reportList",reportList);
			
			return map;
		}

		//신고 대상자의 당한 내역
		public ModelAndView aReportRecord(QnaB qnab) {
			ModelAndView mav = new ModelAndView();
			
			List<QnaB> recordList= aDao.aReportRecord(qnab);
			
			mav.addObject("recordList",recordList);
			mav.setViewName("recordListF");
			return mav;
		}

		//신고내역 상세보기
		public ModelAndView aReportDetail(QnaB qnab) {
			
			ModelAndView mav = new ModelAndView();
			
			qnab = aDao.aReportDetail(qnab);
			
			String nickName = aDao.getNickname(qnab.getId());
			
			mav.addObject("nickName",nickName);
			mav.addObject("reportDetail",qnab);
			mav.setViewName("aReportDetail");
			
			return mav;
		}

		//일괄 삭제하기
		public Map<String, List<QnaB>> reportDel() {
			
			Map<String, List<QnaB>> map = new HashMap<String, List<QnaB>>();
			
			String[] delList = request.getParameterValues("delValue[]");
			System.out.println("확인");
			System.out.println(delList);
			
			for(int i = 0; i<delList.length;i++){
				aDao.reportBoardDel(delList[i]);
				aDao.reportQnaDel(delList[i]);
			}
			
			List<QnaB> reportList= aDao.getReportList();//신고함 리스트 뽑아오기
			
			map.put("reportList", reportList);
			
			return map;
		}

		//기업회원 전체 뽑아오기
		public Map<String, List> aCMemberListF(C_member cmember) {
			int size1 = 0;
			int size2=0;
			int dateChk =0;
			List<C_member> exceptList = aDao.exceptCMem();	//밴 테이블에 값이 존재하지 않는 회원
			List<C_member> cMemList = aDao.aCBanInfo();		//밴 테이블에 있는 회원들 탈퇴가 아닌회원
			size1 = exceptList.size();
			size2 = cMemList.size();
			
			System.out.println("cMemList : "+cMemList);
			System.out.println("exceptList : "+exceptList);
			
			List newList = new ArrayList(); //통합 할 리스트 객체화
			newList.add(0,size1);
			newList.addAll(exceptList);
			System.out.println("size2의 값 :"+size2);
			if(size2 !=0){		//size2 에 값이 있다 => 리스트가 2개
				for(int i=0;i<cMemList.size();i++){
					System.out.println("날짜출력 "+cMemList.get(i).getBan_stop());
					if(cMemList.get(i).getBan_stop() != null){
						dateChk = date.compareTo(cMemList.get(i).getBan_stop());
						System.out.println("날짜 비교값 : "+ dateChk);
						cMemList.get(i).setDatechk(dateChk);
					}
				}
				newList.add(1,size2);
				newList.addAll(cMemList);
			}

			nmMap = new HashMap<String,List>();
			nmMap.put("newList", newList);	//통합 리스트를 맵에 담기

			System.out.println("전부 담긴 nmMap : "+ nmMap);
			
			return nmMap;
		}
		
		//기업회원 영구정지
		public Map<String, Object> aCMemberBan(BanMember banMember) {
			
			Map<String, Object> banMap = new HashMap<String, Object>();
			int result;
			result = aDao.aCMemberBan(banMember);	
			
			banMap.put("result",result);

			return banMap;
		}
		//기업회원 정지풀어주기
		public Map<String, Object> aCMemberCancel(BanMember banMember) {
			Map<String, Object> banMap = new HashMap<String, Object>();
			int result;
			result = aDao.aCMemberCancel(banMember);	
			
			banMap.put("result",result);

			return banMap;
		}
		//기업회원 글 삭제
		public Map<String, Object> recordDelete(BanMember banMember) {
			Map<String, Object> banMap = new HashMap<String, Object>();
			int a;
			int b;
			int result;
			a = aDao.recordDelete(banMember);		//분자 : 삭제 된 글의 수
			b= aDao.aComListCount(banMember);			//분모 : 삭제 할 글의 수
			if(b!=0){
				result = a/b;
			System.out.println("분자 : "+a);
			System.out.println("분모 : "+b);
			if(result==1){
				System.out.println("해당 회원의 모든 글을 삭제하였습니다.");
			}
			banMap.put("result",result);
			}else{
				banMap.put("result",0);
			}
			
			return banMap;
		}
		//기업회원 검색
		public Map<String, Object> aCMemberSearch(C_member cmember, String member_ban, String keyword) {
			int listSize;
			int listSize2;
			int listSize3;
			int dateChk; 		//날짜확인용변수
			Map<String,Object> cMap = new HashMap<String,Object>();
			
			List<C_member> List ;
			List<BanMember> List2 ;
			List<N_member> List3 ;
			List newList = new ArrayList(); //통합 할 리스트 객체화
			System.out.println("서비스단");
			System.out.println("멤버타입 : "+member_ban);
			System.out.println("검색어 : "+keyword);
			
			if(member_ban.equals("normal") ){	//일반회원 검색
				
				if(keyword != null){	// 키워드가 있을 때
					List = aDao.cMemSearch(keyword);	//밴기록 없는 일반회원 검색
					List2 = aDao.cMemSearch2(keyword);	//밴기록 있는 일반회원 검색
					listSize = List.size();
					listSize2 = List2.size();
					
					if(listSize2 !=0){
						System.out.println("밴기록있는 기업회원리스트");
						for(int i=0;i<List2.size();i++){
							System.out.println("날짜출력 "+List2.get(i).getBan_stop());
							dateChk = date.compareTo(List2.get(i).getBan_stop());
							System.out.println("날짜 비교값 : "+ dateChk);
							List2.get(i).setDatechk(dateChk);
						}
						newList.add(0,listSize);
						newList.add(1,listSize2);
						newList.addAll(List);
						newList.addAll(List2);
					}else{
						System.out.println("밴기록없는 목록중 검색 리스트 : "+listSize);
						newList.add(0,listSize);
						newList.addAll(List);
					}
					
				}else{		//키워드 없음 => 노멀 전부출력	
					System.out.println("일반 전체 출력");
					List = aDao.exceptCMem();		//밴기록 없는 일반기업회원 전체
					List2 = aDao.aMemberSearch3();	//밴기록 있는 일반기업회원 전체
					listSize = List.size();
					listSize2 = List2.size();
					
					if(listSize2 !=0){
						for(int i=0;i<List2.size();i++){
							System.out.println("날짜출력 "+List2.get(i).getBan_stop());
							dateChk = date.compareTo(List2.get(i).getBan_stop());
							System.out.println("날짜 비교값 : "+ dateChk);
							List2.get(i).setDatechk(dateChk);
						}
						newList.add(0,listSize);
						newList.add(1,listSize2);
						newList.addAll(List);
						newList.addAll(List2);
					}else{
						newList.add(0,listSize);
						newList.addAll(List);
					}

				}
			
		}else if(member_ban.equals("banned") ){	//정지중인 회원
			if(keyword != null){	// 키워드가 있을 때
				List2 = aDao.cMemSearch4(keyword);	//밴상태인 회원 중 검색
				listSize=List2.size();
				for(int i=0;i<List2.size();i++){
					System.out.println("날짜출력 "+List2.get(i).getBan_stop());
					dateChk = date.compareTo(List2.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					List2.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize);
				newList.addAll(List2);
				System.out.println("밴상태인 목록중 검색 : "+listSize);


			}else{
				List = aDao.aCBanInfo();	//밴상태인 회원 전체
				listSize=List.size();
				for(int i=0;i<List.size();i++){
					System.out.println("날짜출력 "+List.get(i).getBan_stop());
					dateChk = date.compareTo(List.get(i).getBan_stop());
					System.out.println("날짜 비교값 : "+ dateChk);
					List.get(i).setDatechk(dateChk);
				}
				
				newList.add(0,listSize);
				newList.addAll(List);
				System.out.println("밴상태인 회원 전체 : "+listSize);

			}
		}

			cMap.put("newList", newList);
			return cMap;
		}		
		
		//제휴회사 코디 신청 리스트
				public Map<String, List<CoordiSend>> aComCodyList() {
					
					Map<String, List<CoordiSend>> map = new HashMap<String, List<CoordiSend>>();
					
					List<CoordiSend> codyList = aDao.aComCodyList();
					
					map.put("codyList", codyList);
					
					return map;
				}

				// 제휴회사 코디 신청 상세보기
				public ModelAndView aComCodyDetail(CoordiSend coordisend) {
					
					ModelAndView mav = new ModelAndView();
					
					if(coordisend.getCd_read() == 0){
						aDao.aCodyReadUpdate(coordisend);
					}
					
					List<Photo> coordiList  = aDao.aComCodyDetail(coordisend);
					mav.addObject("coordiSend",aDao.aComCodyD(coordisend));
					mav.addObject("coordiList",coordiList);
					System.out.println("코디리스트 크기 : "+coordiList.size());
					mav.setViewName("aComCodyDetailF");
					
					return mav;
				}

				//코디 다운로드
				//다운로드
			    public ResponseEntity<byte[]> coordiDown(String oriName, String sysName) throws IOException {
			        String root=request.getSession().getServletContext().getRealPath("/");
			        String uploadPath=root+"resources/codi/";  //물리적 주소
			        String extension = oriName.substring(oriName.lastIndexOf(".")+1).toUpperCase();
			        ResponseEntity<byte[]> entity = null;
			        InputStream in = null;
			        File dest = null;
			        try {
			            File src = new File(uploadPath, sysName); //파일 존재하지 않아도 생성됨
			            //dest = new File(uploadPath, oriName);
			            //FileCopyUtils.copy(src, dest);
			            MediaType mType = MediaUtils.getMediaType(extension); //JPG의 타입, GIF의 타입, ..
			            HttpHeaders headers = new HttpHeaders();
			            
		                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		                headers.add("Content-Disposition", "attachment;filename=" + oriName);          
		                
			            in = new FileInputStream(src); //파일이 존재치 않으면 생성 안됨
			            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			        } catch(IOException e) {
			            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			        } finally {
			            if(in!=null){in.close();} //파일이 존재시만 스트림 삭제
			            //if(dest.exists()) //복사된 원본명 파일 존재시
			            //    dest.delete(); //삭제
			        }
			        return entity;
			    }
				    
		    //제휴회사 리스트 가져오기
			public Map<String, List<C_member>> getList() {
				Map<String,List<C_member>> gMap = new HashMap<String,List<C_member>>();
				List<C_member> brandList = new ArrayList<C_member>();
				brandList = aDao.getList();
				
				gMap.put("brandList", brandList);

				return gMap;
				
			}
			
			//상태별 배너 리스트
			public Map<String, Object> aBannerState(String select) {
				
				System.out.println("상태 : " + select);
				
				Map<String, Object> bannerMap = new HashMap<String, Object>();
				Banner_Board bannerBoard = new Banner_Board();
				List<Banner_Board> bannerlist=null;
				
				if(select.equals("ing")){//진행중
					System.out.println("진행중");
					bannerlist=aDao.getBannerIng();		//진행중 리스트로 뽑아오기
				}else if(select.equals("future")){//진행예정
					System.out.println("진행예정");
					bannerlist=aDao.getBannerFuture();		//진행예정 리스트로 뽑아오기	
				}else if(select.equals("end")){//종료
					System.out.println("종료");
					bannerlist=aDao.getBannerEnd();		//종료 리스트로 뽑아오기			
				}else{//등록 대기중
					System.out.println("등록 대기중");
					bannerlist=aDao.getBoardList(bannerBoard);		//게시글 리스트로 뽑아오기
				}
				bannerMap.put("select", select);
				bannerMap.put("bannerList",bannerlist);
				return bannerMap;
			}

			//배너 삭제하기
			@Transactional
			public ModelAndView bannerDel(int[] banum, int[] bnum) {
				System.out.println("배너 삭제 서비스");
				System.out.println("banum크기 : "+banum.length);
				String msg="배너 삭제하기에 실패하였습니다.";
				String view="aBannerF";
				ModelAndView mav = new ModelAndView();
				int a=0;
				int ba_num = 0;
				int b_num = 0;
				
				for(int i=0;i<banum.length;i++){
					ba_num = banum[i];
					b_num = bnum[i];
					a =aDao.bannerDel(ba_num);//배너 테이블 삭제
					if(aDao.bannerChk(b_num) == 0){ //해당 b_num에 딸려있는 배너 개수 가져오기
						a =aDao.bannerBdel(b_num); //공통 테이블 삭제	
					}
					System.out.println("업데이트 성공여부 : "+a);
				}
				if(a==1){
					msg="배너 삭제에 성공하였습니다.";
					view="aComAskF";
				}
				
				mav.addObject("msg",msg);
				mav.setViewName(view);
				return mav;
			}
	
}
