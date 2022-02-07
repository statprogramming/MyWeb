<%@page import="com.myweb.user.model.UsersVO"%>
<%@page import="com.myweb.user.model.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1.
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	// 2. DAO에 update() 메소드를 생성하고, 업데이트 구문을 수행해
	// 성공 실패 여부를 1 또는 0으로 리턴
	// 3. 수정 성공시 script 태그 이용해서 "회원정보가 수정되었습니다" 출력 후에 마이페이지로 이동
	// 수정 실패시에는 "회원 정보 수정에 실패했습니다" 출력 후에 마이페이지로 이동

	UsersDAO dao = UsersDAO.getInstance();
	UsersVO vo = new UsersVO(id, pw, name, email, address, null);
	// 메소드 호출
	int result = dao.update(vo);
	
	if(result == 1) { 
		session.setAttribute("userVO", vo); // 성공시에 세션 정보 수정
%>
	<script>
		alert("회원정보가 수정되었습니다");
		location.href = "mypage.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("회원정보 수정에 실패했습니다");
		location.href = "mypage.jsp";
	</script>
<%
	}
%>