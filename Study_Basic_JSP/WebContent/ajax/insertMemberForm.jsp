<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertMemberForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#btnCheckId").click(function () {
			var id = $("input[name=id]").val();
// 			location.href = "checkId.jsp?id=" + id;
			var url = "checkId.jsp";
			var data = {
					"id" : id
			};
			$.get(url, data, function(receivedData) {
// 				console.log(receivedData);
				var data = receivedData.trim(); // trim 공백제거

				if (data == "true") {
// 					alert = "이미 사용중인 아이디";
					$("#result").text("이미 사용중인 아이디");
				} else {
// 					alert = "사용 가능한 아이디";	
					$("#result").text("사용 가능한 아이디");
				}
			});
		});
	});
</script>
</head>
<body>
<!-- 폼 -->
<h1>insertMemberForm.jsp</h1>
<h2>회원 가입 양식</h2>
<form action="insertMemberPro.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디: </td>
			<td>
				<input type="text" name="id" maxlength="20">
				<input type="button" id="btnCheckId" value="중복 확인"/>
				<span id="result"></span>
			</td>
		</tr>
		<tr>
			<td>패스워드: </td>
			<td><input type="password" name="passwd" maxlength="20"></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" name="name" maxlength="6"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="작성완료"/>
				<input type="reset" value="다시입력"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>