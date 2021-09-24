<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<script src = "${jsPath}script.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>내정보 관리 - 인증화면</title>
<script type="text/javascript">
function passwordCheck(){
	if(!document.contactForm.CUST_PWD.value){
		alert("비밀번호를 입력하세요");
		document.contactForm.CUST_PWD.focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file = "../../main/header.jsp" %>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${path}images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="main">Home<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
				<h1 class="mb-0 bread">내정보 관리</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">반려인/반려동물 관리</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters">
						<div class="col-md-7">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">내정보 관리</h3>
								
								<form action="MyInfo" method="POST" id="contactForm" name="contactForm" class="contactForm" onsubmit="return passwordCheck();">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="CUST_PWD">비밀번호</label>
												<input type="password" name="CUST_PWD" class="btn btn-primary" maxlength="20">
											</div>
										</div>										
										<div class="col-md-12">
											<div class="form-group">
												<input type="submit" value="확인" class="btn btn-primary">
												<input type="reset" value="취소" class="btn btn-primary" onclick="window.location= 'main'">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-5 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-5 img"
								style="background-image: url(${path}images/img.jpg);"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file = "../../main/footer.jsp" %>
</body>
</html>