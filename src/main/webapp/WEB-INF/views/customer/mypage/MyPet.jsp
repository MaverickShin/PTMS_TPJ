<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyPet</title>
<meta charset="utf-8">
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
							<li class="div_li"><a href="/tpj/cust/MyInfo">내정보 관리</a></li>
							<li class="div_li"><a href="/tpj/cust/MyPet">MY PET</a></li>
							<li class="div_li"><a href="/tpj/cust/SitterProfile">시터 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
						</ul>
					</nav>
					
					<div class="row no-gutters">
						<div class="col-md-7">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">MyPet</h3>
								
								<form method="POST" id="contactForm" name="contactForm" class="contactForm">
									<details>
										<summary>강아지</summary>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_ID">고객아이디</label> <input
														type="text" class="form-control" name="CUST_ID" id="CUST_ID"
														value="${dto.CUST_ID}" readonly>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PK_CD">펫종류</label> <input
														type="text" class="form-control" name="PK_CD" id="PK_CD"
														value="강아지" readonly>
												</div>
											</div>
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
											<div class="col-md-12">
												<label class="label" for="PET_IMG">펫사진</label>&nbsp;&nbsp;
												<input class="form-group" type="file" id="PET_IMG" name="PET_IMG" accept="${imgPath}*">
											</div>
											<div class="col-md-12">
												<label class="label" for="PK_DETAIL">펫크기</label>&nbsp;&nbsp;
												<input class="form-group" type="radio" id="PK_DETAIL1" name="PK_DETAIL">소견(~7kg)&nbsp;
												<input class="form-group" type="radio" id="PK_DETAIL2" name="PK_DETAIL">중견(8kg~15kg)&nbsp;
												<input class="form-group" type="radio" id="PK_DETAIL3" name="PK_DETAIL">대견(16kg~)
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
													<input type="submit" value="저장" class="btn btn-primary">
												</div>
											</div>
										</div>
									</details>
									<details>
										<summary>고양이</summary>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_ID">고객아이디</label> <input
														type="text" class="form-control" name="CUST_ID" id="CUST_ID"
														value="아이디" readonly>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PK_CD">펫종류</label> <input
														type="text" class="form-control" name="PK_CD" id="PK_CD"
														value="고양이" readonly>
												</div>
											</div>
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
											<div class="col-md-12">
												<label class="label" for="PET_IMG">펫사진</label>
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
													<input type="submit" value="저장" class="btn btn-primary">
												</div>
											</div>
										</div>
									</details>
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