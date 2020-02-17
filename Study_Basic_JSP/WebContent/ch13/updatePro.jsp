<%@page import="ch13.board.BoardVo"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="boardVo" class="ch13.board.BoardVo">
	<jsp:setProperty property="*" name="boardVo"/>
</jsp:useBean>
<%=boardVo %>
<h1>updatePro.jsp</h1>
<%
	BoardDao boardDao = BoardDao.getInstance();
	boardDao.updateArticle(boardVo);

	response.sendRedirect("content.jsp?num=" + boardVo.getNum());
%>

