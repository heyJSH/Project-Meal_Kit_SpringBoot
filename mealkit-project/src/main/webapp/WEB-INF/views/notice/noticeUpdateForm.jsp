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
    
    <title>공지사항 글수정</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/noticeS.css">
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    
<title>공지사항 수정폼</title>
</head>
<body>

<div class="card">
        <div class="card-header1">
            <h1><a href="/notice">글 내용 수정</a></h1>
        </div>
        	<input type="hidden" name="num" value="<%= num %>">
        	<input type="hidden" name="file1Prev" value="<%= fileName1 == null ? "" : fileName1 %>">
        	<input type="hidden" name="file2Prev" value="<%= fileName2 == null ? "" : fileName2 %>">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요." value="<%= name %>">
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요."  value="<%= title %>">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content" id="content"><%= content %></textarea>
	                <div><div>1. <input type="file" name="filecontent1" id="filecontent1"></div><div>등록된 첨부파일1 -> <a href="./fileDownload.jsp?filename=<%= fileName1 %>"><%= fileName1 %></a></div></div>
	                <div><div>2. <input type="file" name="filecontent2" id="filecontent2"></div><div>등록된 첨부파일2 -> <a href="./fileDownload.jsp?filename=<%= fileName2 %>"><%= fileName2 %></a></div></div>
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
	        	<button id="de_name" style="cursor: pointer;" onClick="javascript: noticeDelete(<%= noNum %>);">삭제</button>
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
    
    <script>
    	function prevCheckTextBox() {
    		if (!$('#korname').val()) {	
    			alert('이름을 입력하세요.');	
    			$('#korname').focus();		
    			
    			return;
    		}
    		if ($('#korname').val().length > 5) { 
    			alert('이름을 5자 이내로 입력해 주세요.');	
    			$('#korname').focus();		
    			
    			return;
    		}
    		if (!$('#title').val()) {	
    			alert('제목을 입력하세요.');
    			$('#title').focus();		
    			
    			return;
    		}
    		if (!$('#content').val()) {	
    			alert('내용을 입력하세요.');	
    			$('#content').focus();		
    			
    			return;
    		}
    		
    		// 실제 form의 action의 값으로 전송
   			document.getElementById('form1').submit();
    	}
    	
    	function noticeDelete(noticeNum) {
        	if (confirm('정말 삭제하시겠습니까?')) {
        		location.href = "./noticeDelete.jsp?num=" + noticeNum;
        		}
        	}
    			
    	
    </script>
</body>
</html>