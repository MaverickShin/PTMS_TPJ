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
<div class="result_div" style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
	<div class="container">
		<c:if test="${cnt == 0}">
			<div class="row" id="divs"
				style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
				<div class="col-md-12">
					<h3></h3>
					<p>아직 요청한 훈련이 없습니다. 훈련사 찾기로 나에게 딱맞는 훈련사를 찾아보세요!</p>
				</div>
			</div>
		</c:if>

		<c:if test="${cnt > 0}">
			<div class="row" id="divs"
				style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<c:forEach var="dtos" items="${dto}" varStatus="status">
					<div class="col-md-12"
						style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
							   border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
						<h6 style="color:#DBB9B8;">훈련받을 펫 : ${dtos.PET_NM}</h6>
						<h6 style="color:#DBB9B8;">훈련사 : ${dtos.CUST_NM}</h6>
						<p style="color:#DBB9B8;">훈련일 : ${dtos.START_DAY}</p>
						<p style="color:#DBB9B8;">훈련종류 : ${dtos.TQ_AMT}${reviewCheckCnt[status.index]}</p>
						<p style="color:#DBB9B8;">금액 : <fmt:formatNumber value="${dtos.TQ_FEE}" pattern="###,###,###,###" />원</p>

						<c:if test="${dtos.TQ_ST == 0}">
							<p>
								<input type="button" value="요청취소" style="border-radius: 20px;"
									onclick="window.location='cancelRequestTraining?TQ_CD=${dtos.TQ_CD}'">
							</p>
						</c:if>
						<c:if test="${dtos.TQ_ST == 1}">
							<p>
								<input type="button" value="결제하기" style="border-radius: 20px;"
									onclick="window.location='/tpj/pay/request?item_name=펫 훈련 결제&price=${dtos.TQ_FEE}&primarykey=${dtos.TQ_CD}'">
							</p>
						</c:if>
						<c:if test="${dtos.TQ_ST == 3}">
							<p>
								<input type="button" value="매칭확정하기" style="border-radius: 20px;"
									onclick="window.location='updateTrainingComplete?TQ_CD=${dtos.TQ_CD}'">
							</p>
						</c:if>
						<c:if test="${dtos.TQ_ST == 4}">
							<c:if test="${reviewCheckCnt[status.index] == 1}">
								<p>
									<input type="button" value="후기작성완료" style="border-radius: 20px;" disabled>
								</p>
							</c:if>
							<c:if test="${reviewCheckCnt[status.index] != 1}">
								<p>
									<input type="button" value="후기쓰기"style="border-radius: 20px;"
										onclick="window.location='writeTrainingReview?TQ_CD=${dtos.TQ_CD}&TG_ID=${dtos.TA_CD}'">
								</p>
							</c:if>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-md-12" align="center">
					<div class="block-27">
						<ul>
							<li><a class="pageMoves pageArrow" onclick="pageMove('', '${t}');">&lt;&lt;</a>
							<li><a class="pageMoves pageArrow" onclick="pageMove(${startPage - pageBlock}, '${t}');">&lt;</a></li>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="active"><span><a class="pageMoves"
											onclick="pageNumbers(${i}, '${t}');">${i}</a></span></li>
								</c:if>

								<c:if test="${i != currentPage}">
									<li><span><a class="pageMoves"
											onclick="pageNumbers(${i}, '${t}');">${i}</a></span></li>
								</c:if>

							</c:forEach>
							<li><a class="pageMoves pageArrow" onclick="pageMove(${startPage + pageBlock}, '${t}');">&gt;</a></li>
							<li><a class="pageMoves pageArrow" onclick="pageMove(${pageCount}, '${t}');">&gt;&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>