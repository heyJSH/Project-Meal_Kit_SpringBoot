<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>


<html>
<head>
 	<meta charset="UTF-8">
    
    <title>공지사항 읽기 </title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/noticeS.css">
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    
<title>공지사항 읽기</title>
</head>
<body>

<div class="card">
        <div class="card-header1">
            <h1><a href="/notice">공지사항</a></h1>
        </div>
        	<input type="hidden" name="num" value='<c:out value="${noticeBoard.noNum}" />'>
        	<input type="hidden" name="file1Prev" value= '<c:out value="${noticeBoard.file1Path}"'>
        	<input type="hidden" name="file2Prev" value= '<c:out value="${noticeBoard.file1Path}"'>
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요." value='<c:out value="${noticeBoard.empNm}" />'>
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요."  value='<c:out value="${noticeBoard.title}" />'>
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content" value='<c:out value="${noticeBoard.title}" />'></textarea>
	                <div><div></div><div>등록된 첨부파일1 -> <a href='/fileDownload?filename=<c:out value="${noticeBoard.file1Path}" />'><c:out value="${noticeBoard.file1Path}" /></a></div></div>
	                <div><div></div><div>등록된 첨부파일2 -> <a href='/fileDownload?filename=<c:out value="${noticeBoard.file2Path}" />'><c:out value="${noticeBoard.file2Path}" /></a></div></div>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
        	</div>
    </div>
    
    <!-- footer -->
    <footer>
		<ul class="company_infojo">
			<li class="cInfo">주소: 회사 주소</li>
			<li class="cInfo">이메일: info@company.com</li>
			<li class="cInfo">전화번호: 123-456-7890</li>
    </ul>
   </footer>
    
 
</body>
</html>