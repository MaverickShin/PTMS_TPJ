<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyPet</title>
<meta charset="utf-8">

<style>
.hide {
	display:none;
	background-color: #00bd56;
	min-width: 160px;
	box-shadow: 10px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
	font-size: 12px;
	position: absolute;
	left: -15px;
	top: 0px;
}
.hide a {
	color: white;
  	padding: 12px 16px;
  	text-decoration: none;
  	display: block;
  	text-align: left;
}

.hide a:hover {
	color: #00bd56;
	font-weight: bold;
	background-color: white;
}

#mypages {
	position:relative;
	cursor: pointer;
	color:#00bd56;
}

#mypages:hover .hide {
	display: block;
}
.link {
	display: block;
	padding: 2rem 0rem; 
}
</style>

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
				<h1 class="mb-0 bread">MyPet</h1>
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
					<nav class="div_nav">
						<ul class="div_ul">
							<li class="div_li"><a href="/tpj/cust/MyInfoUser">내정보 관리</a></li>
							<li class="div_li" id = "mypages">
								<a class="link">MY PET</a>
								<div class = "hide">
					    			<a href="/tpj/cust/MyPet">펫 등록</a>
						    		<a href="/tpj/cust/MyPetList">펫 등록/수정</a>
								</div>
							</li>
							<li class="div_li"><a href="/tpj/cust/SitterProfile">시터 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
							<li class="div_li"><a href="/tpj/cust/delCustomer">회원탈퇴</a></li>
						</ul>
					</nav>
					
					<div class="row no-gutters">
						<div class="col-md-7">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">MyPet 등록</h3>
								
								<form action="MyPetInsertAction" method="POST" id="contactForm" name="contactForm" class="contactForm" enctype="multipart/form-data">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<s:csrfInput/>
										<div class="row">
											<%-- <div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_ID">고객아이디</label> <input
														type="text" class="form-control" name="CUST_ID" id="CUST_ID"
														value="${PetVO.getCUST_ID()}" readonly>
												</div>
											</div> --%>
											
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PET_NM">펫이름</label> <input
														type="text" class="form-control" name="PET_NM" id="PET_NM"
														placeholder="펫이름">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PET_AGE">펫나이</label> <input
														type="text" class="form-control" name="PET_AGE" id="PET_AGE"
														placeholder="펫나이">
												</div>
											</div>
											<br>
											<div class="col-md-12">
												<label class="label" for="PK_CD">펫종류</label>&nbsp;&nbsp;
												<input class="form-group" type="radio" id="PK_CD" name="PK_CD" value="1">소형견(~7kg)&nbsp;
												<input class="form-group" type="radio" id="PK_CD" name="PK_CD" value="2">중형견(8kg~15kg)&nbsp;
												<input class="form-group" type="radio" id="PK_CD" name="PK_CD" value="3">대형견(16kg~)&nbsp;
												<input class="form-group" type="radio" id="PK_CD" name="PK_CD" value="4">고양이
											</div>
											<br>
											<div class="col-md-12">
												<label class="label" for="PET_IMG">펫사진</label>&nbsp;&nbsp;
												<input class="form-group" type="file" id="PET_IMG" name="PET_IMG" accept="${imgPath}*">
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="PET_CON">특이사항</label> <input
														type="text" class="form-control" name="PET_CON"
														id="PET_CON" placeholder="특이사항">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="submit" value="등록" class="btn btn-primary">
												</div>
											</div>
										</div>
								</form>
							</div>
						</div>
						
						<div class="col-md-5 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-5 img"
								style="background-image: url(${path}images/gallery-3.jpg);"></div>
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