<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 내장 객체는 글자타입(application/x-www-form-urlencoded)으로
	// 넘어온 데이터만 처리가능
// 	request.setCharacterEncoding("utf-8");
// 	String user = request.getParameter("user");
// 	String title = request.getParameter("title");
// 	String uploadFile = request.getParameter("uploadFile");	

	// cos.jar에있는 MultipartRequest 클래스를 이용
	// 생성자가 잘 수행되면 파일은 업로드되어있다.
	String realPath = application.getRealPath("/");	// 프로젝트의 로컬 경로
// 	System.out.println("realPath : " + realPath);
	
	String saveDirectory = realPath + "/upload";
	File f = new File(saveDirectory);
	if (!f.exists()) {
		f.mkdir();	// make directory
	}
	int maxPostSize = 5 * 1024 * 1024;	// 5MB
	String encoding = "utf-8";
	FileRenamePolicy fileRenamePolicty = new DefaultFileRenamePolicy();
	// -> 중복 파일명인 경우에 파일명 뒤에 숫자를 붙여서처리
	MultipartRequest multi =
		new MultipartRequest(
				request,			// 요청 정보를 알고 있는 놈
				saveDirectory, 		// 서버의 어느 폴더에 저장할 것인지
				maxPostSize,		// 업로드되는 파일의 최대 허용크기
				encoding,			// 인코딩방식
				fileRenamePolicty	// 중복 파일명에 대한 처리
				);
	// -> 파일 업로드는 처리됨.
	
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");
	
	// getFileNames
	// <input type="file">의 name속성 값 얻기
	// -> 파일명(이름)을 얻는게 아니다.
	Enumeration<?> enumer = multi.getFileNames();
	ArrayList<String> arrFileName = new ArrayList<>();
	while (enumer.hasMoreElements())	{
		String fileName = (String)enumer.nextElement();
		System.out.println("fileName: " + fileName);
		String filesystemName = multi.getFilesystemName(fileName);
		// -> getFilesystemName
		// -> 사용자 컴퓨터의 파일명이 아닌, 실제 서버에 저장된 파일명 얻기
		arrFileName.add(filesystemName);
		
		System.out.print("filesystemName: " + filesystemName);
		
		String originalFileName = multi.getOriginalFileName(fileName);
		// getOriginalFileName
		// -> 사용자가 올린 파일명 얻기
		System.out.println(", originalFileName: " + originalFileName);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUpload.jsp</title>
</head>
<body>
<h1>fileUpload</h1>
<hr>
<%=user %><br>
<%=title %><br>
<hr>
<%
	for ( String fileName : arrFileName) {
%>
	<img src="../upload/<%=fileName %>" width="100"/>
<%
	} // for
%>
</body>
</html>