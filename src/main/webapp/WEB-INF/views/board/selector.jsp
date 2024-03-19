<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import="java.net.http.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

	.headerM{width:1100px; box-sizing: border-box; text-align:right; font-style: italic; font-size: larger; font-weight: 600}
	.containerM{border:1px solid #666; background-color: #bbb;
		padding: 40px 0; box-sizing: border-box; height: 741px}
	.theader{background-color: darkblue; color: white; margin: 0 auto}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box; width:130px}

	.responsible{background-color: white; margin-left: 50px; border-collapse:collapse; border: 1px solid #fff }
	.selecter{margin:20px 20px 20px 50px}
	tr{height: 22px; background-color: gray; color: white;}
	.responsible th{border-collapse:collapse; border: 1px solid #fff;}
	.order{background-color: white; margin: 0 auto}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box;}
	.order2 td{border-collapse:collapse; border: 2px double #999; box-sizing: border-box;width:130px; 
		background-color:white; color: black; text-align: center}
	.containerM .reviewT{width: 1188px; height:366px; overflow-y:scroll; margin: 0 0 0 45px; box-sizing: content-box}

</style>
<title>Sales order select</title>

</head>
<body>

  <%@ include file="/WEB-INF/views/includes/header.jsp" %>
	
<section class="hello_World">
<!-- =============================================================================== -->


<div class="containerM">

<div class="headerM"><h2><a href="/board/main">Sales order review</a></h2></div>


	<table class="responsible" border=1>
	  <tr>
		<th>담당자 번호</th>
		<th>담당자 명</th>
	  </tr>
	  <tr>
	  	<td><input type="number"></td>
	  	<td><input type="text"></td>
	  </tr>
	</table>

	
	<div class="selecter">
		<input type = "button" value="입력" onClick="location.href='inserter'">
		<input type = "button" value="수정" onClick="location.href='updater'">
	</div>

<!-- ============================================================================== -->

	<div>
	    <div>
		<table class="order">
		  	<tr>
				<th>주문번호</th>
				<th>고객번호</th>
				<th>고객명</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>주문일</th>
				<th>요청일</th>
				<th>비고</th>
			</tr>
		  </table>
		  </div>
		 <div class="reviewT">
		  <table class="order2">
			<c:forEach items="${boardVOList}" var="board">
                <tr>
                    <td><c:out value="${board.order_num}"/></td>
                    <td><c:out value="${board.cust_id}"/></td>
                    <td><c:out value="${board.cust_name}"/></td>
                    <td><c:out value="${board.product_id}"/></td>
                    <td><c:out value="${board.product_name}"/></td>
                    <td><c:out value="${board.quantity}"/></td>
                    <td><c:out value="${board.order_date}"/></td>
                    <td><c:out value="${board.requst_date}"/></td>
                    <td><button onClick='javascript: noticeDelete(<c:out value="${board.order_num}" />);'>삭제</button></td>
                </tr>
              </c:forEach>
            </table>
          </div>
	</div>
<!-- ============================================================================== -->


	<!-- footer 공통 부분 연결 -->
	
</div>

</section>
<script>

    const deleteSuccessCount = '<c:out value="${deleteSuccessCount}" />'
    if(deleteSuccessCount) {
        alert('성공적으로 삭제되었습니다.');
    }

    function noticeDelete(noticeOrder_num) {
        if (confirm('정말 삭제하시겠습니까?')) {
            console.log(noticeOrder_num);
            var newForm = $('<form name="newForm" method="post" action="/board/deleter"></form>');
            newForm.append($('<input/>', {type: 'hidden', name: 'order_num', value: noticeOrder_num }));
            newForm.appendTo('body');

            // submit form
            newForm.submit();
        }
    }

</script>

   	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>