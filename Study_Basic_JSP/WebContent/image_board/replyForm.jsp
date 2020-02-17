<%@page import="ch13.board.BoardVo"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
// 	int ref = Integer.parseInt(request.getParameter("ref"));
// 	int re_step = Integer.parseInt(request.getParameter("re_step"));
	
	BoardDao boardDao = BoardDao.getInstance();
	// 답글을 달려고 하는 글의 정보
	BoardVo orgVo = boardDao.getOneArticle(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyForm.jsp</title>
</head>
<body>
<h1>답글 달기</h1>
<hr>
<form action="replyPro.jsp" method="post">
	<input type="hidden" name="ref" value="<%=orgVo.getRef() %>"/>
	<input type="hidden" name="re_step" value="<%=orgVo.getRe_step() %>"/>
	<input type="hidden" name="re_level" value="<%=orgVo.getRe_level() %>"/>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"
					value="[RE]: <%=orgVo.getSubject()%>"/></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><input type="text" name="email"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="10" cols="50">


===================
<%=orgVo.getContent() %>
</textarea></td>
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