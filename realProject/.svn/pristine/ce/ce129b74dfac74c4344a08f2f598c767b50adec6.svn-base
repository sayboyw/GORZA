package com.board.finalP;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.Banner_Board;
import com.board.bean.CoordiSend;
import com.board.bean.Photo;
import com.board.bean.Req_msg;
import com.board.service.CompanyMM;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyMM cm;
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav ;
	
	//배너 보내기
	@RequestMapping(value="/cBannerSend" , method = RequestMethod.POST)
	public ModelAndView cBannerSend(Photo photo, Banner_Board bannerBoard, @RequestParam("files[]") MultipartFile[] files) throws Exception{
		System.out.println("배너 보내기 컨트롤러");
		System.out.println("시작일 : "+bannerBoard.getBa_start());
		System.out.println("종료일 : "+bannerBoard.getBa_stop());
		System.out.println("파일 길이 : "+files.length);
		
		
	    mav = new ModelAndView();
	    mav = cm.cBannerSend(bannerBoard,files,photo);
/*	    mav.setViewName("cBannerSendF");			성공 실패시 보내줄 페이지 서비스에서 바꿔야함*/
	    return mav;
	}
	//제휴신청폼
	@RequestMapping(value="/cRequestForm" , method = RequestMethod.POST)
	public ModelAndView cRequestForm(
			Req_msg req, @RequestParam("str_email01") String email1, @RequestParam(value="str_email02", required=false) String email2, @RequestParam(value="selectEmail", required=false) String email3) throws Exception{
		System.out.println("제휴신청 컨트롤러 ");
		System.out.println("메일 잘 옴? "+email1+email2);
		mav = new ModelAndView();
		mav = cm.cRequestForm(req, email1, email2, email3);
/*	    mav.setViewName("cBannerSendF");			성공 실패시 보내줄 페이지 서비스에서 바꿔야함*/
	    return mav;
	}
	
	//코디보내기
	@RequestMapping(value = "/cSend", method = RequestMethod.POST)
    public ModelAndView cSend(CoordiSend cSend, MultipartFile[] c_file) throws IOException{
        
        ModelAndView mav = new ModelAndView();
        
        //String[] cd_sit = cSend.getCd_sit();
        
        mav = cm.cSend(cSend,c_file);
        
        return mav;
    }
	//기업 게시글 랭크뽑기
	@RequestMapping(value = "/getRank", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getRank(@RequestParam("id") String id, @RequestParam("part") String part){
		System.out.println("랭크가져오기//  id값 : "+id);
		
		Map<String,Object> Map = cm.getRank(id,part);
		
		return Map;
	}
		

		//마이페이지 수정
		@RequestMapping(value = "/cUpdate", method = RequestMethod.POST)
		public ModelAndView cUpdate(MultipartHttpServletRequest multi){
			mav = new ModelAndView();

			System.out.println("멀티 : "+multi);
			System.out.println("파일첵 : "+multi.getParameter("fileChk"));
			System.out.println("멀티 : "+multi.getParameter("pw"));
			System.out.println("내용 : "+multi.getParameter("c_name"));
			System.out.println("자기소개 : "+multi.getParameter("intro"));
			System.out.println("닉네임 : "+multi.getParameter("nickName"));

			mav = cm.cUpdate(multi);
			
			return mav;
		}	
		
}
