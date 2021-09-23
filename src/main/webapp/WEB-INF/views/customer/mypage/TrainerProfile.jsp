<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check() {

		var chk1 = document.applyform.TS1_NO.checked;
		var chk2 = document.applyform.TS2_NO.checked;
		var chk3 = document.applyform.TS3_NO.checked;
		var chk4 = document.applyform.TS4_NO.checked;

		var result1 = document.getElementById("tr_kind1_fee");
		var result2 = document.getElementById("tr_kind2_fee");
		var result3 = document.getElementById("tr_kind3_fee");
		var result4 = document.getElementById("tr_kind4_fee");

		if (chk1) {
			result1.style.display = "block";
		} else {
			result1.style.display = "none";
		}

		if (chk2) {
			result2.style.display = "block";
		} else {
			result2.style.display = "none";
		}

		if (chk3) {
			result3.style.display = "block";
		} else {
			result3.style.display = "none";
		}

		if (chk4) {
			result4.style.display = "block";
		} else {
			result4.style.display = "none";
		}

		/* if(document.getElementById("tr_kind1").checked) {
			document.getElementById("input_check_hidden1").disabled = true;
		} */

	}
</script>
<style type="text/css">
.link {
	display: block;
	padding: 2rem 0rem; 
}
</style>
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
					<h1 class="mb-0 bread">TrainerProfile</h1>
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
								<li class="div_li"><a href="/tpj/cust/MyInfoUser">내정보
										관리</a></li>
								<li class="div_li" id = "mypages"><a class="link">MY PET</a>
									<div class = "hide">
						    			<a href="/tpj/cust/MyPet">펫 등록</a>
							    		<a href="/tpj/cust/MyPetList">펫 등록/수정</a>
									</div>
								</li>
								<li class="div_li"><a href="/tpj/cust/SitterProfile">시터
										프로필</a></li>
								<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사
										프로필</a></li>
								<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
								<li class="div_li"><a href="/tpj/cust/delCustomer">회원탈퇴</a></li>
							</ul>
						</nav>

						<div class="row no-gutters">
							<div class="col-md-7"
								style="max-width: 100% !important; flex: 0 0 100% !important">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">TrainerProfile 수정</h3>
									<form name="applyform" action="TrainerProfileAction" method="post" onsubmit="return joinCheck();">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type ="hidden" name="TA_CD" value="${dto.getTA_CD()}">
										
										<div class="row no-gutters">
											<div class="col-md-7"
												style="max-width: 100% !important; flex: 0 0 100% !important">
												<div class="contact-wrap w-100 p-md-5 p-4">
													<h3 class="mb-4">훈련사 등록</h3>
													<div class="row">
														<div class="form-group">
															<div class="form-field">

																<div class="col-md-12">
																	<div class="form-group">
																		<label class="label" for="service_loc">고객 아이디</label><br>
																		${sessionScope.cust_id}
																	</div>
																</div>

																<div class="col-md-12">
																	<label class="label" for="tr_kind">훈련가능 유형</label><br>
																	<label><input type="checkbox" value="1"
																		name="TS1_NO" id="TS1_NO" class="form-group"
																		onchange="check();">배변훈련</label> <label><input
																		type="checkbox" value="2" name="TS2_NO" id="TS2_NO"
																		class="form-group" onchange="check();">분리불안</label> <label><input
																		type="checkbox" value="3" name="TS3_NO" id="TS3_NO"
																		class="form-group" onchange="check();">기본훈련</label> <label><input
																		type="checkbox" value="4" name="TS4_NO" id="TS4_NO"
																		class="form-group" onchange="check();">짖음해결</label>

																	<div id="tr_kind1_fee" style="display: none">
																		<label>한 회차당 배변훈련 요금</label> <input type="number"
																			id="tr_kind1_fee" name="tr_kind1_fee"
																			value="${dto.getTS1_FEE()}" class="form-control">
																	</div>
																	<div id="tr_kind2_fee" style="display: none">
																		<label>한 회차당 분리불안 요금</label> <input type="number"
																			id="tr_kind2_fee" name="tr_kind2_fee"
																			value="${dto.getTS2_FEE()}" class="form-control">
																	</div>
																	<div id="tr_kind3_fee" style="display: none">
																		<label>한 회차당 기본훈련 요금</label> <input type="number"
																			id="tr_kind3_fee" name="tr_kind3_fee"
																			value="${dto.getTS3_FEE()}" class="form-control">
																	</div>
																	<div id="tr_kind4_fee" style="display: none">
																		<label>한 회차당 짖음해결 요금</label> <input type="number"
																			id="tr_kind4_fee" name="tr_kind4_fee"
																			value="${dto.getTS4_FEE()}" class="form-control">
																	</div>
																</div>
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="service_loc">훈련 가능 지역</label>
																<input type="button" value="주소찾기"
																	class="btn btn-primary" onclick="addressSerch();"
																	style="margin-top: 25px;">
															</div>
														</div>

														<div class="col-md-6" style="display: none">
															<div class="form-group">
																<label class="label" for="postcode">우편번호</label> <input
																	type="text" class="form-control" name="address1"
																	id="postcode" placeholder="우편번호" readonly>
															</div>
														</div>


														<div class="col-md-6"  style="display: none">
															<div class="form-group">
																<label class="label" for="address1">서비스 주소</label> <input
																	type="text" class="form-control" name="address1"
																	id="address1"
																	placeholder="도로명 주소" readonly>
															</div>
														</div>

														<div class="col-md-6">
															<div class="form-group">
																<label class="label" for="address2">지번 주소</label> <input
																	type="text" class="form-control" name="address2"
																	id="address2" value="${dto.getTS_AREA()}" placeholder="지번 주소" readonly>
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="trainingDay">훈련가능일</label><br>
																<input type="date" class="iptags" name="START_DAY">~
																<input type="date" class="iptags" name="END_DAY">
																<br>
																<fmt:formatDate value="${dto.getSTART_DAY() }"
																	pattern="yyyy-MM-dd" />
																&nbsp; ~ &nbsp;
																<fmt:formatDate value="${dto.getEND_DAY() }"
																	pattern="yyyy-MM-dd" />
																<br> 조정가능<input type="checkbox" class="iptags"
																	name="ADJUSTABLE" value="1">
															</div>
														</div>


														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="TA_TITLE">소개글 제목</label> <input
																	type="text" class="form-control" name="TA_TITLE"
																	id="TA_TITLE" value="${dto.getTA_TITLE()}">
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="TA_APPEAL">소개글 본문</label> <input
																	type="text" class="form-control" name="TA_APPEAL"
																	id="TA_APPEAL" value="${dto.getTA_APPEAL()}">
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="TA_IMG">프로필 사진</label>
																<label class="btn btn-primary" for="TA_IMG">업로드</label> 
																<input type="file" id="TA_IMG" name="TA_IMG" accept="image/*" class="btn btn-primary" style="display:none">
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group" align="center">
																<input type="submit" value="수정하기"
																	class="btn btn-primary" id="applyTrainer">
																<!-- <input type="button" value="수정하기"
																	class="btn btn-primary" id="applyTrainer" onclick="window.location='TrainerProfileAction?TA_CD=${dto.TA_CD}'"> -->
																<div class="submitting"></div>
															</div>
														</div>
													</div>
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