package com.board.finalP;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.BanMember;
import com.board.bean.C_member;
import com.board.bean.CoordiSend;
import com.board.bean.N_member;
import com.board.bean.QnaB;
import com.board.service.AdminMM;



@Controller
public class AdminController {

	@Autowired
	private AdminMM am;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav ;
	
	// 관리자 ->일반 회원 전체 리스트 출력
	@RequestMapping(value = "/aMemberListF", produces="application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody Map<String,List> aMemberF(N_member nmember) {
		System.out.println("전체회원리스트출력");
		
		Map<String, List> rMap = am.aMemberListF(nmember);
		System.out.println("컨트롤러로 돌아온 rMap : "+ rMap);
		return rMap; 
		//map으로 넘겨도 jackson이 자동으로 JSON 타입으로 변환해서 넘겨줌.
		//jackson은 gson처럼 객체화필요없음 그냥 @ResponseBody와 같이 사용
	}
	
/*		
		mav = new ModelAndView();
		mav = mm.mLogin();*/
	
	//관리자 - > 회원 검색 aMemberSearch
	@RequestMapping(value = "/aMemberSearch", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,List> aMemberSearch(N_member nmember, @RequestParam(value="member_ban",required=false) String member_ban, @RequestParam(value="keyword",required=false) String keyword) {
		System.out.println("회원검색 컨트롤러");
		System.out.println("검색 종류 : "+member_ban);
		System.out.println("키워드 : "+keyword);
		
		Map<String, List>  sMap = am.aMemberSearch(nmember, member_ban,keyword);
		System.out.println("컨트롤러로 돌아온 sMap : "+ sMap);
		
		return sMap; 

	}
	
	//관리자 - > 회원 정지시키기
	@RequestMapping(value = "/aMemberBan", produces="application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> aMemberBan(BanMember banMember) {
		
		System.out.println("회원 정지시키기 컨트롤러");
		System.out.println("받아온 아이디 : "+banMember.getId());
		System.out.println("이유 : "+banMember.getBan_reason());
		
		Map<String, Object> result = am.aMemberBan(banMember);
	
		return result; 

	}
	//관리자 - > 회원 정지해제
	@RequestMapping(value = "/aMemberRemove", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aMemberRemove(BanMember banMember) {
		
		System.out.println("회원 정지 해제시키기 컨트롤러");
		System.out.println("받아온 아이디 : "+banMember.getId());

		Map<String, Object> result = am.aMemberRemove(banMember);
		
		return result; 

	}
	// 관리자 - 회원정지내역불러오기
	@RequestMapping(value = "/banDetail", method = RequestMethod.POST)
	public @ResponseBody Map<String, List> banDetail(BanMember banMember) {
		System.out.println("정지내역불러오기 컨트롤러");
		System.out.println("받아온 아이디 : "+banMember.getId());
		Map<String, List> map = am.banDetail(banMember);
		
		return map;
	}

	
	//관리자 -> 배너 리스트 가져오기
	@RequestMapping(value = "/aBannerList", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aBannerList() {
		System.out.println("배너 리스트 가져오기 컨트롤러");
		
		Map<String, Object> bannerList = am.aBannerList();

		return bannerList;

	}
	// 관리자 -> 배너 처리하기(핸들 값 0->1)
	@RequestMapping(value = "/bannerConduct", method = RequestMethod.GET)
	public ModelAndView bannerConduct(@RequestParam("choice") int[] banum) {
		System.out.println("배너 업데이트 컨트롤러");
		System.out.println("banum가져오기 : "+banum[0]);
		mav = new ModelAndView();
		mav=am.aBannerUpdate(banum);
		/*Map<String, Object> baUpdateMap = am.aBannerUpdate(bannerMap);*/

		return mav;// 리턴타입 바꿔야함

	}
	//관리자 -> 제휴신청 리스트 가져오기
	@RequestMapping(value = "/aAllianceList", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aAllianceList() {
		System.out.println("제휴신청 리스트 가져오기 컨트롤러");
		
		Map<String, Object> AllianceList = am.AllianceList();

		return AllianceList;

	}
	// 관리자 -> 제휴신청 처리하기(agree 값 1-> 2 or 0)
	@RequestMapping(value = "/comReqUpdate", method = RequestMethod.GET)
	public ModelAndView comReqUpdate(@RequestParam("id") String id,@RequestParam("divide") String divide ) {
		System.out.println("제휴신청 업데이트 컨트롤러");
		System.out.println("받아온 id : "+id);
		System.out.println("승인/거절 여부" +divide);
		mav = new ModelAndView();
		mav=am.comReqUpdate(id,divide);
		
		return mav;

	}
	
	// 관리자 - 신고함 리스트 가져오기
	@RequestMapping(value = "/aReportList", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<QnaB>> aReportList() {
		
		Map<String, List<QnaB>> map = new HashMap<String,List<QnaB>>();
		
		map = am.getReportList();
		
		return map;
	}	
			
	// 관리자 - 신고함 해당 사람의 내역보기
	@RequestMapping(value = "/aReportRecord", method = RequestMethod.GET)
	public ModelAndView aReportRecord(QnaB qnab) {
		System.out.println("신고함 해당 사람의 내역보기 : "+qnab.getRp_oid());
		
		ModelAndView mav = new ModelAndView();
		
		mav = am.aReportRecord(qnab);
		
		return mav;
	}	
	
	// 관리자 - 신고함 내역 상세보기
	@RequestMapping(value = "/aReportDetail", method = RequestMethod.GET)
	public ModelAndView aReportDetail(QnaB qnab) {
		System.out.println("신고함 내역 상세보기 : "+qnab.getRp_reason());
		ModelAndView mav = new ModelAndView();
		
		
		mav = am.aReportDetail(qnab);
		
		return mav;
	}
			
	// 관리자 - 신고함 삭제하기
	@RequestMapping(value = "/reportDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, List<QnaB>> reportDel() {
		
		Map<String, List<QnaB>> map = am.reportDel();
		
		return map;
	}
	
	// 관리자 ->일반 기업회원 전체 리스트 출력
	@RequestMapping(value = "/aCMemberListF", produces="application/json; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody Map<String,List> aCMemberListF(C_member cmember) {
		System.out.println("전체 기업회원 리스트 출력");
		
		Map<String, List> Map = am.aCMemberListF(cmember);
		System.out.println("컨트롤러로 돌아온 Map : "+ Map);
		return Map; 
		//map으로 넘겨도 jackson이 자동으로 JSON 타입으로 변환해서 넘겨줌.
		//jackson은 gson처럼 객체화필요없음 그냥 @ResponseBody와 같이 사용
	}
	
	//관리자 - > 기업회원 영구정지
	@RequestMapping(value = "/aCMemberBan", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aCMemberBan(BanMember banMember) {
		
		System.out.println("기업회원 정지시키기 컨트롤러");
		System.out.println("받아온 아이디 : "+banMember.getId());

		Map<String, Object> result = am.aCMemberBan(banMember);
		
		return result; 
	}
	//관리자 - > 기업회원 영구정지해지 기능 
	@RequestMapping(value = "/aCMemberCancel", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aCMemberCancel(BanMember banMember) {
		
		System.out.println("기업회원 정지해지 컨트롤러");
		System.out.println("받아온 아이디 : "+banMember.getId());

		Map<String, Object> result = am.aCMemberCancel(banMember);
		
		return result; 
	}
		
	//관리자 - > 기업회원 글 삭제
		@RequestMapping(value = "/recordDelete", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
		public @ResponseBody Map<String,Object> recordDelete(BanMember banMember) {
			
			System.out.println("기업회원 글 삭제 컨트롤러");
			System.out.println("받아온 아이디 : "+banMember.getId());

			Map<String, Object> result = am.recordDelete(banMember);
			
			return result; 
		}	
		
	//관리자 - > 기업회원 검색
	@RequestMapping(value = "/aCMemberSearch", produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> aCMemberSearch(C_member cmember, @RequestParam(value="member_ban",required=false) String member_ban, @RequestParam(value="keyword",required=false) String keyword) {
		
		System.out.println("기업회원 글 검색 컨트롤러");
		System.out.println("검색 종류 : "+member_ban);
		System.out.println("키워드 : "+keyword);

		Map<String, Object> result = am.aCMemberSearch(cmember, member_ban,keyword);
		
		return result; 
	}
	
	// 관리자 - 제휴회사 코디 신청 리스트
	@RequestMapping(value = "/aComCodyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<CoordiSend>> aComCodyList() {
		
		Map<String, List<CoordiSend>> map = am.aComCodyList();
		
		return map;
	}
	
	
	// 관리자 - 제휴회사 코디 신청 상세보기
	@RequestMapping(value = "/aComCodyDetail", method = RequestMethod.POST)
	public @ResponseBody ModelAndView aComCodyDetail(CoordiSend coordisend) {
		
		ModelAndView mav = am.aComCodyDetail(coordisend);
		
		return mav;
	}
	
	//코디 다운로드
    @RequestMapping(value = "/coordiDown", method = RequestMethod.GET)
    public ResponseEntity<byte[]> coordiDown(String oriName,String sysName) throws IOException{
        System.out.println("oriName="+oriName);
        System.out.println("sysName="+sysName);
        ResponseEntity<byte[]> entity=am.coordiDown(oriName,sysName);
        return entity;
    }
    
	// 관리자 - 제휴회사 리스트 가져오기
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<C_member>> getList() {
		
		Map<String, List<C_member>> map = am.getList();
		
		return map;
	}
	
 // 관리자 - 상태별 배너 리스트
    @RequestMapping(value = "/aBannerState", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> aBannerState(@RequestParam("select") String select) {
		
		Map<String, Object> map = am.aBannerState(select);
		
		return map;
	}
    
 // 관리자 -> 배너 삭제하기(핸들 값 0->1)
 	@RequestMapping(value = "/bannerDel", method = RequestMethod.GET)
 	public ModelAndView bannerDel(@RequestParam("choice") int[] banum, @RequestParam("choose") int[] bnum) {
 		System.out.println("배너 삭제 컨트롤러");
 		System.out.println("banum가져오기 : "+banum[0]);
 		System.out.println("bnum가져오기 : "+bnum[0]);
 		
 		mav=am.bannerDel(banum,bnum);
 		
 		/*Map<String, Object> baUpdateMap = am.aBannerUpdate(bannerMap);*/

 		return mav;// 리턴타입 바꿔야함

 	}
    

    
}
