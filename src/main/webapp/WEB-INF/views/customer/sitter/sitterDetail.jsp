<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${cssPath}calendar.css' rel='stylesheet' />
<script src='${jsPath}calendar.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			height : 500,
			editable : false,
			selectable : true,
			businessHours : true,
			dayMaxEvents : true, // allow "more" link when too many events

			events : [ {
				title : 'Long Event',
				start : '2021-09-07',
				end : '2021-09-22'
			} ]
		});
		calendar.render();
	});
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
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<form action="requestSitting" class="search-form" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
		<input type="hidden" name="SV_AREA" value="${SV_AREA}">
		<input type="hidden" name="SIT_ID" value="${SIT_ID}">
		<section class="hero-wrap hero-wrap-2"
			style="background-image: url('images/bg_2.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row no-gutters slider-text align-items-end">
					<div class="col-md-9 ftco-animate pb-5">
						<p class="breadcrumbs mb-2">
							<span class="mr-2"><a href="index.html">Trainer<i
									class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
								class="ion-ios-arrow-forward"></i></span>
						</p>
						<h1 class="mb-0 bread">펫시터 매칭 결과</h1>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section ftco-degree-bg">
			<div class="container">
				<div class="row">
				
					<!-- 나의 반려동물  -->
					<div class="col-lg-12 sidebar pl-lg-5 ftco-animate" style = "margin-bottom:30px;">
						<div class="form-group">
							<p>나의 반려동물</p>
							<c:if test="${selectCnt > 0 }">
								<c:forEach var="li" items="${list}">
									<input type="checkbox" name="PET_NM" value="${li.PET_NM}">${li.PET_NM}(${li.PK_CD})
			        	</c:forEach>
							</c:if>

							<c:if test="${selectCnt == 0}">
								<p>마이펫을 먼저 등록해 주세요</p>
							</c:if>
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

					<div class="col-md-6">
						<div class="form-group">
						
						<div class="select-wrap" style = "margin-bottom: 30px;">
	                        <label class="label" style = "font-size: 20px !important;">원하는 서비스를 선택해 주세요</label>
                                </div>
                                   <div class="select-wrap">
                                    <p class = "chk_p1"><label class = "chk_label1" for = "SV1_NO"><span class = "list_label_span1">미용 서비스</span><input type="checkbox" value="미용서비스" name="SV1_NO" class="sel_chk1" id = "SV1_NO"><span class = "checkbox_icon"></span></label></p>
                                    <p class = "chk_p1"><label class = "chk_label1" for = "SV2_NO"><span class = "list_label_span1">놀이 서비스</span><input type="checkbox" value="놀이서비스" name="SV2_NO" id = "SV2_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
                                    <p class = "chk_p1"><label class = "chk_label1" for = "SV3_NO"><span class = "list_label_span1">산책 서비스</span><input type="checkbox" value="산책서비스" name="SV3_NO" id = "SV3_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
				 				 <p class = "chk_p1"><label class = "chk_label1" for = "SV4_NO"><span style = "margin-right: 79px;">응급처치 서비스 (필수)</span><input type="checkbox" value="응급처치서비스" name="SV4_NO" class="sel_chk1" id = "SV4_NO"checked onclick="return false;"><span class = "checkbox_icon"></span></label></p>
                                </div>
						</div>
						
						<div class="form-group">
							<P>요청 시작일</P>
							<input type="date" class="form-control" name="START_DAY">
							<P>요청 종료일</P>
							<input type="date" class="form-control" name="END_DAY">
						</div>
					</div>

					

					<!-- 가능한 일정 선택하기 -->
					<div class="col-lg-12 sidebar pl-lg-5 ftco-animate">
						<div class="col-md-12">
							<div class="form-group" align="center">
								<input type="submit" value="펫시팅 신청하기" class="btn btn-primary">
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