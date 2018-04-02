package com.board.finalP;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import org.springframework.web.servlet.ModelAndView;

import com.board.bean.B_board;
import com.board.bean.N_member;
import com.board.bean.Notice;
import com.board.bean.Photo;
import com.board.bean.QnaB;
import com.board.service.QnaNoticeMM;



@Controller
public class QuestionNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionNoticeController.class);
	
	@Autowired
	private QnaNoticeMM qn;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav ;

	// 문의사항 리스트
		@RequestMapping(value = "/aQuestionF", method = RequestMethod.GET)
		public ModelAndView aQuestionF() throws Exception {
			logger.info("페이지이동 문의사항 리스트폼 Call");
			System.out.println("페이지이동 문의사항 리스트폼 Call");
			mav = new ModelAndView();
			mav = qn.aQuestionList();
			return mav;
		}	

	// 문의사항 글쓰기폼 //페이지이동
		@RequestMapping(value = "/bReqWriteF", method = RequestMethod.GET)
		public String bReqWriteF() throws Exception {
			logger.info("글쓰기폼 Call");
			System.out.println("문의사항 글쓰기폼 Call");
			return "bReqWriteF";
		}
		
	// 문의사항 글쓰기
		@RequestMapping(value = "/bReqWrite", method = RequestMethod.POST)
		public ModelAndView bReqWrite(MultipartHttpServletRequest multi,QnaB qnab,@RequestParam("files[]") MultipartFile[] files,Photo photo) throws Exception {
			logger.info("문의사항 게시판 글쓰기 Call");
			System.out.println("멀티 : "+multi);
			System.out.println("문의사항 게시판 글쓰기 Call");
			System.out.println("파일 길이 : "+files.length);
			mav = new ModelAndView();
			mav = qn.bReqWrite(multi,qnab,files,photo);
			return mav;
		}
		
	// 문의사항 상세보기폼,상세보기
		@RequestMapping(value = "/aQuestionDetailF", method = RequestMethod.GET)
		public ModelAndView aQuestionDetailF(B_board board,QnaB qnab) {
			mav = new ModelAndView();
			mav = qn.aQuestionDetail(board,qnab); 
			return mav;
		}
		
	// 문의사항 삭제하기
		@RequestMapping(value = "/bReqDel", method = RequestMethod.GET)
		public ModelAndView bReqDel(N_member member,QnaB qnab) throws Exception {
			mav = new ModelAndView();
			mav=qn.bReqDel(member,qnab);
			return mav;
		}
		
	// 문의사항 답글쓰기폼 //페이지이동
		@RequestMapping(value = "/aSecretWriteF", method = RequestMethod.GET)
		public ModelAndView aSecretWriteF(QnaB qnab) throws Exception {
			
			logger.info("페이지이동 문의사항 답글쓰기폼 Call");
			System.out.println("페이지이동 문의사항 답글쓰기폼 Call");
			System.out.println("페이지이동 문의사항 답글쓰기폼 Call");
			System.out.println("페이지 번호 : "+qnab.getB_num());
			System.out.println("작성한 유저 : "+qnab.getId());
			System.out.println("작성한 유저의 닉네임 : "+qnab.getNickName());
			System.out.println("그룹번호 :"+qnab.getGroup_num());
			System.out.println("그룹번호 : "+qnab.getRp_divide());
			System.out.println("작성글한 유저의 아이디 : "+qnab.getWrite_id());
			System.out.println("작성글의 페이지 번호 : "+qnab.getUpper_num());
			System.out.println("문의사유 : "+qnab.getRp_reason());
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("rp_reason",qnab.getRp_reason());
			mav.addObject("b_num",qnab.getB_num());
			mav.addObject("id",qnab.getId());
			mav.addObject("nickName",qnab.getNickName());
			mav.addObject("group_num",qnab.getGroup_num());
			mav.addObject("rp_divide",qnab.getRp_divide());
			mav.addObject("write_id",qnab.getWrite_id());
			mav.addObject("upper_num",qnab.getUpper_num());
			
			mav.setViewName("aSecretWriteF");
			
			return mav;
		}
		
	// 문의사항 답글쓰기
		@RequestMapping(value = "/aSecretWrite", method = RequestMethod.POST)
		public ModelAndView aSecretWrite(MultipartHttpServletRequest multi,QnaB qnab,@RequestParam("files[]") MultipartFile[] files,Photo photo) throws Exception {
			logger.info("페이지이동 문의사항 답글쓰기 Call");
			System.out.println("페이지이동 문의사항 답글쓰기폼 Call");
			mav=qn.aSecretWrite(multi,qnab,files,photo);
			return mav;
		}
		
	// 문의사항 수정하기폼
		@RequestMapping(value = "/aQuestionUpdateF", method = RequestMethod.GET)
		public ModelAndView aNoticeUpdateF(B_board board,Photo photo) throws Exception {
			logger.info("페이지이동 문의사항 수정하기폼 Call");
			System.out.println("페이지이동 문의사항 수정하기폼 Call");
			System.out.println("페이지 번호 : "+board.getB_num());
			mav = qn.aQuestionUpdateF(board,photo);
			return mav;
		}
	// 문의사항 수정하기
		@RequestMapping(value = "/aQuestionUpdate", method = RequestMethod.POST)
		public ModelAndView aQuestionUpdate(MultipartHttpServletRequest multi,@RequestParam("files[]") MultipartFile[] files,B_board board,QnaB qnab,Photo photo) throws Exception {
			logger.info("페이지이동 문의사항 수정하기 Call");
			System.out.println("페이지이동 문의사항 수정하기 Call");
			mav = new ModelAndView();
			mav = qn.aQuestionUpdate(multi,files,board,qnab,photo);
			return mav;
		}

		
// 공지사항 리스트폼,리스트
		@RequestMapping(value = "/aNoticeF", method = RequestMethod.GET)
		public ModelAndView aNoticeF(Notice notice) throws Exception {
			logger.info("페이지이동 공지사항 리스트폼 Call");
			System.out.println("페이지이동 공지사항 리스트폼 Call");
			mav = new ModelAndView();
			mav = qn.aNoticeList(notice);
			return mav;
		}	
	
// 공지사항 상세보기폼,상세보기
		@RequestMapping(value = "/aNoticeDetailF", method = RequestMethod.GET)
		public ModelAndView aNoticeDetailF(Notice notice,Photo photo) throws Exception {
			logger.info("페이지이동 공지사항 상세보기폼 Call");
			System.out.println("페이지이동 공지사항 상세보기폼 Call");
			mav = new ModelAndView();
			mav = qn.aNoticeDetail(notice,photo);
			return mav;
		}
// 공지사항 삭제하기
		@RequestMapping(value = "/aNoticeDel", method = RequestMethod.GET)
		public ModelAndView aNoticeDel(Notice notice) throws Exception {
			logger.info("페이지이동 공지사항 삭제하기 Call");
			System.out.println("페이지이동 공지사항 삭제하기 Call");
			mav = new ModelAndView();
			mav = qn.aNoticeDel(notice);
			return mav;
		}
// 공지사항 글쓰기폼
		@RequestMapping(value = "/aNoticeWriteF", method = RequestMethod.GET)
		public String aNoticeWriteF() throws Exception {
			logger.info("페이지이동 공지사항 글쓰기폼 Call");
			System.out.println("페이지이동 공지사항 글쓰기폼 Call");
			return "aNoticeWriteF";
		}
// 공지사항 글쓰기
		@RequestMapping(value = "/aNoticeWrite", method = RequestMethod.POST)
		public ModelAndView aNoticeWrite(MultipartHttpServletRequest multi,@RequestParam("files[]") MultipartFile[] files,Notice notice,Photo photo) throws Exception {
			logger.info("페이지이동 공지사항 글쓰기 Call");
			System.out.println("멀티 : "+multi);
			System.out.println("페이지이동 공지사항 글쓰기 Call");
			System.out.println("파일 길이 : "+files.length);
			mav = new ModelAndView();
			mav = qn.aNoticeWrite(multi,files,notice,photo);
			return mav;
		}
// 공지사항 수정하기폼
		@RequestMapping(value = "/aNoticeUpdateF", method = RequestMethod.GET)
		public ModelAndView aNoticeUpdateF(Notice notice,Photo photo) throws Exception {
			logger.info("페이지이동 공지사항 수정하기폼  Call");
			System.out.println("페이지이동 공지사항 수정하기폼 Call");
			System.out.println("페이지 번호 : "+notice.getNo_num());
			mav = qn.aNoticeUpdateF(notice,photo);
			return mav;
		}
// 공지사항 수정하기
		@RequestMapping(value = "/aNoticeUpdate", method = RequestMethod.POST)
		public ModelAndView aNoticeUpdate(MultipartHttpServletRequest multi,@RequestParam("files[]") MultipartFile[] files,Notice notice,Photo photo) throws Exception {
			logger.info("페이지이동 공지사항 수정하기 Call");
			System.out.println("페이지이동 공지사항 수정하기 Call");
			mav = new ModelAndView();
			mav = qn.aNoticeUpdate(multi,files,notice,photo);
			return mav;
		}

}