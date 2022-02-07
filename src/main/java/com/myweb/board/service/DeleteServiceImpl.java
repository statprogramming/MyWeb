package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class DeleteServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// param을 받는다(bno)
		String bno = request.getParameter("bno");

		// DAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		dao.delete(bno);
	}

}
