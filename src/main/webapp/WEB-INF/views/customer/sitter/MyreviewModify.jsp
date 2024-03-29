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
.col-md-6{
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

		<div class="col-md-6" style="font-family: 'Do Hyeon', sans-serif;">
			<div class="contact-wrap w-100 p-md-5 p-4">
				<h3 class="mb-4" align="center">리뷰 수정</h3>
				<form action="MyreviewModifyAction" method="POST" id="reviewModify"
					name="reviewModify" class="contactForm" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<s:csrfInput/>
					<div class="row">
						<c:forEach var="li" items="${list}">
						<input type="hidden" name="SG_CD" value="${li.SG_CD }">
							<div class="col-md-12">
								<label class="label">프로필</label>&nbsp;
								<img alt="사진" src="${li.getSG_IMG()}" height="80px" width="80px">
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="SQ_CD">작성자</label> 
									<input type="text"
										class="form-control" name="CUST_ID" id="CUST_ID"
										value="${li.CUST_ID}" readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="SG_GRADE">평점</label> 
									<input type="number" class="form-control" name="SG_GRADE"
										id="SG_GRADE" max="5" value="${li.SG_GRADE}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="SG_CON">후기글</label> <input
										type="text" class="form-control" name="SG_CON" id="SG_CON"
										value="${li.SG_CON}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="SG_IMG">사진 첨부</label> <input
										type="file" class="form-control" name="SG_IMG" id="SG_IMG"
										value="li.SG_IMG">
								</div>
							</div>
							<div class="col-md-12" align="center">
								<div class="form-group">
									<input type="submit" value="수정처리" class="btn btn-primary">
									<input type="reset" value="수정취소" class="btn btn-primary" onclick="window.history.back();">
								</div>
							</div>
						</c:forEach>
					</div>
				</form>
			</div>
		</div>

	<%@ include file="../../main/footer.jsp"%>
</body>
</html>