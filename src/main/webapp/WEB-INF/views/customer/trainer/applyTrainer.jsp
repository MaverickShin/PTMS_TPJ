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
	
	function joinCheck() {
		
		
		
		var chk = $("input:checkbox[class='form-group']");
		
		var bool = false;
		
		
		for (var i = 0; i < chk.length; i++) {
			
			if(chk[i].checked) {
				bool = true;
			}
			
		}
		
		if(bool == false) {
			alert("훈련가능 유형을 선택하세요.");
			return false;
			
		} else if($("#TS1_NO").is(":checked")) {
			if($("#tr_kind1_fee").val() === "") {
				alert("111훈련요금을 입력하세요.");
				$("#tr_kind1_fee").focus();
				return false;
			}
		} else if($("#TS2_NO").is(":checked")) {
			if(!$("#tr_kind2_fee2").val()) {
				alert("222훈련요금을 입력하세요.");
				$("#tr_kind2_fee2").focus();
				return false;
			}
		} else if($("#TS3_NO").is(":checked")) {
			if(!$("#tr_kind3_fee").val()) {
				alert("333 입력하세요.");
				$("#tr_kind3_fee").focus();
				return false;
			}
		} else if($("#TS4_NO").is(":checked")) {
			if(!$("#tr_kind4_fee").val()) {
				alert("4 입력하세요.");
				$("#tr_kind4_fee").focus();
				return false;
			}
		} else if(!document.applyform.address1.value) {
			alert("훈련가능 지역을 입력하세요.");
			return false;
		} else if(!document.applyform.START_DAY.value) {
			alert("서비스 시작일을 지정하세요.");
			return false;
		} else if(!document.applyform.END_DAY.value) {
			alert("서비스 종료일을 지정하세요.");
			return false;
		} else if(!document.applyform.TA_TITLE.value) {
			alert("")
		}
		
	}
</script>
<script type="text/javascript">

	
</script>

<style>
	.row label {
		font-size: 24px !important;
		font-weight: normal;
	}
	
	.row input {
		font-size: 20px !important;
		font-weight: normal !important;
	}
	
.switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 24px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #bdbdbd;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 16px;
  width: 16px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #00bd56;
}

input:focus + .slider {
  box-shadow: 0 0 1px #00bd56;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<div style="display: flex; flex:1; justify-content:center;">
			<%@ include file = "sidebar.jsp" %>
			
			<c:if test="${selectCnt != 0}">
				<script type="text/javascript">
					alert("이미 훈련사로 활동중인 아이디 입니다. 내정보관리를 확인해 주세요");
					window.location='${tr}requestTrainer';
				</script>
			</c:if>

		<section style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
			<form name="applyform" action="applyTrainerAction" method="post"
				onsubmit="return joinCheck();">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<div class="row no-gutters">
					<div class="col-md-7"
						style="max-width: 100% !important; flex: 0 0 100% !important">
						<div class="contact-wrap w-100 p-md-5 p-4">
							<h2 class="mb-4" style = "padding-bottom:20px; border-bottom:1px solid #00bd56">훈련사 등록</h2>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<div class="form-field">

											<div class="col-md-12" style = "margin-bottom: 40px;">
												<div class="form-group">
													<label class="label" for="service_loc">고객 아이디</label> <br>
													${sessionScope.cust_id}
												</div>
											</div>

											<div class="col-md-12"  style = "margin-bottom: 40px; padding-bottom: 30px; border-bottom: 1px solid #00bd56;">
												<label class="label" for="tr_kind">훈련가능 유형</label><br>
														<label for = "TS1_NO" style = "margin-right: 20px; cursor:pointer;">
															<label class = "switch">
																	<input type="checkbox" value="1" name="TS1_NO" id="TS1_NO" class="form-group"
																	onchange="check();">
																	<span class = "slider round"></span>
															</label> 
															배변훈련
														</label>
														
														<label for = "TS2_NO" style = "margin-right: 20px; cursor:pointer;">
															<label class = "switch">
																<input type="checkbox" value="2" name="TS2_NO" id="TS2_NO"
																class="form-group" onchange="check();">
																<span class = "slider round"></span>
															</label> 
															분리불안
														</label>
														
														<label for = "TS3_NO" style = "margin-right: 20px; cursor:pointer;">
															<label class = "switch">
																<input type="checkbox" value="3" name="TS3_NO" id="TS3_NO"
																class="form-group" onchange="check();">
																<span class = "slider round"></span>
															</label> 
															기본훈련
														</label>
														
														<label for = "TS4_NO" style = "margin-right: 20px; cursor:pointer;">
															<label class = "switch">
																<input type="checkbox" value="4" name="TS4_NO" id="TS4_NO"
																class="form-group" onchange="check();">
																<span class = "slider round"></span>
															</label>
															짖음해결
														</label>

												<div id="tr_kind1_fee" style="display: none; margin-bottom:30px;">
													<label>한 회차당 <span style = "color:#00bd56">배변훈련</span> 요금</label> <input type="number"
														id="tr_kind1_fee1" name="tr_kind1_fee" min="1000" class="form-control">
												</div>
												<div id="tr_kind2_fee" style="display: none; margin-bottom:30px;">
													<label>한 회차당 <span style = "color:#00bd56">분리불안</span> 요금</label> <input type="text"
														id="tr_kind2_fee2" name="tr_kind2_fee" min="1000" class="form-control">
												</div>
												<div id="tr_kind3_fee" style="display: none; margin-bottom:30px;">
													<label>한 회차당 <span style = "color:#00bd56">기본훈련</span> 요금</label> <input type="number"
														id="tr_kind3_fee3" name="tr_kind3_fee" min="1000" class="form-control">
												</div>
												<div id="tr_kind4_fee" style="display: none; margin-bottom:30px;">
													<label>한 회차당 <span style = "color:#00bd56">짖음해결</span> 요금</label> <input type="number"
														id="tr_kind4_fee4" name="tr_kind4_fee" min="1000" class="form-control">
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-12" style = "margin-bottom:10px;">
									<div class="form-group">
										<label class="label" for="service_loc">훈련사 서비스 가능 지역</label> 
										<input type="button" value="주소찾기" class="btn btn-primary"
											onclick="addressSerch();" style = "line-height:10px; margin-left:30px; height: 35px; font-size: 14px !important;">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group" style="display: none">
										<label class="label" for="postcode">우편번호</label> <input
											type="text" class="form-control" name="postcode"
											id="postcode" placeholder="우편번호" readonly>
									</div>
								</div>


								<div class="col-md-12"  style = "border-bottom:1px solid #00bd56; margin-bottom: 40px;">
									<div class="form-group">
										<input
											type="text" class="form-control" name="address1" id="address1"
											placeholder="도로명 주소" readonly style = "margin-bottom: 40px;">
									</div>
								</div>

								<div class="col-md-12" style="display: none">
									<div class="form-group">
										<label class="label" for="address2">지번 주소</label> <input
											type="text" class="form-control" name="address2"
											id="address2" placeholder="지번 주소" readonly>
									</div>
								</div>

								<div class="col-md-12" style = "margin-top: 20px; padding-bottom:20px; border-bottom:1px solid #00bd56;">
									<div class="form-group">
										<label class="label" for="trainingDay">훈련가능일</label><br>
										<input type="date" class="iptags" name="START_DAY">
										<span style = "font-size: 20px; font-weight:bold;">&nbsp;&nbsp; ~ &nbsp;&nbsp;</span>
										<input type="date" class="iptags" name="END_DAY"> <br>
										<br>
										<p class = "chk_p1"><label class="chk_label1" for="ADJUSTABLE"><span class = "list_label_span1" style = "margin-right: 30px !important;">조정가능</span><input type="checkbox" class="sel_chk1" name="ADJUSTABLE" id = "ADJUSTABLE" value="1"><span class = "checkbox_icon"></span></label></p>
									</div>
								</div>


								<div class="col-md-12" style = "margin-top: 30px;">
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

								<div class="col-md-12" style = "margin-top: 30px; border-bottom:1px solid #00bd56; margin-bottom: 30px;">
									<div class="form-group">
										<label class="label" for="TA_IMG">프로필 사진</label>
										<label class="btn btn-primary" for="TA_IMG" style = "font-size: 16px !important; height:50px; font-weight:normal !important; margin-left:15px;">사진등록</label>
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