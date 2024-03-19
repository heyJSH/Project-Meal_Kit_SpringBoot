/* BOM 현황 검색 기능 */
function searchBomList() {
	// 선택한 select box의 option값을 submit
	$('#searchBom').submit();
	
}

// 삭제 ========================================================
/* 체크박스 전체 선택 클릭 이벤트 */
function allChecked(target) {
	// 전체 체크박스 버튼
	const checkbox = document.getElementById('allCheckBox');
	
	// 전체 체크박스 버튼 체크 여부
	const is_checked = checkbox.checked;
	
	// 전체 체크박스 제외한 모든 체크박스
	if(is_checked) {
		// 체크박스 전체 체크
		chksAllChecked();
	} else {
		// 체크박스 전체 해제
		chksAllUnChecked();
	}
	
}

/* 자식 체크박스 클릭 이벤트 */
function chksClicked() {
	// 체크박스 전체 개수
	const allCount = document.querySelectorAll(".chks").length;
	
	// 체크된 체크박스 전체 개수
	const query = 'input[name="chks"]: checked';
	const selectedElements = document.querySelectorAll(query);
	const selectedElementsCnt = selectedElements.length;
	
	// 체크박스 전체개수와 체크된 체크박스 전체 개수가 같으면 전체 체크박스 체크
	if(allCount == selectedElementsCnt) {
		document.getElementById('allCheckBox').checked = true;
	} else {		// 같지 않으면 전체 체크박스 해제
		document.getElementById('allCheckBox').checked = false;
	}
}

/* 체크박스 전체 체크 */
function chksAllChecked() {
	document.querySelectorAll(".chks").forEach(function(v,i) {
		v.checked = true;
	});
}

/* 체크박스 전체 체크 해제 */
function chksAllUnChecked() {
	document.querySelectorAll(".chks").forEach(function(v,i) {
		v.checked = false;
	});
}

/* BOM 삭제 */
function bomDelete() {
    // 폼 가져오기
    const form = document.getElementById('containerAll');

    // 체크박스 체크된 항목
    const query = 'input[name="chks"]:checked';
    const selectedElements = document.querySelectorAll(query);

    // 체크박스 체크된 항목의 개수
    const selectedElementsCnt = selectedElements.length;

    if (selectedElementsCnt == 0) {
        alert("삭제할 항목을 선택해주세요.");
        return false;
    } else {
        form.action = `/bom/remove`;
       // 폼 제출
        form.submit();
    }
}



// 수정 ========================================================
/* 수정 버튼을 누르면, 해당하는 줄의 내용을 수정 */
function editRow(rowId) {
  var tableRow = document.getElementById('table').querySelector('tbody tr[data-row-id="' + rowId + '"]');
  var tableData = tableRow ? tableRow.children : null;

  if (tableData) {
    // 기존의 수정 버튼 숨기기
    var updateButton = tableRow.querySelector('.btn-update');
    if (updateButton) {
      updateButton.style.display = 'none';
    }

    // 수정을 위한 동적 Form 양식 만들기
    var dynamicForm = document.createElement('form');
    dynamicForm.setAttribute('action', '/bom/modify');
    dynamicForm.setAttribute('method', 'post');
    dynamicForm.setAttribute('id', 'modifyForm_' + rowId);
    dynamicForm.style.display = 'flex';
    dynamicForm.style.alignItems = 'center';

    // 각 행의 cell마다 input field 생성
		for (var i = 2; i < tableData.length - 1; i++) {
		  var inputContainer = document.createElement('td');
		  var input = document.createElement('input');
		  input.setAttribute('type', 'text');
		  input.setAttribute('name', 'editData' + i);
		  input.setAttribute('id', 'editData' + i);
		  input.setAttribute('value', tableData[i].innerText);
		  input.style.width = '60px';  // 입력 칸의 너비 조정
		  
		  // 수정 가능한 데이터 너비 조정
		  if (i === 5) {
		    input.style.width = '82px';
		  }
		
		  // 수정하지 못하는 데이터 readonly 속성 추가 및 배경색 변경
		  // bomId, prodId, prodNm, lotId, matId, matNm 
		  if (i === 2 || i === 3 || i === 4 || i === 7 || i === 10 || i === 11) {
		    input.setAttribute('readonly', 'readonly');
		    input.style.backgroundColor = 'gray';  // 회색 배경색 추가
		  }
		
		  // 각 cell의 너비 조정
		  if (i === 2) {
		    // 동적 Form의 첫 번째 cell의 시작 위치
		    inputContainer.style.marginLeft = '10%';
		  } else {
		    inputContainer.style.marginLeft = '1.3%';  // 간격 조정
		  }
		
		  inputContainer.appendChild(input);
		  dynamicForm.appendChild(inputContainer);
		}

    // Confirm 및 Cancel 버튼 생성
    var confirmBtn = document.createElement('button');
    confirmBtn.setAttribute('type', 'button');
    confirmBtn.setAttribute('class', 'btn btn-success btn-sm');
    //confirmBtn.setAttribute('onclick', 'submitUpdate(' + rowId + ')');
    confirmBtn.setAttribute('data-bs-toggle', 'modal');
    confirmBtn.setAttribute('data-bs-target', '#staticBackdrop2');	// 수정 확인용 Modal
    confirmBtn.innerText = 'Confirm';

    var cancelBtn = document.createElement('button');
    cancelBtn.setAttribute('type', 'button');
    cancelBtn.setAttribute('class', 'btn btn-danger btn-sm');
    cancelBtn.setAttribute('onclick', 'cancelUpdate(' + rowId + ')');
    cancelBtn.innerText = 'Cancel';

    // 수정 Form이 들어갈 빈 행 추가
    var modifyRow = document.createElement('tr');
    modifyRow.setAttribute('id', 'modifyRow_' + rowId);
    var modifyCell = document.createElement('td');
    modifyCell.setAttribute('colspan', tableData.length);
    modifyCell.appendChild(dynamicForm);
    modifyRow.appendChild(modifyCell);

    // 동적 Form을 row 다음에 추가
    tableRow.parentNode.insertBefore(modifyRow, tableRow.nextSibling);

    // Confirm 및 Cancel 버튼 추가
    var buttonsRow = document.createElement('tr');
    buttonsRow.setAttribute('id', 'buttonsRow_' + rowId);
    var buttonsCell = document.createElement('td');
    buttonsCell.setAttribute('colspan', tableData.length);
    buttonsCell.style.textAlign = 'right';  // 오른쪽 정렬

    buttonsCell.appendChild(confirmBtn);
    buttonsCell.appendChild(cancelBtn);

    buttonsRow.appendChild(buttonsCell);

    // 동적 Form 다음에 버튼 행 추가
    tableRow.parentNode.insertBefore(buttonsRow, modifyRow.nextSibling);
  } else {
    console.error('행을 찾을 수 없습니다. rowId:', rowId);
  }
}

/* Confirm 버튼 => 업데이트된 Data를 submit 처리(Modal 창의 수정 확인 버튼) */
function submitUpdate(rowId) {
  var formId = 'modifyForm_' + rowId;
  var dynamicForm = document.getElementById(formId);

  // 수정 Form이 들어간 빈 행과 버튼 행을 찾아서 삭제
  var modifyRow = document.getElementById('modifyRow_' + rowId);
  var buttonsRow = document.getElementById('buttonsRow_' + rowId);

  // 기존의 수정 버튼 다시 표시
  var updateButton = document.querySelector('tbody tr[data-row-id="' + rowId + '"] .btn-update');
  if (updateButton) {
    updateButton.style.display = 'inline-block';
  }
  
  // Submit 처리
  dynamicForm.action = '/bom/modify';
  dynamicForm.submit();

  // Form 요소 삭제는 제출 후에 처리
  if(modifyRow) {
		modifyRow.parentNode.removeChild(modifyRow);
	}
	if(buttonsRow) {
		buttonsRow.parentNode.removeChild(buttonsRow);
	}
	// Submit 후에 Form 삭제
  dynamicForm.parentNode.removeChild(dynamicForm);

  
}


/* Cancel 버튼 */
function cancelUpdate(rowId) {
  // 수정 Form이 들어간 빈 행과 버튼 행을 찾아서 삭제
  var modifyRow = document.getElementById('modifyRow_' + rowId);
  var buttonsRow = document.getElementById('buttonsRow_' + rowId);

  if (modifyRow) {
    modifyRow.parentNode.removeChild(modifyRow);
  }

  if (buttonsRow) {
    buttonsRow.parentNode.removeChild(buttonsRow);
  }

  // 기존의 수정 버튼 다시 표시
  var updateButton = document.querySelector('tbody tr[data-row-id="' + rowId + '"] .btn-update');
  if (updateButton) {
    updateButton.style.display = 'inline-block';
  }
}





