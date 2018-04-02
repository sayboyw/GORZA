package com.board.finalP;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;


import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardMM;
import com.board.service.MemberMM;

@Controller
public class PageMoveController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageMoveController.class);
	
	@Autowired
	private MemberMM mm;
	
	@Autowired
	private BoardMM bm;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav ;
	//메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String iMain() {
		return "iMain";		
	}
	
	//로그인박스실험
	@RequestMapping(value = "/loginBox", method = RequestMethod.GET)
	public String loginBox(Locale locale, Model model) {
		return "loginBox";
	}

	//일반회원 - 로그인 페이지로 이동
	@RequestMapping(value = "/mLoginF", method = RequestMethod.GET)
	public String mLoginF(Locale locale, Model model) {
		logger.info("로그인폼 Call");
		System.out.println("로그인폼 이동");
		return "mLoginF";
	}
	// 아이디/비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/mFindF", method = RequestMethod.GET)
	public String mFindF() {
		
		return "mFindF";		
	}
	// 일반회원 - 마이 페이지로 이동
	@RequestMapping(value = "/mMyPageF", method = RequestMethod.GET)
	public String mMypageF(Locale locale, Model model) {

		return "mMyPageF";
	}
	// 일반회원 - 알림으로 이동
	@RequestMapping(value = "/mAlertF", method = RequestMethod.GET)
	public String mAlertF(Locale locale, Model model) {
		
		return "mAlertF";
	}
	// 기업회원 - 제휴 신청으로 이동
	@RequestMapping(value = "/cAskF", method = RequestMethod.GET)
	public String cAskF(Locale locale, Model model) {
		
		return "cAskF";
	}
	// 기업회원 - 코디 신청으로 이동
	@RequestMapping(value = "/cSendF", method = RequestMethod.GET)
	public String cSendF(Locale locale, Model model) {
		
		return "cSendF";
	}
	// 기업회원 - 배너신청 이동
	@RequestMapping(value = "/cBannerSendF", method = RequestMethod.GET)
	public String cBannerSendF(Locale locale, Model model) {
		
		return "cBannerSendF";
	}
				
	// 관리자 - 신청 리스트 페이지로 이동
		@RequestMapping(value = "/aComAskF", method = RequestMethod.GET)
		public String aComAskF(Locale locale, Model model) {
			
			return "aComAskF";
		}		
	//관리자 - 제휴신청 리스트 페이지 이동
		@RequestMapping(value = "/aAllianceF", method = RequestMethod.GET)
		public String aAllianceF() {
			return "aAllianceF";		
		}	
	//관리자 - 배너신청 리스트 페이지 이동
		@RequestMapping(value = "/aBannerF", method = RequestMethod.GET)
		public String aBannerF() {
			return "aBannerF";		
		}	
	//관리자 - 코디신청 리스트 페이지 이동
		@RequestMapping(value = "/aComCodyF", method = RequestMethod.GET)
		public String aComCodyF() {
			return "aComCodyF";		
		}				

	// 관리자 - 회원 관리 페이지로 이동
		@RequestMapping(value = "/aMemberF", method = RequestMethod.GET)
		public String aMemberF(Locale locale, Model model) {
			
			return "aMemberF";
		}		
	// 관리자 - 기업 관리 페이지로 이동
		@RequestMapping(value = "/aComMemberF", method = RequestMethod.GET)
		public String aComMemberF(Locale locale, Model model) {
			
			return "aComMemberF";
		}		
	// 관리자 - 신고함 리스트 팝업으로 이동
		@RequestMapping(value = "/aReportF", method = RequestMethod.GET)
		public String aReportF(Locale locale, Model model) {
			
			return "aReportF";
		}

	//마이스타일 페이지 이동
		@RequestMapping(value = "/mystyle", method = RequestMethod.GET)
		public String mystyle(Locale locale, Model model) {
			return "myStyle";
		}
	
	//CODY(0) CODYSHARE(1) 페이지 이동 

		@RequestMapping(value = "/bListF", method = RequestMethod.GET)
		public String bListF(@RequestParam("ca_num") int ca_num) {
			String view = null;
			if(ca_num==0){
				view = "cody";//브랜드 게시판
			}else{
				view = "codyShare";//일반유저 게시판
			}
			return view;
		}
		
		// 신고하기 작성 폼
			@RequestMapping(value = "/bWriteF", method = RequestMethod.GET)
			public String bWriteF(Locale locale, Model model) {
				
				return "bWriteF";
			}	

		// 회사소개 폼
		@RequestMapping(value = "/iComIntroF", method = RequestMethod.GET)
		public String iComIntroF() {
			return "iComIntroF";
		}	
				
			// 정지 팝업으로 이동
			@RequestMapping(value = "/banPop", method = RequestMethod.GET)
			public String banPop() {
				
				return "banPop";
			}
		
		//정지 상세보기이동
		@RequestMapping(value = "/aMemberBanDetail", method = RequestMethod.GET)
		public String aMemberBanDetail() {
	
			return "aMemberBanDetail";
		}		
		// 관리자가 기업꺼 코디 등록해주는 페이지로 이동
		@RequestMapping(value = "/codyWriteF", method = RequestMethod.GET)
		public String codyWriteF() {
			
			return "codyWriteF";
		}	
		//기업 현황보기
		@RequestMapping(value = "/cCurrentF", method = RequestMethod.GET)
	    public ModelAndView cCurrentF(@RequestParam("id") String id) throws IOException{
			mav = new ModelAndView();
			mav.addObject("id",id);
			mav.setViewName("cCurrentF");
			
	        return mav;
	    }
		// 관리자가 기업꺼 코디 등록해주는 페이지로 이동
		@RequestMapping(value = "/cMyPageF", method = RequestMethod.GET)
		public String cMyPageF() {
			
			return "cMyPageF";
		}	
		
}
