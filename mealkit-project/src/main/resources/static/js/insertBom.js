/* 가격 Format */
function formatPrice(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
}

/* 각 단계의 메뉴와 폼을 배열로 저장 */
const stepMenus = [
  document.querySelector('.formbold-step-menu1'),
  document.querySelector('.formbold-step-menu2'),
  document.querySelector('.formbold-step-menu3'),
  document.querySelector('.formbold-step-menu4')
];

const formSteps = [
  document.querySelector('.formbold-form-step-1'),
  document.querySelector('.formbold-form-step-2'),
  document.querySelector('.formbold-form-step-3'),
  document.querySelector('.formbold-form-step-4')
];

/* 버튼 */
const formSubmitBtn = document.querySelector('.formbold-btn');					// 다음, Submit
const formBackBtn = document.querySelector('.formbold-back-btn');				// 뒤로 가기
const plusMatBtn = document.querySelector('.formbold-plusMat-btn');			// 재료 추가
const newMatConfirmBtn = document.querySelector('.newMaterialConfirm');	// 재료 추가 모달 확인
const plusSupBtn = document.querySelector('.formbold-plusSup-btn');			// 업체 추가
const newSupConfirmBtn = document.querySelector('.newSupplierConfirm');	// 업체 추가 모달 확인
const allConfirmBtn = document.querySelector('.allConfirmBtn');					// 동의 버튼
const allDenyBtn = document.querySelector('.allDenyBtn');								// 비동의 버튼

/* Form */
const form = document.querySelector('form');	// 모든 내용을 담아서 'POST"로 컨트롤러에 보낼 form

/* 처음에는 [뒤로가기], [재료추가], [업체추가], 재료목록, 업체목록 숨기기 */
$(formBackBtn).hide();			// [뒤로가기] 버튼 비활성화
$(plusMatBtn).hide();				// [재료추가] 버튼 비활성화
$(plusSupBtn).hide();				// [업체추가] 버튼 비활성화
$('.newMatLists').hide();		// 재료 추가 전에는 비활성화
$('.newSupLists').hide();		// 업체 추가 전에는 비활성화
$('.watchProdInfo').hide();	// 제품 정보 비활성화

/* 각 단계를 활성화시키는 함수 */
function activateStep(currentIndex, nextIndex) {
  stepMenus[currentIndex].classList.remove('active');
  stepMenus[nextIndex].classList.add('active');
  formSteps[currentIndex].classList.remove('active');
  formSteps[nextIndex].classList.add('active');
}

/* 버튼 클릭 시, 기본 동작 방지 */
function preventDefaultOnClick(event) {
	event.preventDefault();
}
allConfirmBtn.addEventListener("click", preventDefaultOnClick);
allDenyBtn.addEventListener("click", preventDefaultOnClick);

/* 저장할 데이터 배열 생성 */
const prodDataArray = [];
	let prodTableBody;
	let newprodRow;
const matDataArray = [];
	let matData;
	let matTableBody;
	let newMatRow;
const supDataArray = [];
	let supData;
	let supTableBody;
	let newSupRow;

/* "다음" 버튼 클릭 시 실행되는 함수 */
formSubmitBtn.addEventListener("click", function(event){
  event.preventDefault();	// 기본 동작 방지
  
  // 현재 활성화된 메뉴에 따라 작동여부 설정
  if(stepMenus[0].classList.contains('active')) {
		// 빈 입력칸이 있으면 이동 불가능
		if(!$('#prodNm').val()) {		// 제품명 관련 dom
			alert('제품명을 입력하세요.');
			$('#prodNm').focus();
			
			return;
		}
		if(!$('#prodDiv').val()) {		// 제품종류 관련 dom
			alert('제품 종류를 입력하세요.');
			$('#prodDiv').focus();
			
			return;
		}
		if(!$('#prodSpec').val()) {		// 제품규격 관련 dom
			alert('제품 규격을 입력하세요.');
			$('#prodSpec').focus();
			
			return;
		}
		if(!$('#prodPrice').val()) {		// 제품가격 관련 dom
			alert('제품 가격을 입력하세요.');
			$('#prodPrice').focus();
			
			return;
		}
		// 입력된 가격이 숫자가 아닌 경우 알림창 표시
		if (!/^\d+$/.test( $('#prodPrice').val() )) {
      alert('제품 가격은 숫자만 입력하세요.');
      return;
    }
    
    // 입력된 가격을 숫자(Long) 형태로 변환하여 저장
		const prodPrice = parseInt($('#prodPrice').val().replace(/[^0-9]/g, ''));
		
		// 1단계에서 저장할 데이터
    const prodData = {
      prodNm: $('#prodNm').val(),
      prodDiv: $('#prodDiv').val(),
      prodSpec: $('#prodSpec').val(),
      prodPrice: prodPrice
    };
    // 제품 데이터 배열에 추가
    prodDataArray.push(prodData);
    console.log('1단계 데이터:', prodData);
    
    // 첫 번째 단계에서 두 번째 단계로 이동
    activateStep(0, 1);
    $(formBackBtn).show();			// "뒤로 가기" 버튼 활성화
    $(plusMatBtn).show();				// "재료 추가" 버튼 활성화
    $('.watchProdInfo').show();	// "제품 정보" 활성화
    removeModalTrigger();				// "모달 트리거" 제거
    // 두 번째 단계에서 제품 정보 조회 시 가격 형식 변환 적용
		$("#prodPrice").val(formatPrice(prodDataArray[0].prodPrice));
    // 1단계에서 저장한 제품 데이터를 2단계에서 조회
		console.log('2단계로 넘어간 1단계 데이터:', prodData);
    $("#prodNm").val(prodDataArray[0].prodNm);
    $("#prodDiv").val(prodDataArray[0].prodDiv);
    $("#prodSpec").val(prodDataArray[0].prodSpec);
    $("#prodPrice").val(formatPrice(prodDataArray[0].prodPrice));
    // 테이블에 입력한 제품 정보 추가
    prodTableBody = $('.prodTable tbody');
		newprodRow = `<tr>
										  <td>${prodDataArray[0].prodNm}</td>
										  <td>${prodDataArray[0].prodDiv}</td>
										  <td>${prodDataArray[0].prodSpec}</td>
										  <td>${formatPrice(prodDataArray[0].prodPrice)}</td>
  								</tr>`;
		prodTableBody.append(newprodRow);
		
  } else if(stepMenus[1].classList.contains('active')) {
    if ($('.newMatLists:visible').length === 0) {		// 재료 목록이 없으면 다음 단계로 넘어갈 수 없음
			alert('재료를 추가해야 합니다.');
		} else {
			// 두 번째 단계에서 세 번째 단계로 이동
			$("#prodPrice").val(prodDataArray[0].prodPrice);	// 세 번째 단계부터는 가격을 숫자 형태로 표시
			activateStep(1, 2);
	    $(plusMatBtn).hide();				// "재료 추가" 버튼 비활성화
	    $(plusSupBtn).show();				// "업체 추가" 버튼 활성화
	    $('.watchProdInfo').hide();	// 제품 정보 비활성화
	    removeModalTrigger2();			// "모달 트리거" 제거
	    $('.MatListTitle').css({		// form3에서 재료 리스트의 css 변경
	    	'margin-top': '0',
	      'padding-top': '0',
	      'border-top': 'none'
	    });
	    // 전 단계에서 저장한 재료 데이터를 3단계에서 조회
	    console.log('3단계로 넘어온 1단계 데이터:', prodDataArray);
	    console.log('3단계로 넘어온 2단계 데이터:', matDataArray);
		}
  } else if(stepMenus[2].classList.contains('active')) {
    // 세 번째 단계에서 네 번째 단계로 이동
    if ($('.newSupLists:visible').length === 0) {		// 업체 목록이 없으면 다음 단계로 넘어갈 수 없음
			alert('업체를 추가해야 합니다.');
		} else {
			activateStep(2, 3);
	    $(plusSupBtn).hide();				// "업체 추가" 버튼 비활성화
	    $('.newMatLists').hide();		// 재료 목록 비활성화
	    $('.newSupLists').hide();		// 업체 목록 비활성화
	    // 4단계에서 모든 데이터 조회
	    console.log('4단계로 넘어온 1단계 데이터:', prodDataArray);
	    console.log('4단계로 넘어온 2단계 데이터:', matDataArray);
	    console.log('4단계로 넘어온 3단계 데이터:', supDataArray);
      // console.log('4단계에서 조회할 데이터:', prodDataArray, matDataArray, supDataArray);
	    formSubmitBtn.textContent = 'Submit'; 			// "다음" 버튼 텍스트 변경
		}
  } else if(stepMenus[3].classList.contains('active')) {
    // 네 번째 단계에서 폼 제출
    // 만약 비동의 상태에서 Submit 클릭 시, alert('BOM 등록을 위해 동의해야 합니다.');
    if(allDenyBtn.classList.contains('active')) {
			alert('BOM 등록을 위해 동의해야 합니다.');
		} else {
			/*console.log('matNm', document.getElementById('matNm').value);
			
			form.submit();*/
			
			// FormData 객체 생성
        var formData = new FormData();

        // 재료 정보를 폼 데이터에 추가
        for (var i = 0; i < matDataArray.length; i++) {
            formData.append('materials[' + i + '].matNm', matDataArray[i].matNm);
            formData.append('materials[' + i + '].matDiv', matDataArray[i].matDiv);
            formData.append('materials[' + i + '].quantityUnits', matDataArray[i].quantityUnits);
            formData.append('materials[' + i + '].bomProdQuantity', matDataArray[i].bomProdQuantity);
        }

        // 업체 정보를 폼 데이터에 추가
        for (var j = 0; j < supDataArray.length; j++) {
            formData.append('suppliers[' + j + '].supNm', supDataArray[j].supNm);
            formData.append('suppliers[' + j + '].supContact', supDataArray[j].supContact);
            formData.append('suppliers[' + j + '].supAddress', supDataArray[j].supAddress);
            formData.append('suppliers[' + j + '].supEmail', supDataArray[j].supEmail);
            formData.append('suppliers[' + j + '].supSell', supDataArray[j].supSell);
        }

        // AJAX 요청 설정
        $.ajax({
            type: "POST",
            url: "/bom/registerBom",
            data: formData, // FormData 객체 전달
            processData: false, // 데이터 처리 방지
            contentType: false, // 콘텐츠 유형 설정 방지
            success: function(response) {
                console.log(response);
                alert("BOM 등록 성공");
            },
            error: function(xhr, status, error) {
						    if(xhr.responseText) {
						        console.error(xhr.responseText);
						        alert("BOM 등록 에러: " + xhr.responseText); // 서버로부터 반환된 메시지 출력
						    } else {
						        console.error("서버에서 응답을 받지 못했습니다."); // 서버 응답이 없는 경우에 대한 처리
						        alert("서버 응답이 없습니다. 관리자에게 문의하세요.");
						    }
						}

        });
		}
  }
});

/* form을 NewBomDao.java에 submit 하는 함수 */
/*function newBomSubmit() {
	document.querySelector('form').submit();
}*/

/* "뒤로" 버튼 클릭 시 실행되는 함수 */
formBackBtn.addEventListener("click", function(event){
  event.preventDefault();

  // 현재 활성화된 메뉴에 따라 이전 단계로 이동
  for (let i = 1; i < stepMenus.length; i++) {
    if (stepMenus[i].classList.contains('active')) {
      activateStep(i, i - 1);
      break;
    }
  }

  // 첫 번째 단계
  if (stepMenus[0].classList.contains('active')) {
    $(formBackBtn).hide();			// "뒤로 가기" 버튼 비활성화
    $(plusMatBtn).hide();				// "재료 추가" 버튼 비활성화
    $('.newMatLists').hide();		// 재료 목록 비활성화
    $('.watchProdInfo').hide();	// 제품 정보 비활성화
    $("#prodPrice").val(prodDataArray[0].prodPrice);		// 가격을 숫자 형태로 표시
  }
  // 두 번째 단계
  if (stepMenus[1].classList.contains('active')) {
		$(plusMatBtn).show();				// "재료 추가" 버튼 활성화
		$(plusSupBtn).hide();				// "업체 추가" 버튼 비활성화
		$('.watchProdInfo').show();	// 제품 정보 활성화
		$('.newMatLists').show();		// 재료 목록 활성화
		$('.newSupLists').hide();		// 업체 목록 비활성화
		$("#prodPrice").val(formatPrice(prodDataArray[0].prodPrice));		// 두 번째 단계에서 제품 정보 조회 시 가격 형식 변환 적용
		$('.MatListTitle').css({		// form2에서 재료 리스트의 css 변경
			'margin-top': '4%',
      'padding-top': '3%',
      'border-top': '1px solid #DDE3EC'
    });
	}
	// 세 번째 단계
	if (stepMenus[2].classList.contains('active')) {
		$(plusSupBtn).show();				// "업체 추가" 버튼 활성화
		$('.newMatLists').show();		// 재료 목록 활성화
		$('.newSupLists').show();		// 업체 목록 활성화
		formSubmitBtn.textContent = 'Next Step';  // "다음" 버튼 텍스트 변경
    formSubmitBtn.innerHTML = 'Next Step <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_1675_1807)"><path d="M10.7814 7.33312L7.20541 3.75712L8.14808 2.81445L13.3334 7.99979L8.14808 13.1851L7.20541 12.2425L10.7814 8.66645H2.66675V7.33312H10.7814Z" fill="white"/></g><defs><clipPath id="clip0_1675_1807"><rect width="16" height="16" fill="white"/></clipPath></defs></svg>';
	}
});

/* 재료 배열 초기화(2단계 => 3단계 => 2단계 => 3단계로 갈 때, 재료가 중복되어 추가되는 현상 때문에 작성!) */
function clearMatDataArray() {
	matDataArray.length = 0;
}

/* [재료추가] 버튼 클릭 시, 실행하는 함수 */
plusMatBtn.addEventListener("click", function (event) {
  event.preventDefault(); // 기본동작 방지
  
	// 디버깅
	// 입력 필드 유효성 검사
  if (!$('#matNm').val() ||
      !$('#matDiv').val() ||
      !$('#bomProdQuantity').val() ||
      !$('#quantityUnits').val() ||
      !/^(\d+(\.\d{1,3})?)$/.test($('#bomProdQuantity').val())
  ) {
    // 유효성 검사 실패 시 알림 표시
    if (!$('#matNm').val()) {
      alert('재료명을 입력하세요.');
      $('#matNm').focus();
    } else if (!$('#matDiv').val()) {
      alert('재료 종류를 입력하세요.');
      $('#matDiv').focus();
    } else if (!$('#bomProdQuantity').val()) {
      alert('제품 1개를 생산하는데 필요한 수량을 입력하세요.');
      $('#bomProdQuantity').focus();
    } else if (!$('#bomProdQuantity').val()) {
      alert('단위를 입력하세요.');
      $('#quantityUnits').focus();
    } else {
      alert('재료 수량은 정수 또는 소수점 셋째 자리까지 입력 가능합니다.');
    }
    return;
  }
  // 입력이 유효하면 모달 트리거를 바로 추가
  addModalTrigger();
  
  // ★모달 트리거를 추가한 후, showNewMatList()를 호출하여 모달창 확인 없이 그냥 바로 목록을 추가한다.★
  // showNewMatList();
  
  
  
});

// 모달의 트리거(재료)를 삭제하는 함수
function removeModalTrigger() {
  plusMatBtn.removeAttribute('data-bs-toggle');
  plusMatBtn.removeAttribute('data-bs-target');
}

// 모달의 트리거(재료)를 추가하는 함수
function addModalTrigger() {
  plusMatBtn.setAttribute('data-bs-toggle', 'modal');
  plusMatBtn.setAttribute('data-bs-target', '#staticBackdrop');
}

// 모달의 트리거(업체)를 삭제하는 함수
function removeModalTrigger2() {
  plusSupBtn.removeAttribute('data-bs-toggle');
  plusSupBtn.removeAttribute('data-bs-target');
}

// 모달의 트리거(업체)를 추가하는 함수
function addModalTrigger2() {
  plusSupBtn.setAttribute('data-bs-toggle', 'modal');
  plusSupBtn.setAttribute('data-bs-target', '#staticBackdrop2');
}

/* ================================= */
/* [업체추가] 버튼 클릭 시, 실행하는 함수 */
plusSupBtn.addEventListener("click", function (event) {
  event.preventDefault(); // 기본동작 방지
  
	// 디버깅
	// 입력 필드 유효성 검사
  if (!$('#supNm').val() ||
      !$('#supContact').val() ||
      !$('#supEmail').val() ||
      !$('#supAddress').val() ||
      !$('#supSell').val()) {
    // 유효성 검사 실패 시 알림 표시
    if (!$('#supNm').val()) {
      alert('업체명을 입력하세요.');
      $('#supNm').focus();
    } else if (!$('#supContact').val()) {
      alert('연락처를 입력하세요.');
      $('#supContact').focus();
    } else if (!$('#supEmail').val()) {
      alert('이메일을 입력하세요.');
      $('#supEmail').focus();
    } else if (!$('#supAddress').val()) {
      alert('주소를 입력하세요.');
      $('#supAddress').focus();
    } else if (!$('#supSell').val()) {
      alert('판매목록을 입력하세요.');
      $('#supSell').focus();
    }
    return;
  }
  // 입력이 유효하면 모달 트리거를 바로 추가
  addModalTrigger2();
  
  // ★모달 트리거를 추가한 후, showNewMatList()를 호출하여 모달창 확인 없이 그냥 바로 목록을 추가한다.★
  // showNewSupList();
  
});

/* ================================= */

/*var matIndex = 0;*/

/* [재료추가] - 모달의 [확인] 버튼 클릭 시, 실행하는 함수 */
function showNewMatList() {
    // 재료 수량과 단위를 가져옴
    let quantity = parseFloat($('#bomProdQuantity').val());
    let unit = $('#quantityUnits').val();

    // 단위가 'g'인 경우, 'kg'로 변환
    if (unit.toLowerCase() === 'g') {
        quantity /= 1000;
        unit = 'kg';
    }

    // 단위가 'ea'인 경우, 대문자로 변환
    if (unit.toLowerCase() === 'ea') {
        unit = unit.toUpperCase();
    }

    // 중복 재료 추가 방지를 위해 추가된 재료 목록에서 검사
    const existingMat = matDataArray.find(mat => mat.matNm === $('#matNm').val());
    if (existingMat) {
        alert('이미 추가된 재료입니다.');
        return;
    }

    // 2단계에서 저장할 데이터
    matData = {
        matNm: $('#matNm').val(),
        matDiv: $('#matDiv').val(),
        matQuantity: quantity,     // 변환된 수량 저장
        matUnits: unit
    };

    // 재료 데이터 배열에 추가
    if (!existingMat) {
        matDataArray.push(matData);
    }

    // 테이블에 새로운 행 추가
    matTableBody = $('.newMatTable tbody');
    newMatRow = `<tr>
                    <th scope="row">${matDataArray.length}</th>
                    <td>${matData.matNm}</td>
                    <td>${matData.matDiv}</td>
                    <td>${matData.matQuantity}</td>
                    <td>${matData.matUnits}</td>
                </tr>`;
    matTableBody.append(newMatRow);

    // 입력칸 값 초기화
    $('#matNm').val('').focus(); // 수정된 부분
    $('#matDiv').val('');
    $('#bomProdQuantity').val('');
    $('#quantityUnits').val('');

    // 모달 트리거 비활성화
    removeModalTrigger();

    // 재료 목록 활성화
    $('.newMatLists').show();
}

/* [업체추가] - 모달의 [확인] 버튼 클릭 시, 실행하는 함수====================================== */
function showNewSupList() {
    // 중복 업체 추가 방지를 위해 추가된 재료 목록에서 검사
    const existingSup = supDataArray.find(sup => sup.supNm === $('#supNm').val());
    if (existingSup) {
        alert('이미 추가된 업체입니다.');
        return;
    }

    // 3단계에서 저장할 데이터
    supData = {
        supNm: $('#supNm').val(),
        supContact: $('#supContact').val(),
        supEmail: $('#supEmail').val(),
        supAddress: $('#supAddress').val(),
        supMatLists: $('#supSell').val()
    };


    // 업체 데이터 배열에 추가
    supDataArray.push(supData);

    // 테이블에 새로운 행 추가
    supTableBody = $('.newSupTable tbody');
    newSupRow = `<tr>
                    <th scope="row">${supDataArray.length}</th>
                    <td>${supData.supNm}</td>
                    <td>${supData.supContact}</td>
                    <td>${supData.supEmail}</td>
                    <td>${supData.supAddress}</td>
                    <td>${supData.supMatLists}</td>
                </tr>`;
    supTableBody.append(newSupRow);

    // 입력칸 값 초기화
    $('#supNm').val('').focus(); // 수정된 부분
    $('#supContact').val('');
    $('#supEmail').val('');
    $('#supAddress').val('');
    $('#supSell').val('');

    // 모달 트리거 비활성화
    removeModalTrigger2();

    // 업체 목록 활성화
    $('.newSupLists').show();
}



/* form4에서 동의, 비동의 버튼 활성화 */
allDenyBtn.addEventListener("click", function(){
	allDenyBtn.classList.add('active');
	allConfirmBtn.classList.remove('active');
});
allConfirmBtn.addEventListener("click", function(){
	allConfirmBtn.classList.add('active');
	allDenyBtn.classList.remove('active');
});

/* BOM 등록 ajax */
/*$(document).ready(function() {
    $("#submitBtn").click(function(event) {
        event.preventDefault();

        // FormData 객체 생성
        var formData = new FormData();

        // 재료 정보를 폼 데이터에 추가
        for (var i = 0; i < materialList.length; i++) {
            formData.append('materials[' + i + '].matNm', materialList[i].matNm);
            formData.append('materials[' + i + '].matDiv', materialList[i].matDiv);
            formData.append('materials[' + i + '].quantityUnits', materialList[i].quantityUnits);
            formData.append('materials[' + i + '].bomProdQuantity', materialList[i].bomProdQuantity);
        }

        // 업체 정보를 폼 데이터에 추가
        for (var j = 0; j < supplierList.length; j++) {
            formData.append('suppliers[' + j + '].supNm', supplierList[j].supNm);
            formData.append('suppliers[' + j + '].supContact', supplierList[j].supContact);
            formData.append('suppliers[' + j + '].supAddress', supplierList[j].supAddress);
            formData.append('suppliers[' + j + '].supEmail', supplierList[j].supEmail);
            formData.append('suppliers[' + j + '].supSell', supplierList[j].supSell);
        }

        // AJAX 요청 설정
        $.ajax({
            type: "POST",
            url: "/registerBom",
            data: formData, // FormData 객체 전달
            processData: false, // 데이터 처리 방지
            contentType: false, // 콘텐츠 유형 설정 방지
            success: function(response) {
                console.log(response);
                alert("BOM 등록 성공");
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                alert("BOM 등록 에러");
            }
        });
    });
});
*/

