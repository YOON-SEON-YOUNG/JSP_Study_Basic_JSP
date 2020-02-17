<%@page import="ch13.board.BoardVo"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="ch13.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contexPath = application.getRealPath("/");	// 해당  프로젝트의 로컬 경로
	String saveDirectory = contexPath + "upload";
	File f = new File(saveDirectory);
	if (!f.exists()) {	// 해당 폴도가 존재하지 않는다면
		f.mkdir();		// 폴더 생성 (upload)
	}
	System.out.println("saveDirectory: " + saveDirectory);	// 이미지 등록된 경로 체크
	int maxSize = 1024 * 1024 * 10;	//10MB
	String encoding = "utf-8";
	FileRenamePolicy fileRename = new DefaultFileRenamePolicy();
	MultipartRequest multi =
		new MultipartRequest(
				request,			// 요청 정보
				saveDirectory,		// 서버에 저장될 경로
				maxSize,			// 업로드 파일 최대 허용 크기
				encoding,			// 인코딩 방식
				fileRename			// 파일명 중복 처리
				);
	// -> 여기까지 에러 없이 실행 -> 파일 업로드 정상 처리
	
	String writer = multi.getParameter("writer");
	String subject = multi.getParameter("subject");
	String email = multi.getParameter("email");
	String content = multi.getParameter("content");
	String passwd = multi.getParameter("passwd");
	
	// 파일의 이름이 아니고
	// <input type="file"> 의 name 속성 값
	Enumeration<?> enumer = multi.getFileNames();	
	String file1 = (String)enumer.nextElement();			// name="file1"
	String filesystemName = multi.getFilesystemName(file1);	// penguins1.jpg 실제 서버에 저장되는 이름을 얻어냄
	
	BoardVo boardVo = new BoardVo();
	boardVo.setWriter(writer);
	boardVo.setSubject(subject);
	boardVo.setEmail(email);
	boardVo.setContent(content);
	boardVo.setPasswd(passwd);
	boardVo.setFile_name(filesystemName);
	boardVo.setIp(request.getRemoteAddr());
	
	System.out.println("boardVo: " + boardVo);

	BoardDao boardDao = BoardDao.getInstance();
	boardDao.insertArticle(boardVo);

	response.sendRedirect("list.jsp");
%>