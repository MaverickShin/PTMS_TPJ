<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>내정보 관리</title>
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<script src="${jsPath}script.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="utf-8">
<style>
.hide {
	display: none;
	background-color: #00bd56;
	min-width: 160px;
	box-shadow: 10px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	font-size: 16px;
	position: absolute;
	left: -15px;
	top: 80px;
}

.hide a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	font-size: 16px;
}

.hide a:hover {
	color: #00bd56;
	font-weight: bold;
	background-color: white;
}

#mypages {
	position: relative;
	cursor: pointer;
	color: #00bd56;
}

#mypages:hover .hide {
	display: block;
}

.link {
	display: block;
	padding: 2rem 0rem;
}

.contact-wrap label {
	font-size: 18px !important;
}

.contact-wrap input {
	font-size: 16px !important;
}
</style>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${path}images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="main">Home<i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-0 bread">내정보 관리</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
<!-- 				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">반려인/반려동물 관리</h2>
				</div> -->
			</div>
			<div class="row justify-content-center"
				style="font-family: 'Do Hyeon', sans-serif;">
				<div class="col-md-12">
					<div class="wrapper">
					<%@ include file="MyInfobar.jsp"%>
						<div class="row no-gutters">
							<div class="col-md-7">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">내정보 관리</h3>

									<form action="MyInfoAction" method="POST" id="contactForm"
										name="contactForm" class="contactForm">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}">
										<c:if test="${selectCnt ==1 }">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="CUST_ID">아이디</label> <input
															type="text" class="form-control"
															value="${CustomerVO.getCUST_ID()}" name="CUST_ID"
															id="CUST_ID" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="CUST_NM">이름</label> <input
															type="text" class="form-control"
															value="${CustomerVO.getCUST_NM()}" name="CUST_NM"
															id="CUST_NM" readonly>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="CUST_PWD">비밀번호</label> <input
															type="password" class="form-control" name="CUST_PWD"
															id="CUST_PWD" value="${CustomerVO.getCUST_PWD()}"
															placeholder="비밀번호">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="CUST_EM">이메일</label> <input
															type="email" class="form-control" name="CUST_EM"
															id="CUST_EM" value="${CustomerVO.getCUST_EM()}"
															placeholder="이메일">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="CUST_PH">연락처</label> <input
															type="text" class="form-control" name="CUST_PH"
															id="CUST_PH" value="${CustomerVO.getCUST_PH()}"
															placeholder="연락처">
													</div>
												</div>
												<div class="col-md-7">
													<div class="form-group">
														<label class="label" for="postcode">우편번호</label> <input
															type="text" class="form-control" name="zipcode"
															id="postcode" value="${CustomerVO.getZIPCODE()}"
															placeholder="우편번호" readonly>
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group" style="margin-top: 10px;">
														<input type="button" value="주소찾기" class="btn btn-primary"
															onclick="addressSerch();" style="margin-top: 25px;">
														<div class="submitting"></div>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="address1">도로명 주소</label> <input
															type="text" class="form-control" name="address1"
															id="address1" value="${CustomerVO.getADDRESS1()}"
															placeholder="도로명 주소" readonly>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="address2">지번 주소</label> <input
															type="text" class="form-control" name="address2"
															id="address2" value="${CustomerVO.getADDRESS2()}"
															placeholder="지번 주소" readonly>
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="subaddress">상세주소</label> <input
															type="text" class="form-control" name="subaddress"
															id="subaddress" value="${CustomerVO.getSUBADDRESS()}"
															placeholder="상세주소">
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="수정" class="btn btn-primary">
														<input type="button" value="탈퇴하기" class="btn btn-primary"
															onclick="if(confirm('정말 회원 탈퇴하시겠습니까?')) window.location='delCustomer'">
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${selectCnt !=1 }">
											<script type="text/javascript">
												alert("입력하신 비밀번호가 일치하지 않습니다. \n다시 입력해주세요");
												window.history.back();
											</script>
										</c:if>
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

	<%@ include file="../../main/footer.jsp"%>
</body>
</html>
