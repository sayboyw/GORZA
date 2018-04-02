package com.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.Banner_Board;
import com.board.bean.C_member;
import com.board.bean.CoordiSend;
import com.board.bean.N_member;
import com.board.bean.Photo;
import com.board.bean.Req_msg;
import com.board.dao.CompanyDao;
import com.board.userClass.ProfileUpload;
@Component
public class CompanyMM {

	@Autowired
	private CompanyDao cDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav;

	Map<String,String> fMap=null;
	
	private Map<String, Object> rMap;
	//기업이 배너사진 보내주는 메소드 (글쓰기)
	@Transactional
	public ModelAndView cBannerSend(Banner_Board bannerBoard, MultipartFile[] files,Photo photo) {
		System.out.println("배너 등록 서비스");
		//System.out.println("check="+board.getFileChk())
		System.out.println("받아온 구분자 : "+photo.getAp_divide());
		int divide = photo.getAp_divide();

		String root=request.getSession().getServletContext().getRealPath("/");
		String path = null;
		if(divide == 0){	//일반
			path="resources/upload/normal/";
		}else if (divide==1){	//기업
			path="resources/upload/brand/";
		}else if (divide ==2){	//신고.문의
			path="resources/upload/qna/";
		}else if (divide==3){	//배너
			path="resources/upload/banner/";
		}else{
			path=null;
		}
		String uploadPath=root+path;

		//2.폴더 생성을 꼭 할것...

		File dir=new File(uploadPath);

		if(!dir.isDirectory()){  //upload폴더 없다면

			dir.mkdir();  //upload폴더 생성

		}
		
		N_member mb = (N_member) session.getAttribute("mb");
		String id = mb.getId();
		System.out.println("id : "+id );

		bannerBoard.setId(id);

		int step1 = cDao.bannerSend1(bannerBoard); //글 등록후 글 번호를 빈에 받아오자...
		int step2;
		int step3 = 0;
		int banum;
		String msg = "배너 신청 실패";			 //추후 수정
		System.out.println("1단계 결과 값 : "+step1);
		
		if(step1==1){
			int bnum = bannerBoard.getB_num();
			for(MultipartFile file:files) {
				bannerBoard.setB_num(bnum);
				step2 = cDao.bannerSend2(bannerBoard);

				System.out.println("2단계 결과 값 : "+step2);
				if(step2==1){
					banum=bannerBoard.getBa_num();
					System.out.println("3단계시작");

					String oriFileName = file.getOriginalFilename();
	
					// 저장할 파일이름
	
					String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
					path = path+sysFileName;
					File dest = new File(uploadPath, sysFileName);
	
					try {
						FileCopyUtils.copy(file.getBytes(), dest);
						photo=new Photo();
						
						photo.setOriName(oriFileName);
						photo.setSysName(sysFileName);
						photo.setAp_path(path);
						photo.setAp_divide(divide);
						photo.setAp_pkNum(banum);
						
						step3 = cDao.bannerSend3(photo);//db에 등록
						//path 초기화시켜주기
						if(divide == 0){	//일반
							path="resources/upload/normal/";
						}else if (divide==1){	//기업
							path="resources/upload/brand/";
						}else if (divide ==2){	//신고.문의
							path="resources/upload/qna/";
						}else if (divide==3){	//배너
							path="resources/upload/banner/";
						}else{
							path=null;
						}
						System.out.println("3단계 결과 값 : "+step3);
					} catch (IOException e) {
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();	//인터넷에서 본 강제적 트랜잭션
						e.printStackTrace();
					} //실질적 업로드
				}
				if(step3==1){
					msg="배너 신청에 성공하였습니다.";	//추후 수정
				}
			}
			
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);				//추후 수정
		mav.setViewName("iMain");

		return mav;

	}
	//제휴신청
	public ModelAndView cRequestForm(Req_msg req, String email1, String email2, String email3) {
		N_member nMember = (N_member) session.getAttribute("mb");
		String id = nMember.getId();
		System.out.println("서비스시작");
		req.setId(id);
		System.out.println("id : "+req.getId());
		System.out.println("기업명 : "+req.getBrand());
		System.out.println("텔 : " +req.getC_tel());
		
		String location = req.getPostcode()+" "+req.getRoadAddress()+" "+req.getDetailAddress();
		System.out.println("실제 주소 : "+location);
		mav = new ModelAndView();
		String email ;
		if(email2==null) {
			email = email1+"@"+email3;
		}else {
			email = email1+"@"+email2;
		}
		req.setC_location(location); 
		req.setC_email(email);

		System.out.println("가짜 장소 "+req.getC_location());	// null
		System.out.println("이메일 : "+email);
		System.out.println("대표 : "+req.getDelegator());			// null
		System.out.println("내용 : "+ req.getC_content());
		//db에 insert
		
		String msg="제휴신청에 실패하였습니다.";
		
		if(cDao.cRequest(req)==1) {			//성공
			System.out.println("입력 성공");
			if(cDao.cUpdate(id)==1) {
				System.out.println("업데이트 성공");
				msg="제휴신청에 성공하였습니다.";
			}
			
		}
		mav.addObject("msg", msg);
		mav.setViewName("iMain");
		return mav;
	}
	
	//기업 코디 보내기
		public ModelAndView cSend(CoordiSend cSend, MultipartFile[] c_file) {
			
			ModelAndView mav = new ModelAndView();
			String root=request.getSession().getServletContext().getRealPath("/");
			String path = "resources/codi/";
			String uploadPath=root+path;
			String[] sitAll = cSend.getCd_sitAll();
			String sitplus = "";
			for(int i = 0;i<sitAll.length;i++){
				sitplus += "/"+sitAll[i];
			}
			cSend.setCd_sit(sitplus);
			//2.폴더 생성을 꼭 할것...

			File dir=new File(uploadPath);
			
			if(!dir.isDirectory()){  //codi폴더 없다면
				dir.mkdir();  //codi폴더 생성
			}
			
			try{
			int b = cDao.cSend(cSend);//코디 보내기 글 등록후 글 번호를 빈에 받아오자...
			Photo photo=null;
	        List<Photo> aList=new ArrayList<Photo>();
	        
	        for(MultipartFile file:c_file) {
	            String oriName = file.getOriginalFilename();
	            // 저장할 파일이름
	            String sysName = System.currentTimeMillis() + "-" + oriName;
	            File dest = new File(uploadPath, sysName);
	            FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
	            photo=new Photo();
	            photo.setOriName(oriName);
	            photo.setSysName(sysName);
	            photo.setAp_pkNum(cSend.getCd_num());
	            photo.setAp_path(path+sysName);
	            photo.setAp_divide(2);
	            cDao.codyFileInsert(photo);//db에 등록
	        }
			}catch(Exception e){
				mav.setViewName("iMain");
				System.out.println("실패 이쎕션");
			}
	        
	        	mav.setViewName("iMain");
	        
	        	return mav;

		}

		public ModelAndView cUpdate(MultipartHttpServletRequest multi) {
			
			mav = new ModelAndView();
			
			C_member cMember = new C_member();
			
			cMember.setC_name(multi.getParameter("c_name"));
			cMember.setIntro(multi.getParameter("intro"));
			cMember.setPw(multi.getParameter("pw"));
			cMember.setNickName(multi.getParameter("nickName"));
			cMember.setId(multi.getParameter("id"));
			
			Map<String,String> fMap=null;
			int success = 0;
			
			if(Integer.parseInt(multi.getParameter("fileChk")) == 1){
				ProfileUpload upload = new ProfileUpload();
	            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
	            fMap.put("id", cMember.getId());
	           if(cDao.cProChk(cMember.getId()) == 0){//프로필이 존재하나 체크
	        	   cDao.cProInsert(fMap);//입력
	           }else{
	        	   cDao.cProUpdate(fMap);//수정
	           }
			}
			
			int result;
			result = cDao.cUpdateNor(cMember); //공통테이블에 수정
			if(result == 1){
				result = cDao.cUpdateCm(cMember);//c_member에 수정
				if(result == 1){
					mav.addObject("msg","수정에 성공했습니다");
				}else{
					mav.addObject("msg","수정에 실패했습니다2.");
				}
			}else{
				mav.addObject("msg","수정에 실패했습니다1.");
				
			}
			
			session.setAttribute("mb", cDao.cNormalInfo(cMember.getId()));//기업회원 공통 정보
			session.setAttribute("cm", cDao.cUniquInfo(cMember.getId()));//기업회원 공통 정보
			
			mav.setViewName("cMyPageF");
			
			return mav;
		}

		//기업게시글 랭크뽑기
		public Map<String, Object> getRank(String id, String part) {
			rMap = new HashMap<String,Object>();			//리스트 담을 맵
			ArrayList<Object> bList = new ArrayList<Object>();		//글 담을 리스트
			
			if(part.equals("like")){		
				bList = cDao.getLikeRank(id);	//좋아요일때
			}else{
				bList = cDao.getReplyRank(id);		//댓글순으로 뽑기
			}
			
			rMap.put("blist",bList);	//맵에 리스트 담기
			return rMap;
		}
		
}
