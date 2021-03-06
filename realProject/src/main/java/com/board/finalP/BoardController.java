package com.board.finalP;

import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.board.bean.All_board;
import com.board.bean.B_board;
import com.board.bean.Lisc;
import com.board.bean.N_Board;
import com.board.bean.PopSearch;
import com.board.bean.Reply;
import com.board.bean.Search;
import com.board.service.BoardMM;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardMM bm;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
    
	//게시글 리스트 보여주기(인기순/최신순) 
	@RequestMapping(value = "/bList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bList(@RequestParam("num") int num){
		System.out.println("인기글이냐 최신글이냐 : "+num);
		
		Map<String,Object> rMap = bm.blist(num);
		
		return rMap;
	}
	
	//게시글 상세보기(일반);
	@RequestMapping(value = "/bDetail", method = RequestMethod.GET)
	public @ResponseBody ModelAndView bDetail(N_Board nBoard){
		
		ModelAndView mav = new ModelAndView();
		System.out.println(nBoard.getId()+"///"+nBoard.getB_num());
		
		mav = bm.bDetail(nBoard);
		
		return mav;
	}	
	
	//게시글 리스트 보여주기(인기순/최신순)
	@RequestMapping(value = "/getBrand", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getBrand(@RequestParam("num") int num){
		System.out.println("브랜드 게시판 인기글이냐 최신글이냐 : "+num);
		
		Map<String,Object> Map = bm.getBrand(num);
		
		return Map;
	}	
	
	//게시글 상세보기(브랜드);
	@RequestMapping(value = "/brandDetail", method = RequestMethod.GET)
	public @ResponseBody ModelAndView brandDetail(B_board bBoard){
		System.out.println("브랜드 글 상세보기");
		System.out.println(bBoard.getId()+"///"+bBoard.getB_num());
		ModelAndView mav = new ModelAndView();
		
		mav = bm.brandDetail(bBoard);
		
		return mav;
	}		

	//좋아요 기능
	@RequestMapping(value = "/bLike", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> bLike(Lisc lisc){
		ModelAndView mav = new ModelAndView();
		System.out.println(lisc.getB_num()+"//좋아요기능//"+lisc.getId());
		
		Map<String,Integer> rMap = bm.bLike(lisc);
		
		return rMap;
	}
		
	//스크랩 기능
	@RequestMapping(value = "/bScrap", method = RequestMethod.GET)
	public @ResponseBody Map<String, Integer> bScrap(Lisc lisc){
		ModelAndView mav = new ModelAndView();
		System.out.println(lisc.getB_num()+"//좋아요기능//"+lisc.getId());
		
		Map<String,Integer> rMap = bm.bScrap(lisc);
		
		return rMap;
	}
			
	//댓글작성 기능
	@RequestMapping(value = "/bReplyWrite", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> bReplyWrite(Reply reply){
		ModelAndView mav = new ModelAndView();
		System.out.println(reply.getB_num()+"//댓글작성기능//"+reply.getId()+"//댓글작성기능//"+reply.getRe_content());
		
		Map<String,Object> rMap = bm.bReplyWrite(reply);
        
        return rMap;
	}
	
	//댓글삭제 기능
	@RequestMapping(value = "/bReplyDel", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> bReplyDel(Reply reply){
		ModelAndView mav = new ModelAndView();
		System.out.println("알이 넘 : " + reply.getRe_num()+"비넘 : "+reply.getB_num());
		
		Map<String,Object> rMap = bm.bReplyDel(reply);
        
        return rMap;
	}
	
	//댓글전체 보기 기능(그 페이지 가기)
	@RequestMapping(value = "/allReplyF", method = RequestMethod.GET)
	public @ResponseBody ModelAndView allReplyF(Reply reply){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("allReply");
		mav.addObject("b_num",reply.getB_num());
		
        return mav;
	}
	
	//댓글전체 보기 기능(뿌려주기)
	@RequestMapping(value = "/allReply", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> allReply(Reply reply){
		
		Map<String,Object> map = bm.allReply(reply);
		
        return map;
	}
	
	//글작성 기능
	@RequestMapping(value = "/bWrite", method = RequestMethod.POST)
	public ModelAndView bWrite(MultipartHttpServletRequest multi){
		
		ModelAndView mav = new ModelAndView();
		
		mav = bm.bWrite(multi);
		
        return mav;
	}
	
	//글 삭제
	@RequestMapping(value = "/bDel", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> bDel(@RequestParam("b_num") int b_num, @RequestParam("ap_path") String ap_path){
		
		System.out.println(" b_num  : "+ b_num);
		
		Map<String,Object> map = bm.bDel(b_num,ap_path);
		
        return map;
	}

	//글 수정페이지 이동  //페이지이동
	@RequestMapping(value = "/bUpdateF", method = RequestMethod.POST)
	public @ResponseBody ModelAndView bUpdateF(All_board allBoard){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("allBoard", allBoard);
		mav.setViewName("bUpdateF");
		
        return mav;
	}
	//브랜드 글 수정페이지 이동 //페이지이동
	@RequestMapping(value = "/bBrandUpdateF", method = RequestMethod.POST)
	public @ResponseBody ModelAndView bBrandUpdateF(All_board allBoard){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("allBoard", allBoard);
		mav.setViewName("bBrandUpdateF");
		
        return mav;
	}
	
	
	//글 수정
	@RequestMapping(value = "/bUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> bUpdate(MultipartHttpServletRequest multi){
		
		System.out.println("멀티 : "+multi);
		System.out.println("파일첵 : "+multi.getParameter("fileChk"));
		System.out.println("멀티 : "+multi.getParameter("hashtag"));
		System.out.println("내용 : "+multi.getParameter("b_content"));
		System.out.println("아이디 : "+multi.getParameter("id"));
		System.out.println("비넘 : "+multi.getParameter("b_num"));
		
		Map<String,Object> map = bm.bUpdate(multi);
		
		map.put("id", multi.getParameter("id"));
		map.put("b_num", multi.getParameter("b_num"));
		
        return map;
	}
				
	//브랜드 게시판 글 수정
		@RequestMapping(value = "/aBrandUpdate", method = RequestMethod.POST)
		public @ResponseBody Map<String,Object> aBrandUpdate(MultipartHttpServletRequest multi){
			
			System.out.println("멀티 : "+multi);
			System.out.println("파일첵 : "+multi.getParameter("fileChk"));
			System.out.println("멀티 : "+multi.getParameter("hashtag"));
			System.out.println("내용 : "+multi.getParameter("b_content"));
			System.out.println("아이디 : "+multi.getParameter("id"));
			System.out.println("비넘 : "+multi.getParameter("b_num"));
			
			Map<String,Object> map = bm.aBrandUpdate(multi);
			
			map.put("id", multi.getParameter("id"));
			map.put("b_num", multi.getParameter("b_num"));
			
	        return map;
		}
	
	// 포스트/스크랩 리스트 보기
	@RequestMapping(value = "/mPostScrabList", method = RequestMethod.GET)
	public @ResponseBody Map<String,List<N_Board>> mPostScrabList(N_Board nBoard){

		 Map<String, List<N_Board>> map = bm.mPostScrabList(nBoard);
		
        return map;
	}
		
	//검색기능(전체 )
	@RequestMapping(value = "/iSearch", method = RequestMethod.GET)
	public ModelAndView iSearch(@RequestParam("search") String search){
		
		ModelAndView mav = new ModelAndView();
		System.out.println("검색어 : "+search);
		mav = bm.iSearch(search);
		
		return mav;
	}
	
	//인기검색어 1~10위까지 리스트 가져오기
	@RequestMapping(value = "/iPopSearchList", method = RequestMethod.GET)
	public @ResponseBody Map<String,List<PopSearch>> iPopSearchList(){
		
		Map<String, List<PopSearch>> map = bm.iPopSearchList();
		
        return map;
		
	}
						
	//관리자 - > 기업이 보내준 코디 등록  	 : 브랜드 게시판에 글쓰기
	@RequestMapping(value = "/codyWrite", produces="application/json; charset=UTF-8", method = RequestMethod.POST)
	public ModelAndView codyWrite(MultipartHttpServletRequest multi,@RequestParam("file") MultipartFile uploadFile) {
		mav = new ModelAndView();
		System.out.println(" 기업이 보내준 코디 등록하는 컨트롤러");

		mav = bm.codyWrite(multi, uploadFile);
		return mav; 
	}
	
	//검색 중복
	@RequestMapping(value = "/multiSearch",produces="application/json; charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> multiSearch (Search search) throws Exception {
		System.out.println("검색유지 컨트롤러");
		System.out.println("getBr_sit  :"+search.getBr_sit());

		System.out.println("num : "+search.getNum());

		Map<String, Object> map =bm.multiSearch(search);

	     return map;
	}
	
	
}