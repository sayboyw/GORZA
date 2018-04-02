package com.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.B_board;
import com.board.bean.N_member;
import com.board.bean.Notice;
import com.board.bean.Photo;
import com.board.bean.QnaB;
import com.board.bean.Reply;
import com.board.dao.qnDao;
import com.board.userClass.Paging;

//회원관리 서비스 클래스

@Component
@Service
public class QnaNoticeMM {
	
	@Autowired
	private qnDao qnDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav;


	
	// 문의하기 리스트출력
	public ModelAndView aQuestionList() throws Exception {
		System.out.println("문의사항 리스트출력중...");
		N_member mb = (N_member) session.getAttribute("mb");
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		mav = new ModelAndView();
		String view = null;
		List<QnaB> qlist = null;
		System.out.println("문의사항 리스트출력완료");
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
		System.out.println("페이지넘:"+pageNum);   
		/*페이징 관련*/
		int maxNum = qnDao.getBoardCount();//total Count
		System.out.println(maxNum);
		Paging paging = new Paging(maxNum, pageNum, 10, 5, "aQuestionF");
		String boardPaging = paging.makeHtmlPaging();
		
		qlist=qnDao.questionBoardList(pageNum); //글 목록 뽑아오기 pageNum은 페이징 기본 토대
		
		mav.addObject("qlist",qlist);
		mav.addObject("boardPaging",boardPaging);
		view="aQuestionF";
		mav.setViewName(view);
		return mav;
	}
	
	// 문의하기 글쓰기출력
	@Transactional
	public ModelAndView bReqWrite(MultipartHttpServletRequest multi,QnaB qnab,MultipartFile[] files,Photo photo) throws Exception  {
		System.out.println("문의사항 게시판 글쓰기출력");
		String title = multi.getParameter("b_title");
		String content = multi.getParameter("b_content");
		N_member mb = (N_member) session.getAttribute("mb");
		String id = mb.getId();
		int state = mb.getState();
		
		System.out.println("글작성하는 유저아이디 : "+id);
		System.out.println("글작성하는 state : "+state);
		qnab.setId(id);
		qnab.setB_title(title);
		qnab.setB_content(content);
		System.out.println("제목 : "+title);
		
		int step1 = qnDao.qnabSend1(qnab);
		int step2;
		int step3 = 0;
		String msg="문의되지 않았습니다.";
		System.out.println("1단계 결과 값 : "+step1);
		
		if(step1==1){
			int b_num = qnab.getB_num();
			System.out.println("페이지 비넘 :"+b_num);
			step2 = qnDao.qnabSend2(qnab);
			System.out.println("2단계 결과 값 : "+step2);
			if(step2==1){
				System.out.println("3단계시작");
				if(Integer.parseInt(multi.getParameter("fileChk")) == 1){

				for(MultipartFile file:files) {
					String oriName = file.getOriginalFilename();
					
					int divide = 5;
					String root=request.getSession().getServletContext().getRealPath("/");
					String path = null;
					if(divide == 5){
						path="resources/question/";
					}else{
						path=null;
					}
					String sysName = System.currentTimeMillis() + "-" + oriName;
					// 저장할 파일이름
					String uploadPath=root+path;
					File dest = new File(uploadPath, sysName);
					File dir=new File(uploadPath);
					if(!dir.isDirectory()){
						dir.mkdir();
					}
					
					FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
					
					photo.setOriName(oriName);
					photo.setSysName(sysName);
					photo.setAp_path(path+sysName);
					photo.setAp_divide(divide);
					photo.setAp_pkNum(qnab.getB_num());

					
					step3 = qnDao.qnabSend3(photo);//db에 등록
					System.out.println("받아온 구분자 : "+photo.getAp_divide());
					System.out.println("3단계 결과 값 : "+step3);
					
				}
				}
				if(step3==1){
					msg="문의해주셔서 감사합니다.";
					mav.addObject("msg", msg);	
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		List<QnaB> qlist = null;
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
		qlist= qnDao.questionBoardList(pageNum);
		int maxNum = qnDao.getBoardCount();
		Paging paging = new Paging(maxNum, pageNum, 10, 5, "aQuestionF");
		String boardPaging = paging.makeHtmlPaging();
		mav.addObject("state",state);
		mav.addObject("qlist",qlist);
		mav.addObject("boardPaging",boardPaging);
		mav.setViewName("aQuestionF");
		return mav;
	}

	
	// 문의사항 상세보기
	public ModelAndView aQuestionDetail(B_board board,QnaB qnab) {
		System.out.println("문의사항 글번호,작성자닉네임 출력중...");
		mav = new ModelAndView();
		String view = null;
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int group_num = Integer.parseInt(request.getParameter("group_num"));
		int upper_num = Integer.parseInt(request.getParameter("upper_num"));
		String b_id = request.getParameter("b_id");
		String write_id = request.getParameter("write_id");
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
		N_member mb = (N_member) session.getAttribute("mb");
		System.out.println("페이징 번호 : "+pageNum);
		System.out.println("페이지 번호 : "+b_num);
		System.out.println("현재 로그인한 아이디 : "+mb.getId());
		System.out.println("글작성한 아이디 : "+b_id);
		System.out.println("글작성 답변 아이디 : "+write_id);
		System.out.println("문의사항 글번호,작성자닉네임 출력완료!");
		System.out.println("상세보기 유저정보 출력중...");
		String id = mb.getId();
	    System.out.println("로그인한 아이디 : "+id);
	    int state = mb.getState();
	    String write_id2 = qnab.getWrite_id();
	    System.out.println("사용자 state : "+state);
	    System.out.println("사용자 id : "+id);
	    System.out.println("작성자 id : "+write_id2);
	    request.setAttribute("id", id);
	    request.setAttribute("state", state);
	    request.setAttribute("write_id2", write_id2);
	    System.out.println("상세보기 유저정보 완료!");
	    System.out.println(b_id+"?=?"+id);
	    String msg ="";
	    System.out.println("상세보기 출력중...");
		    if(state == 2){
		    	System.out.println("관리자 진입");
		    	mav.addObject("qnabPhoto",qnDao.qnabPhoto(qnab.getB_num()));
		    	System.out.println("스테이트 : "+state);
	    		System.out.println("그룹넘 : "+group_num);
	    		System.out.println("어퍼넘 : "+upper_num);
		    	mav.addObject("state",state);
		    	mav.addObject("group_num",group_num);
		    	mav.addObject("upper_num",upper_num);
		    	mav.addObject("qDetail",qnDao.getContents2(b_num));
		    	System.out.println("상세보기 출력완료!");
		    	view="aQuestionDetailF";
		    }else{
		    	if(b_id.equals(id)){
		    		System.out.println("작성자인 일반인 진입");
		    		mav.addObject("qnabPhoto",qnDao.qnabPhoto(qnab.getB_num()));
		    		System.out.println("스테이트 : "+state);
		    		System.out.println("그룹넘 : "+group_num);
		    		System.out.println("어퍼넘 : "+upper_num);
		    		mav.addObject("state",state);
		    		mav.addObject("group_num",group_num);
		    		mav.addObject("upper_num",upper_num);
		    		mav.addObject("qDetail",qnDao.getContents2(b_num));
			    	System.out.println("상세보기 출력완료!");
		    		view="aQuestionDetailF";
		    	}else{
		    		if(write_id.equals(id)){
			    		System.out.println("답변자 유저 진입");
			    		System.out.println("문의한 아이디 : "+write_id);
			    		System.out.println("문의한 아이디 : "+write_id2);
			    		mav.addObject("qnabPhoto",qnDao.qnabPhoto(qnab.getB_num()));
			    		System.out.println("스테이트 : "+state);
			    		System.out.println("그룹넘 : "+group_num);
			    		System.out.println("어퍼넘 : "+upper_num);
			    		mav.addObject("state",state);
			    		mav.addObject("group_num",group_num);
			    		mav.addObject("upper_num",upper_num);
			    		mav.addObject("qDetail",qnDao.getContents2(b_num));
				    	System.out.println("상세보기 출력완료!");
			    		view="aQuestionDetailF";
		    	}else{
			    	msg="작성자만 접근가능합니다.";
			    	mav.addObject("msg", msg);
			    	System.out.println("작성자아닌 일반인 진입");
			    	ModelAndView mav = new ModelAndView();
					List<QnaB> qlist = null;
					qlist= qnDao.questionBoardList(pageNum);
					int maxNum = qnDao.getBoardCount();
					Paging paging = new Paging(maxNum, pageNum, 10, 5, "aQuestionF");
					String boardPaging = paging.makeHtmlPaging();
					mav.addObject("state",state);
					mav.addObject("qlist",qlist);
					mav.addObject("boardPaging",boardPaging);
					view="aQuestionF";
			    }
		    }
	    }
	    mav.setViewName(view);
		return mav;
	}
	
	// 문의사항 게시글 삭제
	public ModelAndView bReqDel(N_member member,QnaB qnab) {
		mav = new ModelAndView();
		String view = null;
		System.out.println("공지사항 삭제할 페이지번호 출력중...");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		System.out.println("삭제할 페이지번호 : "+b_num);
		System.out.println("공지사항 삭제할 페이지번호 출력중...");
		
		N_member mb = (N_member) session.getAttribute("mb");
		int state = mb.getState();
		System.out.println("유저 state : "+state);
		List<Photo> flist=qnDao.filebReqDelList(b_num);
		System.out.println("flist : "+flist);
		int f= 0;
		if(flist.size()!=0){//해당 게시글에 파일이 존재할 경우
			f=qnDao.filebReqDel(b_num);
			System.out.println("해당 페이지 파일존재 여부 : "+f);
		}
		String msg = "";
		if(state == 2){
			msg="삭제가 완료되었습니다.";
			request.setAttribute("msg", msg);
			qnDao.bReqDel(b_num);
			System.out.println("삭제 완료");
			List<QnaB> qlist = null;
			System.out.println("문의사항 리스트출력완료");
			int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
			System.out.println("페이지넘:"+pageNum);
			qlist= qnDao.questionBoardList(pageNum);
			System.out.println("사이즈:"+qlist.size());
			mav.addObject("qlist",qlist);
			view="aQuestionF";
		}
		if(state == 0){
			msg="삭제가 완료되었습니다.";
			request.setAttribute("msg", msg);
			qnDao.bReqDel(b_num);
			System.out.println("삭제 완료");
			ModelAndView mav = new ModelAndView();
			List<QnaB> qlist = null;
			int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
			qlist= qnDao.questionBoardList(pageNum);
			int maxNum = qnDao.getBoardCount();
			Paging paging = new Paging(maxNum, pageNum, 10, 5, "aQuestionF");
			String boardPaging = paging.makeHtmlPaging();
			mav.addObject("state",state);
			mav.addObject("qlist",qlist);
			mav.addObject("boardPaging",boardPaging);
			view="aQuestionF";
		}
		mav.setViewName(view);
		return mav;
	}
	
	// 문의사항 답글쓰기
	@Transactional
	public ModelAndView aSecretWrite(MultipartHttpServletRequest multi,QnaB qnab,MultipartFile[] files,Photo photo) throws IOException {
		System.out.println("문의사항 게시판 답글쓰기출력");
		String title = multi.getParameter("b_title");
		String content = multi.getParameter("b_content");
		String rp_reason = multi.getParameter("rp_reason");
		int b_num = Integer.parseInt(multi.getParameter("b_num"));
		String id = multi.getParameter("id");
		int group_num = Integer.parseInt(multi.getParameter("group_num"));
		int rp_divide = Integer.parseInt(multi.getParameter("rp_divide"));
		System.out.println("페이지 번호 : "+b_num);
		System.out.println("문의사항 글올린 유저의 아이디 : "+id);
		System.out.println("그룹번호 :"+group_num);
		System.out.println("문의사유 : "+rp_reason);
		System.out.println("구분자 :"+rp_divide);
		
		N_member mb = (N_member) session.getAttribute("mb");
		String id2 = mb.getId();
		int state = mb.getState();
		System.err.println("답글하는 페이지번호 : "+b_num);
		System.out.println("글작성하는 유저아이디 : "+id2);
		System.out.println("글작성하는 state : "+state);
		qnab.setId(id2);
		qnab.setRp_reason(rp_reason);
		qnab.setB_title(title);
		qnab.setB_content(content);
		System.out.println("제목 : "+title);
		System.out.println("내용 : "+content);
		System.out.println("문의 사유 : "+rp_reason);
		int step1 = qnDao.qnabReSend1(qnab);
		int step2 = 0;
		int step3 = 0;
		String msg="답글달기 실패!";
		System.out.println("1단계 결과 값 : "+step1);
		if(step1==1){
			System.out.println("2단계시작");
			qnab.setGroup_num(group_num);
			qnab.setRp_divide(rp_divide);
			step2 = qnDao.qnabReSend2(qnab);
			System.out.println("2단계 결과 값 : "+step2);
			if(step2==1){
				System.out.println("3단계시작");
				if(Integer.parseInt(multi.getParameter("fileChk"))==1){
					
			
				for(MultipartFile file:files) {
					String oriName = file.getOriginalFilename();
					int divide = 6;
					String root=request.getSession().getServletContext().getRealPath("/");
					String path = null;
					if(divide == 6){
						path="resources/questionReple/";
					}else{
						path=null;
					}
					String sysName = System.currentTimeMillis() + "-" + oriName;
					// 저장할 파일이름
					String uploadPath=root+path;
					File dest = new File(uploadPath, sysName);
					File dir=new File(uploadPath);
					if(!dir.isDirectory()){
						dir.mkdir();
					}
					
					FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
					
					photo.setOriName(oriName);
					photo.setSysName(sysName);
					photo.setAp_path(path+sysName);
					photo.setAp_divide(divide);
					photo.setAp_pkNum(qnab.getB_num());

					
					step3 = qnDao.qnabReSend3(photo);//db에 등록
					System.out.println("받아온 구분자 : "+photo.getAp_divide());
					System.out.println("3단계 결과 값 : "+step3);
				}
				}
				if(step3==1){
					msg="문의해주셔서 감사합니다.";
					mav.addObject("msg", msg);	
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		List<QnaB> qlist = null;
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
		qlist= qnDao.questionBoardList(pageNum);
		int maxNum = qnDao.getBoardCount();
		Paging paging = new Paging(maxNum, pageNum, 10, 5, "aQuestionF");
		String boardPaging = paging.makeHtmlPaging();
		mav.addObject("state",state);
		mav.addObject("qlist",qlist);
		mav.addObject("boardPaging",boardPaging);
		mav.setViewName("aQuestionF");
		return mav;
	}
	
	// 문의사항 수정하기폼
	public ModelAndView aQuestionUpdateF(B_board board, Photo photo) {
		System.out.println("공지사항 글번호 출력중...");
		N_member mb = (N_member) session.getAttribute("mb");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		System.out.println("페이지번호:"+b_num);
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		System.out.println("들어온 닉네임:"+mb.getNickName());

		String view = null;
		
		mav.addObject("questionPhoto",qnDao.qnabPhoto(board.getB_num()));
		mav.addObject("qDetail",qnDao.getContents2(b_num));

		view="aQuestionUpdateF";
		mav.setViewName(view);
		return mav;
	}
	
	// 문의사항 수정하기
	public ModelAndView aQuestionUpdate(MultipartHttpServletRequest multi, MultipartFile[] files, B_board board,QnaB qnab,Photo photo) throws IOException {
		N_member mb = (N_member) session.getAttribute("mb");
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		System.out.println("들어온 닉네임:"+mb.getNickName());
		System.out.println("문의사항 글번호 출력완료!");
		
		System.out.println("문의사항 상세보기 출력완료!");
		board.setB_title(multi.getParameter("b_title"));
		board.setB_content(multi.getParameter("b_content"));
		System.out.println("문의사항 수정할 페이지번호 완료!");
		System.out.println("제목 : "+multi.getParameter("b_title")+","+"내용 : "+multi.getParameter("b_content"));
		
		int step1 = qnDao.aQuestionUpdate(board);
		int step2 = 0;
		int step3 = 0;
		String msg="답글달기 실패!";
		System.out.println("1단계 결과 값 : "+step1);
		
			if(step1==1){
				if(Integer.parseInt(multi.getParameter("fileChk"))==1){
				System.out.println("2단계시작");
				step2 = qnDao.aQuestionUpdate2(qnab);
				System.out.println("2단계 결과 값 : "+step2);
				if(Integer.parseInt(multi.getParameter("fileChk"))==1){
				if(step2==1){
				for(MultipartFile file:files) {
					System.out.println("3단계시작");
					String oriName = file.getOriginalFilename();
					int divide = 5;
					String root=request.getSession().getServletContext().getRealPath("/");
					String path = null;
					if(divide == 5){
						path="resources/question/";
					}else{
						path=null;
					}
					String sysName = System.currentTimeMillis() + "-" + oriName;
					// 저장할 파일이름
					String uploadPath=root+path;
					File dest = new File(uploadPath, sysName);
					File dir=new File(uploadPath);
					if(!dir.isDirectory()){
						dir.mkdir();
					}
					
					FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
					
					photo.setOriName(oriName);
					photo.setSysName(sysName);
					photo.setAp_path(path+sysName);
					photo.setAp_divide(divide);
					photo.setAp_pkNum(board.getB_num());

					step3 = qnDao.questionfileUpdate(photo);//db에 등록
					System.out.println("받아온 구분자 : "+photo.getAp_divide());
					System.out.println("3단계 결과 값 : "+step3);
				}
			}
		//////////////////////////////////////////////////////////////////////////////////////////////
		}
		}
			}
	msg="수정이 완료되었습니다.";
	mav.addObject("msg", msg);	
	mav.setViewName("aQuestionUpdateF");
	
	return mav;
}

	
	
	
	//댓글 작성 기능
	public Map<String, Object> questionWrite(Reply reply) {
		Map<String, Object> rMap = null;
		
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
		
		reply.setB_num(pageNum);
		qnDao.qnaReInsert(reply); // 댓글삭제
        List<Reply> rlist=qnDao.qnabReply(reply);//댓글 리스트 가져오기
        
        rMap= new HashMap<String,Object>();
        rMap.put("rListCount",qnDao.qnabReplyCount(reply.getB_num()));
        rMap.put("rlist", rlist);	
        
		return rMap;
	}

	//댓글 삭제 기능
	public Map<String, Object> qnabReplyDel(Reply reply) {
		
		Map<String, Object> rMap = null;
		
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
		
		reply.setB_num(pageNum);
		qnDao.qnabReplyDel(reply);//댓글 삭제하기
        List<Reply> rlist=qnDao.qnabReply(reply);//댓글 리스트 가져오기
        
        rMap= new HashMap<String, Object>();
        rMap.put("rListCount",qnDao.qnabReplyCount(reply.getB_num()));
        rMap.put("rlist", rlist);	
        
		return rMap;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 공지사항 리스트폼,리스트 - 완전끝
	public ModelAndView aNoticeList(Notice notice) {
		System.out.println("공지사항 리스트출력중...");
		mav = new ModelAndView();
		String view = null;
		N_member mb = (N_member) session.getAttribute("mb");
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		List<Notice> nlist = null;
		System.out.println("공지사항 리스트출력완료!");
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;
		System.out.println("페이지넘:"+pageNum);   
		/*페이징 관련*/
		int maxNum = qnDao.noticeBoardCount();//total Count
		System.out.println(maxNum);
		Paging paging = new Paging(maxNum, pageNum, 10, 5, "aNoticeF");
		String boardPaging = paging.makeHtmlPaging();

		nlist= qnDao.noticeBoardList(pageNum);
		System.out.println("페이지넘:"+pageNum);
		System.out.println("사이즈:"+nlist.size());
		mav.addObject("nlist",nlist);
		mav.addObject("boardPaging",boardPaging);
		view="aNoticeF";
		mav.setViewName(view);
		return mav;
	}

	// 공지사항 상세보기폼,상세보기 - 완전끝
	public ModelAndView aNoticeDetail(Notice notice,Photo photo) {
		System.out.println("공지사항 글번호 출력중...");
		N_member mb = (N_member) session.getAttribute("mb");
		int no_num = Integer.parseInt(request.getParameter("no_num"));
		System.out.println("페이지번호:"+no_num);
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		System.out.println("들어온 닉네임:"+mb.getNickName());
		mav = new ModelAndView();
		String view = null;
		
		System.out.println("공지사항 글번호 출력완료!");
		System.out.println("공지사항 상세보기 출력중...");
		
		qnDao.hitUp(no_num); // 조회수올리기
		mav.addObject("noticePhoto",qnDao.noticePhoto(notice.getNo_num()));
		mav.addObject("nDetail",qnDao.getContents(no_num));
		
		System.out.println("공지사항 상세보기 출력완료!");
		
		view="aNoticeDetailF";
		mav.setViewName(view);
		return mav;
	}

	// 공지사항 삭제하기 -- 완전끝
	public ModelAndView aNoticeDel(Notice notice) {
		mav = new ModelAndView();
		System.out.println("공지사항 삭제할 페이지번호 출력중...");
		int no_num = Integer.parseInt(request.getParameter("no_num"));
		System.out.println("삭제할 페이지번호 : "+no_num);
		System.out.println("공지사항 삭제할 페이지번호 출력중...");
		N_member mb = (N_member) session.getAttribute("mb");
		int state = mb.getState();
		System.out.println("유저 state : "+state);
		List<Photo> flist=qnDao.getFileList(no_num);
		System.out.println("flist : "+flist);
		if(flist.size()==1){
			System.out.println("해당 페이지 파일존재 여부 : "+qnDao.fileDelete(no_num));
			qnDao.fileDelete(no_num);
		}
		qnDao.aNoticeDel(no_num);
		String msg="삭제가 완료되었습니다.";
		mav.addObject("msg", msg);
		

		request.setAttribute("state", state);
		mav.setViewName("aNoticeDetailF");
		return mav;
	}

	// 공지사항 글쓰기 -- 완전끝
	@Transactional
	public ModelAndView aNoticeWrite(MultipartHttpServletRequest multi,MultipartFile[] files,Notice notice,Photo photo) throws Exception  {
		System.out.println("문의사항 게시판 글쓰기출력");
		String title = multi.getParameter("no_title");
		String content = multi.getParameter("no_content");
		N_member mb = (N_member) session.getAttribute("mb");
		String id = mb.getId();
		int state = mb.getState();
		System.out.println("글작성하는 유저아이디 : "+id);
		System.out.println("글작성하는 state : "+state);
		
		notice.setNo_title(title);
		notice.setNo_content(content);
		int step1 = qnDao.noticeSend(notice);
		int step2 = 0;
		System.out.println("1단계 결과 값 : "+step1);
		if(step1==1){
			System.out.println("2단계시작");
			if(Integer.parseInt(multi.getParameter("fileChk"))==1){

			for(MultipartFile file:files) {
				String oriName = file.getOriginalFilename();
				int divide = 7;
				String root=request.getSession().getServletContext().getRealPath("/");
				String path = null;
				if(divide == 7){
					path="resources/notice/";
				}else{
					path=null;
				}
				String sysName = System.currentTimeMillis() + "-" + oriName;
				// 저장할 파일이름
				String uploadPath=root+path;
				File dest = new File(uploadPath, sysName);
				File dir=new File(uploadPath);
				if(!dir.isDirectory()){
					dir.mkdir();
				}
				
				FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
				
				photo.setOriName(oriName);
				photo.setSysName(sysName);
				photo.setAp_path(path+sysName);
				photo.setAp_divide(divide);
				photo.setAp_pkNum(notice.getNo_num());

				step2 = qnDao.noticeSend2(photo);//db에 등록
				System.out.println("받아온 구분자 : "+photo.getAp_divide());
				System.out.println("2단계 결과 값 : "+step2);
			}
			
		}
		}
		// 다시출력하기
		String msg="공지사항 등록성공!";
		mav.addObject("msg", msg);
		mav.setViewName("aNoticeWriteF");
		return mav;
	}
	
	// 공지사항 수정하기폼
	public ModelAndView aNoticeUpdateF(Notice notice,Photo photo) {
		System.out.println("공지사항 글번호 출력중...");
		N_member mb = (N_member) session.getAttribute("mb");
		int no_num = Integer.parseInt(request.getParameter("no_num"));
		System.out.println("페이지번호:"+no_num);
		int state = mb.getState();
		request.setAttribute("state", state);
		System.out.println("로그인사람 state : "+state);
		System.out.println("들어온 닉네임:"+mb.getNickName());

		String view = null;
		
		mav.addObject("noticePhoto",qnDao.noticePhoto(notice.getNo_num()));
		mav.addObject("nDetail",qnDao.getContents(no_num));

		view="aNoticeUpdateF";
		mav.setViewName(view);
		return mav;
	}
	
	// 공지사항 수정하기
		public ModelAndView aNoticeUpdate(MultipartHttpServletRequest multi,MultipartFile[] files,Notice notice,Photo photo) throws IOException {
			N_member mb = (N_member) session.getAttribute("mb");
			int state = mb.getState();
			request.setAttribute("state", state);
			System.out.println("로그인사람 state : "+state);
			System.out.println("들어온 닉네임:"+mb.getNickName());
			System.out.println("공지사항 글번호 출력완료!");
			
			System.out.println("공지사항 상세보기 출력완료!");
			notice.setNo_title(multi.getParameter("no_title"));
			notice.setNo_content(multi.getParameter("no_content"));
			System.out.println("공지사항 수정할 페이지번호 완료!");
			System.out.println("제목 : "+multi.getParameter("no_title")+","+"내용 : "+multi.getParameter("no_content"));
			
			int step1 = qnDao.aNoticeUpdate(notice);
			int step2 = 0;
			String msg="답글달기 실패!";
			System.out.println("1단계 결과 값 : "+step1);
			
			if(Integer.parseInt(multi.getParameter("fileChk")) == 1){
				if(step1==1){
					System.out.println("2단계시작");
					for(MultipartFile file:files) {
						String oriName = file.getOriginalFilename();
						int divide = 7;
						String root=request.getSession().getServletContext().getRealPath("/");
						String path = null;
						if(divide == 7){
							path="resources/notice/";
						}else{
							path=null;
						}
						String sysName = System.currentTimeMillis() + "-" + oriName;
						// 저장할 파일이름
						String uploadPath=root+path;
						File dest = new File(uploadPath, sysName);
						File dir=new File(uploadPath);
						if(!dir.isDirectory()){
							dir.mkdir();
						}
						
						FileCopyUtils.copy(file.getBytes(), dest); //실질적 업로드
						
						photo.setOriName(oriName);
						photo.setSysName(sysName);
						photo.setAp_path(path+sysName);
						photo.setAp_divide(divide);
						photo.setAp_pkNum(notice.getNo_num());

						if(qnDao.noticefileUpdateChk(photo) == 0){
							step2 = qnDao.noticeSend2(photo);//db에 등록(인설트)
						}else{
							step2 = qnDao.noticefileUpdate(photo);//db에 등록(수정)
						}
						
						System.out.println("받아온 구분자 : "+photo.getAp_divide());
						System.out.println("2단계 결과 값 : "+step2);
					}
				}
			}
			
			msg="수정이 완료되었습니다.";
			mav.addObject("msg", msg);	
			mav.setViewName("aNoticeUpdateF");
			return mav;
		}
	
			
}
