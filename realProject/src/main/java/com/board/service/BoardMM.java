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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.board.bean.N_member;
import com.board.bean.Photo;
import com.board.bean.All_board;
import com.board.bean.B_board;
import com.board.bean.Lisc;
import com.board.bean.N_Board;
import com.board.bean.PopSearch;

import com.board.bean.Reply;
import com.board.bean.Search;
import com.board.dao.IboardDao;
import com.board.userClass.CodyPaging;
import com.board.userClass.NormalPaging;
import com.board.userClass.UploadFile;

//회원관리 서비스 클래스

//@Component -- 컨트롤러는 @Controller 서비스클래스는 @Service > 기능은 모두 @Component와 똑같음... 근데 가독성을 위해 구분해줌
//							DAO클래스 @Repository
@Component
//@Transactional
public class BoardMM {
	@Autowired
	private IboardDao bDao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav;
	private String jsonStr;
	//jackson용도
	private Map<String, Object> rMap;

	//일반 게시글 리스트 가져오기
		@Transactional
		public Map<String, Object> blist(int num) {
			rMap = new HashMap<String,Object>();
			
	        List<N_Board> blist=null;
			ArrayList<Object> allList = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			int comentCount = 0;
	        int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;   
	        
	        System.out.println("pageNum="+pageNum);
	        
	        NormalPaging paging = new NormalPaging(bDao.getAllBoard(), pageNum, 9, 10, "bList",num);
	        
	        if(num==0){//인기글 보여주기
	        	blist=bDao.getLikeBoardList(pageNum);       
	        }else{//최신글 보여주기
	        	blist=bDao.getNewBoardList(pageNum);
	        }
	        
	        System.out.println(blist.size());
	        
	        for(int i=0;i<blist.size();i++){
	        	allList = new ArrayList<Object>();
	        	allList.add(blist.get(i).getB_num()); //게시글 번호
	        	comentCount = bDao.getComCount(blist.get(i).getB_num()); //댓글 개수 가져오기
	        	//allList.add(blist.get(i).getB_content());//게시글 내용
	        	allList.add(comentCount);//댓글 개수
	        	allList.add(blist.get(i).getLikeC());//좋아요개수
	        	allList.add(bDao.getPhotoShow(blist.get(i).getB_num())); //초기화면에 보여줄 사진 가져오기
	        	allList.add(blist.get(i).getB_date());//게시글 작성날짜
	        	allList.add(blist.get(i).getB_title());//게시글 제목
	        	//allList.add(blist.get(i).getHashtag());//게시글 해시태그
	        	allList.add(blist.get(i).getId());//게시글 작성자
	        	allList.add(bDao.getPfofile(blist.get(i).getId())); //프로필 사진 가져오기       	
	        	allList.add(blist.get(i).getNickName());//게시글 작성자 닉네임
	        	
	        	onlyList.add(allList);
	        	
	        }
	        
	        rMap.put("paging",paging.makeHtmlPaging());
	        rMap.put("blist", onlyList);
			return rMap;
		}


		//일반 게시글 상세보기
		public ModelAndView bDetail(N_Board nBoard) {
			mav = new ModelAndView();
			Reply reply = new Reply();
			reply.setB_num(nBoard.getB_num());
			reply.setId(nBoard.getId());
			N_member n_member = (N_member) session.getAttribute("mb");
			int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
			nBoard.setPageNum(pageNum);
			reply.setPageNum(pageNum);
			System.out.println("번호번호 : "+nBoard.getNum());
			if(nBoard.getNum() == 1){
				mav.addObject("boardDetail",bDao.getBrdContents(nBoard.getB_num()));//글 상세보기(좋아요 개수도 나옴);	기업글
			}else{
				mav.addObject("boardDetail",bDao.getNorContents(nBoard.getB_num()));//글 상세보기(좋아요 개수도 나옴);	일반글
			}
			
			List<Reply> rlist=bDao.getReplyList(reply);// 댓글 리스트 가져오기
			mav.addObject("proFile",bDao.getPfofile(nBoard.getId()));//프로필 사진
			mav.addObject("comentCount",bDao.getComCount(nBoard.getB_num()));//댓글 개수
			mav.addObject("rlist",rlist);//댓글 리스트
			mav.addObject("boardPhoto",bDao.getPhotoShow(nBoard.getB_num()));//게시글 사진
			nBoard.setId(n_member.getId());
			mav.addObject("likeChk",bDao.getLikeChk(nBoard));//로그인 한 사람이 해당 게시글에 좋아요 했는지; 카운트
			mav.addObject("scrabChk",bDao.getScrabChk(nBoard));//로그인 한 사람이 해당 게시글에 스크랩 했는지; 카운트
			
			mav.setViewName("bDetailF");
			return mav;
		}
		
		//브랜드게시판 글 리스트 가져오기
		@Transactional
		public java.util.Map<String, Object> getBrand(int num) {
			rMap = new HashMap<String,Object>();
			
	        List<B_board> blist=null;
			ArrayList<Object> allList = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			int comentCount = 0;
	        int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;   
	        
	        System.out.println("pageNum="+pageNum);
	        
	        NormalPaging paging = new NormalPaging(bDao.getBrandBoard(), pageNum, 9, 10, "bList",num);
	        
	        if(num==0){//인기글 보여주기
	        	blist=bDao.getBrandLikeBoardList(pageNum);       
	        }else{//최신글 보여주기
	        	blist=bDao.getBrandNewBoardList(pageNum);
	        }
	        
	        System.out.println(blist.size());
	        
	        for(int i=0;i<blist.size();i++){
	        	allList = new ArrayList<Object>();
	        	allList.add(blist.get(i).getB_num()); //게시글 번호
	        	comentCount = bDao.getComCount(blist.get(i).getB_num()); //댓글 개수 가져오기
	        	//allList.add(blist.get(i).getB_content());//게시글 내용
	        	allList.add(comentCount);//댓글 개수
	        	allList.add(blist.get(i).getLikeC());//좋아요개수
	        	allList.add(bDao.getPhotoShow(blist.get(i).getB_num())); //초기화면에 보여줄 사진 가져오기
	        	allList.add(blist.get(i).getBr_date());//게시글 작성날짜
	        	allList.add(blist.get(i).getB_title());//게시글 제목
	        	//allList.add(blist.get(i).getHashtag());//게시글 해시태그
	        	allList.add(blist.get(i).getId());//게시글 작성자
	        	allList.add(bDao.getPfofile(blist.get(i).getId())); //프로필 사진 가져오기       	
	        	allList.add(blist.get(i).getNickName());//게시글 작성자 닉네임
	        	
	        	onlyList.add(allList);
	        	
	        }
	        
	        rMap.put("paging",paging.makeHtmlPaging());
	        rMap.put("blist", onlyList);
			return rMap;

		}
		
	//브랜드 게시판 상세보기
	public ModelAndView brandDetail(B_board bBoard) {
		int bnum = bBoard.getB_num();
		System.out.println("bnum : " +bnum);
		
		mav = new ModelAndView();
		Reply reply = new Reply();
		reply.setB_num(bnum);
		reply.setId(bBoard.getId());
		N_member n_member = (N_member) session.getAttribute("mb");
		int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
		bBoard.setPageNum(pageNum);
		reply.setPageNum(pageNum);
		System.out.println("번호번호 : "+bBoard.getNum());
		if(bBoard.getNum() == 1){
			mav.addObject("boardDetail",bDao.getBrdContents(bnum));//글 상세보기(좋아요 개수도 나옴);	
			System.out.println("aaaaa " +bDao.getBrdContents(bnum));
		}
		
		//댓글영역
  		List<Reply> rlist=bDao.getReplyList(reply);// 댓글 리스트 가져오기

		mav.addObject("proFile",bDao.getPfofile(bBoard.getId()));//프로필 사진
		mav.addObject("comentCount",bDao.getComCount(bBoard.getB_num()));//댓글 개수
		mav.addObject("rlist",rlist);//댓글 리스트

		mav.addObject("boardPhoto",bDao.getPhotoShow(bBoard.getB_num()));//게시글 사진
		bBoard.setId(n_member.getId());
		mav.addObject("likeChk",bDao.getLikeChk(bBoard));//로그인 한 사람이 해당 게시글에 좋아요 했는지; 카운트
		mav.addObject("scrabChk",bDao.getScrabChk(bBoard));//로그인 한 사람이 해당 게시글에 스크랩 했는지; 카운트
		
		mav.setViewName("brandDetailF");
		return mav;
	}
	
		
		
	//좋아요기능
		public Map<String, Integer> bLike(Lisc lisc) {

			if(lisc.getNum()==0){//좋아요 실행(insert);
				bDao.likeInsert(lisc);
				bDao.likeAlertIn(lisc);//알림용 인설트
			}else{//1일경우 좋아요 해제(delete);
				bDao.likeDel(lisc);
				bDao.likeAlertDel(lisc);//알림용 삭제
			}
			
			Map<String, Integer> map = new HashMap();
			map.put("num", lisc.getNum());
			
			return map;
		}

		//스크랩하기
		public Map<String, Integer> bScrap(Lisc lisc) {
			
			if(lisc.getNum()==0){//스크랩 실행(insert);
				bDao.scrapInsert(lisc);
				bDao.scrapAlertIn(lisc);//알림용 인설트
			}else{//1일경우 스크랩 해제(delete);
				bDao.scrapDel(lisc);
				bDao.scrapAlertDel(lisc);//알림용 삭제
			}
			
			Map<String, Integer> map = new HashMap();
			map.put("num", lisc.getNum());
			
			return map;
			
		}

		//댓글작성하기
		public Map<String, Object> bReplyWrite(Reply reply) {
			Map<String, Object> rMap = null;
			
			int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
			
			reply.setPageNum(pageNum);
			bDao.bReplyWrite(reply);//insert 댓글 작성
			bDao.bReplyAlertIn(reply);//알림용 인설트
			
	        List<Reply> rlist=bDao.getReplyList(reply);//댓글 리스트 가져오기
	        
	        rMap= new HashMap<String,Object>();
	        rMap.put("rListCount",bDao.getComCount(reply.getB_num()));
	        rMap.put("rlist", rlist);	
	        
			return rMap;
		}

		//댓글 삭제 기능
		public Map<String, Object> bReplyDel(Reply reply) {
			
			Map<String, Object> rMap = null;
			
			int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1; 
			
			reply.setPageNum(pageNum);
			bDao.bReplyDel(reply);//댓글 삭제하기
			bDao.bReplyAlertDel(reply);//알림용 삭제
	        List<Reply> rlist=bDao.getReplyList(reply);//댓글 리스트 가져오기
	        
	        rMap= new HashMap<String, Object>();
	        rMap.put("rListCount",bDao.getComCount(reply.getB_num()));
	        rMap.put("rlist", rlist);	
	        
			return rMap;
			
		}

		//댓글 전체 리스트 보기
				public Map<String, Object> allReply(Reply reply) {
				
					List<Reply> rlist=bDao.getReplyList(reply);// 댓글 리스트 가져오기
					Map<String, Object> map = new HashMap<String, Object>();
					
					map.put("rlist", rlist);
					
					return map;
				}

		
		//글 작성하기(일반 게시글)
				public ModelAndView bWrite(MultipartHttpServletRequest multi) {
					
			        N_member mb = (N_member) session.getAttribute("mb");
			        
			        Map<String,String> fMap=null;
			        
		            UploadFile upload = new UploadFile();
		            fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
			        
			        //DB에 저장
			        N_Board board = new N_Board();
			        board.setB_title(multi.getParameter("b_title"));
			        board.setB_content(multi.getParameter("b_content"));
			        board.setId(mb.getId());
			        board.setHashtag(multi.getParameter("hashtag"));
			        mav = new ModelAndView();
			        String view = null;
			        
			        System.out.println("닉네임 : "+mb.getNickName());
			        System.out.println("아이디 : "+mb.getId());
			        
			        if(bWrite(board,fMap)!=0){
			            view="redirect:myStyle?nickName="+"";
			            System.out.println("DB등록 성공");
			        }else{
			            view="bWriteF";
			            System.out.println("DB등록 실패");
			        }
			        mav.setViewName(view);
			        
			        return mav;
			    }
				//글 작성하기(일반 게시글)
				@Transactional
			    public int bWrite(N_Board board, Map<String, String> fMap) {
			        int b = bDao.bWrite(board); //글 등록후 글 번호를 빈에 받아오자...
			        System.out.println("bnum : " + board.getB_num()); //글 번호 받아왔는지 확인
			        if(b == 1){
			        	b=bDao.bWriteNBoard(board);//일반 고유 게시판 정보
			        }
			        int f = -1;   
			        fMap.put("ap_pkNum", String.valueOf(board.getB_num())); //스트링 형식으로 bnum을 넣어줌 map을 <String,String> 해줬기 때문에
			        fMap.put("ap_divide", "0");
			        f=bDao.fileInsert(fMap);
			        if(b!=0 && f!=0){
			            return 1;
			        }  
			        return b;
			    }
				
		// 포스트/스크랩 리스트 보기
		public Map<String, List<N_Board>> mPostScrabList(N_Board nBoard) {
			Map<String,List<N_Board>> rMap = null;
			List<N_Board> mPostScrabList= null;
			rMap= new HashMap<String, List<N_Board>>();
			if(nBoard.getNum()==0){
				System.out.println("포스트");
				mPostScrabList= bDao.mPostList(nBoard.getId());
			}else{
				System.out.println("스크랩");
				mPostScrabList= bDao.mScrapList(nBoard.getId());
			}
			rMap.put("mPostScrabList",mPostScrabList);//스크랩 리스트 저장
			
			return rMap;
		}
		
		//검색 기능
		public ModelAndView iSearch(String search) {
			ModelAndView mav = new ModelAndView();
			List<All_board> sortList = new ArrayList<All_board>();//정렬용 
					
			ArrayList<All_board> nList = bDao.searchNormal(search);//노말에서 검색한 내용 리스트
			ArrayList<All_board> bList = bDao.searchBrand(search);//브랜드에서 검색한 내용 리스트
			
			int nListSize = nList.size();
			int bListSize = bList.size();
			
			int i = 0;
			int j = 0;
			
			while(true){//한규남식 정렬
				if(i == nListSize){//증가한 i 와 nListSize가 값이 같냐.
					for(j=j;j<bListSize;j++){
						sortList.add(bList.get(j));
					}
					break;
				}else if(j == bListSize){//증가한 j 와 bListSize가 값이 같냐.
					for(i=i;i<nListSize;i++){
						sortList.add(nList.get(i));
					}
					break;
				}else{//아직 정렬 비교가 끝나지않음
					if(nList.get(i).getLikeC()>=bList.get(j).getLikeC()){//nList 의 해당 배열의 좋아요가 bList의 해당 배열의 좋아요 보다 크거나 같다
						sortList.add(nList.get(i));
						i++;
					}else{//bList 의 해당 배열의 좋아요가 nList의 해당 배열의 좋아요 보다 크다
						sortList.add(bList.get(j));
						j++;
					}
				}
			}
			
			Map<String, Object> allMap = null;
			ArrayList<Object> onlyList = new ArrayList<Object>();
			
			System.out.println("일반용 사이즈 : "+nList.size());
			System.out.println("기업용 사이즈 : "+bList.size());
			System.out.println("정렬된 사이즈 : "+sortList.size());
			
			// 인기 검색어에 등록 과정
			if(sortList.size()!=0){
				int check = bDao.chkSearch(search);//검색어 이미 테이블에 있는지 체크
				if(!search.equals("")){
					if(check==0 ){
						bDao.insertSearch(search);//검색어 테이블에 저장
					}else{
						bDao.updateSearch(search);//검색어 이미 있으면 횟수 업데이트
					}
				}
			}
			
			All_board allBoard = new All_board();
			
			for(int z=0;z<sortList.size();z++){
				allMap = new HashMap<String,Object>();
				allMap.put("b_num",sortList.get(z).getB_num()); //게시글 번호
	        	int comentCount = bDao.getComCount(sortList.get(z).getB_num()); //댓글 개수 가져오기
	        	//allList.add(blist.get(i).getB_content());//게시글 내용
	        	allMap.put("comCount",comentCount);//댓글 개수
	        	allMap.put("likeC",sortList.get(z).getLikeC());//좋아요개수
	        	allMap.put("ap_path",sortList.get(z).getAp_path()); //초기화면에 보여줄 사진 가져오기(경로)
	        	
	        	if(sortList.get(z).getB_divide() == 0 ){//게시글 작성 날짜
	        		allBoard.setDate(sortList.get(z).getB_date());
	        	}else{
	        		allBoard.setDate(sortList.get(z).getBr_date());
	        	}
	        	
	        	allMap.put("date",allBoard.getDate());//날짜
	        	allMap.put("id",sortList.get(z).getId());//게시글 작성자
	        	allMap.put("profile",bDao.getPfofile(sortList.get(z).getId())); //프로필 사진 가져오기       	
	        	allMap.put("nickName",sortList.get(z).getNickName());//게시글 작성자 닉네임
	        	allMap.put("b_divide",sortList.get(z).getB_divide());
	        	
	        	onlyList.add(allMap);
	        	
	        }
			
			mav.addObject("search",search);
			mav.addObject("searchList",onlyList); 
			
			mav.setViewName("iSearch");
			
			return mav;
		}
		
		//인기검색어 리스트
		public Map<String, List<PopSearch>> iPopSearchList() {
			Map<String, List<PopSearch>> map = new HashMap<String, List<PopSearch>>();
			
			List<PopSearch> popList = bDao.getPopList();
			
			map.put("popList", popList);
			
			return map;
		}
				
	//일반글 삭제 기능
	public Map<String, Object> bDel(int b_num, String ap_path) {
		
		Map<String, Object> map = new HashMap<>();
		
		int success = bDao.bDel(b_num); //해당 글 삭제
		
		if(success ==1){//글 삭제 완료시 해당 게시글의 그림 폴더랑 db에서 삭제
			
			if(bDao.fileDel(b_num) == 1){
				
			String root = request.getSession().getServletContext().getRealPath("/");//실제 경로
	        String savePath = root+ap_path;       
	        System.out.println(savePath);
	        
			File file = new File(savePath);	        
		        if(file.exists()) {
		            System.out.println("삭제 합니다.");
		            boolean result = file.delete();
		            System.out.println("삭제 성공 여부 : " + success);
		        }
			}
		}
		
		map.put("success", success);
		
		return map;
	}
				
	//일반글 수정 기능
	public Map<String, Object> bUpdate(MultipartHttpServletRequest multi) {
		
		Map<String, Object> map = new HashMap<>();
		
		All_board allBoard = new All_board();
		
		allBoard.setHashtag(multi.getParameter("hashtag"));
	allBoard.setB_content(multi.getParameter("b_content"));
	allBoard.setId(multi.getParameter("id"));
	allBoard.setB_num(Integer.parseInt(multi.getParameter("b_num")));
	
	
	Map<String,String> fMap=null;
	int success = 0;
	if(Integer.parseInt(multi.getParameter("fileChk")) == 1){
	UploadFile upload = new UploadFile();
	fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
	   success = bUpdate(allBoard,fMap);
	}else{
		success = bDao.bUpdate(allBoard); //글 등록후 
	System.out.println("bnum : " + allBoard.getB_num()); //글 번호 받아왔는지 확인
	if(success == 1){
		success=bDao.bUpdateNBoard(allBoard);
	    }
	}
	
	 map.put("success", success);
		
		return map;
	}

	//글 수정하기(일반 게시글)
	@Transactional
	public int brandUpdate(All_board allBoard, Map<String, String> fMap) {
	    int b = bDao.bUpdate(allBoard); //글 등록후 글 번호를 빈에 받아오자...
	System.out.println("bnum : " + allBoard.getB_num()); //글 번호 받아왔는지 확인
	if(b == 1){
		b=bDao.bUpdateNBoard(allBoard);//일반 고유 게시판 정보
	}
	int f = -1;   
	fMap.put("ap_pkNum", String.valueOf(allBoard.getB_num())); //스트링 형식으로 bnum을 넣어줌 map을 <String,String> 해줬기 때문에
	    f=bDao.fileUpdate(fMap);
	    if(b!=0 && f!=0){
	        return 1;
	    }  
	    return b;
	}
	//관리자가 코디글 작성하기
			@Transactional
			public ModelAndView codyWrite(MultipartHttpServletRequest multi,MultipartFile uploadFile) {
				System.out.println("브랜드게시판 글작성 서비스");
				int result1=0;
				int result2=0;
				int bnum;
				String id =null;
				String brand = multi.getParameter("br_brand");			//닉네임 받아오기
				mav = new ModelAndView();
				id = bDao.getId(brand);		//닉네임으로 아이디찾기
				System.out.println("기업 아이디 : "+id);
				B_board board = new  B_board();
				Photo photo = new Photo();
				int divide=1;					//기업을 의미
				String root=request.getSession().getServletContext().getRealPath("/");
				String path = "resources/upload/brand/";

				String uploadPath=root+path;

				File dir=new File(uploadPath);
				if(!dir.isDirectory()){  //upload폴더 없다면
					dir.mkdir();  //upload폴더 생성
				}
				
				board.setId(id);
				board.setB_title(multi.getParameter("b_title")); 
				board.setB_content(multi.getParameter("b_content"));
				board.setBr_sit(multi.getParameter("br_sit"));
				board.setBr_divide(multi.getParameter("br_divide"));
				board.setBr_color(multi.getParameter("br_color"));
				board.setBr_brand(brand);
				board.setHashtag(multi.getParameter("hashtag"));
				result1 = bDao.boardWrite1(board);
				if(result1 == 1){		//1단계  board 게시판에 넣기
					result2 = bDao.boardWrite2(board);
					if(result2 == 1){			//2단계  br_board 게시판에 넣기
						bnum=board.getB_num();
						String oriFileName = uploadFile.getOriginalFilename();
						
						// 저장할 파일이름
						String sysFileName = System.currentTimeMillis() + "-" + oriFileName;
						path = path+sysFileName;
						try {
							uploadFile.transferTo(new File(uploadPath + sysFileName ));
						} catch (IOException e) {
							e.printStackTrace();
						}
						File dest = new File(uploadPath, sysFileName);
						
						photo.setOriName(oriFileName);
						photo.setSysName(sysFileName);
						photo.setAp_path(path);
						photo.setAp_divide(divide);
						photo.setAp_pkNum(bnum);
						
						bDao.boardWrite3(photo);
					}
				}
			
				mav.setViewName("cody");
				return mav;
			}

	
	
	//브랜드 게시판 글 삭제 기능
		public Map<String, Object> aBrandDel(int b_num, String ap_path) {
			
			Map<String, Object> map = new HashMap<>();
			
			int success = bDao.bDel(b_num); //해당 글 삭제
			
			if(success ==1){//글 삭제 완료시 해당 게시글의 그림 폴더랑 db에서 삭제
				
				if(bDao.brandFileDel(b_num) == 1){
					
				String root = request.getSession().getServletContext().getRealPath("/");//실제 경로
		        String savePath = root+ap_path;       
		        System.out.println(savePath);
		        
				File file = new File(savePath);	        
			        if(file.exists()) {
			            System.out.println("삭제 합니다.");
			            boolean result = file.delete();
			            System.out.println("삭제 성공 여부 : " + success);
			        }
				}
			}
			
			map.put("success", success);
			
			return map;
		}
					
		//브랜드 게시판 글 수정 기능  Board에 수정됨
		public Map<String, Object> aBrandUpdate(MultipartHttpServletRequest multi) {
			
			Map<String, Object> map = new HashMap<>();
			
			All_board allBoard = new All_board();
			
			allBoard.setHashtag(multi.getParameter("hashtag"));
			allBoard.setB_content(multi.getParameter("b_content"));
			allBoard.setId(multi.getParameter("id"));
			allBoard.setB_num(Integer.parseInt(multi.getParameter("b_num")));
		
		
		Map<String,String> fMap=null;
		int success = 0;
		if(Integer.parseInt(multi.getParameter("fileChk")) == 1){
		UploadFile upload = new UploadFile();
		fMap = upload.fileUp(multi); //파일 서버에 업로드 메소드
		   success = bUpdate(allBoard,fMap);
		}else{
			success = bDao.bUpdate(allBoard); //글 등록후 
		System.out.println("bnum : " + allBoard.getB_num()); //글 번호 받아왔는지 확인
		if(success == 1){
			success=bDao.bUpdatebBoard(allBoard);//일반 고유 게시판 정보
		    }
		}
		
		 map.put("success", success);
			
			return map;
		}

		//글 수정하기(일반 게시글)
		@Transactional
		public int bUpdate(All_board allBoard, Map<String, String> fMap) {
		    int b = bDao.bUpdate(allBoard); //글 등록후 글 번호를 빈에 받아오자...
		System.out.println("bnum : " + allBoard.getB_num()); //글 번호 받아왔는지 확인
		if(b == 1){
			b=bDao.bUpdateNBoard(allBoard);//일반 고유 게시판 정보
		}
		int f = -1;   
		fMap.put("ap_pkNum", String.valueOf(allBoard.getB_num())); //스트링 형식으로 bnum을 넣어줌 map을 <String,String> 해줬기 때문에
		    f=bDao.fileUpdate(fMap);
		    if(b!=0 && f!=0){
		        return 1;
		    }  
		    return b;
		}

		// 검색어 유지하는 메소드
	      public Map<String, Object> multiSearch(Search search) {
	    	  
	    	 int pageNum = (request.getParameter("pageNum")!=null)?Integer.parseInt(request.getParameter("pageNum")):1;   
	    	 search.setPageNum(pageNum);
	    	 
	    	 CodyPaging paging = new CodyPaging(bDao.getAllBrBoard(), pageNum, 9, 10, "codyList",search.getNum());
	    	 
	         List<Object> searchList = new ArrayList<>();      //쿼리문에 쓸 리스트     
	         rMap = new HashMap<String,Object>();
	         Map<String, Object> aMap = new HashMap<String, Object>();
	         
	            rMap.put("br_sit",search.getBr_sit());

	            rMap.put("br_divide",search.getBr_divide());
	            rMap.put("br_divideSize", search.getBr_divide().size());
	            
	            rMap.put("br_color",search.getBr_color());
	            rMap.put("br_colorSize", search.getBr_color().size());
	            
	            rMap.put("br_brand",search.getBr_brand());
	            rMap.put("br_brandSize", search.getBr_brand().size());
	            
	            rMap.put("pageNum", search.getPageNum());
	            rMap.put("num", search.getNum());
	            
	         List<B_board> blist = bDao.multiSearch(rMap);
	         System.out.println("지금 리스트에 담긴애들 " +blist);
	         
	         aMap.put("paging", paging.makeHtmlPaging());
	         aMap.put("blist",blist);
	         
	         return aMap;
	      }
	

		/*private String HtmlBoardQlist(List<QnaB> qlist) throws Exception {
		        
	        StringBuilder std = new StringBuilder();
	        
	        int qSize = qlist.size();
			System.out.println("문의게시판 글사이즈 : "+qSize);
			
			std.append("<table>");
			std.append("<tr bgcolor='navy'><th>글번호</th><th>제목</th><th>아이디</th><th>작성날짜</th></tr>");
	        
	        for(int i=0; i<qSize; i++){
	        std.append("<tr>");
		        std.append("<td>"+qlist.get(i).getB_num()+"</td>");
		        std.append("<td><a href='#' onclick='articleView("+qlist.get(i).getB_num()+")'>"+qlist.get(i).getB_title()+"</a></td>");
		        std.append("<td>"+qlist.get(i).getId()+"</td>");
		        std.append("<td>"+qlist.get(i).getRp_date()+"</td>");
	        std.append("</tr>");
	    }
	       std.append("</table>");
	       
	       return std.toString();
		}
		*/

}
