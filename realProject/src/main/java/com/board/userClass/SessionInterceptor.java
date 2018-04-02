package com.board.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {//세션 가로채서 컨트롤러 가기 전에 미리 처리해줌
		System.out.println("preHandle Call");
		if(session.getAttribute("mb") ==null){
			response.sendRedirect("./mLoginF");
			return false;//있으나 마나
		}
		return true; //요청페이지로 이동(true 라고 명시해놔야함)
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {//컨트롤러 후 뷰 전에
		System.out.println("postHandle Call");
		modelAndView = new ModelAndView();
		modelAndView.addObject("result","postHandleResult");
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
