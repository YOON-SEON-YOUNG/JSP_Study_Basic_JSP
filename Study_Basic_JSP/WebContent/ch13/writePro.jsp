<%@page import="ch13.board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDao boardDao = BoardDao.getInstance();
			
	// cos.jar에있는 MultipartRequest 클래스를 이용
	// 생성자가 잘 수행되면 파일은 업로드되어있다.
	String realPath = application.getRealPath("/");	// 프로젝트의 로컬 경로
	
	
	// 거의 한세트. realPatr 경로를 저장해야하니까.
	// 저장할 파일경로가 없으면 만들어서 저장.
	String saveDirectory = realPath + "/upload";
	File f = new File(saveDirectory);
	if (!f.exists()) {
		f.mkdir();	// make directory
	}
	
	int maxPostSize = 5 * 1024 * 1024;	// 5MB
	String encoding = "utf-8";
	FileRenamePolicy fileRenamePolicty = new DefaultFileRenamePolicy();
	// -> 중복 파일명인 경우에 파일명 뒤에 숫자를 붙여서처리
	
	MultipartRequest multi = new MultipartRequest(
			request,			// 요청 정보를 알고 있는 놈
			saveDirectory, 		// 서버의 어느 폴더에 저장할 것인지
			maxPostSize,		// 업로드되는 파일의 최대 허용크기
			encoding,			// 인코딩방식
			fileRenamePolicty	// 중복 파일명에 대한 처리
			);
		
	String writer = multi.getParameter("writer");
	String subject = multi.getParameter("subject");
	String email = multi.getParameter("email");
	String content = multi.getParameter("content");
	String passwd = multi.getParameter("passwd");
	
	String ip = request.getRemoteAddr();
	
	Enumeration<?> enumer = multi.getFileNames();
	String fileName = (String)enumer.nextElement();		
	String filesystemName = multi.getFilesystemName(fileName);
	
	BoardVo boardVo = new BoardVo();
	boardVo.setWriter(writer);
	boardVo.setSubject(subject);
	boardVo.setEmail(email);
	boardVo.setContent(content);
	boardVo.setPasswd(passwd);
	boardVo.setIp(ip);
	boardVo.setFile_name(filesystemName);
	
	boardDao.insertArticle(boardVo);
	
	response.sendRedirect("list.jsp");
%>

