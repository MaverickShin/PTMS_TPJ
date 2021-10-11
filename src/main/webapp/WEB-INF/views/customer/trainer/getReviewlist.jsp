<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.result_div {
	background-color: #DDDADA;
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
						<span class="mr-2"><a href="index.html">Trainer<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">고객님의 후기를 확인하세요!</h1>
				</div>
			</div>
		</div>
	</section>

	<div style="display: flex; flex: 1; justify-content: center;">

		<%@ include file="sidebar.jsp"%>

		<section
			style="width: 800px; margin-left: auto; margin-right: auto; margin-top: 30px;"
			class="sections">
		<div class="result_div"
				style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
			<div class="container">
				<c:if test="${cnt == 0}">
					<div class="row" id="divs"
						style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
						<div class="col-md-12">
							<h3></h3>
							<p>아직 작성한 후기가 없습니다.</p>
						</div>
					</div>
				</c:if>

				<c:if test="${cnt > 0}">
					<div class="row" id="divs"
						style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<c:forEach var="dtos" items="${dto}">
							<div class="col-md-12" style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
								 border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
								<h5>나의 후기</h5>
								<p><img alt="사진" src="${dtos.getTG_IMG()}" height="50px" width="50px"> </p>
								<h6 style="color:#DBB9B8;">훈련받은 펫 : ${dtos.PET_NM}</h6>
								<p style="color:#DBB9B8;">훈련일 : ${dtos.START_DAY}</p>
								<p style="color:#DBB9B8;">훈련종류 : ${dtos.TQ_AMT}</p>
								<p style="color:#DBB9B8;">
									금액 :
									<fmt:formatNumber value="${dtos.TQ_FEE}"
										pattern="###,###,###,###" />원
								</p>
								<p style="color:#DBB9B8;">별점 : ${dtos.TG_GRADE}</p>
								<hr>
								<p style="color:#DBB9B8;">${dtos.TG_CON}</p>
								<p align="center">
									<input type="button" style="border-radius: 20px;" value="후기 수정" onclick="window.location'modifyTrainingReview?TG_CD=${dtos.TG_CD}', '_blank', 'menubar=no, width=555, height=500, resizable = no, scrollbars = no, titlebar = no, location = no');">
									<input type="button" style="border-radius: 20px;" value="후기 삭제" onclick="window.location='deleteTrainingReview?TG_CD=${dtos.TG_CD}'">
								</p>
							</div>
						</c:forEach>
					</div>
					
					<div class="row">
						<div class="col-md-12" align="center">
							<div class="block-27">
								<ul>
									<c:if test="${startPage > pageBlock}">
										<li><a href="${t}">&lt;&lt;</a>
										<li><a href="${t}?pageNum=${startPage - pageBlock}">&lt;</a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="active"><span><a
													href="${t}?pageNum=${i}">${i}</a></span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li><span><a href="${t}?pageNum=${i}">${i}</a></span></li>
										</c:if>

									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="${t}?pageNum=${startPage + pageBlock}">&gt;</a></li>
										<li><a href="${t}?pageNum=${pageCount}">&gt;&gt;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		</section>
	</div>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>