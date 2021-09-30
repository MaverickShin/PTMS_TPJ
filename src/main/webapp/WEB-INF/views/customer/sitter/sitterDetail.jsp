<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function matchingChk() {

		var gsize = "";

		$("input[name=PK_CD]:checked").each(function() {

			if (gsize == "") {

				gsize = $(this).val();

			} else {

				gsize = gsize + "," + $(this).val();

			}

		});

		if (!document.matchingChk.START_DAY.value) {
			alert("서비스 시작일을 지정해 주세요.");
			document.matchingChk.START_DAY.focus();
			return false;
		} else if (!document.matchingChk.END_DAY.value) {
			alert("서비스 종료일을 지정해 주세요.");
			document.matchingChk.END_DAY.focus();
			return false;
		} else if (!gsize) {
			alert("한마리 이상의 반려동물을 선택하셔야 합니다.");
			return false;
		}
	}
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 20%;
	margin: 1% auto;
}

.list_div2 p {
	width: 200px;
}
</style>
<title>Insert title here</title>
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
						<span class="mr-2"><a href="">Trainer<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread" style="font-family: 'Do Hyeon', sans-serif;">펫시터
						매칭 결과</h1>
				</div>
			</div>
		</div>
	</section>

	<form action="requestSitting" class="search-form" name="matchingChk"
		method="post" onsubmit="return matchingChk();">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}"> <input type="hidden" name="SV_AREA"
			value="${SV_AREA}"> <input type="hidden" name="SIT_ID"
			value="${SIT_ID}">
		<section class="ftco-section ftco-degree-bg"
			style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; padding-top: 30px;">
			<div class="container">
				<div class="row">

					<!-- 나의 반려동물  -->
					<div class="col-md-12"
						style="margin-bottom: 30px; border-bottom: 2px solid #00bd56;">
						<div class="form-group">

							<h2>내가 선택한 조건</h2>

							<div class="list_div2" style="margin-top: 30px;">

								<h5 style="padding-bottom: 20px; color: #00bd56;">마이 펫</h5>
								<div
									style="display: grid; grid-template-columns: 1fr 1fr; border-bottom: 1px solid #eeeeee;">

									<c:set var="suc" value="false" />

									<c:forEach var="li" items="${list}" varStatus="lst">
										<c:forEach var="i" items="${pet}" varStatus="st">
											<p class="chk_p1">
												<label class="chk_label1" for="pet_li_${lst.index}">
													<input type="checkbox" id="pet_li_${lst.index}"
													class="sel_chk1" name="PK_CD" value="${li.PK_CD}"
													<c:if test = "${i == li.PK_CD}">
															checked
														</c:if>>

													<span class="checkbox_icon"></span> <span
													class="list_label_span2">${li.PET_NM}(${li.PK_CD})</span>
												</label> <input type="hidden" name="PET_CD" value="${li.PET_CD}">
											</p>
										</c:forEach>
									</c:forEach>
								</div>

								<h5
									style="padding-bottom: 20px; margin-top: 30px; color: #00bd56;">서비스</h5>
								<div
									style="display: grid; grid-template-columns: 1fr 1fr; border-bottom: 1px solid #eeeeee;">
									<c:forEach var="j" items="${sv_no}" varStatus="st">

										<c:choose>
											<c:when test="${st.index == 0}">
												<c:if test="${j == 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV1_NO"><span
															class="list_label_span1">미용 서비스</span><input
															type="checkbox" value="미용 서비스" name="SV1_NO"
															class="sel_chk1" id="SV1_NO"><span
															class="checkbox_icon"></span></label>
													</p>
												</c:if>

												<c:if test="${j != 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV1_NO"><span
															class="list_label_span1">미용 서비스</span><input
															type="checkbox" value="미용 서비스" name="SV1_NO"
															class="sel_chk1" id="SV1_NO" checked><span
															class="checkbox_icon"></span></label>
													</p>
												</c:if>
											</c:when>

											<c:when test="${st.index == 1}">
												<c:if test="${j == 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV2_NO"><span
															class="list_label_span1">놀이 서비스</span><input
															type="checkbox" value="놀이 서비스" name="SV2_NO" id="SV2_NO"
															class="sel_chk1"><span class="checkbox_icon"></span></label>
													</p>
												</c:if>

												<c:if test="${j != 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV2_NO"><span
															class="list_label_span1">놀이 서비스</span><input
															type="checkbox" value="놀이 서비스" name="SV2_NO" id="SV2_NO"
															class="sel_chk1" checked><span
															class="checkbox_icon"></span></label>
													</p>
												</c:if>
											</c:when>

											<c:when test="${st.index == 2}">
												<c:if test="${j == 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV3_NO"><span
															class="list_label_span1">산책 서비스</span><input
															type="checkbox" value="산책 서비스" name="SV3_NO" id="SV3_NO"
															class="sel_chk1"><span class="checkbox_icon"></span></label>
													</p>
												</c:if>

												<c:if test="${j != 0}">
													<p class="chk_p1">
														<label class="chk_label1" for="SV3_NO"><span
															class="list_label_span1">산책 서비스</span><input
															type="checkbox" value="산책 서비스" name="SV3_NO" id="SV3_NO"
															class="sel_chk1" checked><span
															class="checkbox_icon"></span></label>
													</p>
												</c:if>
											</c:when>
										</c:choose>

									</c:forEach>
									<p class="chk_p1">
										<label class="chk_label1" for="SV4_NO"><span
											style="margin-right: 79px;">응급처치 서비스 (필수)</span><input
											type="checkbox" value="응급처치 서비스" name="SV4_NO"
											class="sel_chk1" id="SV4_NO" value="${dto.SV4_NO}" checked
											disabled><span class="checkbox_icon"></span></label>
									</p>
								</div>

								<div class="row"
									style="margin-top: 30px; font-size: 18px !important;">
									<div class="col-md-4">
										<div class="form-group">
											<label class="label" for="START_DAY"
												style="font-size: 20px; font-weight: normal;">요청 시작일</label>
											<input type="date" class="form-control" name="START_DAY"
												id="START_DAY" value="${WK_START}"
												style="width: 300px !important; font-size: 18px !important;">
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group">
											<label class="label" for="END_DAY"
												style="font-size: 20px; font-weight: normal;">요청 종료일</label>
											<input type="date" class="form-control" name="END_DAY"
												id="END_DAY" value="${WK_END}"
												style="width: 300px !important; font-size: 18px !important;">
										</div>
									</div>

									<div class="col-md-12" style="margin-top: 30px;">
										<p>총 금액 : ${total} 원</p>
									</div>

									<div class="col-md-12" style="margin-top: 30px;">
										<c:if test="${reviewCnt != 0}">
											<h3 class="mb-5" class="label">후기</h3>
											<c:forEach var="dto" items="${revInfo}" varStatus="st">
												<div class="comment-body">
													<h5>${dto.CUST_ID}</h5>
													<div class="meta">${dto.SG_DT}</div>
													<p>${dto.SG_CON}</p>
												</div>
											</c:forEach>
										</c:if>

										<c:if test="${reviewCnt == 0}">
											<h4 class="mb-5" class="label">후기</h4>
				        					아직 등록된 후기가 없습니다.
				        				</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="col-lg-6 ftco-animate">
						<h2 class="mb-3">${dto.SIT_TITLE}</h2>
						<p>${dto.SIT_APPEAL}</p>
						<p>
							<img src="${imgPath}${dto.SIT_IMG}" alt="" class="img-fluid">
						</p>
					</div>

					<!-- 펫시터 일정 표시만 -->
					<div id='calendar' style="margin-bottom: 50px;"></div>

					<div class="col-md-6" align=center>
						<div class="form-group">

							<div class="select-wrap" style="margin-bottom: 30px;">
								<label class="label" style="font-size: 20px !important;">시터가
									제공 가능한 서비스 입니다.</label>
							</div>
							<div class="select-wrap">
								<c:if test="${dto.SV1_NO == null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">미용 서비스</span><input type="checkbox"
											value="1" class="sel_chk1" id="SV1_NO" disabled><span
											class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<c:if test="${dto.SV1_NO != null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">미용 서비스</span><input type="checkbox"
											value="1" class="sel_chk1" id="SV1_NO" value="${dto.SV1_NO}"
											checked disabled><span class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<c:if test="${dto.SV2_NO == null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">놀이 서비스</span><input type="checkbox"
											value="2" id="SV2_NO" class="sel_chk1" disabled><span
											class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<c:if test="${dto.SV2_NO != null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">놀이 서비스</span><input type="checkbox"
											value="2" id="SV2_NO" class="sel_chk1" value="${dto.SV2_NO}"
											checked disabled><span class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<c:if test="${dto.SV3_NO == null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">산책 서비스</span><input type="checkbox"
											value="3" id="SV3_NO" class="sel_chk1" disabled><span
											class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<c:if test="${dto.SV3_NO != null}">
									<p class="chk_p1">
										<label class="chk_label1"><span
											class="list_label_span1">산책 서비스</span><input type="checkbox"
											value="3" id="SV3_NO" value="${dto.SV3_NO}" class="sel_chk1"
											checked disabled><span class="checkbox_icon"></span></label>
									</p>
								</c:if>

								<p class="chk_p1">
									<label class="chk_label1"><span
										style="margin-right: 79px;">응급처치 서비스 (필수)</span><input
										type="checkbox" value="4" class="sel_chk1" id="SV4_NO"
										value="${dto.SV4_NO}" checked disabled><span
										class="checkbox_icon"></span></label>
								</p>
							</div>
						</div>

					</div>



					<!-- 가능한 일정 선택하기 -->
					<div class="col-lg-12 sidebar pl-lg-5 ftco-animate"
						style="margin-top: 30px; border-top: 1px solid #00bd56; padding-top: 40px;">
						<div class="col-md-12">
							<div class="form-group" align=center>
								<input type="submit" value="신청하기" class="btn btn-primary"
									style="text-align: center; width: 150px; padding-left: 35px; font-size: 24px !important;">
								<div class="submitting"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
	</form>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>