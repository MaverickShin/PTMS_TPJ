<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	
	$("#cust_id").blur(function() {
		var cust_id = $("input[name='cust_id']").val();
		// 새로운 일정 저장
		
		if(cust_id != "") {
			
			$.ajax({
				type: "get",
				url: "/tpj/cust/confirmid",
				cache: false,
				dataType: "json",
				data: "cust_id=" + cust_id,
				contentType: "application/json; charset=utf-8",
				beforeSend : function(jqXHR, settings)
				{
					var token = $("meta[name='_csrf_header']").attr("content");
					var header = $("meta[name='_csrf']").attr("content");
					console.log(token);
					console.log(header);
					jqXHR.setRequestHeader(header, token);
			},
			success: function(cnt) {
				console.log(cnt);
				if (cnt == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#result_id_div").css("display", "block");
					$("#result_id").text("이미 사용중인 아이디입니다 ");
					$("#result_id").css("color", "red");
				} else {
					$("#result_id_div").css("display", "block");
					$('#result_id').text("사용 가능한 아이디 입니다.");
					$('#result_id').css('color', 'blue');
				}
			},
			error : function(request, status, error) {
				alert("에러!");
			}
			});
		}
	});
	
	$("#emailchk").click(function() {
		
		var cust_em = $("input[name='cust_em']").val();
		var key;
		var bool = false;
		
		if(cust_em != "") {
		
			$.ajax({
				type: "get",
				url: "/tpj/cust/mailAction",
				cache: false,
				dataType: "json",
				data: "cust_em=" + cust_em,
				contentType: "application/json; charset=utf-8",
				beforeSend : function(jqXHR, settings)
				{
					var token = $("meta[name='_csrf_header']").attr("content");
					var header = $("meta[name='_csrf']").attr("content");
					jqXHR.setRequestHeader(header, token);
			},
			success: function(result) {
				if (result != 0) {
					// 1 : 아이디가 중복되는 문구
					alert("이메일 인증번호를 전송하였습니다!. \n 인증을 완료해주세요!");
					key = result;
					bool = true;
				} else {
					alert("이메일 전송 실패!");
				}
			},
			error : function(request, status, error) {
				alert("이메일 전송 에러!");
			}
			});
		}
		$("#result_em_div").show();
		$("#emailchk").val("전송완료");
		$("#emailchk").attr("disabled", true);
		
		$("#result_em").keyup(function() {
			if($("#result_em").val().length >= 6) {
				var content = $("#result_em").val();
				
				if(content == key) {
					alert("인증성공");
					$("#emailchk").val("인증완료");
					$("#result_em").attr("disabled", true);
					$("#emailchk").attr("disabled", true);
					} else {
						alert("인증실패");
						$("#emailchk").val("재 전송하기");
						$("#emailchk").attr("disabled", false);
					}
			}
		});
		
	});
	
});
	

</script>    
<script type="text/javascript">

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

</script>
<title>회원가입 페이지</title>
</head>
<body>

<%@ include file = "../header.jsp" %>

<!-- session -->
<section style = "width:700px; margin-left:auto; margin-right:auto; margin-top:30px;">
	<form name="joinInform" action="${cu}joinaction" method="post" onsubmit="return joinCheck();">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="row no-gutters" >
				<div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<h3 class="mb-4" style="text-align:center;font-weight: bold;font-family: 'Font Awesome 5 Pro;">Create Account</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="cust_id">아이디</label>
										<input type="text" class="form-control" name="cust_id" id="cust_id" placeholder="아이디" autofocus>
									</div>
								</div>
								
								<div class="col-md-12" id = "result_id_div" style = "display:none;">
									<div class="form-group">
										<div id = "result_id" style = "dispaly:none;"></div>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="cust_pwd">비밀번호</label>
										<input type="password" class="form-control" name="cust_pwd" id="cust_pwd" placeholder="비밀번호">
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="repwd">비밀번호 확인</label>
										<input type="password" class="form-control" name="repwd" id="repwd" placeholder="비밀번호 확인">
									</div>
								</div>
								
								
								<div class="col-md-3">
									<div class="form-group">
										<label class="label" for="hp1">휴대폰 번호</label>
										<input type="text" class="form-control" name="hp1" id="hp1" maxlength= "3">
									</div>
								</div>
								
								<div class="col-md-3">
									<div class="form-group">
										<label class="label" for="hp2">&nbsp;</label>
										<input type="text" class="form-control" name="hp2" id="hp2" maxlength= "4" >
									</div>
								</div>
								
								<div class="col-md-3">
									<div class="form-group">
										<label class="label" for="hp3">&nbsp;</label>
										<input type="text" class="form-control" name="hp3" id="hp3" maxlength= "4">
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="cust_nm">이름</label>
										<input type="text" class="form-control" name="cust_nm" id="cust_nm" placeholder="이름">
									</div>
								</div>
								
								<div class="col-md-7"> 
									<div class="form-group">
										<label class="label" for="cust_em">이메일</label>
										<input type="email" class="form-control" name="cust_em" id="cust_em" placeholder="이메일">
									</div>
								</div>
								
								
								<div class="col-md-5">
									<div class="form-group" style = "margin-top: 10px;">
										<input type="button" value="이메일 인증" class="btn btn-primary" id = "emailchk" style = "margin-top:25px;">
										<div class="submitting"></div>
									</div>
								</div>
								
								<div class="col-md-7" id = "result_em_div" style = "display: none;">
									<div class="form-group">
										<label class="label" for="result_em">이메일 인증번호</label>
										<input type="text" class="form-control" name="resultem" id="result_em" placeholder="인증번호">
									</div>
								</div>
								
								
								<div class="col-md-7">
									<div class="form-group">
										<label class="label" for="postcode">우편번호</label>
										<input type="text" class="form-control" name="zipcode" id="postcode" placeholder="우편번호" readonly>
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="form-group" style = "margin-top: 10px;">
										<input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
										<div class="submitting"></div>
									</div>
								</div>
								
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="address1">도로명 주소</label>
										<input type="text" class="form-control" name="address1" id="address1" placeholder="도로명 주소" readonly>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="label" for="address2">지번 주소</label>
										<input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="subaddress">상세주소</label>
										<input type="text" class="form-control" name="subaddress" id="subaddress" placeholder="상세주소">
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