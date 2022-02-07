<%@page import="com.myweb.user.model.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	// 세션이 없는 경우
	if(session.getAttribute("userVO") == null) {
		response.sendRedirect("login.jsp");
	}
	// 세션 정보
	UsersVO vo = (UsersVO) session.getAttribute("userVO");
%>
<section>
	<div align="center">
		<h3><%=vo.getId() %>(<%=vo.getName() %>)님의 정보관리</h3>
		<a href="update.jsp">[정보 수정]</a>
		<a href="delete.jsp">[회원 탈퇴]</a>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>