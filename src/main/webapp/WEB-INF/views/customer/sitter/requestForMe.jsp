<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.list_tab {
	display: flex;
	align-items: center;
}

.list_tab p {
	display: block;
	text-align: center;
	font-weight: bold;
	cursor: pointer;
	width: 200px;
	height: 60px;
	line-height: 60px;
	background-color: #f5f5f5;
	border: 1px solid #eeeeee;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<div class="list_tab">
		<p id="left_button" style="background-color: #00bd56;; color: white;">요청
			수락대기</p>
		<p id="center_button" onclick="cancles();">매칭서비스 완료</p>
		<p id="right_button" onclick="refuse();">거절</p>
	</div>

	<c:forEach var="li" items="${list}">
	<div class="row no-gutters">
		<div class="col-md-7">
			<div class="contact-wrap w-100 p-md-5 p-4">
				<h3 class="mb-4">요청서</h3>
				<form action="" method="POST" id="contactForm" name="contactForm"
					class="contactForm">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="SQ_CD">요청번호</label> <input
									type="text" class="form-control" name="SQ_CD" id="SQ_CD"
									value="${li.SQ_CD}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="CUST_ID">요청고객</label> <input
									type="email" class="form-control" name="CUST_ID" id="CUST_ID"
									value="${li.CUST_ID}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="SQ_AMT">펫 정보</label> <input
									type="text" class="form-control" name="SQ_AMT" id="SQ_AMT"
									value="${li.SQ_AMT}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="SQ_LOC">고객거주지역</label> <input
									type="email" class="form-control" name="SQ_LOC" id="SQ_LOC"
									value="${li.SQ_LOC}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="START_DAY">의뢰 시작일</label> <input
									type="text" class="form-control" name="START_DAY" id="START_DAY"
									value="${li.START_DAY}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="END_DAY">의뢰 종료일</label> <input
									type="email" class="form-control" name="END_DAY" id="END_DAY"
									value="${li.END_DAY}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="SQ_DT">요청일</label> <input
									type="text" class="form-control" name="SQ_DT" id="SQ_DT"
									value="${li.SQ_DT}" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="label" for="REQ_SV">고객 요청 서비스</label> <input
									type="email" class="form-control" name="REQ_SV" id="REQ_SV"
									value="${li.REQ_SV}" readonly>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label class="label" for="SQ_ST">처리상태</label> <input
									type="email" class="form-control" name="SQ_ST" id="SQ_ST"
									value="${li.SQ_ST}" readonly>
							</div>
						</div>		
						<div class="col-md-12">
							<div class="form-group">
								<input type="submit" value="Send Message"
									class="btn btn-primary">
								<div class="submitting"></div>
							</div>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-5 d-flex align-items-stretch">
			<div class="info-wrap w-100 p-5 img"
				style="background-image: url(images/img.jpg);"></div>
		</div>
	</div>
	</c:forEach>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>