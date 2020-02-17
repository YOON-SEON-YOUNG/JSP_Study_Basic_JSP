<%@page import="ch12.member.MemeberDao1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>loginPro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String saveId = request.getParameter("saveId");
	
	MemeberDao1 memberDao = MemeberDao1.getInstance();
	int result = memberDao.userCheck(id, passwd);
	
	switch (result)	{
	case MemeberDao1.ID_NOT_FOUND:
%>
		<script>
			alert("해당 아이디가 없습니다.");
			history.back();				// 뒤로가기(loginForm.jsp)
		</script>
<%
	break;
	case MemeberDao1.INCORRECT_PASSWD:
%>
		<script>
			alert("패스워드가 일치하지 않습니다.");
			history.back();				// 뒤로가기(loginForm.jsp)
		</script>
<%
	break;
	case MemeberDao1.LOGIN_OK:
		session.setAttribute("id", id);
		Cookie cookie = new Cookie("id", id);
		int ageTime = 0;	// setMaxAge 값이 0이면 (유효기간0) - 쿠키삭제
		if (saveId != null && !saveId.equals("")){	// 체크(아이디저장!)
	ageTime = 60 * 60 * 24;	// 1일
		}
		cookie.setMaxAge(ageTime);	// 쿠키 유효기간 : 1일
		response.addCookie(cookie);
%>
		<script>
			alert("로그인 성공");
			location.href = "main.jsp";	// 메인 페이지로 이동(main.jsp)
		</script>
<%
		break;
	}//switch
%>