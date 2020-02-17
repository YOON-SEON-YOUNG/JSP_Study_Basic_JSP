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
<%@ include file="include/header.jsp" %>
<script>
$(document).ready(function() {
	$("#btnReply").click(function() {
		location.href = "replyForm.jsp?num=<%=boardVo.getNum()%>&ref=<%=boardVo.getRef()%>&re_step=<%=boardVo.getRe_step()%>";
	});
	$("#btnUpdate").click(function() {
		location.href = "updateForm.jsp?num=<%=boardVo.getNum()%>"; 	// 수정폼
	});
	$("#btnDelete").click(function() {
		location.href = "deleteForm.jsp?num=<%=boardVo.getNum()%>"; 	// 삭제폼
	});
	$("#btnList").click(function() {
		location.href = "list.jsp";			// 목록
	});
});
</script>
</head>
<body>

<h1>글 상세 보기</h1>
<hr>
<form action="writePro.jsp" method="post">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=boardVo.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=boardVo.getSubject() %></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%=boardVo.getEmail() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=boardVo.getContent() %></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" value="답글달기" id="btnReply"
					class="btn btn-normal"/>
				<input type="button" value="수정" id="btnUpdate"
					class="btn btn-primary"/>
				<input type="button" value="삭제" id="btnDelete"
					class="btn btn-danger"/>
				<input type="button" value="목록보기" id="btnList"
					class="btn btn-warning"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>