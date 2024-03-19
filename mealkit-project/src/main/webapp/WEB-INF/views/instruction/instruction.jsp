    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="./includes/header.jsp"%>
    <link rel="stylesheet" href="./css/instruction.css" />
	<div class="subject">
		<p><a href="/instruction">제조 지시</a></p>
	</div>
	<div class="instruction">
		<div class="table1">
			<div class="sub_table">
				<table>
					<tr>
						<th class="t1_1">제품번호</th>
						<th class="t1_2">제품명</th>
						<th class="t1_3">제품수량</th>
					</tr>
				</table>
			</div>
			<div class="content">
				<table>
				    <c:forEach items="${finishedProductVOList}" var="instProd">
                        <tr>
                            <td class="t1_1"><c:out value="${instProd.product_id}"/></td>
                            <td class="t1_2"><c:out value="${instProd.product_nm}"/><br>(<c:out value="${instProd.product_spec}"/>)</td>
                            <td class="t1_3"><c:out value="${instProd.product_quantity}"/></td>
                        </tr>
                    </c:forEach>
				</table>
			</div>
		</div>
		<div class="table2">
			<div class="sub_table">
                <form action="instruction_btn" method="post">
				    <table>
                        <tr>
                            <th class="t2_1">Lot번호</th>
                            <th class="t2_2">지시자</th>
                            <th class="t2_3">제품번호</th>
                            <th class="t2_4">Lot Size</th>
                            <th class="t2_5">생산량</th>
                            <th class="t2_6">지시일</th>
                            <th class="t2_7">수행일</th>
                            <th class="t2_8">수행자</th>
                            <th class="t2_9">제출버튼</th>
                            <th class="t2_10">완료여부</th>
                        </tr>
						<tr>
							<td class="t2_1"></td>
							<td class="t2_2"><input type="text" id="inst_id" class="inputField" name="inst_id" placeholder="지시자ID"></td>
							<td class="t2_3"><input type="text" id="product_id" class="inputField" name="product_id" placeholder="제품번호"></td>
							<td class="t2_4"><input type="text" id="lot_size" class="inputField" name="lot_size" placeholder="Lot Size"></td>
							<td class="t2_5"></td>
							<td class="t2_6"><input type="date" id="inst_date" class="inputField" name="inst_date" placeholder="지시일"></td>
							<td class="t2_7"></td>
							<td class="t2_8"></td>
							<td class="t2_9"><button id="submitBtn">제출</button></td>
							<td class="t2_10"></td>
						</tr>
				    </table>
                </form>
			</div>
			<div class="content">
				<table>
				    <c:forEach items="${instructionVOList}" var="instruction">
                        <tr>
                            <td class="t2_1"><c:out value="${instruction.lot_id}"/></td>
                            <td class="t2_2"><c:out value="${instruction.inst_nm}"/></td>
                            <td class="t2_3"><c:out value="${instruction.product_id}"/></td>
                            <td class="t2_4"><c:out value="${instruction.lot_size}"/></td>
                            <td class="t2_5"><c:out value="${instruction.output}"/></td>
                            <td class="t2_6"><c:out value="${instruction.inst_date}"/></td>
                            <td class="t2_7"><c:out value="${instruction.manu_date}"/></td>
                            <td class="t2_8"><c:out value="${instruction.manu_nm}"/></td>
                            <td class="t2_9"></td>
                            <td class="t2_10"><c:out value="${instruction.completion}"/></td>
                        </tr>
                    </c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="./js/instruction.js"></script>
	<%@ include file="./includes/footer.jsp" %>
