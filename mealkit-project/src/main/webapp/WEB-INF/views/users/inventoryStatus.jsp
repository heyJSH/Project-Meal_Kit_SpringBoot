    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="./includes/header.jsp"%>
    <link rel="stylesheet" href="./css/inventoryStatus.css" />
	<div class="subject">
		<p><a href="inventoryStatus">재고 현황</a></p>
	</div>
	<div class="inventoryStatus">
		<div class="full_box">
		    <div class="small_box">
		        <div>
			        <p>
				        완제품
			        </p>
		        </div>
		    <div class="table">
			    <div class="up">
				    <table border="1">
					    <tr>
						    <th class="t1">제품번호</th>
						    <th class="t2">제품명</th>
						    <th class="t3">제품수량</th>
					    </tr>
				    </table>
			    </div>
			    <div class="content">
				    <table border="1">
				        <c:forEach items="${finishedProductVOList}" var="invenProd">
                            <tr>
                                <td class="t1"><c:out value="${invenProd.product_id}"/></td>
                                <td class="t2"><c:out value="${invenProd.product_nm}"/> (<c:out value="${invenProd.product_spec}"/>)</td>
                                <td class="t3"><c:out value="${invenProd.product_quantity}"/></td>
                            </tr>
                        </c:forEach>
				    </table>
			    </div>
			</div>
	    </div>
	    <div class="small_box">
			<div>
				<p>
					재료
				</p>
			</div>
			<div class="table">
			    <div class="up">
				    <table border="1">
					    <tr>
						    <th class="t1">재료번호</th>
						    <th class="t2">재료명</th>
						    <th class="t3">재료수량</th>
					    </tr>
				    </table>
			    </div>
			    <div class="content">
				    <table border="1">
				        <c:forEach items="${invenMateVOList}" var="invenMate">
                            <tr>
                                <td class="t1"><c:out value="${invenMate.material_id}"/></td>
                                <td class="t2"><c:out value="${invenMate.material_nm}"/></td>
                                <td class="t3"><c:out value="${invenMate.material_quantity}"/> <c:out value="${invenMate.quantity_units}"/></td>
                            </tr>
                        </c:forEach>
				    </table>
			    </div>
		    </div>
	    </div>
	</div>
    <%@ include file="./includes/footer.jsp" %>
