<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--replyPro.jsp--%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="replyVo" class="ch13.board.BoardVo">
	<jsp:setProperty property="*" name="replyVo"/>
</jsp:useBean>

<%
	replyVo.setIp(request.getRemoteAddr());

	BoardDao boardDao = BoardDao.getInstance();
	boardDao.reply(replyVo);
	response.sendRedirect("list.jsp");
%>