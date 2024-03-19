console.log('Reply Module...');

var materialService = (function() {
//    return { name: "AAAA" };

    // 댓글 등록 ajax 호출함수
    function replyAdd(material, callback, error) {
        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/purchase/new',                               // form의 action값
            data : JSON.stringify(material),                       // json으로 string처리하면서 파라미터 전달
            contentType : "application/json; charset=utf-8",    // content-type지정
            // response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 재료 목록 조회 함수
    function getMaterialList(param, callback, error) {

        $.getJSON("/purchase/materialnm/" + param,       // get 전용 ajax함수
            function(data) {                                            // 호출 성공시 처리되는 함수
                if (callback) {
                    callback(data);
                }
        }).fail(
            function(xhr, status, err) {                                // 호출 실패시 처리되는 함수
                if (error) {
                    error();
                }
        });
    }

        function getList1(data, callback, error) {
            $.getJSON("/purchase/modifyMaterialName/",       // get 전용 ajax함수
                function(data) {                                            // 호출 성공시 처리되는 함수
                    if (callback) {
                        callback(data);
                    }
            }).fail(
                function(xhr, status, err) {                                // 호출 실패시 처리되는 함수
                    if (error) {
                        error();
                    }
            });
        }

        function getList(material, callback, error) {
            $.ajax({
                // request처리
                type : 'post',                                      // form의 method속성 값
                url : '/purchase/modifyMaterialName',           // form의 action값                  // json으로 string처리하면서 파라미터 전달
                contentType : "application/json; charset=utf-8",    // content-type지정
                // response처리
                success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function getListSecond(param, callback, error) {
            var name = (param.material_Nm);
            console.log("replyjs, materialName",name);
            $.ajax({
                // request처리
                type : 'get',                                      // form의 method속성 값
                url : "/purchase/modifyMaterialElse/" + name,          // form의 action값                  // json으로 string처리하면서 파라미터 전달
                contentType : "application/json; charset=utf-8",    // content-type지정
                // response처리
                success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                    if (error) {
                        error(er);
                    }
                }
            });
        }

        function getPurchaseSupplier(param, callback, error) {
            var name = (param.material_Nm);
            console.log("replyjs, materialName",name);
            $.ajax({
                // request처리
                type : 'post',                                      // form의 method속성 값
                url : "/purchase/materialPurchaseSelectSupplier/" + name,          // form의 action값                  // json으로 string처리하면서 파라미터 전달
                contentType : "application/json; charset=utf-8",    // content-type지정
                // response처리
                success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                    if (error) {
                        error(er);
                    }
                }
            });
        }

    // 댓글 삭제
    function remove(material_id, callback, error) {
        $.ajax({
            type : 'delete',
            url : '/purchase/' + material_id,
            success : function(deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 댓글 수정
    function update(material, callback, error) {
        console.log("material_id: " + material.material_Id);
        console.log("material_classification: " + material.material_Classification);
        console.log("material_quantity: " + material.material_Quantity);
        console.log("material_name: " + material.material_Nm);

        $.ajax({
            type : 'put',
            url : '/purchase/' + material.material_Id,
            data : JSON.stringify(material),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 댓글 상세조회
    function get(rno, callback, error) {
		$.get("/replies/" + rno, function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

    function displayTime(timeValue){
        var today = new Date();
        var replyDate = new Date(timeValue);
        var replyDateTime = replyDate.getTime();

        var gap = today.getTime() - replyDateTime;
        var dateObj = new Date(timeValue);
        var str = "";

        if(gap < (1000*60*60*24)){
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

            return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
                     ':', (ss > 9 ? '' : '0') + ss ].join('');
        } else{
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth(); + 1;
            var dd = dateObj.getDate();

            return [yy, '-', (mm>9 ? '' : '0') + mm, '-',
                       (dd > 9 ? '' : '0')+dd ].join('');
        }
    }

    return {
        add: replyAdd,
        getList: getList,
        getListSecond: getListSecond,
        getPurchaseSupplier: getPurchaseSupplier,
        remove: remove,
        update: update,
        get: get,
        displayTime : displayTime
    };       // replyAdd function의 내용이 나옴

})();