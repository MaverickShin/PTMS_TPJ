<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
$(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp42057131'); // 'IMP key 사용'
    var msg;
    var item = '<c:out value = "${item_name}"/>';
    var amount = '<c:out value = "${price}"/>';
    var email = '<c:out value = "${vo.CUST_EM}"/>';
    var tel = '<c:out value = "${vo.CUST_PH}"/>';
    var name = '<c:out value = "${vo.CUST_NM}"/>';
    var addr = '<c:out value = "${vo.ADDRESS1}"/>';
    var post = '<c:out value = "${vo.ZIPCODE}"/>';
    var urls = '<c:out value = "${url}"/>';
    var pk = '<c:out value = "${primarykey}"/>';
    var pages = '<c:out value = "${page}"/>';
    var paykind = '<c:out value = "${paykind}"/>';
    var ids = '<c:out value = "${id}"/>';
    var state = 0;
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : item,
        amount : amount,
        buyer_email : email,
        buyer_name : name,
        buyer_tel : tel,
        buyer_addr : addr,
        buyer_postcode : post
    }, function(rsp) {
        if ( rsp.success ) {
            //결제 완료를 위해 jQuery ajax로 결제상태 업데이트
            $.ajax({
                url: urls, 
                type: 'get',
                dataType: 'json',
                data: {"primarykey" : pk, "item_name" : item},
            	success: function(data) {
                // 결제 상태 업데이트가 정상인 경우 결제이력 생성
                if (data == 1) {
                    msg = '결제가 완료되었습니다.';
                    alert(msg);
                    
                    $.ajax({
                    	type: "get",
                        url: "/tpj/pay/paySuccess", 
                        data: {"kind" : paykind, "price" : amount, "id" : ids},
                        dataType: "json",
                    	success: function(result) {
                    	if(result == 1) {
                    		window.location = pages; 
                    	}
                    	else {
                    		alert("시스템 오류 : 결제 정보가 정상적으로 처리 되지 않았습니다!");
                    	}
                    },
                    error: function(request, status, error) {
                    	alert(error);
                    }
                    });
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    msg = "결제가 완료 되지 않았습니다!";
                    msg += "\n" + rsp.error_msg;
                    
                    window.location = pages;
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            },
            error : function(request, status, error) {
    			alert("에러!");
    		}
            });
        } else {
            msg = '결제에 실패하였습니다.';
            msg += "\n"+rsp.error_msg;
            //실패시 이동할 페이지
            alert(msg);
            window.history.go(-3);
        }
        	
    });
    
});
</script>
 
</body>
</html>
