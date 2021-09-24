<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<div style="display: flex">
		<nav id="listdiv_id1" style="width: 400px; padding: 100px;">
			<ul>
				<li>-고객-</li>
				<li><a href="#">훈련사 목록</a></li>
				<li><a href="">이용 후기</a></li>
				<li><a href="">훈련 종류</a></li>
				<li>-훈련사-</li>
				<li><a href="applyTrainer">훈련사지원</a></li>
				<li><a href="">활동 등록</a></li>
				<li><a href="">나에게 온 의뢰</a></li>
			</ul>
		</nav>

		<section
			style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
			<form name="applyform" action="applyTrainerAction" method="post"
				onsubmit="return joinCheck();">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<div class="row no-gutters">
					<div class="col-md-7"
						style="max-width: 100% !important; flex: 0 0 100% !important">
						<div class="contact-wrap w-100 p-md-5 p-4">
							<h3 class="mb-4">훈련사 등록</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<div class="form-field">

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="service_loc">고객 아이디</label> <br>
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
														id="tr_kind1_fee" name="tr_kind1_fee" class="form-control">
												</div>
												<div id="tr_kind2_fee" style="display: none">
													<label>한 회차당 분리불안 요금</label> <input type="number"
														id="tr_kind2_fee" name="tr_kind2_fee" class="form-control">
												</div>
												<div id="tr_kind3_fee" style="display: none">
													<label>한 회차당 기본훈련 요금</label> <input type="number"
														id="tr_kind3_fee" name="tr_kind3_fee" class="form-control">
												</div>
												<div id="tr_kind4_fee" style="display: none">
													<label>한 회차당 짖음해결 요금</label> <input type="number"
														id="tr_kind4_fee" name="tr_kind4_fee" class="form-control">
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="service_loc">시터 서비스 가능 지역</label> <input
											type="button" value="주소찾기" class="btn btn-primary"
											onclick="addressSerch();" style="margin-top: 25px;">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group" style="display: none">
										<label class="label" for="postcode">우편번호</label> <input
											type="text" class="form-control" name="postcode"
											id="postcode" placeholder="우편번호" readonly>
									</div>
								</div>


								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="address1">도로명 주소</label> <input
											type="text" class="form-control" name="address1" id="address1"
											placeholder="도로명 주소" readonly>
									</div>
								</div>

								<div class="col-md-12" style="display: none">
									<div class="form-group">
										<label class="label" for="address2">지번 주소</label> <input
											type="text" class="form-control" name="address2"
											id="address2" placeholder="지번 주소" readonly>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="trainingDay">훈련가능일</label><br>
										<input type="date" class="iptags" name="START_DAY">~ <input
											type="date" class="iptags" name="END_DAY"> <br>
										조정가능<input type="checkbox" class="iptags" name="ADJUSTABLE"
											value="1">
									</div>
								</div>


								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="TA_TITLE">소개글 제목</label> <input
											type="text" class="form-control" name="TA_TITLE"
											id="TA_TITLE">
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="TA_APPEAL">소개글 본문</label> <input
											type="text" class="form-control" name="TA_APPEAL"
											id="TA_APPEAL">
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label class="label" for="TA_IMG">프로필 사진</label>
										<label class="btn btn-primary" for="TA_IMG">업로드</label>
										<input type="file" id="TA_IMG" name="TA_IMG" accept="image/*" class="btn btn-primary" style="display: none">
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group" align="center">
										<input type="submit" value="지원하기" class="btn btn-primary"
											id="applyTrainer">
										<div class="submitting"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>

	<%@ include file="../../main/footer.jsp"%>
</body>
</html>