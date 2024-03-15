<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<head>
 	<meta charset="UTF-8">
    
    <title>공지사항 글수정</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/noticeS.css">
    <link rel="icon" href="/resources/images/favicon.ico">
    <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
    <script defer src="/resources/js/main.js"></script>
    
<title>공지사항 수정폼</title>
</head>
<body>


<body>
<!-- 헤더 포함 -->
<div>
    <h1 th:text="${notice.title}"></h1>
    <p th:text="${notice.content}"></p>
    <!-- 첨부파일 링크 -->
    <a th:href="@{/fileDownload(filename=${notice.file1_path})}" th:text="${notice.file1_path}">첨부파일 1</a>
    <a th:href="@{/fileDownload(filename=${notice.file2_path})}" th:text="${notice.file2_path}">첨부파일 2</a>
</div>
<!-- 수정 및 삭제 버튼 -->
<!-- 푸터 포함 -->
</body>
</html>

    
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