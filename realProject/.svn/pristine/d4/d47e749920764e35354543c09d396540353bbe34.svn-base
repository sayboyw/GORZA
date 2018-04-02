package com.board.service;

import java.io.PrintWriter;
import java.sql.Date;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.board.bean.Alert;
import com.board.bean.B_board;
import com.board.bean.BanMember;
import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.Follow;
import com.board.bean.N_Board;
import com.board.bean.N_member;

import com.board.bean.QnaB;
import com.board.dao.IboardDao;


import com.board.dao.ImemberDao;
import com.board.userClass.ProfileUpload;

//회원관리 서비스 클래스

@Component
@Service
public class MemberMM {
	
	@Autowired
	private ImemberDao mDao;
	private IboardDao bDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav;

	//로그인 서비스
	public ModelAndView mLogin(N_member nmember){
		mav = new ModelAndView();
		String view = null;
		String msg = null;
		Date date = new Date(System.currentTimeMillis());
		System.out.println("현재 날짜 : " +date);
		//암호화 대비용(아직..)
		
		if( mDao.getSecurittyPwd(nmember) == 1){//로그인성공(암호화 매치 시켜주는거 빠짐 일단 간략하게)
			nmember = mDao.mLogin(nmember);
			
			//정지관련 정보 있는지 체크
			int banChk = mDao.getBanChk(nmember.getId());
			
			if(banChk != 0){//정지관련에 정보가 있으면
				
				BanMember bMember = mDao.getBanInfo(nmember.getId());
				
				System.out.println("아이디 : "+bMember.getId());
				System.out.println("시작일 : "+bMember.getBan_start());
				System.out.println("종료일 : "+bMember.getBan_stop());
				System.out.println("탈퇴신청여부 : "+bMember.getBan_leave());
				
				if(banChk !=3){//정지횟수가 3이(영구정지가 아닐때)
					if(bMember.getBan_leave() == 0){//탈퇴신청안했을때
						if(bMember.getBan_stop()!=null){//정지 종료일이 값이 있냐 없냐
							
							//date(현재날짜)가 종료 날짜보다 작으면 -1 같으면 0 크면 1 출력
							int dateChk = date.compareTo(bMember.getBan_stop());
							System.out.println("dateChk : "+dateChk);
							
							if(dateChk >0 || dateChk==0){ //1이거나 0이면 로그인
								view = "iMain";
								if(nmember.getState()==1){//세션 상태가 기업이면 기업 정보 가져오기
									session.setAttribute("cm", mDao.cMemberInfo(nmember.getId()));
									session.setAttribute("mb", nmember);
								}else{
									session.setAttribute("mb", mDao.allInfo(nmember.getNickName()));//일반회원 고유 정보
								}
							}else{
								view = "mLoginF";
								msg = "정지 상태인 아이디 입니다. 종료일은 "+bMember.getBan_stop()+" 입니다.";
								mav.addObject("msg", msg);
							}
						}else{//종료일에 값이 없는경우 로그인
							view = "iMain";
							if(nmember.getState()==1){//세션 상태가 기업이면 기업 정보 가져오기
								session.setAttribute("cm", mDao.cMemberInfo(nmember.getId()));
								session.setAttribute("mb", nmember);
							}else{
								session.setAttribute("mb", mDao.allInfo(nmember.getNickName()));//일반회원 고유 정보
							}
						}
					}else{//탈퇴신청 상태
						
						//date(현재날짜)가 종료 날짜보다 작으면 -1 같으면 0 크면 1 출력
						int dateChk = date.compareTo(bMember.getBan_stop());
						System.out.println("dateChk : "+dateChk);
						
						if(dateChk < 0 || dateChk ==0){ //-1 이거나 0 이면 로그인 
							view = "iMain";
							if(nmember.getState()==1){//세션 상태가 기업이면 기업 정보 가져오기
								session.setAttribute("cm", mDao.cMemberInfo(nmember.getId()));
								session.setAttribute("mb", nmember);
							}else{
								session.setAttribute("mb", mDao.allInfo(nmember.getNickName()));//일반회원 고유 정보
							}
							msg = "탈퇴 종료일이 : " +bMember.getBan_stop() + "입니다 확인 바랍니다.";
							mav.addObject("msg", msg);
						}else{//1일 경우 탈퇴
							view = "mLoginF";
							msg = "탈퇴된 아이디 입니다.";
							mav.addObject("msg", msg);
						}
					}
				}else{//정지횟수 3일때(영구정지일때)
					view = "mLoginF";
					msg = "영구정지된 아이디 입니다.";
					mav.addObject("msg", msg);
				}
			}else{//정지관련에 정보가 없으면 바로 로그인
				view = "iMain";
				if(nmember.getState()==1){//세션 상태가 기업이면 기업 정보 가져오기
					session.setAttribute("cm", mDao.cMemberInfo(nmember.getId()));
					session.setAttribute("mb", nmember);
				}else{
					session.setAttribute("mb", mDao.allInfo(nmember.getNickName()));//일반회원 고유 정보
				}
			}
		}else{//로그인실패
			view = "mLoginF";
			msg = "아이디와 비밀번호를 확인해 주세요";
			mav.addObject("msg", msg);
		}

		mav.setViewName(view);
		
		return mav;
		
	}

	//팔로우 띄워주기
	public HashMap followCount(String nickName) {
		HashMap map = new HashMap();
		String id = mDao.getid(nickName);
		session.setAttribute("onlyId", id);
		System.out.println("뽑은아이디 : "+id);
		int followerC = mDao.getfollowerC(id);
		System.out.println("팔로워 수 :"+followerC);
		int followingC = mDao.getfollowingC(id);
		System.out.println("팔로잉 수 :"+followingC);
		map.put("followerC", followerC);
		map.put("followingC", followingC);
		map.put("id", id);
		return map;
	}

	//팔로우 리스트보기(팔로워/팔로잉)
		@Transactional
		public ModelAndView followList(String id, int num) {
			ModelAndView mav = new ModelAndView();
			List<Follow> flist = null;
			HashMap<String, Object> map = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			if(num==0){//팔로워 리스트(o_id 가 나인거)
				
				flist = mDao.getfollowlist(id);
				
				for(int i=0;i<flist.size();i++){//(맞팔 확인)
					map = new HashMap<String, Object>();
					
					Follow follow = new Follow();
					follow.setId(id);//내 아이디
					follow.setO_id(flist.get(i).getId());//상대 아이디

					map.put("sysName", flist.get(i).getSysName());//프로필 사진 가져오기
					map.put("id", id);//주인
					map.put("nickName", flist.get(i).getNickName());// 나를 팔로우 한사람의 닉네임
					map.put("folfolChk",mDao.getFollowFollowMe(follow));//맞팔 상태 체크(1 or 0 반환);
					
					onlyList.add(map);//리스트를 리스트에 담기
				}
				mav.addObject("flist",onlyList);
			}else{//팔로잉 리스트
				flist = mDao.getfollowinglist(id);
				mav.addObject("flist",flist);
			}
			
			mav.addObject("num",num);
			mav.setViewName("followerContentsAjax");
			
			return mav;
		}

		//팔로우 취소
		@Transactional
		public HashMap followCancle(Follow follow) {
			HashMap map = new HashMap();
			List<Follow> flist = null;
			
			HashMap<String, Object> mapFolFol = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			
			String id = mDao.getid(follow.getNickName());//해당 닉네임의 아이디 가져오기
			String onlyid = follow.getId();
			System.out.println("삭제된사람의 아이디 : "+id);
			mDao.followCancle(id);
			
			map.put("num", follow.getNum());
			
			if(follow.getNum() == 1){	
				flist = mDao.getfollowinglist(onlyid);
				map.put("flist", flist);
			}else{
				
				flist = mDao.getfollowlist(onlyid);
				
				for(int i=0;i<flist.size();i++){//(맞팔 확인)
					mapFolFol = new HashMap<String, Object>();
					
					follow = new Follow();
					
					follow.setId(onlyid);//내 아이디
					follow.setO_id(flist.get(i).getId());//상대 아이디
					
					mapFolFol.put("sysName", flist.get(i).getSysName());
					mapFolFol.put("id", onlyid);//주인
					mapFolFol.put("nickName", flist.get(i).getNickName());// 나를 팔로우 한사람의 닉네임
					mapFolFol.put("folfolChk",mDao.getFollowFollowMe(follow));//맞팔 상태 체크(1 or 0 반환);
					
					onlyList.add(mapFolFol);//맵을 리스트에 담기
				}
				map.put("flist", onlyList);
			}
			
			return map;
			
		}
	
	//팔로우 했는지 체크하기
	public int followChk(String nickName) {
		N_member nMember = (N_member) session.getAttribute("mb");
		C_member cMember = new C_member();
		
		cMember.setId(nMember.getId());
		cMember.setNickName(nickName);
		
		int followChk = mDao.followChk(cMember);
		
		return followChk;
	}

	//팔로우 하기//취소하기
		@Transactional
		public HashMap follow(Follow follow) {
			
			HashMap map = new HashMap();
			String o_id = mDao.getid(follow.getNickName());
			follow.setO_id(o_id);
			String id = follow.getId();
			List<Follow> flist = null;
			HashMap<String, Object> mapFolFol = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			
			if(follow.getNum() == 0){//구분자 마이스타일에서 팔로우
				mDao.follow(follow);	//팔로우 하기
			}else if(follow.getNum()==3){// 팔로우 리스트에서 팔로우
				mDao.follow(follow);	//팔로우 하기
				
				flist = mDao.getfollowlist(follow.getId());
				
				for(int i=0;i<flist.size();i++){//(맞팔 확인)
					mapFolFol = new HashMap<String, Object>();
					
					follow = new Follow();
					
					follow.setId(id);//내 아이디
					follow.setO_id(flist.get(i).getId());//상대 아이디

					mapFolFol.put("sysName", flist.get(i).getSysName());
					mapFolFol.put("id", id);//주인
					mapFolFol.put("nickName", flist.get(i).getNickName());// 나를 팔로우 한사람의 닉네임
					mapFolFol.put("folfolChk",mDao.getFollowFollowMe(follow));//맞팔 상태 체크(1 or 0 반환);
					
					onlyList.add(mapFolFol);//맵을 리스트에 담기
				}
				map.put("flist", onlyList);
				
			}else{//삭제
				mDao.followingCancle(follow);//팔로잉 삭제
			}
			
			map.put("num", follow.getNum());
			
			return map;
		}
		
//신고하기
public HashMap<String,Integer> mReport(QnaB qnab) {
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	int b_num = mDao.reportBoardInsert(qnab);//게시글 공통에 글넣기
	System.out.println("가져왔나? : "+ qnab.getB_num());
	System.out.println(b_num);
	qnab.setRp_oid(qnab.getNickName());
	int success = mDao.mReport(qnab);
	System.out.println("success :"+success);
	map.put("success", success);
 
	return map;
}
	

//자기소개 가져오기
public N_member allInfo(String nickName) {
	
	N_member intro = mDao.allInfo(nickName);
	
	return intro;
}

//메인 페이지 출력
	public Map<String, Object> iMainPrint() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Banner_Board> bannerList = mDao.mainBannerList();//메인화면 배너리스트 출력
		List<B_board> mainBrandList = mDao.mainBrandList();//메인화면 브랜드 게시판 인기순 리스트 출력(3개)
		List<N_Board> mainNormalList = mDao.mainNormalList();//메인화면 일반 게시판 인기순 리스트 출력(3개)
		List<Banner_Board> mainBannerList = new ArrayList<Banner_Board>();
		
		Date date = new Date(System.currentTimeMillis());
		
		for(int i=0;i<bannerList.size();i++){			
			//date(현재날짜)가 시작 날짜보다 작으면 -1 같으면 0 크면 1 출력
			int startChk = date.compareTo(bannerList.get(i).getBa_start());
			if(startChk==1 || startChk == 0){
				int endChk = date.compareTo(bannerList.get(i).getBa_stop());
				if(endChk== -1 || endChk==0){
					mainBannerList.add(bannerList.get(i));
				}
			}		
		}
		
		System.out.println("총 배너 개수 : "+bannerList.size());
		System.out.println("담은 개수 : "+mainBannerList.size());
		
		map.put("mainBannerList", mainBannerList);
		map.put("mainBrandList", mainBrandList);
		map.put("mainNormalList", mainNormalList);
		
		return map;
	}

	//개인정보 수정
	public ModelAndView mUpdate(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		
		N_member nMember = new N_member();
		
		
		nMember.setBirth(multi.getParameter("birth"));
		nMember.setIntro(multi.getParameter("intro"));
		nMember.setGender(multi.getParameter("gender"));
		nMember.setPw(multi.getParameter("pw"));
		nMember.setNickName(multi.getParameter("nickName"));
		nMember.setId(multi.getParameter("id"));
		
		Map<String,String> fMap=null;
		int success = 0;
		
		if(Integer.parseInt(multi.getParameter("fileChk")) == 1){
			ProfileUpload upload = new ProfileUpload();
            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
            fMap.put("id", nMember.getId());
           if(mDao.proChk(nMember.getId()) == 0){//프로필이 존재하나 체크
        	   mDao.proInsert(fMap);//입력
           }else{
        	   mDao.proUpdate(fMap);//수정
           }
		}
		
		int result;
		result = mDao.mUpdate(nMember); //공통테이블에 수정
		if(result == 1){
			result = mDao.mUpdate2(nMember);//n_member에 수정
			if(result == 1){
				mav.addObject("msg","수정에 성공했습니다");
			}else{
				mav.addObject("msg","수정에 실패했습니다2.");
			}
		}else{
			mav.addObject("msg","수정에 실패했습니다1.");
			
		}
		
		session.setAttribute("mb", mDao.allInfo(nMember.getNickName()));//일반회원 고유 정보
		
		mav.setViewName("mMyPageF");
		return mav;
	}
	
	//알림 띄어주기(새로온거)
	public Map<String, Object> alertCount(String id) {
		
		 Map<String, Object> map = new HashMap<String, Object>();
		
		 int count = mDao.alertCount(id);
		 
		 map.put("alertCount", count);
		 
		 return map;
	}

	
	//회원탈퇴
	public ModelAndView memberLeave() {
		
		mav = new ModelAndView();
		
		N_member nmember = (N_member) session.getAttribute("mb");
		
		String id = nmember.getId();
		
		System.out.println("서비스, 받은 아이디 : "+id);
		String msg = "회원 탈퇴 요청 실패";
		if(mDao.memberLeave(id)==1){
			msg="회원탈퇴 처리 되었습니다(유효기간 : 한달)";
		}
		mav.addObject("msg",msg);
		mav.setViewName("mMyPageF");
		return mav;
	}

	//마이페이지로 이동
	public Map<String, Object> myPagebanChk() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		N_member nmember = (N_member)session.getAttribute("mb");
		String id = nmember.getId();
		int success = mDao.myPagebanChk(id);
		map.put("success", success);
		return map;
	}

	//탈퇴해지
	public ModelAndView memberWelcome() {
		mav = new ModelAndView();
		
		N_member nmember = (N_member) session.getAttribute("mb");
		
		String id = nmember.getId();
		
		System.out.println("서비스, 받은 아이디 : "+id);
		String msg = "탈퇴해지 요청실패";
		if(mDao.memberWelcome(id)==1){
			msg="탈퇴해지 처리 되었습니다";
		}
		mav.addObject("msg",msg);
		mav.setViewName("mMyPageF");
		return mav;
	}
	
	//알림 리스트 가져오기
		public Map<String, Object> alertList(String id) {
				Map<String, Object> map = new HashMap<String, Object>();
			 	Map<String, Object> allMap = null;
				
			 	List<Object> sortList = new ArrayList<Object>();//정렬용 
				
				ArrayList<Alert> alertList = mDao.alertBList(id);//알림 테이블 리스트 가져오기(게시글 관련)
				ArrayList<Follow> followList = mDao.alertFList(id);//팔로우 알림용 가져오기
				
				int alertListSize = alertList.size();
				int followListSize = followList.size();
				
				int i = 0;
				int j = 0;
				
				while(true){//한규남식 정렬
					
					if(i == alertListSize){//증가한 i 와 alertListSize가 값이 같냐.
						for(j=j;j<followListSize;j++){
							allMap = new HashMap<String, Object>();
							
							allMap.put("id", followList.get(j).getId());
							allMap.put("nickName", followList.get(j).getNickName());
							allMap.put("divideNum", 1);
							allMap.put("sysName", mDao.getPfofile(followList.get(j).getId()));//프로필 사진 가져오기
							
							sortList.add(allMap);
						}
						break;
					}else if(j == followListSize){//증가한 j 와 followListSize가 값이 같냐.
						for(i=i;i<alertListSize;i++){
							allMap = new HashMap<String, Object>();
							
							allMap.put("b_num", alertList.get(i).getB_num());
							allMap.put("id", alertList.get(i).getId());
							allMap.put("divide", alertList.get(i).getDivide());
							allMap.put("o_seq", alertList.get(i).getO_seq());
							allMap.put("nickName", alertList.get(i).getNickName());
							allMap.put("divideNum", 0);
							allMap.put("ap_path", mDao.getBphoto(alertList.get(i).getB_num())); //게시글 사진 가져오기
							
							sortList.add(allMap);
						}
						break;
					}else{//아직 정렬 비교가 끝나지않음
						allMap = new HashMap<String, Object>();
						int compar = alertList.get(i).getA_date().compareTo(followList.get(j).getF_date());					
						if(compar == 1 || compar==0){//알림 테이블 값이 팔로우 값보다 먼저다(작다)
							allMap.put("b_num", alertList.get(i).getB_num());
							allMap.put("id", alertList.get(i).getId());
							allMap.put("divide", alertList.get(i).getDivide());
							allMap.put("o_seq", alertList.get(i).getO_seq());
							allMap.put("nickName", alertList.get(i).getNickName());
							allMap.put("divideNum", 0);
							allMap.put("ap_path", mDao.getBphoto(alertList.get(i).getB_num())); //게시글 사진 가져오기
							i++;
						}else{//팔로우
							allMap.put("id", followList.get(j).getId());
							allMap.put("nickName", followList.get(j).getNickName());
							allMap.put("divideNum", 1);
							allMap.put("sysName", mDao.getPfofile(followList.get(j).getId()));//프로필 사진 가져오기
							
							j++;
						}
					}
					
					sortList.add(allMap);
					
				}
			 
				mDao.alertBUpdate(id); //읽음 표시로 변경(게시글 관련 알림)
				mDao.alertFUpdate(id); // 읽음 표시로 변경(팔로우 관련 알림)
				
				map.put("alertList", sortList);
				
			 return map;
		}
	
	/*	
	//회원가입 요청
	private void memberInsert(Member member) {
		mav = new ModelAndView();
		String view = null;
		//비번을 암호화(Encoding) 할 수 있지만 복호화(Decoding);
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		//비번을 암호화한 코드로 변환해서 저장
		member.setM_pwd(pwdEncoder.encode(member.getM_pwd()));
		System.out.println("암호화된 비번 : "+member.getM_pwd());
		try {
			if(mDao.memberInsert(member) !=0){
				view="home";//로그인 페이지 이동
				mav.addObject("check", 1);//회원가입 성공
			}
		} catch (Exception e) {
			view="joinForm";
		}
		mav.setViewName(view);
	}

	//로그인 서비스
	private void access(Member member) {
		mav = new ModelAndView();
		String view = null;
		//복호화가 불가능하다.
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwdEncode = mDao.getSecurittyPwd(member.getM_id());
		System.out.println("pw : "+pwdEncode);
		if(pwdEncode!=null){//성공 1리턴, 실패 0리턴
			if(pwdEncoder.matches(member.getM_pwd(), pwdEncode)){//암호화된거랑 입력값이랑 비교해주는거(matches);
				System.out.println("로그인 성공");
				//session.setAttribute("id", member.getM_id());
				member = mDao.getMemberInfo(member.getM_id()); // 로그인한 회원정보
				//mav.addObject("mb",member);
				session.setAttribute("mb", member);
				view="redirect:boardList";//url로 보내는 방법 redirect
			}else{
				System.out.println("로그인 실패");
				view="home";
				mav.addObject("check", 2);//로그인 실패
			}
		}else{
			System.out.println("로그인 실패");
			view="home";
			mav.addObject("check", 2);//로그인 실패
		}
		mav.setViewName(view);
	}
*/
		

		/*=============================뱅비============================*/


		//아이디 중복확인
		public Map<String, Integer> overlay(String id) {
			System.out.println("아이디 중복확인 서비스");
			
			int idChk = mDao.idChk(id);
			System.out.println(idChk);
			HashMap<String, Integer> idMap= new HashMap<String, Integer>();
			idMap.put("id", idChk);
			
			return idMap;
			
		}

		//닉네임 중복확인
		public Map<String, Integer> nickOverlay(String nickName) {
			System.out.println("닉네임 중복확인 서비스");
			
			int nickChk = mDao.nickChk(nickName);
			HashMap<String, Integer> nickMap = new HashMap<String, Integer>();
			nickMap.put("nickName", nickChk);
			
			return nickMap;
		}



		//일반 회원가입
		@Transactional
		public Map<String, Integer> mJoinF(N_member n_member) {

			System.out.println("일반 회원가입 서비스");
			
			HashMap<String, Integer> mJoinMap = new HashMap<String, Integer>();
			
			n_member.setPw(n_member.getPw1());
			n_member.setPw(n_member.getPw2());
			n_member.setEmailAll(n_member.getEmail1()+"@"+n_member.getEmail2());
			n_member.setBirthAll(n_member.getBirthYY()+"-"+n_member.getBirthMM()+"-"+n_member.getBirthDD());
			
			
			/*BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
			n_member.setPw(pwEncoder.encode(n_member.getPw()));*/
			
			System.out.println("암호화 된 비번:"+n_member.getPw());
			
			int mJoinFm = mDao.mJoinFm(n_member);//공통 테이블
			int mJoinFm2;
			int mJoinFp=0;
			
			
			if(mJoinFm == 1){
				mJoinFm2 = mDao.mJoinFm2(n_member);//고유 테이블
				if(mJoinFm2 == 1){
					System.out.println("2차 성공");
					mJoinFp =	mDao.mJoinProfile(n_member);//프로필 등록
				}
			}
			
			mJoinMap.put("success",mJoinFp );	//value자리에 0 or 1 이 들어감
			
			return mJoinMap;
			
			
		}
		
		//브랜드명 중복확인
		public Map<String, Integer> comNickOver(String nickname) {
			int comNickChk = mDao.comNickChk(nickname);
			HashMap<String, Integer> comNickChkMap= new HashMap<String, Integer>();
			comNickChkMap.put("nickname", comNickChk);
			
			return comNickChkMap;
		}
			
			
			
		//기업회원 가입
		@Transactional
		public Map<String, Integer> mComJoinF(C_member c_member) throws Exception {
			
			System.out.println("기업 회원가입 서비스");
			
			HashMap<String, Integer> mComJoinMap = new HashMap<String, Integer>();
			
			c_member.setPw(c_member.getPw1());
			c_member.setPw(c_member.getPw2());
			
			c_member.setEmailAll(c_member.getEmail1()+"@"+c_member.getEmail2());
			
			
			int comJoinI = mDao.comJoinI(c_member); //공통 테이블
			int comJoinI2;
			int mComJoinP=0;
			
			if(comJoinI == 1) {
				comJoinI2 = mDao.comJoinI2(c_member);//고유 정보 테이블
				if(comJoinI2 == 1) { 
					mComJoinP =	mDao.mComJoinP(c_member);//프로필 등록
				}
			}
			mComJoinMap.put("success", mComJoinP);
			
			return mComJoinMap;

		}

			
		//기업회원 인증 메일 발송
		public String mailSend(C_member c_member) throws Exception {
			
			c_member.setEmailAll(c_member.getEmail1()+"@"+c_member.getEmail2());
			
			char pwCollection[] = new char[] {
		            '1','2','3','4','5','6','7','8','9','0'
	            };
		            
	            String inzungNum = "";
	            
	            for (int i = 0; i < 6; i++) { 
	               int randomPw = (int)(Math.random()*(pwCollection.length));
	               inzungNum += pwCollection[randomPw]; 
	            }
		       
	            
	            
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "bengby@naver.com";
			String hostSMTPpwd = "@qkdnxm1206";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "bengby@naver.com";
			String fromName = "GORZA";
			String subject = "";
			String msg = "";

			// 회원가입 메일 내용
			subject = "GORZA 기업회원 가입 인증 메일입니다.";
			msg += "인증번호입니다.</div><br/>";
			msg += inzungNum;
			
			// 받는 사람 E-Mail 주소
			String mail = c_member.getEmailAll();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
				
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			
			return inzungNum;
			
		}

		
		//기업회원 메일인증
		public void confirm(C_member c_member, HttpServletResponse response) throws Exception {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			if (c_member.getSuccess() != 1) { // 이메일 인증에 실패하였을 경우
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("</script>");
				out.close();
			} else { // 이메일 인증을 성공하였을 경우
				out.println("<script>");
				out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
				out.println("</script>");
				out.close();
			}
		}	
		
			
		
		
		
		
		// 아이디 찾기
		public Map<String, Object> mFindId(N_member nMember) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
				
			List<String> idList = mDao.find_id(nMember);
			
			map.put("idList", idList);
			
			return map;
			
		}

		//비밀번호 찾기
		public Map<String, Object> mFindPw(N_member n_member) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			String msg = "";
			int chk = 0;
			// 아이디가 없으면
			if(mDao.idChk(n_member.getId()) == 0) {
				msg = "아이디를 확인해주세요.";
			}else if(mDao.emailChk(n_member.getEmailAll()) == 0) {
				msg ="이메일을 확인해주세요.";
			}else if(mDao.pwqChk(n_member.getPw_q())==0) {
				msg ="비밀번호 찾기 질문을 확인해주세요.";
			}else {
				// 임시 비밀번호 생성
				char pwCollection[] = new char[] {
					'1','2','3','4','5','6','7','8','9','0', 
					'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
					'!','@','#','$','%','&','*'
				};
				
				String pw = "";
				
				for (int i = 0; i < 10; i++) { 
					int randomPw = (int)(Math.random()*(pwCollection.length));
					pw += pwCollection[randomPw]; 
				}
				
				n_member.setPw(pw);
				
				// 비밀번호 변경
				mDao.update_pw(n_member);
				
				// 비밀번호 변경 메일 발송
				pw_mail(n_member, "mFindPw");
				
				msg="임시 비밀번호가 발송되었습니다. 확인 후 변경하여 사용하세요.";
				chk = 1;
			}
			
			map.put("chk", chk);
			map.put("msg",msg);
			return map;
		}
		
		//임시 비밀번호 메일 발송
		private void pw_mail(N_member n_member, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "bengby@naver.com";
			String hostSMTPpwd = "@qkdnxm1206";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "bengby@naver.com";
			String fromName = "GORZA";
			String subject = "";
			String msg = "";
					
			if(div.equals("mFindPw")) {
				subject = "GORZA 문의하신 임시 비밀번호 입니다.";
				msg += n_member.getId() + " 님의 임시 비밀번호 입니다. <br>";
				msg += "<p>임시 비밀번호 : ";
				msg += n_member.getPw() + "</p>";
			}
			
			// 받는 사람 E-Mail 주소
			String mail = n_member.getEmailAll();
			
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			}catch (Exception e) {
				
				System.out.println("메일발송 실패 : " + e);
			}
		}









}

