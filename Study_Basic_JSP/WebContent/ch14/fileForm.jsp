<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileForm.jsp</title>
</head>
<body>
<h1>파일 업로드 폼</h1>
<hr>
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
<!-- 파일 전송은 무조건 method="post"-->
<!-- 데이터를 바이너리로 전송 -->
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="user"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>파일명1</th>
			<td><input type="file" name="uploadFile1"></td>
		</tr>
		<tr>
			<th>파일명2</th>
			<td><input type="file" name="uploadFile2"></td>
		</tr>
		<tr>
			<th>파일명3</th>
			<td><input type="file" name="uploadFile3"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="완료">
			</td>
		</tr>
	</table>
</form>
</body>
</html>