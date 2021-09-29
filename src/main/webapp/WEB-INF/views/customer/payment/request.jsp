<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
$(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp42057131'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
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
    var page = '<c:out value = "${page}"/>';
    var paykind = '<c:out value = "${paykind}"/>';
    var id = '<c:out value = "${id}"/>';
    
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
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            $.ajax({
                url: urls, //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                	priamrykey : pk
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if (data == 1) {
                    msg = '결제가 완료되었습니다.';
                    alert(msg);
                    
                    $.ajax({
                        url: "/tpj/cust/paySuccess", //cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        dataType: 'json',
                        data: {
                        	kind : paykind,
                        	price : price,
                        	id : id
                        }
                    ,
                    success: function(result) {
                    	if(result == 1) window.location = page; 
                    	else alert("시스템 오류 : 결제 정보가 정상적으로 처리 되지 않았습니다!");
                    },
                    error: function(request, status, error) {
                    	alert(error);
                    }
                    });
                                        
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    msg = "결제가 완료 되지 않았습니다!";
                    msg += "\n" + rsp.error_msg;
                    
                    window.location = page;
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
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
