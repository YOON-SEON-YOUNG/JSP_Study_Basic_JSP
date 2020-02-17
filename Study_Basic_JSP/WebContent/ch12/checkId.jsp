<%@page import="ch12.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDao memberDao = MemberDao.getInstance();
	boolean result = memberDao.checkId(id);
	out.print(result);
 %>