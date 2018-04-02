package com.board.finalP;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.C_member;
import com.board.bean.N_member;
import com.board.bean.QnaB;
import com.board.service.MemberMM;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMM mm;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav ;
		
	//로그인
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView getDnum(@ModelAttribute("mb") N_member nmember){
		System.out.println("id="+nmember.getId()+"//"+"pwd="+nmember.getPw());
		mav = new ModelAndView();
		mav = mm.mLogin(nmember);
/*		
		mav = new ModelAndView();
		mav = mm.mLogin();*/
		return mav;
	}
	//로그아웃
	@RequestMapping(value = "/mLogout", method = RequestMethod.GET)
	public ModelAndView mLogout() {
		mav = new ModelAndView();
		session.invalidate();
		//session.removeAttribute("mb"); 해당 속성 이름의 세션만 삭제
		//session.invalidate(); 모든 session을 날려버리는 거
		mav.setViewName("redirect:/"); //url 상에 logOut 안찍히게 하기 위함.
		//forward:url(ex)/) //POST-POST 방식이거나 GET-GET끼리만 가능함. 같은 방식일때만 사용. 값을 가지고 다닐때 forward 사용
		//redirect는 //GET-GET, POST-GET, 방식만 가능 현재 url이 무슨 방식이든 상관없이 가는 대상이 get방식일때만 가능함. 이게 주로 사용됨.
		return mav;		
	}

	//신고하기팝업 띄우기
	@RequestMapping(value = "/mReportF", method = RequestMethod.GET)
	public ModelAndView mReportF(@RequestParam("nickName") String nickName){

		System.out.println("nickName="+nickName);
		mav = new ModelAndView();

		mav.addObject("nickName",nickName);
		mav.setViewName("mReportF");

		return mav;
	}

	//신고하기
	@RequestMapping(value = "/mReport", method = RequestMethod.GET)
	public @ResponseBody Map<String,Integer> mReport(QnaB qnab){

		Map<String,Integer> map = new HashMap<String,Integer>();

		map = mm.mReport(qnab);

		return map;
	}

	//메인 페이지 출력
	@RequestMapping(value = "/iMainPrint", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> iMainPrint(){

		Map<String,Object> map = new HashMap<String,Object>();

		map = mm.iMainPrint();

		return map;
	}


	//마이페이지 수정
	@RequestMapping(value = "/mUpdate", method = RequestMethod.POST)
	public ModelAndView mUpdate(MultipartHttpServletRequest multi){
		mav = new ModelAndView();

		System.out.println("멀티 : "+multi);
		System.out.println("파일첵 : "+multi.getParameter("fileChk"));
		System.out.println("멀티 : "+multi.getParameter("pw"));
		System.out.println("내용 : "+multi.getParameter("gender"));
		System.out.println("자기소개 : "+multi.getParameter("intro"));
		System.out.println("생일 : "+multi.getParameter("birth"));
		System.out.println("닉네임 : "+multi.getParameter("nickName"));

		mav = mm.mUpdate(multi);
		return mav;
	}

	//회원 탈퇴 
	@RequestMapping(value = "/memberLeave", method = RequestMethod.GET)
	public ModelAndView memberLeave(){
		mav = new ModelAndView();

		System.out.println("회원탈퇴 컨트롤러");
		mav = mm.memberLeave();
		return mav;
	}


	//탈퇴 해지
	@RequestMapping(value = "/memberWelcome", method = RequestMethod.GET)
	public ModelAndView memberWelcome(){
		mav = new ModelAndView();

		System.out.println("탈퇴해지 컨트롤러");
		mav = mm.memberWelcome();
		return mav;
	}

	//알림 개수 가져오기
	@RequestMapping(value = "/alertCount", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> alertCount(@RequestParam("id") String id){
		System.out.println("알림 카운트");

		Map<String,Object> map = mm.alertCount(id);

		return map;
	}

	// 탈퇴/ 해지 체크
	@RequestMapping(value = "/mMyPageban", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> mMyPageban(Locale locale, Model model) {


		Map<String,Object> map = mm.myPagebanChk();

		return map;
	}

	//알림 리스트 가져오기
	@RequestMapping(value = "/alertList", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> alertList(@RequestParam("id") String id){

		System.out.println("알림 리스트");

		Map<String,Object> map = mm.alertList(id);

		return map;
	}
			
	
	

/*=============================뱅비============================*/

	//회원 종류 선택 페이지 // 페이지이동
	@RequestMapping(value = "/mJoinTypeF", method = RequestMethod.GET)
	public String mJoinTypeF() {
		session.invalidate();		
		return "mJoinTypeF";
	}
		
	// 회원 종류 선택 후 약관동의 페이지로 이동 // 페이지이동
	@RequestMapping(value = "/typeSelect", method = RequestMethod.POST)
	public String typeSelect(@RequestParam("state") int state) {
		System.out.println(state);
		
		session.setAttribute("state", state);
				
		return "mAgreeF";
	}
	
	// 약관동의 후에 회원가입폼으로 이동 // 페이지이동
	@RequestMapping(value = "/joinF", method = RequestMethod.GET)
	public ModelAndView joinF() {
		mav = new ModelAndView();
		
		session.setAttribute("mAgree", 1);
		System.out.println(session.getAttribute("state"));
		int state = (int) session.getAttribute("state");
		
		if(state == 0){
			mav.setViewName("mJoinF");
		} else{
			mav.setViewName("mComJoinF");
		}
		
		return mav;
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/overlay", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, Integer> overlay(String id) {
		
		System.out.println("중복확인 요청");
		
		Map<String, Integer> overMap = mm.overlay(id);
		
		return overMap;
	}
	
	//닉네임 중복체크
	@RequestMapping(value = "/nickOverlay", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, Integer> nickOverlay(String nickName) {
		
		System.out.println("닉네임 중복확인 요청");
		
		Map<String, Integer> nickOverMap = mm.nickOverlay(nickName);
		
		return nickOverMap;
	}
	
	
	//일반회원 가입
	@RequestMapping(value = "/mJoinF", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, Integer> mJoinF(N_member n_member) {
		
		System.out.println("일반 회원가입 요청 컨트롤러");
		
		return mm.mJoinF(n_member);
	}
	
	
	
	//기업회원 브랜드명 중복확인
	@RequestMapping(value = "/comNickOver", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, Integer> comNickOver(String nickname) {
		
		System.out.println("브랜드명 중복확인 컨트롤러");
		
		Map<String, Integer> comNickOverMap = mm.comNickOver(nickname);
		
		return comNickOverMap;
	}
	
	
	//기업회원 가입
	@RequestMapping(value="/mComJoinF", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, Integer> mComJoinF(C_member c_member) throws Exception {
		
		System.out.println("기업회원 가입 컨트롤러");
		
		return mm.mComJoinF(c_member);
		
	}
	
	
	//인증메일 발송
	@RequestMapping(value="/mailSend", produces = "application/json; charset=UTF8")
	public @ResponseBody Map<String, String> mailSend(C_member c_member) throws Exception  {

		System.out.println("메일 아작스");
		
		Map<String, String> map = new HashMap<String, String>(); 
				
		map.put("inzungNum", mm.mailSend(c_member));
		
		return map;
		
	}
	
	//인증메일 확인
	@RequestMapping(value="/confirm", method = RequestMethod.POST)
	public void confirm(C_member c_member,  HttpServletResponse response) throws Exception  {

		mm.confirm(c_member, response);
		
	}
	
	
	
	
	
	
	
	
	//아이디 찾기
	@RequestMapping(value = "/mFindId", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mFindId(N_member nMember) throws Exception{
		
		Map<String, Object> map = mm.mFindId(nMember);
		
		return map;
	}
	
	
	//비밀번호 찾기
	@RequestMapping(value = "/mFindPw", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mFindPw(N_member n_member) throws Exception{
		
		System.out.println(n_member.getEmailAll()+"//"+n_member.getId()+"//"+n_member.getPw_q()+"//"+n_member.getName());
		Map<String, Object> map = mm.mFindPw(n_member);
		
		return map;
	}
































}//Ctr END
