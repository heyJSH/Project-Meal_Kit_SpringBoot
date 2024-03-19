$(document).ready(function() {
    $('#addBtn').prop('disabled', true);
    function checkDepartmentIdNoAlert() {
        var validDepId = true;
        var dep_id = $('#dep_id').val();
        switch (dep_id) {
            case '500001':
                $('#dep_nm').val('생산팀');
                break;
            case '500002':
                $('#dep_nm').val('영업팀');
                break;
            case '500003':
                $('#dep_nm').val('구매팀');
                break;
            case '500004':
                $('#dep_nm').val('관리팀');
                break;
            default:
                validDepId = false;
                $('#dep_nm').val('');
                break;
        }
        return validDepId;
    }
    function checkDepartmentId() {
        var validDepId = checkDepartmentIdNoAlert();
        if (!validDepId) {
            alert('존재하지 않는 부서입니다.');
        }
        return validDepId;
    }
    function checkInputFields() {
        var allFilled = true;
        $('.inputField').not('#dep_nm').each(function() {
            if ($(this).val() === '') {
                allFilled = false;
                return false;
            }
        });
        var validDepId = checkDepartmentIdNoAlert();
        $('#addBtn').prop('disabled', !(allFilled && validDepId));
    }
    $('.inputField').keyup(checkInputFields).change(checkInputFields);
    $('#dep_id').change(function() {
        checkDepartmentId();
        checkInputFields();
    });
});
