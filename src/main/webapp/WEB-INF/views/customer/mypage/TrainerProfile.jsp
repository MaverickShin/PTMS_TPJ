<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>훈련사 프로필 수정</title>
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
								<li class="div_li"><a href="/tpj/cust/MyInfo">내정보 관리</a></li>
								<li class="div_li"><a href="/tpj/cust/MyPet">MY PET</a></li>
								<li class="div_li"><a href="/tpj/cust/SitterProfile">시터 프로필</a></li>
								<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사 프로필</a></li>
								<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
							</ul>
						</nav>

						<div class="row no-gutters">
							<div class="col-md-7"
								style="max-width: 100% !important; flex: 0 0 100% !important">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">TrainerProfile</h3>
									<form method="POST" id="contactForm" name="contactForm"
										class="contactForm">
										<div class="row">
											<div class="col-md-12">
												<div class="box">
													<!-- 프로필 사진 -->
													<img class="profile" alt="이미지"
														src="${path}images/gallery-2.jpg">
												</div>
												<div class="filebox">
													<input class="form-group" type="file" id="TA_IMG"
														name="TA_IMG" accept="${imgPath}*">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_NM">이름</label> <input
														type="${dto.CUST_NM}" class="form-control" name="CUST_NM"
														id="CUST_NM" placeholder="훈련사" readonly>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_ID">아이디</label> <input
														type="text" class="form-control" name="CUST_ID"
														id="CUST_ID" value="${dto.CUST_ID}" placeholder="아이디">
												</div>
											</div>
											<div class="col-md-6">
												<label class="label" for="TS_AREA">서비스 가능지역</label><br>
													<input class="form-group" type="checkbox" id="TS_AREA1" name="TS_AREA" value="인천">인천&nbsp;
													<input class="form-group" type="checkbox" id="TS_AREA2" name="TS_AREA" value="강남">강남&nbsp;
													<input class="form-group" type="checkbox" id="TS_AREA3" name="TS_AREA" value="강남">홍대&nbsp;
													<input class="form-group" type="checkbox" id="TS_AREA4" name="TS_AREA" value="잠실">잠실&nbsp;
													<input class="form-group" type="checkbox" id="TS_AREA5" name="TS_AREA" value="마포">마포
												<br>
												<label class="label" for="TS1_NO">서비스</label><br>
													<input class="form-group" type="checkbox" id="TS1_NO" name="TS1_NO" value="${dto.SV1_NO}">배변훈련&nbsp;
													<input class="form-group" type="checkbox" id="TS2_NO" name="TS2_NO" value="${dto.SV2_NO}">짖음훈련&nbsp;
													<input class="form-group" type="checkbox" id="TS3_NO" name="TS3_NO" value="${dto.SV3_NO}">기본훈련&nbsp;
													<input class="form-group" type="checkbox" id="TS4_NO" name="TS4_NO" value="${dto.SV4_NO}">공격성해결훈련
												<br>
												<label class="label" for="RESERVATION">예약 가능일</label>
													<input type="checkbox" id="RESERVATION1" name="RESERVATION" value="${dto.RESERVATION}">평일
													<input type="checkbox" id="RESERVATION2" name="RESERVATION" value="${dto.RESERVATION}">주말
												<br>
												<label class="label" for="START_TM">방문가능시간</label>
													<input type="time" id="START_TM" name="START_TM">
												<label class="label" for="END_TM">마감시간</label>
													<input type="time" id="END_TM" name="END_TM">
												<br><br>
											</div>
											<div class="col-md-12" style="text-align:center;">
												<label class="label" for="TA_TITLE">소개글</label>
												<input type="text" class="form-control" name="TA_TITLE" id="TA_TITLE" placeholder="소개글 제목">
												<textarea rows="5px" cols="100%" name="TA_APPEAL" id="TA_APPEAL"></textarea>
											</div>
											
											<div class="col-md-12" style="text-align:center;">
												<div class="form-group">
													<input type="submit" value="수정" class="btn btn-primary">
												</div>
											</div>
										</div>
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