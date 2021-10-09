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
						<span class="mr-2"><a href="index.html">sitter<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">고객님의 후기작성 내역입니다.</h1>
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
							<p>작성한 후기가 존재하지 않습니다.</p>
						</div>
					</div>
				</c:if>

				<c:if test="${cnt > 0}">
					<div class="row" id="divs"
						style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<c:forEach var="li" items="${list}">
							<div class="col-md-12" style="background-color: #f5f5f5;">
								<h5>나의 후기</h5>
								&nbsp;
								<p>나의 요청 서비스 : ${li.REQ_SV}</p>
								<p>서비스 요금 : ${li.SQ_FEE}</p>
								<p>의뢰일 : ${li.START_DAY}</p>
								<p>의뢰 종료일 : ${li.END_DAY}</p>
								<p>내가 준 평점 : ${li.SG_GRADE}</p>
								<p>시터이용후기 : ${li.SG_CON}</p>
								<p>후기 등록일 : ${li.SG_DT}</p>

								<p align="center">
									<input type="button" name="reviewModify" value="리뷰 수정"
										onclick="window.location='MyreviewModify?SG_CD=${li.SG_CD}'">
									<input type="button" name="reviewDel" value="삭제"
										onclick="window.location='MyreviewDelete?SG_CD=${li.SG_CD}'">
								</p>
							</div>
						</c:forEach>
					</div>

					<div class="row">
						<div class="col-md-12" align="center">
							<div class="block-27">
								<ul>
									<li><a href="${s}">&lt;&lt;</a>
									<li><a href="${s}?pageNum=${startPage - pageBlock}">&lt;</a></li>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="active"><span><a
													href="${s}?pageNum=${i}">${i}</a></span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li><span><a href="${s}?pageNum=${i}">${i}</a></span></li>
										</c:if>

									</c:forEach>

									<li><a href="${s}?pageNum=${startPage + pageBlock}">&gt;</a></li>
									<li><a href="${s}?pageNum=${pageCount}">&gt;&gt;</a></li>
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