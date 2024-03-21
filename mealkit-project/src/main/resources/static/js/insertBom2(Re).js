/* 가격 Format */
function formatPrice(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
}

/* 각 단계의 메뉴와 폼을 배열로 저장 */
const stepMenus = Array.from($('.formbold-step-menu'));
const formSteps = Array.from($('.formbold-form-step'));

/* 버튼 */
const formSubmitBtn = $('.formbold-btn');          // 다음, Submit
const formBackBtn = $('.formbold-back-btn');       // 뒤로 가기
const plusMatBtn = $('.formbold-plusMat-btn');     // 재료 추가
const plusSupBtn = $('.formbold-plusSup-btn');     // 업체 추가
const allConfirmBtn = $('.allConfirmBtn');         // 동의 버튼
const allDenyBtn = $('.allDenyBtn');               // 비동의 버튼

/* Form */
const form = $('form');    // 모든 내용을 담아서 'POST"로 컨트롤러에 보낼 form

/* 처음에는 [뒤로가기], [업체추가], [재료추가], 재료목록, 업체목록 숨기기 */
formBackBtn.hide();         // [뒤로가기] 버튼 비활성화
plusMatBtn.hide();          // [재료추가] 버튼 비활성화
plusSupBtn.hide();          // [업체추가] 버튼 비활성화
$('.formbold-sup-forms').hide(); // 업체목록 숨기기

/* 각 단계를 활성화시키는 함수 */
function activateStep(currentIndex, nextIndex) {
  $(stepMenus[currentIndex]).removeClass('active');
  $(stepMenus[nextIndex]).addClass('active');
  $(formSteps[currentIndex]).removeClass('active');
  $(formSteps[nextIndex]).addClass('active');
}


/* 버튼 클릭 시, 기본 동작 방지 */
function preventDefaultOnClick(event) {
  event.preventDefault();
}
$(allConfirmBtn).on("click", preventDefaultOnClick);
$(allDenyBtn).on("click", preventDefaultOnClick);

/* 저장할 데이터 배열 생성 */
const prodDataArray = [];
const matDataArray = [];
const supDataArray = [];

/* "다음" 버튼 클릭 시 실행되는 함수 */
$(formSubmitBtn).on("click", function(event){
  event.preventDefault();  // 기본 동작 방지

  // 현재 활성화된 메뉴에 따라 작동 여부 설정
  if($(stepMenus[0]).hasClass('active')) {
    // 1단계에서 저장할 데이터
    const prodData = {
      prodNm: $('#prodNm').val(),
      prodDiv: $('#prodDiv').val(),
      prodSpec: $('#prodSpec').val(),
      prodPrice: parseInt($('#prodPrice').val().replace(/[^0-9]/g, ''))
    };

    // 입력된 가격이 숫자가 아닌 경우 알림창 표시
    if (!/^\d+$/.test(prodData.prodPrice)) {
      alert('제품 가격은 숫자만 입력하세요.');
      return;
    }

    // 제품 데이터 배열에 추가
    prodDataArray.push(prodData);

    // 첫 번째 단계에서 두 번째 단계로 이동
    activateStep(0, 1);
    $(formBackBtn).show();        // "뒤로 가기" 버튼 활성화
    $(plusMatBtn).show();         // "재료 추가" 버튼 활성화

    // 두 번째 단계에서 제품 정보 조회 시 가격 형식 변환 적용
    $("#prodPrice").val(formatPrice(prodData.prodPrice));
  } else if($(stepMenus[1]).hasClass('active')) {
    // 2단계에서 3단계로 이동
    activateStep(1, 2);
    $(plusMatBtn).hide();         // "재료 추가" 버튼 비활성화
    $(plusSupBtn).show();         // "업체 추가" 버튼 활성화
  } else if($(stepMenus[2]).hasClass('active')) {
    // 3단계에서 4단계로 이동
    activateStep(2, 3);
    $(plusSupBtn).hide();         // "업체 추가" 버튼 비활성화
    $(".newSupLists").hide();     // 공급업체 목록 숨기기
  } else if($(stepMenus[3]).hasClass('active')) {
    // 4단계에서 폼 제출

    // 동의하지 않은 경우 알림창 표시
    if($(allDenyBtn).hasClass('active')) {
      alert('BOM 등록을 위해 동의해야 합니다.');
      return;
    }

    // FormData 객체 생성
    const formData = new FormData();

    // 폼 데이터 추가
    formData.append('prodNm', prodDataArray[0].prodNm);
    formData.append('prodDiv', prodDataArray[0].prodDiv);
    formData.append('prodSpec', prodDataArray[0].prodSpec);
    formData.append('prodPrice', prodDataArray[0].prodPrice);

    // 재료 데이터 추가
    matDataArray.forEach(matData => {
      formData.append('matNm', matData.matNm);
      formData.append('matDiv', matData.matDiv);
      formData.append('matQuantity', matData.matQuantity);
      formData.append('matUnits', matData.matUnits);
    });

    // 업체 데이터 추가
    supDataArray.forEach(supData => {
      formData.append('supNm', supData.supNm);
      formData.append('supContact', supData.supContact);
      formData.append('supEmail', supData.supEmail);
      formData.append('supAddress', supData.supAddress);
      formData.append('supSell', supData.supSell);
    });

    // AJAX 요청 설정
    $.ajax({
      type: "POST",
      url: "/registerBom",
      data: formData,
      processData: false,
      contentType: false,
     
      success: function(response) {
        // 성공적으로 컨트롤러에 데이터를 제출한 경우에 대한 처리
        alert('BOM이 성공적으로 등록되었습니다.');
        // 여기서 추가적인 로직을 구현할 수 있습니다.
      },
      error: function(xhr, status, error) {
        // 컨트롤러에 데이터를 제출하는 도중 오류가 발생한 경우에 대한 처리
        alert('BOM 등록 중 오류가 발생했습니다.');
        console.error(error);
      }
    });
  }
});

/* "뒤로 가기" 버튼 클릭 시 실행되는 함수 */
$(formBackBtn).on("click", function(event){
  event.preventDefault();  // 기본 동작 방지

  // 현재 활성화된 메뉴에 따라 작동 여부 설정
  if($(stepMenus[1]).hasClass('active')) {
    // 2단계에서 1단계로 이동
    activateStep(1, 0);
    $(formBackBtn).hide();        // "뒤로 가기" 버튼 비활성화
    $(plusMatBtn).hide();         // "재료 추가" 버튼 비활성화
  } else if($(stepMenus[2]).hasClass('active')) {
    // 3단계에서 2단계로 이동
    activateStep(2, 1);
    $(plusMatBtn).show();         // "재료 추가" 버튼 활성화
    $(plusSupBtn).hide();         // "업체 추가" 버튼 비활성화
    $(".newSupLists").hide();     // 공급업체 목록 숨기기
  } else if($(stepMenus[3]).hasClass('active')) {
    // 4단계에서 3단계로 이동
    activateStep(3, 2);
    $(plusSupBtn).show();         // "업체 추가" 버튼 활성화
  }
});

/* "재료 추가" 버튼 클릭 시 실행되는 함수 */
$(plusMatBtn).on("click", function(event){
  event.preventDefault();  // 기본 동작 방지

  // 재료 입력 폼을 동적으로 생성하여 추가
  const matForm = $('.formbold-mat-form').clone();
  matForm.addClass('formbold-cloned-mat-form');
  matForm.find('.formbold-removeMat-btn').on('click', function(event) {
    event.preventDefault();
    matForm.remove();
  });
  $('.formbold-mat-forms').append(matForm);
});

/* "업체 추가" 버튼 클릭 시 실행되는 함수 */
$(plusSupBtn).on("click", function(event){
  event.preventDefault();  // 기본 동작 방지

  // 업체 입력 폼을 동적으로 생성하여 추가
  const supForm = $('.formbold-sup-form').clone();
  supForm.addClass('formbold-cloned-sup-form');
  supForm.find('.formbold-removeSup-btn').on('click', function(event) {
    event.preventDefault();
    supForm.remove();
  });
  $('.formbold-sup-forms').append(supForm);
  $(".newSupLists").show();     // 공급업체 목록 보이기
});


