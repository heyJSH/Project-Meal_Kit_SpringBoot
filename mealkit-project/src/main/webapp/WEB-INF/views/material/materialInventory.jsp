<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- modal-->
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<style>

</style>
</head>
<body>
      <!--재고-->
    <div class = "contentBox show-first">
        <div class="materialInventoryHeadName">
            <h1 class="materialInventoryHeadNameh1">원자재 재고</h1>
        </div>
        <table>
            <tr>
                <th> 원자재명 </th>
                <th> 구분 </th>
                <th> 수량 </th>
                <th> 삭제 </th>
            </tr>
            <c:forEach items="${materialInventory}" var="material">
            <tr id = 'id<c:out value="${material.material_Id}"/>'>
                <th class = "movingMaterialUpdateBtn" onClick:'javascript: showMaterialModal(<c:out value="${material.material_Id}"/>)'> <c:out value="${material.material_Nm}"/> </th>
                <th> <c:out value="${material.material_Classification}"/> </th>
                <th> <c:out value="${material.material_Quantity}"/> </th>
                <th id = "materialDeleteBtn" onClick = 'javascript: deleteMaterial(<c:out value="${material.material_Id}"/>)' style="cursor:pointer"> 삭제 </th>
            </tr>
            </c:forEach>
        </table>
    <div>
<!-- 첫번째 버튼-->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-bs-name="">재료추가</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">재료 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
          <div class="form-group">
            <label for="material-name" class="col-form-label">재료명:</label>
            <input type="text" class="form-control" id="material_name" name = "material_Nm">
        </div>
        <div class="form-group">
            <label for="material-classification" class="col-form-label">구분:</label>
            <input type="text" class="form-control" id="material_classification" name = "material_Classification">
        </div>
        <div class="form-group">
            <label for="message-text" class="col-form-label">수량:</label>
            <input type="number" class="form-control" id="material_quantity" name = "material_Quantity">
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary materialinsert" id = "materialInsertBtn" type="button">추가</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 두번째 버튼-->
<button type="button" class="btn btn-primary secondBoxForModify" data-toggle="modal" data-target="#exampleModal2" data-bs-name="">재료정보 수정</button>
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">재료 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <div class="modal-body">

          <div class="form-group">
            <label for="material-id" class="col-form-label">재료명:</label>
            <select name = "material_Nm" id = "secondModalBox" onchange="changeselect()" class= "secondModalBox form-control">;

            </select>
          </div>

          <div class = "selectDeleteBox">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id = "materialUpdateBtn" javascript = "materialInfoUpdate()">수정</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
       </form>
    </div>
  </div>
</div>

</body>



<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/reply1.js"></script>
<script>
    function deleteMaterial(material_id) {
        if(confirm("삭제하시겠습니까?")){               // 실제 삭제처리
        materialService.remove(
            material_id,
            function(count) {
                console.log('count:', count);
                if (count === "success") {
                    //alert("REMOVED");
                     $('#id'+ material_id).remove(); // 화면에서 삭제
                }
            },
            function(err) {
                alert('삭제 ERROR...');
            }
        );
        }

	}


   $('#materialUpdateBtn').on("click", function(e) {
        const materialNm = $('#secondModalBox').val();
        const materialId = $('#material_Id_modify').val();
        const materialClassification = $('#material_Classification_modify').val();
        const materialQuantity = $('#material_Quantity_modify').val();


        materialService.update(
            {material_Id : materialId,
             material_Nm: materialNm,
             material_Classification: materialClassification,
             material_Quantity: materialQuantity },
            function(count) {
                console.log('count:', count);
                if (count === "success") {

                }
            },
            function(err) {
                alert('삭제 ERROR...');
            }

        );
    });


    $('#materialInsertBtn').on("click", function(e) {
        const materialNm = $('#material_name').val();
        const materialClassification = $('#material_classification').val();
        const materialQuantity = $('#material_quantity').val();

        // 등록 ajax호출
        materialService.add(
            { material_Nm: materialNm,
              material_Classification: materialClassification,
              material_Quantity: materialQuantity },       // request data
            function(count) {
                console.log('count:', count);
                if (count === "success") {

                location.href = "/purchase/materialinventory";
                }
            },
            function(err) {
                alert('삭제 ERROR...');
            }

        );
    });


    $('#exampleModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget); // Button that triggered the modal
      var recipient = button.data('whatever'); // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this);
      modal.find('.modal-title').text('재료 ' + recipient);
      modal.find('.modal-body input').val(recipient);
      });

  $('#exampleModal2').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var recipient = button.data('whatever'); // Extract info from data-* attributes
    var modal = $(this);
    modal.find('.modal-title').text('재료 ' + recipient);
    modal.find('.modal-body input').val(recipient);
    });

    $(".secondBoxForModify").on('click', function(e){
        var materialUL = $(".secondModalBox");
        var str = "";
        materialService.getList('',
            function(list){

               if(list == null || list.length == 0){       // 댓글 개수가 없을 경우
                    materialUL.html("");
                    return;
                }

                console.log("list.length:",list.length);
                // 댓글 개수가 있을 경우
                 for(var ii = 0, len = list.length || 0; ii < len; ii++){
                     str += "        <option value='" + list[ii].material_Nm  +"'>" + list[ii].material_Nm;
                     str += "        </option>";
                 }
                 materialUL.html(str);  // html 렌더링
            }



        );




              // 댓글 목록 가져와서 화면에 뿌려주는 함수 실행
    });

    function changeselect() {
      var select = document.getElementById("secondModalBox");  // class = material인 데이터를 선택
      var selectValue = select.options[select.selectedIndex].value;   // select element에서 선택된 option의 value가 저장된다.
      console.log("jsp파일 changeselect",selectValue);

      var materialSelectSecond = $(".selectDeleteBox");
      var str = "";
      if(selectValue != null){
            materialService.getListSecond({material_Nm: selectValue},
                  function(result){
                     str +=        "<div class='form-group'>";
                     str +=           "<label for='material-name' class='col-form-label'>재료번호:</label>";
                     str +=           "<input type='text' class='form-control' id='material_Id_modify' name = 'material_Id' value = '" + result.material_Id + "' readonly>";
                     str +=         "</div>";
                     str +=         "<div class='form-group'>";
                     str +=           "<label for='material-classification' class='col-form-label'>구분:</label>";
                     str +=          "<input type='text' class='form-control' id='material_Classification_modify' name = 'material_Classification' value= '" +result.material_Classification+  "'>";
                     str +=         "</div>";
                     str +=         "<div class='form-group'>";
                     str +=           "<label for='message-text' class='col-form-label'>수량:</label>";
                     str +=           "<input type='number' class='form-control' id='material_Quantity_modify' name = 'material_Quantity' value = '" + result.material_Quantity + "'>";
                     str +=         "</div>";
                     str +=     "</div>";

                     materialSelectSecond.html(str);  // html 렌더링

                   }
              );
        }
    }







</script>