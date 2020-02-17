<%@page import="ch13.board.SearchDto"%>
<%@page import="ch13.board.PagingDto"%>
<%@page import="ch13.board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%
	// n줄씩 보기
	int perPage = 10;
	String strPerPage = request.getParameter("perPage");
	if (strPerPage != null) {
		perPage = Integer.parseInt(strPerPage);
	}
// 	System.out.println("perPage:" + perPage);

	// 검색
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
	if (searchType == null) {
		searchType = "";
	}
	if (keyword == null) {
		keyword = "";
	}
	SearchDto searchDto = new SearchDto(searchType, keyword);
	
	BoardDao boardDao = BoardDao.getInstance();
	int count = boardDao.getCount(searchDto);
	
	// 총 페이지 수
	// count	totalPage
	// 500		50
	// 501		51
	// 502		51
	int totalPage = (int)Math.ceil((double)count / perPage); // 석인

	int nowPage = 1;
	String strPage = request.getParameter("page");
	if (strPage != null && !strPage.equals("")) {
		nowPage = Integer.parseInt(strPage);
	}
	// nowPage 	startRow	endRow
	// 1		1			10
	// 2		11			20
	// 3		21			30
	int startRow = nowPage * perPage - (perPage - 1); // 인광
	int endRow = nowPage * perPage;
	PagingDto pagingDto = new PagingDto(startRow, endRow);
	
	// 페이징 - 페이지 블럭
	// nowPage	startPage	endPage
	// 1		1			10
	// 5		1			10
	// 10		1			10
	// 11		11			20
	int startPage = ((nowPage - 1) / 10) * 10 + 1; // 인광
	int endPage = startPage + 9;
	if (endPage > totalPage) {
		endPage = totalPage;
	}
	
// 	System.out.println("count:" + count);
// 	System.out.println("startPage:" + startPage);
// 	System.out.println("endPage:" + endPage);
// 	System.out.println("totalPage:" + totalPage);
	
	ArrayList<BoardVo> list = boardDao.getArticles(pagingDto, searchDto);
%>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href = "writeForm.jsp";
		});
		$("#btnSearch").click(function() {
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
// 			console.log("searchType:" + searchType);
// 			console.log("keyword:" + keyword);
			location.href = "list.jsp?searchType=" + searchType 
					+ "&keyword=" + keyword;
			// -> list.jsp?searchType=subject&keyword=40
		});
		
		$("select[name=perPage]").change(function() {
			var val = $(this).val();
			location.href = "list.jsp?perPage=" + val;
		});
		
		
	});
</script>
</head>
<body>

	<h1>글 목록</h1>
	<hr>
	<input type="button" id="btnWrite" value="글쓰기" class="btn btn-warning" />
	
	총 게시글 수 :
	<%=count%>개
	<select name="searchType" id="searchType">
		<option value="subject"
		<%
			if (searchType != null && searchType.equals("subject")) out.print("selected");
		%>
		>제목</option>
		<option value="content"
		<%
			if (searchType != null && searchType.equals("content")) out.print("selected");
		%>
		>내용</option>
		<option value="writer"
		<%
			if (searchType != null && searchType.equals("writer")) out.print("selected");
		%>
		>작성자</option>
	</select>
	<input type="text" name="keyword" id="keyword" placeholder="검색어 입력"
	<%
		if (keyword != null) {
			out.print("value='" + keyword + "'"); // value='40'
		} // if
	%>	
		>
	<input type="button" value="검색" id="btnSearch"/>
	
	<select name="perPage">
	<%
		for (int i = 5; i <= 20; i += 5) { 
	%>
		<option value="<%=i %>" 
		<%
			if (perPage == i) {
				out.print("selected");
			}
		%>
		><%=i %>줄씩 보기</option>
	<% 
		}
	%>	
	</select>
	
	<hr>
	<a href="list.jsp">목록형</a> |
	<a href="album.jsp">앨범형</a>
	<hr>
	
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>파일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
						<th>IP</th>
					</tr>
				</thead>
				<tbody>

					<%
						for (BoardVo boardVo : list) {
					%>
					<tr>
						<td><%=boardVo.getNum()%></td>
						<td>
							<%
								String fileName = "";
								if (boardVo.getFile_name() != null) {
									fileName = boardVo.getFile_name();
								} else {
									fileName = "default.jpg";
								}
							%>
							<img src="../upload/<%=fileName%>" width="50"/>
						</td>
						<td>
						<% 
							for (int i = 0; i < boardVo.getRe_level(); i++) {
								out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
							}
						
							if (boardVo.getRe_level() > 0) {
								out.println("ㄴ");
							}
						%>
						<a href="content.jsp?num=<%=boardVo.getNum()%>"><%=boardVo.getSubject()%></a>
						</td>
						<td><%=boardVo.getWriter()%></td>
						<td><%=boardVo.getReg_date()%></td>
						<td><%=boardVo.getReadcount()%></td>
						<td><%=boardVo.getIp()%></td>
					</tr>
					<%
						} // for
					%>

				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 text-center">
		<ul class="pagination">
		<%
			if (startPage != 1) {
		%>
			<li><a href="list.jsp?page=<%=startPage - 1 %>&perPage=<%=perPage %>&searchType=<%=searchType%>&keyword=<%=keyword%>">이전</a></li>
		<%
			} // if
		%>
		<%
			// 페이지 반복
			for (int i = startPage; i <= endPage; i++) {
		%>
				<li
				<%
					if (nowPage == i) {
						out.print("class='active'");
					}
				%>
				><a href="list.jsp?page=<%=i %>&perPage=<%=perPage %>&searchType=<%=searchType%>&keyword=<%=keyword%>"><%=i %></a></li>
		<%
			} // for
		%>
		
		<%
			if (endPage != totalPage) {
		%>
		<li><a href="list.jsp?page=<%=endPage + 1 %>&perPage=<%=perPage %>&searchType=<%=searchType%>&keyword=<%=keyword%>">다음</a></li>
		<%
			} // if
		%>
		</ul>
		</div>
	</div>

	<%@ include file="include/footer.jsp" %>