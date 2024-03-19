<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- modal-->

<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>구매관리 구매하기</title>
<style>
        .h {
            margin-top: 180px;
            width: 1200px;
            height: 400px;
        }

        .functionbox {
            width: 1200px;
            height: 400px;
            margin: 100px auto;
            position: relative;
        }

        .firstfunctionname {
            margin: 50px auto;
            font-size: 25px;
            width: 100px;
            height: 30px;
            display: flex;
            justify-content: center;
            text-align: center;
        }

        .bigfunctionbox {
            width: 800px;
            height: 200px;
            display: flex;
            justify-content: center;
            margin: 20px auto;
            position: relative;
            gap: 100px;
        }

        .firstselect, .secondselect {
            display: flex;
            width: 250px;
            height: 50px;
            align-items: center;
        }

        .sename1, .sename2, .sename3 {
            width: 180px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .select1, .supplier {
            width: 200px;
            padding: .5em .4em;
            font-family: inherit;
            background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
            border: 1px solid #333;
            border-radius: 10px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .inputnumber {
            display: flex;
            width: 300px;
            height: 50px;
            border-radius: 10px;
        }

        .quantity {
            width: 100px;
        }

        .buybutton {
            position: absolute;
            bottom: 90px;
            right: -30px;
        }

        .finish {
            width: 50px;
            height: 30px;
            text-align: center;
            color: white;
            border: 0;
            border-radius: 30px;
            background-color: black;
            font-size: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s;
        }

        .finish:hover {
            background-color: royalblue;
            color: black;
            border: #fff;
        }

        .movingbox {
            position: absolute;
            width: 300px;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 30px;
            right: 200px;
            top: 290px;
        }

        .movingbutton {
            width: 115px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mnt {
            width: 110px;
            height: 30px;
            font-size: 17px;
            color: white;
            background-color: grey;
            transition: all 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mnt:hover {
            background-color: royalblue;
            color: black;
            border: #fff;
        }

        .secondlongbox {
            width: 800px;
            height: 40px;
        }

        .sup1info {
            width: 800px;
            height: 20px;
            font-size: 16px;
            margin-left: -100px;
        }

        .sup1info 1 {
            width: 150px;
            border-bottom: 1px solid black;
            background-color: RED;
        }

</style>
</head>
<body>

 <form action = "./insertdata" method="post" id="form2" onSubmit = "return false">
 <div id = "full_box">
	<DIV class = "h">

	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        <span aria-hidden = "true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
        <div class = "functionbox">
            <div class = "firstfunctionname">주문하기</DIV>
            <div class = "bigfunctionbox">
                <div class = "firstselect">
                    <div class = "sename1">원자재: </div>
                         <select name = "materialnm" id = "materialnm" onchange="changeselect()" class= "select1">
                            <c:forEach items="${materialPurchase}" var="purchase">
                                 <option value= '<c:out value="${purchase.material_Nm}"/>' <c:out value="${purchase.material_Nm}"/>== null ? "selected" : (<c:out value="${purchase.material_Nm}"/>.equals("돼지고기") ? "selected" : "") >
                                    <c:out value="${purchase.material_Nm}"/>
                                 </option>
                            </c:forEach>
                        </select>
                </div>
                <div class = "secondselect">
                    <div class = "sename2">공급업체:&ensp; </div>
                    <select name = "supplier" class= "supplier" id = "supplier" onchange = "changeselectsecond()";>

                    </select>
                 </div>
                <div class = "inputnumber">
                    <div class = "sename3">수량입력: </div>
                    <input type = "number" class = "quantity" id = "quantity" name = "quantity">
                </div>
                <div class = "buybutton">
                    <input type = "submit" class = "finish" value = "구입" onClick="javascript: prevCheckTextBox()">
                </div>
            </div>
        </div>

        <div class = "secondlongbox">
            <div class= "sup1info 1">● 업체ID: </div>
        </div>
        <div class = "secondlongbox">
            <div class= "sup1info 2">● 업체명: </div>
        </div>
        <div class = "secondlongbox">
            <div class= "sup1info 3">● 전화번호: </div>
        </div>
        <div class = "secondlongbox">
            <div class= "sup1info 4">● 주소: </div>
        </div>
        <div class = "secondlongbox">
            <div class= "sup1info 5">● EMAIL: </div>
        </div>
        <div class = "secondlongbox">
            <div class= "sup1info 6">● 판매제품: </div>
        </div>
    </div>


	</div>
	</div>

</form>
</div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>




				

<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/reply1.js"></script>
<script>


 function changeselect() {

	var select = document.getElementById("materialnm");  // class = material인 데이터를 선택
	var selectValue = select.options[select.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
	console.log("jsp파일" ,selectValue)

     var str = "";
     if(selectValue != null){
     var supplier = $(".supplier");
          materialService.getPurchaseSupplier({material_Nm: selectValue},
              function(list){

                 if(list == null || list.length == 0){       // 업체가 없을 경우
                      supplier.html("");
                      return;
                  }

                  console.log("list.length:",list.length);
                  // 댓글 개수가 있을 경우
                   for(var ii = 0, len = list.length || 0; ii < len; ii++){
                       str += "        <option value='" + list[ii].sup_Name  +"'>" + list[ii].sup_Name;
                       str += "        </option>";
                   }
                   supplier.html(str);  // html 렌더링

              }
          );
          console.log($('#material').val());
	}

 }

 
  function changeselectsecond() {
	var select1 = document.getElementById("supplier");  // class = material인 데이터를 선택
	var selectValue1 = select1.options[select1.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.

  }







	function prevCheckTextBox() {
		// 실제 FORM의 action의 값으로 전송
 		if(!$('#materialnm').val()){
				alert('원자재을 선택하세요.'); // 이름 입력하라고 팝업 뜸
				$('#materialnm').focus();
				return;
		} 
		
 		else if(!$('.supplier').val()){
			alert('공급업체을 선택하세요.'); // 이름 입력하라고 팝업 뜸
			$('.supplier').focus();
			return;
			} 

	
 		else if(!$('.quantity').val()){
			alert('수량을 입력하세요.'); // 이름 입력하라고 팝업 뜸
			$('.quantity').focus();
			return;
		}
 		else if($('.quantity').val()%100!=0){
			alert('100단위로 입력하세요.'); // 이름 입력하라고 팝업 뜸
			$('.quantity').focus();
			return;
		}

 		document.getElementById('form2').submit();
	}
</script>

</body>
</html>