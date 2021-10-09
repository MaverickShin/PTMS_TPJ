<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
							<div class="col-md-12" style="background-color: #f5f5f5;">
								<h5>나의 후기</h5>
								<p>${dtos.TG_IMG}
								<h6>훈련받은 펫 : ${dtos.PET_NM}</h6>
								<p>훈련일 : ${dtos.START_DAY}</p>
								<p>훈련종류 : ${dtos.TQ_AMT}</p>
								<p>
									금액 :
									<fmt:formatNumber value="${dtos.TQ_FEE}"
										pattern="###,###,###,###" />
									원
								</p>
								<p>별점 : ${dtos.TG_GRADE}</p>
								<hr>
								<p>${dtos.TG_CON}</p>
								<p align="center">
									<input type="button" value="후기 수정" onclick="window.open('modifyTrainingReview?TG_CD=${dtos.TG_CD}', '_blank', 'menubar=no, width=555, height=500, resizable = no, scrollbars = no, titlebar = no, location = no');">
									<input type="button" value="후기 삭제" onclick="window.location='deleteTrainingReview?TG_CD=${dtos.TG_CD}'">
								</p>
							</div>
						</c:forEach>
					</div>
					
					<div class="row">
						<div class="col-md-12" align="center">
							<div class="block-27">
								<ul>
									<li><a href="${t}">&lt;&lt;</a>
									<li><a href="${t}?pageNum=${startPage - pageBlock}">&lt;</a></li>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="active"><span><a
													href="${t}?pageNum=${i}">${i}</a></span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li><span><a href="${t}?pageNum=${i}">${i}</a></span></li>
										</c:if>

									</c:forEach>

									<li><a href="${t}?pageNum=${startPage + pageBlock}">&gt;</a></li>
									<li><a href="${t}?pageNum=${pageCount}">&gt;&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</section>
	</div>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>