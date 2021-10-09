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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@400;700&family=Ubuntu:wght@300&display=swap" rel="stylesheet">
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
				<h2 class="heading-section" style="font-family: math;font-family: 'Noto Sans KR', sans-serif;">내 정보 / 반려동물 관리</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters" style="justify-content: center;">
						<div class="col-md-7" style="width:150px">
							<div class="contact-wrap w-100 p-md-5 p-4" style="text-align-last: center;">
								<h4 class="mb-4" style="text-align:center; font-weight:bold;">본인 인증</h4><br>
								<h6 style="font-family: 'Noto Sans KR', sans-serif;">개인 정보를 안전하게 보호하기 위해 비밀번호로 한 번 더 인증해 주세요.</h6><br>
								<form action="MyInfo" method="POST" id="contactForm" name="contactForm" class="contactForm" onsubmit="return passwordCheck();">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="CUST_PWD">비밀번호</label>
												<input type="password" name="CUST_PWD" class="btn btn-primary" maxlength="20">
											</div>
										</div><br>									
										<div class="col-md-12">
											<div class="form-group">
												<input type="submit" value="비밀번호로 본인인증" class="btn btn-primary">
												<input type="reset" value="메인으로 돌아가기" class="btn btn-primary" onclick="window.location= '/tpj/cust/main'">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
<%-- 						<div class="col-md-5 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-5 img"
								style="background-image: url(${path}images/img.jpg);"></div>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file = "../../main/footer.jsp" %>
</body>
</html>