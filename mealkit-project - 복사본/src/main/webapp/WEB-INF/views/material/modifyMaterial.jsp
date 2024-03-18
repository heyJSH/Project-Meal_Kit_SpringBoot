<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB와 연결 -->
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>
<%@ page import="utils.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조 지시</title>
	 <!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	<!-- reset.css 연결 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<!-- main.css 연결 -->
	<link rel="stylesheet" href="/resources/css/main.css" />


	<!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

	<!-- jQuery 연결 -->
	<script src="/resources/js/jquery-3.7.1.min.js"></script>
	<style>
	@charset "UTF-8";

/* 심신의 안정을 위해 해당 코드는 지우지 말 것 */

body {
	position: relative;
}

.subject {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 50px;
	padding-bottom: 0;
}

.manufaturing {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 200px;
	padding-bottom: 70px;
	margin-bottom: 132px;
}

.manufaturing1 {
	display: flex;
	width: 1200px;
	justify-content: center;
	align-items: center;
	margin: 20px auto;

}



.nowsuppier {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 20px;
	width: 200PX;
	height: 50px;

	font-size: 25px;
}

.nowsuppierbox{
	position: absolute;
	width: 1200px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	top: 150px;
}

.movingbtn1{
	position: absolute;
	right: 160px;
	top: 20px;
	width: 100px;
	height: 20px;
}
.movingbtn2{
	position: absolute;
	right: 50px;
	top: 20px;
	width: 100px;
	height: 20px;
}

.movingbtn3{
	position: absolute;
	right: -50px;
	top: 20px;
	width: 100px;
	height: 20px;
}

.movingbtn4{
	position: absolute;
	right: -140px;
	top: 20px;
	width: 100px;
	height: 20px;
}

.forfooterbox {
	width: 100%;
	height: 118Px;

}


.subject p {
	font-size: 32px;
	font-weight: bold;
}

.manufaturing table {
	position: relative;
	border-collapse: collapse;
	border: 1px solid black;
	width: 1200px;
}

.manufaturing1 table {
	position: relative;
	border-collapse: collapse;
	border: 1px solid black;
	width: 1200px;
}

.manufaturing table th {
	background-color: gray;
	color: white;
	border-collapse: collapse;
	border: 1px solid white;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.manufaturing1 table th {
	background-color: gray;
	color: white;
	border-collapse: collapse;
	border: 1px solid white;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.manufaturing th, .manufaturing td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

.manufaturing1 th, .manufaturing1 td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

.manufaturing .manu_container {
	display: flex;

}

.manufaturing1 .manu_container {
	display: flex;
	margin: 0 auto;
}

.manufaturing .manu_container div {
	margin: 0;
	margin-right: 20px;
}

.manufaturing1 .manu_container div {
	margin-right: -40px;

}


.manufaturing .manu_container .prod_table {
	height: 500px;
}

.manufaturing1 .manu_container .prod_table {
	height: 500px;
}

.manufaturing .manu_container .prod_table table {
	width: 1200px;
}

.manufaturing1 .manu_container .prod_table table {
	width: 1200px;
}

.inst_table .i11 {
	width: 80px;
	border-collapse: collapse;
	border-left: 1px solid black;
}

.manu_container .lot_table .i1{
	width: 90px;
}


.inst_table .i22 {
	width: 185px;
}

.manu_container .lot_table .i2{
	width: 209px;
}

.inst_table .i33 {
	width: 200px;
}

.manu_container .lot_table .i3{
	width: 225px;
}


.inst_table .i44 {
	width: 300px;
}

.manu_container .lot_table .i4{
	width: 340px;
}

.inst_table .i55 {
	width: 30px;
}

.manu_container .lot_table .i5{
	width: 33px;
}



.manufaturing .manu_container .lot_table {
	height: 559px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
	margin-top: -100px;
}

.manufaturing1 .manu_container .lot_table {
	height: 100px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
}


.manufaturing .manu_container .lot_table table {
	width: 1200px;
}

.manufaturing .manu_container .prod_table .view_table {
	overflow-y: scroll;
	width: 100%;
	height: 300px;
	margin: 0;
}

.manufaturing .manu_container .lot_table .inst_table {
	overflow-y: scroll;
	width: 100%;
	height: 300px;
	margin: 0;
}


.insertsuppierbigbox {
	position: absolute;
	width: 1200px;
	height: 350px;
	top: 500px;
	justify-content: center;
	align-items: center;

}

.insertsuppierbox{
	width: 1200px;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;

	margin: 40px auto;
	margin-top: 80px;
	margin-bottom: -20px;
}

.insertsuppier{
	font-size: 25px;
}


.lot_table1 {
	width: 1200px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px auto;
}

.inputsupplierheadbox{
	display: flex;
	justify-content: space-between;
	width: 1200px;
	height: 40px;
	margin-left: 100px;
	margin-right: 100px;

}


.summitbutton222{
	width: 60px;
}

.inputsupplierbox{
	display: flex;
	justify-content: space-between;
	gap: 20px;
}


.inputField22{
	width: 400px;
	height: 20px;
	dispaly: flex;
	justify-content: center;
	text-align: center;
	align-items: center;
}

.i333{
	width: 100px;
}
	</style>
</head>
<body>


	<!-- ============================================================================== -->

	<!-- 본인 컨텐츠는 여기서 쓰면 됩니다 -->
	<header>
		<div class="inner">
			<!-- 로고 이미지 -->
			<a href="./index.jsp" class="logo">
				<img src="./css/images/logo.png" alt="starbucks_logo">
			</a>

			<!-- 위에 있는 서브 메뉴 부분 -->
			<div class="sub-menu">
				<ul class="menu">
					<li>
						<!-- 마이페이지 링크 연결할 것 -->
						<a href="./myPage.jsp">My Page</a>
					</li>
					<li>
						<!-- 로그아웃 링크 연결할 것 -->
						<a href="./logout.jsp">Log Out</a>
					</li>
				</ul>
			</div>

		<!-- 밑에 있는 서브 메뉴 부분 -->
		<ul class="main-menu">
		<% String depNm = (String)session.getAttribute("depNm"); %>

		<!-- 재고 현황은 여기서 수정할 것 -->
		<!-- 재고현황 메뉴는 모든 부서가 접근 가능 -->
   	 	<% if("관리팀".equals(depNm) || "구매팀".equals(depNm) || "생산팀".equals(depNm) || "영업팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">재고현황</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4><a href="./inventoryStatus.jsp">재고 현황</a></h4>
                </li>
              </ul>
            </div>
          </div>
        </li>
          <% } %>

        <!-- 구매관리는 여기서 수정할 것 -->
        <!-- 구매관리 메뉴, 구매팀과 관리팀만 접근 가능 -->
   	    <% if("구매팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">구매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>원자재 DB관리</h4>
                  <ul>
                    <li>
                    	<a href="./modifymaterial.jsp">원자재</a>
                    </li>
                    <li>
                    	<a href="./modifysup.jsp">구매 업체</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>원자재 구매</h4>
                  <ul>
                    <li>
                    	<a href="./firstFinal.jsp">구매</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>계약 현황</h4>
                  <ul>
                    <li>
                    	<a href="./showingPurchase.jsp">계약 현황</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %>

        <!-- 제조관리 수정은 여기서 할 것 -->
        <!-- 제조관리 메뉴, 생산팀과 관리팀만 접근 가능 -->
        <% if("생산팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">제조관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>BOM</h4>
                  <ul>
                    <li>
                    	<a href="./BomList.jsp">BOM 현황</a>
                    </li>
                    <li>
                    	<a href="./bomInsertForm.jsp">BOM 등록</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>제조 관리</h4>
                  <ul>
                    <li>
                    	<a href="./instruction.jsp">제조 지시</a>
                    </li>
                    <li>
                    	<a href="./manufacturing.jsp">제조 수행</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %>


        <!-- 판매 관리는 여기서 수정할 것 -->
        <!-- 판매관리 메뉴, 영업팀과 관리팀만 접근 가능 -->
        <% if("영업팀".equals(depNm) || "관리팀".equals(depNm)) { %>
        <li class="item">
          <div class="item__name">판매관리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>Sales order</h4>
                  <ul>
                    <li>
                    	<a href="./salesOrder_main.jsp">주문서 메인</a>
                    </li>
                    <li>
                    	<a href="./salesOrder_insertForm.jsp">주문서 작성</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <h4>주문서 조회</h4>
                  <ul>
                    <li>
                    	<a href="./salesOrder_select.jsp">조회화면</a>
                    </li>
                    <li>
                    	<a href="./salesOrder_updateForm.jsp">주문서 수정</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <% } %>
			</ul>
		</div>
  </header>

		<div class = "nowsuppierbox">
			<div>
				<div class = "nowsuppier">원자재현황</div>
				<div class = "movingbtn1"><a href = "./firstFinal.jsp">구매계약</a></div>
				<div class = "movingbtn2"><a href = "./modifysup.jsp">업체현황</a></div>
				<div class = "movingbtn3"><a href = "./showingPurchase.jsp">계약현황</a></div>
				<button type="button" class="movingbtn4" data-toggle="modal" data-target="#modifymodal" onClick = "openModifyModal()">
                  재료 수정
                </button>

			</div>
		</div>

		<div class="manufaturing">
		<div class="manu_container">

			<div class="lot_table">
				<div>
					<table>
						<tr>
						<th class="i1">원자재ID</th>
						<th class="i2">원자재명</th>
						<th class="i3">구분</th>
						<th class="i4">수량</th>
						<th class="i5">삭제</th>
				</tr>
				</table>
				<div class="inst_table">
					<table id = "chat">
                     <c:forEach items="${modifyList}" var="modify">
                        <tr id = '<c:out value="${modify.material_Id}"/>'>
                            <td class="i11" id = "materialid" name = "materialid" value = '<c:out value="${modify.material_Id}"/>'><c:out value="${modify.material_Id}"/></td>
                            <td class="i22" id = "materialname" value = '<c:out value="${modify.material_Nm}"/>'><c:out value="${modify.material_Nm}"/></td>
                            <td class="i33" id = "materialclassification" value = '<c:out value="${modify.material_Classification}"/>'><c:out value="${modify.material_Classification}"/></td>
                            <td class="i44" id = "materialquantity" value = '<c:out value="${modify.material_Quantity}"/>'><c:out value="${modify.material_Quantity}"/></td>
                            <td class="i55" id = "materialdeletebtn" style="cursor: pointer" onClick = 'javascript: deleteMaterial(<c:out value="${modify.material_Id}"/>)'>
                                X
                            </td>
                        </tr>
                      </c:forEach>
					</table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Button trigger modal -->



<div class = "forfooterbox">
	<div class = "insertsuppierbigbox">
		<div class = "insertsuppierbox">
			<div class = "insertsuppier">원자재추가</div>
		</div>

<div class="manufaturing1">
	<div class="manu_container">
		<div class="lot_table">
			<div>
				<table>
					<tr>
						<th class="i22">원자재명</th>
						<th class="i33">구분</th>
						<th class="i333">추가</th>

				</tr>
 					<form action = "./insertmaterial.jsp" method="post" id="form5" onSubmit = "return false">
						<tr>
							<td class="i22"><input type="text" class="inputField22" name="material_name" id = "material_name" placeholder="원자재명"></td>
							<td class="i33"><input type="text" class="inputField22" name="classification" id = "classification" placeholder="구분"></td>
							<td class="i333 "><input type="submit" class="summitbutton222" name="submitmaterialdata"  onClick="javascript: prevCheckTextBox();" id = "submitmaterialdata" placeholder="추가"></td>
						</tr>
					</form>

				</table>
			</div>
		</div>
	</div>
</div>
</div>
        <div class="modal fade" id="modifymodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                <!-- 외부 JSP 파일 들어올 자리 (MODAL)
            </div>
          </div>
        </div>




    <%@ include file="../includes/footer.jsp"%>
		<!-- ============================================================================== -->

<script src="/resources/js/reply.js"></script>
<script>

    var materialUL = $("#materialUL");
	function prevCheckTextBox() {
		if (!$('#material_name').val()) {	// 이름 관련 dom
			alert('원자재명을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
			$('#material_name').focus();		// 이름 입력 칸으로 포커스 이동
			
			return;
		}
		if (!$('#classification').val()) {	// 제목 관련 dom
			alert('구분을 입력하세요.');	// 제목 입력하라고 팝업 뜸.
			$('#classification').focus();		// 제목 입력 칸으로 포커스 이동
			
			return;
		}
			
		// 실제 form의 action의 값으로 전송
			document.getElementById('form5').submit();
	}

    function deleteMaterial(material_id) {
        if(confirm("삭제하시겠습니까?")){
        materialService.remove(                        // 백엔드에 ajax로 실제 db로 삭제
            material_id,
            function(count) {
                console.log('count:', count);
                if (count === "success") {
                    //alert("REMOVED");
                     $('#'+ material_id).remove();       // 화면에 삭제처리
                }
            },
            function(err) {
                alert('삭제 ERROR...');
            }
        );
        }

	}

    $('#11').on("Click", function(e){
        const material_name = $('#materialname').val();
        const material_Classification = $('#materialclassification').val();
        const material_Quantity = $('#materialquantity').val();


        function materialUpdate(material_id){
            materialService.update(
                {material_nm: material_name , material_Classification : material_Classification, material_id : material_id},
                function(count) {
                console.log('count:', count);
                if (count === "success") {
                    //alert("update");
                }
                },
                function(err) {
                    alert('수정 ERROR...');
                }
            );
        }
    })

    function openModifyModal(){
        $('.modal-content').load("materialmodal");
        $('.modal-content').modal();
    }


	</script>
	
	
</body>
</html>