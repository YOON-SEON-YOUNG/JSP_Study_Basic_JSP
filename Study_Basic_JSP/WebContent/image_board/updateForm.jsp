<%@page import="ch13.board.BoardVo"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardVo boardVo = boardDao.getOneArticle(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
<h1>글수정</h1>
<hr>
<form action="updatePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>"/>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer"
					value="<%=boardVo.getWriter()%>"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"
					value="<%=boardVo.getSubject()%>"/></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" name="email"
					value="<%=boardVo.getEmail()%>"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content"><%=boardVo.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="작성완료"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기" id="btnList"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>