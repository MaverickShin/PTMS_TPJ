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
											
											<div class="select-wrap">
       											<label class="label" for="tr_kind">훈련가능 유형</label>
					                      		<label><input type="checkbox" value="1" name="tr_kind1" id="tr_kind1" class="form-control" onchange = "check();">배변훈련</label>
					                      		<div id="tr_kind1_fee" style = "display:none">
					                      			<label>한 회차당 배변훈련 요금</label>
                         									<input type="number" id="tr_kind1_fee" class="form-control">
                      								</div>
					                      		<label><input type="checkbox" value="2" name="tr_kind2" id="tr_kind2" class="form-control" onchange = "check();">분리불안</label>
					                      		<div id="tr_kind2_fee" style = "display:none">
					                      			<label>한 회차당 분리불안 요금</label>
                         									<input type="number" id="tr_kind1_fee" class="form-control">
                      								</div>
					                      		<label><input type="checkbox" value="3" name="tr_kind3" id="tr_kind3" class="form-control" onchange = "check();">기본훈련</label>
					                      		<div id="tr_kind3_fee" style = "display:none">
					                      			<label>한 회차당 기본훈련 요금</label>
                         									<input type="number" id="tr_kind1_fee" class="form-control">
                      								</div>
					                      		<label><input type="checkbox" value="4" name="tr_kind4" id="tr_kind4" class="form-control" onchange = "check();">짖음해결</label>
					                      		<div id="tr_kind4_fee" style = "display:none">
					                      			<label>한 회차당 짖음해결 요금</label>
                         									<input type="number" id="tr_kind1_fee" class="form-control">
                      								</div>
                 							</div>
											
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="service_loc">훈련 가능 지역</label>
													<input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
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
													<label class="label" for="trainingDay">훈련가능일</label><br>
													<input type="date" class="iptags" name="START_DAY" >~
													<input type="date" class="iptags" name="END_DAY" >
													조정가능<input type="checkbox" class="iptags" name="ADJUSTABLE" value="1">
												</div>
											</div>
											
											
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="intro_title">소개글 제목</label>
													<input type="text" class="form-control" name="intro_title" id="intro_title">
												</div>
											</div>
											
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="intro_content">소개글 본문</label>
													<input type="text" class="form-control" name="intro_content" id="intro_content">
												</div>
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