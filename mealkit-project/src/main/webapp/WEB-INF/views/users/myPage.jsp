<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>마이페이지 링크</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- reset.css 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="./css/main.css" />
	<link rel="stylesheet" href="./css/mainjo.css" />
	<link rel="stylesheet" href="./css/myPage.css" />
	

  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<!-- jQuery 연결 -->
	<script src="./js/jquery-3.7.1.min.js"></script>
	
	<style>

	footer {
	  position: fixed; /* 하단에 고정 */
	  width: 100%;
	  background-color: #3d3d3d;
	  color: white;
	  padding: 10px;
	  text-align: center;
	  align-items: flex-end;
	  bottom: 0;
	 
	}
	
	.company_infojo{
		padding: 10px;
	}
		
	li.cInfo {
		display: inline-block;
		margin: 0 30px;
	}
	
	</style>
	
</head>
<body>
  <!-- header 공통 부분 연결 -->
    <%@ include file ="../includes/header.jsp" %>

  <form class="mypage" method="post" action="updateUserInfo">
 
  <div class="container">      
    <div class="insert">
    	<h1>직원 정보 수정</h1>
	<div class ="insertjo"></div>
	
     <table>
	    <tr>
			<td class="col1">이름</td>
			<td class="col2"><input type="text" name="empNm" value="${employee.emp_nm}" readonly></td>
		</tr>
	    <tr>
			<td class="col1">아이디</td>
			<td class="col2"><input type="text" name="empId" value="${employee.emp_id}" readonly></td>
	    </tr>
	    <tr>
			<td class="col1">비밀번호</td>
			<td class="col2"><input type="password" name="empPw" placeholder="비밀번호 입력" required><br></br>
	            <p style = " font-size:15px; ">※비밀번호는 <span style = " font-size:15px; " class="num"  >문자, 숫자,10 ~ 16자리</span>로 입력이 가능합니다.</p>
	        </td>
	    </tr>
	    <tr>
			<td class="col1">전화번호</td>
			<td class="col2"><input type="text" name="empContact" placeholder="전화번호 입력" required><br></br>
	        <p  style = " font-size:15px; ">※전화번호는 <span  style = " font-size:15px; " class="num">'-'</span>를 포함해서 입력하세요.</p>
	        </td>
	    </tr>
	    <tr> 
	    </tr>
    </table>

		<!-- 성공 메시지 출력 -->
		<c:if test="${not empty successMessage}">
			<script>
				alert('${successMessage}');
			</script>
		</c:if>

    <div class="create">
	  <input class="but3" type="submit" value="정보 수정">
    </div>
  </div>
  </div>
  </form>
  
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
