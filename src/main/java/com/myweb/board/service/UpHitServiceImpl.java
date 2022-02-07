package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class UpHitServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// bno를 받는다.
		String bno = request.getParameter("bno");
		
		// 쿠키 검사
		Cookie[] cookies = request.getCookies();
		
		boolean flag = true; // 중복검사 변수
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(bno)) { // 쿠키이름이 bno와 같으면
					flag = false; // 중복됨
					break;
				}
			}
		}
		// flag가 true인 경우만 조회수를 증가
		if(flag) {			
			BoardDAO dao = BoardDAO.getInstance();
			dao.upHit(bno);
		}
		
		// 쿠키 문법, 쿠키 생성, 시간 설정, 쿠키 전송
		// 쿠키-클라이언트에 저장되는 정보, 서버측에서 생성, 클라이언트에 저장, 글번호에 저장
		// 쿠키-서버로(자바코드쪽) 전송되서 들어오면 글번호 쿠키가 있다면 조회수 증가 x, 글번호 쿠키가 없다면 조회수 증가o
		Cookie cookie = new Cookie(bno, bno); //(이름, 값)
		cookie.setMaxAge(20);
		response.addCookie(cookie);
	}

}
