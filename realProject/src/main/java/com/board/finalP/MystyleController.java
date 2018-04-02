package com.board.finalP;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.board.bean.Follow;
import com.board.bean.N_member;
import com.board.service.MemberMM;

@Controller
public class MystyleController {
	
	private static final Logger logger = LoggerFactory.getLogger(MystyleController.class);
	
		@Autowired
	   private MemberMM mm;
	   @Autowired
	   private HttpSession session;
	   
	   private ModelAndView mav;

	 //내스타일
	    @RequestMapping(value = "/followCount", method = RequestMethod.GET)
		public @ResponseBody Map followCount(@RequestParam("nickName") String nickName) {
	    	
	    	System.out.println("닉네임 : "+nickName);
	    	
	    	HashMap map = new HashMap();
	    	
			map.put("follow", mm.followCount(nickName));
			
			return map;
		}
    
	    //팔로우 리스트 가져오기
	    @RequestMapping(value = "/followList", method = RequestMethod.GET)
		public @ResponseBody ModelAndView followList(@RequestParam("id") String id, @RequestParam("num") int num) {
	    	
			System.out.println("컨트롤러에서 받아온 id : "+id);//해당 마이스타일 페이지의 주인
			System.out.println("받아온 : "+num);
			
			ModelAndView mav = new ModelAndView();
			mav =mm.followList(id,num);
			
			return mav;
		}
    
	  //팔로우 취소하기
	    @RequestMapping(value = "/followCancle", method = RequestMethod.GET)
		public @ResponseBody Map followCancle(Follow follow) {
			System.out.println("팔로우취소 nickName : "+follow.getNickName());
			System.out.println("팔로우취소 num : "+follow.getNum());

			 HashMap map = mm.followCancle(follow);
			
			return map;
		}

  //마이스타일 페이지 이동
  	@RequestMapping(value = "/myStyle", method = RequestMethod.GET)
  	public ModelAndView mystyle(@RequestParam("nickName") String nickName) {
  		
  		System.out.println("여기 닉네임 : "+nickName);
  		
  		if(nickName.equals("")){
  			N_member mb = (N_member) session.getAttribute("mb");
  			nickName = mb.getNickName();
  		}
  		
  		N_member nMember = new N_member();
  		nMember = mm.allInfo(nickName);
  		
  		System.out.println("담은 닉네임 : "+nickName);
  		ModelAndView mav = new ModelAndView();
  		
  		int followChk = mm.followChk(nickName);
  		
  		mav.addObject("nMember",nMember);
  		mav.addObject("followChk",followChk);
  		mav.setViewName("myStyle");
  		
  		return mav;
  	}
    
  //팔로우 하고/취소하기(마이스타일 페이지)
  	@RequestMapping(value = "/follow", method = RequestMethod.GET)
	public @ResponseBody Map follow(Follow follow) {
    	
    	System.out.println("닉네임 : "+follow.getNickName());
    	System.out.println("아이디 : "+follow.getId());
    	System.out.println("구분넘버 : "+follow.getNum());
    	HashMap map = new HashMap();
    	
    	map = mm.follow(follow);
    	if(follow.getNum() !=3){
    		map.put("follow", mm.followCount(follow.getNickName()));	
    	}
		return map;
	}
}