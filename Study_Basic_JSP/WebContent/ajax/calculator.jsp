<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calculator.jsp</title>
<style>
#lcd {
	border: 2px dashed red;
	text-align: right;
	font-weight: bold;
	padding: 5px;
}
.col1 {
	width : 40px;
}
.col2 {
	width : 80px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function() {
	var num1 = "";
	var num2 = "";
	var op = "";
	
	function clear() {
		num1 = "";
		num2 = "";
		op = "";
		$("#lcd").val("0");
	}
	
	// 지우기
	$("#backspace").click(function() {
		// 123 -> 12
		var val = $("#lcd").val();
		var val2 = val.substring(0, val.length-1);
		if (val2.length == 0) {
			$("#lcd").val("0");
		} else {
			$("#lcd").val(val2);
		}
		
	});
	
	// 클리어
	$("#clear").click(function() {
		clear();
	});
	
	// 계산
	$("#result").click(function() {
		if (num1 == "" || op == "") {
			alert("연산자를 선택하세요");
			return;
		}
		num2 = $("#lcd").val();
		var sendData = {
				"num1" : num1,
				"num2" : num2,
				"op"   : op
		};
		var url = "calcRun.jsp";
		$.get(url, sendData, function(result) {
// 			console.log(result);
			$("#lcd").val(result.trim());
		});
	});
	
	// 숫자넣기
	$(".num").click(function() {
// 		console.log($(this).val());
		var lcdVal = $("#lcd").val();
		var thisVal = $(this).val();
		var dotIndex = lcdVal.indexOf(".");
		if (thisVal == "." && dotIndex != -1) {
			return;
		}
		var before = lcdVal;
		if (before == "0" && thisVal != ".") {
			before = "";
		}
		$("#lcd").val(before + thisVal);
	});
	
	// 부호넣기
	$(".op").click(function() {
		num1 = $("#lcd").val();
		op = $(this).val();
		$("#lcd").val("0");
		console.log("num1:" + num1);
		console.log("op:" + op);
	});
});
</script>
</head>
<body>
<h1>더미 계산기</h1>
<hr>
<table border="1">
	<tr>
		<td colspan="4">
			<input type="text" value="0" id="lcd" readonly/>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="←" class="col1" id="backspace"/></td>
		<td><input type="button" value="C" class="col1" id="clear"/></td>
		<td colspan="2"><input type="button" value="=" class="col2" id="result"/></td>
	</tr>
	<tr>
		<td><input type="button" value="7" class="col1 num"/></td>
		<td><input type="button" value="8" class="col1 num"/></td>
		<td><input type="button" value="9" class="col1 num"/></td>
		<td><input type="button" value="/" class="col1 op"/></td>
	</tr>
	<tr>
		<td><input type="button" value="4" class="col1 num"/></td>
		<td><input type="button" value="5" class="col1 num"/></td>
		<td><input type="button" value="6" class="col1 num"/></td>
		<td><input type="button" value="*" class="col1 op"/></td>
	</tr>
	<tr>
		<td><input type="button" value="1" class="col1 num"/></td>
		<td><input type="button" value="2" class="col1 num"/></td>
		<td><input type="button" value="3" class="col1 num"/></td>
		<td><input type="button" value="-" class="col1 op"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="0"  class="col2 num"/></td>
		<td><input type="button" value="." class="col1 num"/></td>
		<td><input type="button" value="+" class="col1 op"/></td>
	</tr>
</table>
</body>
</html>