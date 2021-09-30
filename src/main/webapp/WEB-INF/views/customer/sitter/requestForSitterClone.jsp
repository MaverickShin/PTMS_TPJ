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
		<div class="about-author d-flex p-4 bg-light">
			<div class="desc">
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
				<div class="about-author d-flex p-4 bg-light"
					style="place-content: center;">
					<div class="desc" style="background-color: #dfe3eb; padding: 20px;">
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
				</div>
			</c:forEach>
		</div>

		<div class="page_control">
			<table>
				<tr>
					<th align="center">
						<!-- 게시글이 있으면 --> <!-- 처음[◀◀]    / 이전블록[◀]  / --> <c:if
							test="${startPage > pageBlock}">
							<a href="${s}"> [◀◀] </a>
							<a href="${s}?pageNum=${startPage - pageBlock}"> [◀] </a>
						</c:if> <!-- 블록내의 페이지 번호 --> <c:forEach var="i" begin="${startPage}"
							end="${endPage}">
							<c:if test="${i == currentPage}">
								<span style="cursor: pointer;"><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="${s}?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach> <!-- 다음[▶]   /  마지막[▶▶]  / --> <c:if
							test="${pageCount > endPage}">
							<a href="${s}?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="${s}?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</c:if>

</body>
</html>