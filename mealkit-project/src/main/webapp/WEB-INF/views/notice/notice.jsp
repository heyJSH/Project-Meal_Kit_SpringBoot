<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">    
    <title>공지사항</title>
    <link rel="stylesheet" href="css/reset.css">  
    <link rel="icon" href="images/favicon.ico">
    <script defer src="js/jquery-3.7.1.min.js"></script>
    <script defer src="js/main.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/notice.css">
    
  </head>
<body>

	<section class ="inner_jo">
	  <div class="inner sub_tit_wrap">
		  <div class="sub_tit_inner">
	      <h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
		  </div>
		  <div class="news_sch_wrap">
	    <div class="sch_items">
	        <input type="search" name="sch_bar" id="sch_bar" placeholder="검색어를 입력해 주세요." value='<c:out value="${search}" />'>
	        <!-- 검색 버튼 클릭 시 searchText 함수 호출 -->
	        <button type="button" onclick="searchText();">검색</button>
	    </div>
      </div>
	 </div>
  </section>


    <section>
      <div class="inner notice__list">
        <div class="notice__header">
            <div class="notice__no">NO</div>
            <div class="notice__title">제목</div>
            <div class="notice__regdate">날짜</div>
            <div class="notice__hit">조회수</div>

        </div>
        <div class="notice__list__itmes">

</div>

        </div>
        	  <!-- 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
       		  <div class="wr_btn">
              <a href="./noticeInsertForm.jsp">글쓰기</a>
        </div>
   	</div>
	
  </section>
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