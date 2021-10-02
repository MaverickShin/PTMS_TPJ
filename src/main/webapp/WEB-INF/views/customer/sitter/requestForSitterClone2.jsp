<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${cnt == 0}">
		<div class="row" id="divs"
			style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
			<div class="col-md-12">
				<h3></h3>
				<c:if test="${st == 0}">
					<p>아직 들어온 의뢰가 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
				</c:if>

				<c:if test="${st == 1}">
					<p>수락한 의뢰가 없습니다. 첫 펫시팅을 도전해 보세요!</p>
				</c:if>

				<c:if test="${st == 2}">
					<p>거절한 의뢰가 없습니다. 일등 펫시터 님이시군요~!</p>
				</c:if>

				<c:if test="${st == 3}">
					<p>아직 완료된 내역이 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
				</c:if>

			</div>
		</div>
	</c:if>

	<c:if test="${cnt > 0}">
		<div class="row" id="divs"
			style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
			<c:forEach var="li" items="${list}">
				<div class="col-md-12" style="background-color: #f5f5f5;">
					<h5>고객 : ${li.CUST_ID}</h5>
					&nbsp;
					<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
					<p>의뢰시작일 : ${li.START_DAY}</p>
					<p>의뢰종료일 : ${li.END_DAY}</p>
					<p>고객요청서비스 : ${li.REQ_SV}</p>
					<p>금액 : ${li.SQ_FEE} 원</p>
					<c:if test="${li.SQ_ST == 0}">
						<input type="button" value="수락" class="btn btn-primary"
							style="backgrount-color: #a3cde3;"
							onclick="window.location='sitterAccept?SQ_CD=${li.SQ_CD}'">
						<input type="button" value="거절" class="btn btn-primary"
							style="backgrount-color: #a3cde3;"
							onclick="window.location='sitterRefuse?SQ_CD=${li.SQ_CD}'">
					</c:if>
				</div>
			</c:forEach>
		</div>

		<c:if test="${endPage != 1}">
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

		<c:if test="${endPage == 1}">
			<div class="row">
				<div class="col-md-12" align="center">
					<div class="block-27">
						<ul>
							<li><a href="">&lt;&lt;</a></li>
							<li><a href="">&lt;</a></li>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="active"><span><a
											href="">${i}</a></span></li>
								</c:if>

								<c:if test="${i != currentPage}">
									<li><span><a href="">${i}</a></span></li>
								</c:if>

							</c:forEach>

							<li><a href="">&gt;</a></li>
							<li><a href="">&gt;&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</c:if>

</body>
</html>