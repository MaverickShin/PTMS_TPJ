<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<script src = "${jsPath}script.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--  
<script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	
	$("#cust_id").focusout(function() {
		var cust_id = $("input[name='cust_id']").val();
		// 새로운 일정 저장
		$.ajax({
			type: "POST",
			url: "/tpj/cust/confirmid",
			cache: false,
			dataType: "json",
			data: "cust_id=" + cust_id,
			contentType: "application/json; charset=utf-8",
			beforeSend : function(jqXHR, settings)
			{
				var token = $("meta[name='_csrf_header']").attr("content");
				var header = $("meta[name='_csrf']").attr("content");
				jqXHR.setRequestHeader(header, token);
		},
		success: function(cnt) {
		if(cnt.result == 0){
		alert("사용가능");
		}
		},
		error : function(request, status, error) {
			alert("에러!")
		}
		});
	});
	
});

</script>    
-->
<script type="text/javascript">

//회원가입 페이지
function joinInFocus(){
	document.joinInform.cust_id.focus();
}
function joinCheck() {
	// 아이디 입력 확인
	if (!document.joinInform.cust_id.value) {
		alert("아이디를 입력하세요");
		document.joinInform.cust_id.focus();
		return false; // 동작 중지	
	} 
	
	else if (!document.joinInform.cust_pwd.value) {// 비밀번호 확인
		alert("비밀번호를 입력하세요");
		document.joinInform.cust_pwd.focus();
		return false;
		
	}
	
	else if (!document.joinInform.repwd.value) {// 비밀번호 확인
		alert("비밀번호를 확인하세요");
		document.joinInform.repwd.focus();
		return false;
		// 비밀번호와 비밀번호 확인이 일치하는지 확인
	}
	
	else if (document.joinInform.cust_pwd.value != document.joinInform.repwd.value) {
		alert("비밀번호가 다릅니다. 다시 입력하세요");
		document.joinInform.password.focus();
		return false;
	}
	
	else if (!document.joinInform.cust_nm.value) {// 이메일 확인
		alert("이름을 입력하세요");
		document.joinInform.cust_nm.focus();
		return false;
	}
	
	else if (!document.joinInform.jumin1.value){
		alert("주민번호 앞자리를 입력하세요");
		document.joinInform.jumin1.focus();
		return false;
	}
	else if (!document.joinInform.jumin2.value){
		alert("주민번호 뒷자리를 입력하세요");
		document.joinInfrom.jumin2.focus();
		return false;
	}
	else if (!document.joinInform.address1.value) {// 이메일 확인
		alert("주소을 입력하세요");
		document.joinInform.address1.focus();
		return false;
	}
	else if (!document.joinInform.cust_age.value) {
		alert("나이을 입력하세요");
		document.joinInform.cust_age.focus();
		return false;
	}
	else if (!document.joinInform.cust_em.value) {
		alert("이메일을 입력하세요");
		document.joinInform.cust_em.focus();
		return false;
	}
	else if (!document.joinInform.subaddress.value) {
		alert("상세 주소를 입력하세요");
		document.joinInform.subaddress.focus();
		return false;
	}
}

//주민번호
function nextJumin1(){
	if(document.joinInform.jumin1.value.length >= 6){
		document.joinInform.jumin2.focus();
	}
}
function nextJumin2(){
	if(document.joinInform.jumin1.value.length >= 7){
		document.joinInform.address.focus();
	}
}

function confirmid() {
	
 var id = document.joinInform.cust_id.value;
   
   if(id != "") {
      window.location.href = "/tpj/cust/confirmid?cust_id=" + id;
 }
	
}

</script>
<title>회원가입 페이지</title>
</head>
<body onload="joinInFocus();">

<%@ include file = "../header.jsp" %>

<!-- session -->
<section style = "width:700px; margin-left:auto; margin-right:auto; margin-top:30px;">
	<form name="joinInform" action="${ad}adminjoinaction" method="post" onsubmit="return joinCheck();">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="row no-gutters" >
				<div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<h3 class="mb-4">관리자 등록</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="mg_id">관리자 아이디</label>
										<input type="text" class="form-control" name="mg_id" id="mg_id" placeholder="아이디" onblur="confirmid();">
									</div>
								</div>
								
								<div class="col-md-12">
									<div class = "id_ok" style = "display:none;">사용가능한 아이디</div>
									<div class = "id_already" style = "display:none;">사용 불 가능한 아이디</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="mg_pwd">비밀번호</label>
										<input type="password" class="form-control" name="mg_pwd" id="mg_pwd" placeholder="비밀번호">
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="repwd">비밀번호 확인</label>
										<input type="password" class="form-control" name="repwd" id="repwd" placeholder="비밀번호 확인">
									</div>
								</div>
								
							    <div class="col-md-12">
									<div class="form-group">
   										<div class="form-field">
       										<div class="select-wrap">
       											<label class="label" for="mg_kind">관리자 분류</label>
					                      		<select name="mg_kind" id="mg_kind" class="form-control">
					                      			<option value="0">경영지원팀</option>
					                        		<option value="1">고객지원팀</option>
					                        		<option value="2">마케팅팀</option>
                 								</select>
                 							</div>
             							</div>
   									</div>
								</div>
								
								
								<div class="col-md-12">
									<div class="form-group" align = "center">
										<input type="submit" value="회원가입" class="btn btn-primary" id = "join_sub">
										<div class="submitting"></div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
	</form>
</section>
<%@ include file = "../footer.jsp" %>	

</body>
</html>