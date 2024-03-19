    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="./includes/header.jsp"%>
    <link rel="stylesheet" href="./css/employees.css" />
	<div class="subject">
		<p><a href="/employees">사원 관리</a></p>
	</div>
	<div class="employees">
		<div class="table">
			<div class="sub_table">
				<table>
					<tr>
						<th class="t1">사원번호</th>
						<th class="t2">비밀번호</th>
						<th class="t3">사원명</th>
						<th class="t4">연락처</th>
						<th class="t5">부서번호</th>
						<th class="t6">부서명</th>
						<th class="t7">직책</th>
						<th class="t8">완료버튼</th>
					</tr>
					<form action="employees_btn" method="post">
						<tr>
							<td class="t1"></td>
							<td class="t2"></td>
							<td class="t3"><input type="text" class="inputField" name="emp_nm" placeholder="사원명"></td>
							<td class="t4"><input type="text" class="inputField" name="emp_contact" placeholder="연락처"></td>
							<td class="t5"><input type="text" class="inputField" name="dep_id" id="dep_id" placeholder="부서번호"></td>
							<td class="t6"><input type="hidden" name="dep_nm" id="dep_nm"></td>
							<td class="t7"><input type="text" class="inputField" name="emp_role" placeholder="직급"></td>
							<td class="t8"><button id="addBtn">사원추가</button></td>
						</tr>
					</form>
				</table>
			</div>
			<div class="content">
				<table>
				    <c:forEach items="${employeesVOList}" var="employees">
                        <tr>
                            <td class="t1"><c:out value="${employees.emp_id}"/></td>
                            <td class="t2"><c:out value="${employees.emp_pw}"/></td>
                            <td class="t3"><c:out value="${employees.emp_nm}"/></td>
                            <td class="t4"><c:out value="${employees.emp_contact}"/></td>
                            <td class="t5"><c:out value="${employees.dep_id}"/></td>
                            <td class="t6"><c:out value="${employees.dep_nm}"/></td>
                            <td class="t7"><c:out value="${employees.emp_role}"/></td>
                            <td class="t8"></td>
                        </tr>
                    </c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="./js/employees.js"></script>
	<%@ include file="./includes/footer.jsp" %>
