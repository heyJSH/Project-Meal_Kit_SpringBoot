<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

	.headerM{width:1100px; box-sizing: border-box; text-align:right; font-style: italic; font-size: larger; font-weight: 600}
	.containerM{border:1px solid #666; background-color: #bbb;
		padding: 40px 0; box-sizing: border-box; height: 741px}
	.theader{background-color: darkblue; color: white; margin: 0 auto}
	.order{background-color: white; margin: 0 auto}
	.responsible{background-color: white; margin-left: 50px; border-collapse:collapse; border: 1px solid #fff }
	.selecter{margin:20px 20px 20px 50px}
	tr{height: 22px; background-color: gray; color: white;}
	.responsible th{border-collapse:collapse; border: 1px solid #fff;}
	.order th{border-collapse:collapse; border: 1px solid #fff; box-sizing: border-box; width:130px}
	.order td{width:130px; }
	.memo{margin:60px; font-size:14px; color: #966; font-weight:800}
</style>

<title>Sales order insert form</title>
</head>
<body>

  <%@ include file="/WEB-INF/views/includes/header.jsp" %>
	
<section class="hello_World">
<!-- ================================================================================ -->

<div class="containerM">

<div class="headerM"><h2><a href="/board/main">Sales order insert</a></h2></div>

	<form action="/board/inserter" method="post">

	<table class="responsible" border=1>
	  <tr>
		<th>담당자 번호</th>
		<th>담당자 명</th>
	  </tr>
	  
	  <tr>
	  	<td><input type="number" name="emp_id"></td>
	  	<td><input type="text" name="emp_nm"></td>
	  </tr>
	</table>
	

	<div class="selecter">
		<input type = "button" value="조회" onClick="location.href='selector'">
		<input type = "reset" value="취소">
		<input type = "submit" value="완료">

	</div>

	<table class="order" border=1>
	  <thead>
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
	  </thead>		
	</table>
	

		<table class="order" border=1>
		  <tbody>
		  <tr>
				<td><input type="number" name="order_num" style="width:94%"></td>
				<td><input type="number" name="cust_id" style="width:94%"></td>
				<td><input type="text" name="cust_name" style="width:94%"></td>
				<td><input type="number" name="product_id" style="width:94%"></td>
				<td><input type="text" name="product_name" style="width:94%"></td>
				<td><input type="number" name="quantity" style="width:94%"></td>
				<td><input type="date" name="order_date" style="width:96%"></td>
				<td><input type="date" name="requst_date" style="width:96%"></td>
				<td><input type="text" style="width:95%"></td>		
			</tr>		

		  <tr>
                <td><input type="number" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="text" style="width:95%"></td>
            </tr>

		  <tr>
                <td><input type="number" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="text" style="width:95%"></td>
            </tr>

		  <tr>
                <td><input type="number" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="text" style="width:94%"></td>
                <td><input type="number" style="width:94%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="date" style="width:96%"></td>
                <td><input type="text" style="width:95%"></td>
            </tr>

		  </tbody>			
		</table>	
	</form>
	<h6 class="memo">※ 담당자 정보를 반드시 기재하여 주십시오</h6>
</div>
</section>

	<!-- ============================================================================== -->

</body>

	<!-- footer 공통 부분 연결 -->
   	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</html>