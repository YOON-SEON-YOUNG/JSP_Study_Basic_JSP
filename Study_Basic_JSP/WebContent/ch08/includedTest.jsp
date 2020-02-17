<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");	// 요청이 아직 살아있음.(응답하기 전)
%>
<h2>포함되는 페이지입니다.</h2>
<h3><b><%=name %></b>님 반갑습니다.</h3>