<%@page import="ch12.member.MemeberDao1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMemberPro.jsp</title>
</head>
<body>
<!-- 처리 -->
<h1>insertMemberPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 
	MemberVo memberVo = new MemberVo();
	memberVo.setId(request.getParameter("id");에 해당하는 부분
	memberVo.setPasswd(request.getParameter("passwd");에 해당하는 부분
	memberVo.setName(request.getParameter("name");에 해당하는 부분
 -->
<jsp:useBean id="memberVo" class="ch12.member.MemberVo">
<%-- 	<jsp:setProperty property="id" name="memberVo"/> --%>
<%-- 	<jsp:setProperty property="passwd" name="memberVo"/> --%>
<%-- 	<jsp:setProperty property="name" name="memberVo"/> --%>
<!-- 위에 해당하는 조건이 다 Vo에도 있으면  property="*" 로 생략하여 쓸 수 있다. -->
	<jsp:setProperty property="*" name="memberVo"/>
</jsp:useBean>
<%
	MemeberDao1 memeberDao = MemeberDao1.getInstance();
	boolean result = memeberDao.insertMember(memberVo);
	
 	if(result == true){
%>
 <!-- 
	memberVo.getId(); 에 해당하는 부분
 -->
 <h2><jsp:getProperty property="id" name="memberVo"/>님 회원가입을 축하드립니다.</h2>
<%  
	} else {
 %>
 <h2>회원가입 실패</h2>
<%  
	} // if
%>
</body>
</html>