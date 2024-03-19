    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="./includes/header.jsp"%>
    <link rel="stylesheet" href="./css/manufacturing.css" />
	<div class="subject">
		<p><a href="/manufacturing">제조 수행</a></p>
	</div>
	<div class="manufacturing">
		<div class="table5">
			<div class="table1">
				<div class="sub_table">
					<table>
						<tr>
							<th class="t1_1">Lot번호</th>
							<th class="t1_2">지시자</th>
							<th class="t1_3">제품번호</th>
							<th class="t1_4">Lot Size</th>
							<th class="t1_5">생산량</th>
							<th class="t1_6">지시일</th>
							<th class="t1_7">수행일</th>
							<th class="t1_8">수행자</th>
							<th class="t1_9">완료버튼</th>
						</tr>
					</table>
				</div>
				<div class="content">
					<table>
					</table>
				</div>
			</div>
		</div>
		<div class="table4">
			<div class="table2">
				<div class="sub_table">
					<table>
						<tr>
							<th class="t2_1">제품번호</th>
							<th class="t2_2">제품명</th>
							<th class="t2_3">제품수량</th>
							<th class="t2_4">재료현황</th>
						</tr>
					</table>
				</div>
				<div class="content">
					<table>
					</table>
				</div>
			</div>
			<div class="table3">
				<div class="sub_table">
					<table>
						<tr>
                            <th class="t3_1">재료번호</th>
                            <th class="t3_2">재료명</th>
                            <th class="t3_3">재고수량</th>
                            <th class="t3_4">표준량</th>
                            <th class="t3_5">LOT(1000) 기준</th>
                        </tr>
                    </table>
                </div>
                <div class="content">
					<table>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="./js/manufacturing.js"></script>
	<%@ include file="./includes/footer.jsp" %>
