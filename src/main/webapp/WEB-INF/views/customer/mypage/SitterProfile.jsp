<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터 프로필 수정</title>
<style type="text/css">
.link {
	display: block;
	padding: 2rem 0rem;
}
#mypages {
	position:relative;
	cursor: pointer;
	color:#00bd56;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function updateCheck(){
	if (!document.applyform.WK_START.value){
		alert("시작 날짜를 입력하세요");
		return false;
	}else if(!document.applyform.WK_END.value){
		alert("마지막 날짜를 입력하세요");
		return false;
	}else if(!document.applyform.SIT_IMG.value){
		alert("이미지를 등록해 주세요");
		return false;
	}
}

</script>

<style type="text/css">
.row label {
	font-size: 18px !important;
	font-weight: normal;
}

.row input {
	font-size: 13px !important;
	font-weight: normal !important;
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
<!-- 				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">반려인/반려동물 관리</h2>
				</div> -->
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper" style="font-family: 'Do Hyeon', sans-serif;">
					<%@ include file="MyInfobar.jsp"%>
						<div class="row no-gutters">
							<div class="col-md-7"
								style="max-width: 100% !important; flex: 0 0 100% !important">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4" style="TEXT-ALIGN-LAST:center;font-size:35px">펫시터 프로필 수정</h3>
									<form action="SitterProfileAction" name="applyform" method="post" onsubmit="return updateCheck();">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="SIT_ID" value="${dto.getSIT_ID()}">
										<div class="row no-gutters">
											<div class="col-md-7"
												style="max-width: 100% !important; flex: 0 0 100% !important">
												<div class="contact-wrap w-100 p-md-5 p-4">
													<div class="row">

														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="service_loc">고객 아이디</label><br>
																${sessionScope.cust_id}
															</div>
														</div>

														<div class="col-md-12" >
															<div class="form-group">
																<div class="form-field">
																	<div class="select-wrap">
																		<label class="label" for="tr_kind">제공 가능한 서비스를 선택해 주세요</label>
																		<br>
																		<p class = "chk_p1"><label class = "chk_label1" for = "SV1_NO"><span class = "list_label_span1">미용 서비스</span><input type="checkbox" value="1" name="SV1_NO" class="sel_chk1" id = "SV1_NO"><span class = "checkbox_icon" ></span></label>&nbsp;
																		 <p class = "chk_p1"><label class = "chk_label1" for = "SV2_NO"><span class = "list_label_span1">놀이 서비스</span><input type="checkbox" value="2" name="SV2_NO" id = "SV2_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
	                                    								 <p class = "chk_p1"><label class = "chk_label1" for = "SV3_NO"><span class = "list_label_span1">산책 서비스</span><input type="checkbox" value="3" name="SV3_NO" id = "SV3_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
																		<p class = "chk_p1"><label class = "chk_label1" for = "SV4_NO"><span style = "margin-right: 79px;">응급처치 서비스 <span style="color:blue;">(필수)</span></span><input type="checkbox" value="4" name="SV4_NO" class="sel_chk1" id = "SV4_NO"checked onclick="return false;"><span class = "checkbox_icon"></span></label></p>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-md-12">
															<label class="label" for="SIT_ST">시터 활동 상태</label><br>
															<c:if test="${dto.getSIT_ST() == 0}">
																<label>
																	<input
																	type="radio" value="0" name="SIT_ST" id="SIT_ST"
																	class="form-group" checked>활동해제
																</label>
																<label><input
																	type="radio" value="1" name="SIT_ST" id="SIT_ST"
																	class="form-group">활동중
																</label>
															</c:if>
															&nbsp;
															<c:if test="${dto.getSIT_ST() == 1}">
																<label>
																	<input
																	type="radio" value="0" name="SIT_ST" id="SIT_ST"
																	class="form-group">활동해제
																</label>
																<label><input
																	type="radio" value="1" name="SIT_ST" id="SIT_ST"
																	class="form-group" checked>활동중
																</label>
															</c:if>
														</div>
																
														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="service_loc">시터 서비스 가능 지역</label> 
																<input type="button" value="주소찾기"
																	class="btn btn-primary" onclick="addressSerch();"
																	style="margin-top: 25px;">
															</div>
														</div>

														<div class="col-md-6">
															<div class="form-group" style="display: none">
																<label class="label" for="postcode">우편번호</label> <input
																	type="text" class="form-control" name="address1"
																	id="postcode" placeholder="우편번호" readonly>
															</div>
														</div>


														<div class="col-md-12">
															<div class="form-group">
																<label class="label" for="address1">도로명 주소</label> <input
																	type="text" class="form-control" name="SV_AREA"
																	id="address1" value="${dto.getSV_AREA()}" placeholder="도로명 주소" readonly>
															</div>
														</div>

														<div class="col-md-12" style="display: none">
															<div class="form-group">
																<label class="label" for="address2">지번 주소</label> <input
																	type="text" class="form-control" name="address2"
																	id="address2" placeholder="지번 주소" readonly>
															</div>
														</div>
														
														<div class="col-md-6">
															<div class="form-group">
																<label class="label" for="hometype">주거지 유형</label> <select
																	size="1" id="iptags" name="SR_CD">
																	<option value="1">주택(마당x)</option>
																	<option value="2">주택(마당o)</option>
																	<option value="3">아파트</option>
																	<option value="4">빌라</option>
																</select><br>
															</div>
														</div>

														<div class="col-md-6">
															<div class="form-group">
																<label class="label" for="trainingDay">서비스 가능일</label> <br>
																<input type="date" class="iptags" name="WK_START" value="${dto.getWK_START()}">
																~ <input type="date" class="iptags" name="WK_END" value="${dto.getWK_END()}">
															</div>
														</div>

														<div class="col-md-12" style="text-align: center;">
														<br><br>
															<label class="label" for="SIT_TITLE">소개글</label> <input
																type="text" class="form-control" name="SIT_TITLE"
																id="SIT_TITLE" value="${dto.getSIT_TITLE() }" placeholder="소개글 제목">
															<textarea class="col-md-12" rows="5px" name="SIT_APPEAL"
																id="SIT_APPEAL" placeholder="소개글 본문">${dto.getSIT_APPEAL() }</textarea>
														</div>

														<div class="col-md-12">
															<div class="form-group">
																<br>
																<label class="label" for="SIT_IMG">프로필 사진</label> 
																<label class="btn btn-primary" for="SIT_IMG">업로드</label> 
																<input type="file" id="SIT_IMG" name="SIT_IMG" accept="image/*" class="btn btn-primary" style="display: none">
															</div>
														</div>

														<div class="col-md-12">
															<div class="form-group" align="center">
																<input type="submit" value="수정하기" class="btn btn-primary" id="join_sub"> 
																<input type="button" value="탈퇴하기"
																	class="btn btn-primary" onclick = "if(confirm('정말 시터를 탈퇴하시겠습니까?')) window.location='SitterDel?SIT_ID=${dto.SIT_ID}'">
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