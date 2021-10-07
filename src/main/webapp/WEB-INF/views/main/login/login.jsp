<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객-로그인</title>
<script type="text/javascript">
function loginCheck() {
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
}
</script>
<style>
input[type="text"]:focus {
    outline: 2px solid green;
}
input[type="password"]:focus{
	outline: 2px solid green;
}
</style>
</head>
<body>

	<%@ include file="../../main/header.jsp"%>

	<section style = "width:700px; margin-left:auto; margin-right:auto; margin-top:30px;">
	<form name="joinInform" action="${cu}loginaction" method="post" onsubmit="return loginCheck();">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="row no-gutters" >
				<div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<h3 class="mb-4" style="text-align:center;font-weight: bold;font-family: 'Font Awesome 5 Pro;">Login</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="cust_id">아이디</label>
										<input type="text" class="form-control" name="cust_id" id="cust_id" placeholder="아이디">
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="cust_pwd">비밀번호</label>
										<input type="password" class="form-control" name="cust_pwd" id="cust_pwd" placeholder="비밀번호" >
									</div>
								</div>
								
								
								<div class="col-md-12">
									<div class="form-group" align = "center">
										<input type="submit" value="로그인" class="btn btn-primary" id = "join_sub" style="width:120px;">
										<div class="submitting"></div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
	</form>
</section>

	<%@ include file="../../main/footer.jsp"%>

</body>
</html>