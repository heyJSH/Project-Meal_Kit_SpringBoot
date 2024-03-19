$(document).ready(function() {
    $('#submitBtn').prop('disabled', true);
    var isValidInstId = false;
    var isValidProductId = false;
    var isValidLotSize = false;
    var isValidInstDate = false;
    function enableSubmitIfValid(){
        if(isValidInstId && isValidProductId && isValidLotSize && isValidInstDate){
            $('#submitBtn').prop('disabled', false);
        }else{
            $('#submitBtn').prop('disabled', true);
        }
    }
    function checkInstId(){
        var empId = $('#inst_id').val();
        if(empId){
            $.ajax({
                url: '/checkInstId',
                type: 'GET',
                data: {emp_id: empId},
                success: function(response){
                    isValidInstId = response.isValid;
                    if(!response.isValid){
                        alert('존재하지 않는 사원입니다.');
                        $('#inst_id').focus();
                    }
                    enableSubmitIfValid();
                }
            });
        }
    }
    function checkProductId(){
        var productId = $('#product_id').val();
        if(productId){
            $.ajax({
                url: '/checkProductId',
                type: 'GET',
                data: {product_id: productId},
                success: function(response){
                    isValidProductId = response.isValid;
                    if(!response.isValid){
                        alert('존재하지 않는 상품입니다.');
                        $('#product_id').focus();
                    }
                    enableSubmitIfValid();
                }
            });
        }
    }
    function checkLotSize(){
        var lotSize = $('#lot_size').val();
        if(lotSize){
            $.ajax({
                url: '/checkLotSize',
                type: 'GET',
                data: {lot_size: lotSize},
                success: function(response){
                    isValidLotSize = response.isValid;
                    if(!response.isValid){
                        alert('올바르지 않은 Lot Size입니다.');
                        $('#lot_size').focus();
                    }
                    enableSubmitIfValid();
                }
            });
        }
    }
    function checkInstDate(){
        var instDate = $('#inst_date').val();
        if(instDate){
            $.ajax({
                url: '/checkInstDate',
                type: 'GET',
                data: {inst_date: instDate},
                success: function(response){
                    isValidInstDate = response.isValid;
                    if(!response.isValid){
                        alert('올바르지 않은 지시일입니다.');
                        $('#inst_date').focus();
                    }
                    enableSubmitIfValid();
                }
            });
        }
    }
    $('#inst_id').change(function(){
        isValidInstId = false;
        checkInstId();
    });
    $('#product_id').change(function(){
        isValidProductId = false;
        checkProductId();
    });
    $('#lot_size').change(function(){
        isValidLotSize = false;
        checkLotSize();
    });
    $('#inst_date').change(function(){
        isValidInstDate = false;
        checkInstDate();
    });
});
