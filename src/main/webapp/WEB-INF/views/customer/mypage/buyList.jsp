<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련사 프로필 수정</title>
<style type="text/css">
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
					<h1 class="mb-0 bread">SitterProfile</h1>
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
							<div class="col-md-7"
								style="max-width: 100% !important; flex: 0 0 100% !important">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">buyList</h3>
									<form method="POST" id="contactForm" name="contactForm" class="contactForm">
										<img alt="" src="${path}images/gallery-2.jpg">
									</form>
								</div>
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