package com.board.userClass;

import org.springframework.web.servlet.ModelAndView;

public class HanPagingSpring {
	private int totalCount; 		// 전체 글의 개수 dao에서 전체글 count
	private int page; 		// 현재 페이지 번호
	private int countList; //10		// 페이지당 나타낼 글의 갯수 (페이지 수 지정 )
	private int countPage; //2		// 페이지그룹당 페이지 갯수(하단에 보여줄 페이지 번호 개수)
	private String boardName; 	// 게시판의 종류 url 담을꺼임

	public HanPagingSpring(int totalCount, int page, int countList, int countPage, String boardName) {
		this.totalCount = totalCount;
		this.page = page;
		this.countList = countList;
		this.countPage = countPage;
		this.boardName = boardName;
	}
	
	@SuppressWarnings("unused")
	public ModelAndView makeHtmlPaging() {
		// 전체 페이지 갯수
		int totalPage = totalCount / countList; // 총 페이지
		if (totalCount % countList > 0) {
		    totalPage++;
		}
		
		if (totalPage < page) {
		    page = totalPage;
		}
		
		int startPage = ((page - 1) / 10) * 10 + 1; //글 페이징 부분에서 보여줄 첫번째 번호
		int endPage = startPage + countPage - 1; // 글 페이징 부분에서 보여줄 마지막 번호

		if (endPage > totalPage) {
		    endPage = totalPage;
		}
		ModelAndView model = new ModelAndView();
		
		return model;
	}
	
}
