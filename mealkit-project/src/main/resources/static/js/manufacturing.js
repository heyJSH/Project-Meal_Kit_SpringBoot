$(document).ready(function() {
    var isValidOutPut = false;
    var isValidManuDate = false;
    var isValidManuId = false;
    var currentProductId = null;
    function selectManufacturing(){
        $.ajax({
            url: '/selectManufacturing',
            type: 'GET',
            success: function(response){
                var newTableRows = '';
                $.each(response, function(index, manufacturing){
                    newTableRows += '<tr>' +
                                        '<td class="t1_1">' + manufacturing.lot_id + '</td>' +
                                        '<td class="t1_2">' + manufacturing.inst_nm + '</td>' +
                                        '<td class="t1_3" id="product_id_' + manufacturing.lot_id + '">' + manufacturing.product_id + '</td>' +
                                        '<td class="t1_4" id="lot_size_' + manufacturing.lot_id + '">' + manufacturing.lot_size + '</td>' +
                                        '<td class="t1_5">' +
                                            '<input class="inputField" id="output_' + manufacturing.lot_id + '" name="output" type="number" placeholder="생산량"/>' +
                                        '</td>' +
                                        '<td class="t1_6" id="inst_date_' + manufacturing.lot_id + '">' + manufacturing.inst_date + '</td>' +
                                        '<td class="t1_7">' +
                                            '<input class="inputField" id="manu_date_' + manufacturing.lot_id + '" name="manu_date" type="date" placeholder="수행일"/>' +
                                        '</td>' +
                                        '<td class="t1_8">' +
                                            '<input class="inputField" id="manu_id_' + manufacturing.lot_id + '" name="manu_id" type="text" placeholder="수행자ID"/>' +
                                        '</td>' +
                                        '<td class="t1_9">' +
                                            '<button class="completeBtn" id="completeBtn_' + manufacturing.lot_id + '" data-lot-id="' + manufacturing.lot_id + '" disabled>완료</button>' +
                                        '</td>' +
                                    '</tr>';
                });
                $('.table1 .content table').html(newTableRows);
            },
            error: function(xhr, status, er){
                console.log(er);
            }
        });
    }
    function selectManuProd(){
        $.ajax({
            url: '/selectManuProd',
            type: 'GET',
            success: function(response){
                var newTableRows = '';
                $.each(response, function(index, manuProd){
                    newTableRows += '<tr>' +
                                        '<td class="t2_1">' + manuProd.product_id + '</td>' +
                                        '<td class="t2_2">' + manuProd.product_nm + '<br>(' + manuProd.product_spec + ')</td>' +
                                        '<td class="t2_3">' + manuProd.product_quantity + '</td>' +
                                        '<td class="t2_4">' +
                                            '<button class="moreInfoBtn" data-product-id="' + manuProd.product_id + '">더보기</button>' +
                                        '</td>' +
                                    '</tr>';
                });
                $('.table2 .content table').html(newTableRows);
            },
            error: function(xhr, status, er){
                console.log(er);
            }
        });
    }
    function enableSubmitIfValid(lotId){
        if(isValidOutPut && isValidManuDate && isValidManuId){
            $('#completeBtn_' + lotId).prop('disabled', false);
        }else{
            $('#completeBtn_' + lotId).prop('disabled', true);
        }
    }
    function checkOutPut(lotId, lotSize, outPut){
        if(outPut == lotSize){
            isValidOutPut = true;
        }else{
            if(outPut != null){
                alert('Lot Size와 생산량이 일치하지 않습니다.');
            }
            $('#output_' + lotId).focus();
            isValidOutPut = false;
        }
        enableSubmitIfValid(lotId);
    }
    function checkManuDate(lotId, instDate, manuDate){
        if(manuDate >= instDate){
            isValidManuDate = true;
        }else{
            alert('올바르지 않은 수행일입니다.');
            $('#manu_date_' + lotId).focus();
            isValidManuDate = false;
        }
        enableSubmitIfValid(lotId);
    }
    function checkManuId(lotId, empId){
        if(empId){
            $.ajax({
                url: '/checkManuId',
                type: 'GET',
                data: {emp_id: empId},
                success: function(response){
                    isValidManuId = response.isValid;
                    if(!response.isValid){
                        alert('존재하지 않는 사원입니다.');
                        $('#manu_id_' + lotId).focus();
                    }
                    enableSubmitIfValid(lotId);
                }
            });
        }
    }
    $(document).on('change', '.inputField[type="number"]', function(){
        var $currentRow = $(this).closest('tr');
        var lotId = $currentRow.find('.completeBtn').data('lot-id');
        var lotSize = parseInt($currentRow.find('#lot_size_' + lotId).text(), 10);
        var outPut = parseInt($currentRow.find('#output_' + lotId).val(), 10);
        isValidOutPut = false;
        checkOutPut(lotId, lotSize, outPut);
    });
    $(document).on('change', '.inputField[type="date"]', function(){
        var $currentRow = $(this).closest('tr');
        var lotId = $currentRow.find('.completeBtn').data('lot-id');
        var instDateStr = $currentRow.find('#inst_date_' + lotId).text();
        var instDate = new Date(instDateStr);
        var manuDateStr = $currentRow.find('#manu_date_' + lotId).val();
        var manuDate = new Date(manuDateStr);
        isValidManuDate = false;
        checkManuDate(lotId, instDate, manuDate);
    });
    $(document).on('change', '.inputField[type="text"]', function(){
        var $currentRow = $(this).closest('tr');
        var lotId = $currentRow.find('.completeBtn').data('lot-id');
        var empId = parseInt($currentRow.find('#manu_id_' + lotId).val(), 10);
        isValidManuId = false;
        if(empId == 0){
            alert('존재하지 않는 사원입니다.');
            $('#manu_id_' + lotId).focus();
            enableSubmitIfValid();
        }
        checkManuId(lotId, empId);
    });
    $(document).on('click', '.completeBtn', function(event){
        var $currentRow = $(this).closest('tr');
        var lotId = $currentRow.find('.completeBtn').data('lot-id');
        var productId = $currentRow.find('#product_id_' + lotId).text();
        var lotSize = parseInt($currentRow.find('#lot_size_' + lotId).text(), 10);
        var outPut = parseInt($currentRow.find('#output_' + lotId).val(), 10);
        var manuDate = $currentRow.find('#manu_date_' + lotId).val();
        var empId = parseInt($currentRow.find('#manu_id_' + lotId).val(), 10);
        $.ajax({
            url: '/moreInfo',
            type: 'GET',
            data: {product_id: productId},
            success: function(response){
                var isSuccess = true;
                $.each(response, function(index, manuMate){
                    if(lotSize / 1000 * manuMate.bom_prod_quantity > manuMate.material_quantity){
                        alert(manuMate.material_nm + '이(가) ' + (lotSize / 1000 * manuMate.bom_prod_quantity - manuMate.material_quantity) + manuMate.quantity_units + ' 부족합니다.');
                        isSuccess = false;
                        return false;
                    }
                });
                if (isSuccess){
                    updateProduct();
                }
            },
            error: function(xhr, status, response){
                alert("Error: " + response);
            }
        });
        function updateProduct(){
            $.ajax({
                url: '/updateProduct',
                type: 'POST',
                data: JSON.stringify({product_id: productId, lot_size: lotSize, lot_id: lotId}),
                contentType: "application/json; charset=utf-8",
                success: function(result, status, xhr){
                    console.log("상품 업데이트 완료");
                    updateMaterial();
                },
                error: function(xhr, status, er){
                    console.log(er);
                }
            });
        }
        function updateMaterial(){
            $.ajax({
                url: '/updateMaterial',
                type: 'POST',
                data: JSON.stringify({product_id: productId, lot_size: lotSize}),
                contentType: "application/json; charset=utf-8",
                success: function(result, status, xhr){
                    console.log("재료 업데이트 완료");
                    updateInstruction();
                },
                error: function(xhr, status, er){
                    console.log(er);
                }
            });
        }
        function updateInstruction(){
            $.ajax({
                url: '/updateInstruction',
                type: 'POST',
                data: JSON.stringify({output: outPut, manu_date: manuDate, emp_id: empId, lot_id: lotId}),
                contentType: "application/json; charset=utf-8",
                success: function(result, status, xhr){
                    console.log("지시 업데이트 완료");
                    deleteManufacturing();
                },
                error: function(xhr, status, er){
                    console.log(er);
                }
            });
        }
        function deleteManufacturing(){
            $.ajax({
                url: '/deleteManufacturing',
                type: 'POST',
                data: JSON.stringify({lot_id: lotId}),
                contentType: "application/json; charset=utf-8",
                success: function(result, status, xhr){
                    console.log("수행 삭제 완료");
                    selectManufacturing();
                    selectManuProd();
                    if(currentProductId){
                        selectManuMate(currentProductId);
                    }
                },
                error: function(xhr, status, er){
                    console.log(er);
                }
            });
        }
    });
    $(document).on('click', '.moreInfoBtn', function(event){
        var productId = $(this).data('product-id');
        currentProductId = productId;
        $.ajax({
            url: '/moreInfo',
            type: 'GET',
            data: {product_id: productId},
            success: function(response){
                var newTableRows = '';
                $.each(response, function(index, manuMate){
                    newTableRows += '<tr>' +
                                        '<td class="t3_1">' + manuMate.material_id + '</td>' +
                                        '<td class="t3_2">' + manuMate.material_nm + '</td>' +
                                        '<td class="t3_3">' + manuMate.material_quantity + ' ' + manuMate.quantity_units + '</td>' +
                                        '<td class="t3_4">' + manuMate.bom_prod_quantity + ' ' + manuMate.quantity_units + '</td>' +
                                        '<td class="t3_5">' + manuMate.manufacturing_availability + '</td>' +
                                    '</tr>';
                });
                $('.table3 .content table').html(newTableRows);
            },
            error: function(xhr, status, error) {
                alert("Error: " + error);
            }
        });
    });
    function selectManuMate(productId){
        $.ajax({
            url: '/moreInfo',
            type: 'GET',
            data: {product_id: productId},
            success: function(response){
                var newTableRows = '';
                $.each(response, function(index, manuMate){
                    newTableRows += '<tr>' +
                                        '<td class="t3_1">' + manuMate.material_id + '</td>' +
                                        '<td class="t3_2">' + manuMate.material_nm + '</td>' +
                                        '<td class="t3_3">' + manuMate.material_quantity + ' ' + manuMate.quantity_units + '</td>' +
                                        '<td class="t3_4">' + manuMate.bom_prod_quantity + ' ' + manuMate.quantity_units + '</td>' +
                                        '<td class="t3_5">' + manuMate.manufacturing_availability + '</td>' +
                                    '</tr>';
                });
                $('.table3 .content table').html(newTableRows);
            },
            error: function(xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }
    selectManufacturing();
    selectManuProd();
});
