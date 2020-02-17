<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	double num1 = Double.parseDouble(request.getParameter("num1"));
	double num2 = Double.parseDouble(request.getParameter("num2"));
	String op = request.getParameter("op");
	
// 	System.out.println("num1:" + num1);
// 	System.out.println("num2:" + num2);
// 	System.out.println("op:" + op);

	double result = 0;

	if (op.equals("+")) {
		result = num1 + num2;
	} else if (op.equals("-")) {
		result = num1 - num2;
	} else if (op.equals("*")) {
		result = num1 * num2;
	} else if (op.equals("/")) {
		result = num1 / num2;
	}
	
	out.print(result);
%>