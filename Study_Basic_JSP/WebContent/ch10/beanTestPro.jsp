<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTestPro.jsp</title>
</head>
<body>
<!-- 처리 -->
<h1>beanTestPro.jsp</h1>
<h2>자바빈을 사용하는 JSP 페이지</h2>
<!-- form의 name속성 값과 setProperty의 property 값이 같아야한다.
	 request.getParameter(name)이 자동 실행된다. -->
	 
<!--  b.setName()에 해당하는 것 -->
<jsp:useBean id="b" class="ch10.bean.TestBean">
<!-- 아래의  property="name"은 setName을 하겠다는말 b.setName -->
	<jsp:setProperty property="name" name="b"/>
</jsp:useBean>

<!-- b.getName()에 해당하는 것 -->
<jsp:getProperty property="name" name="b"/>



</body>
</html>