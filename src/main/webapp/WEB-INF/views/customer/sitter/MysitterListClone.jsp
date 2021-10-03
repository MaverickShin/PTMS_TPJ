<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload = "console.log('클론입니당');">

	<div class="container">

		<c:if test="${cnt == 0}">
			<div class="row" id="divs"
				style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
				<div class="col-md-12">
					<h3></h3>
					<p>이용한 서비스가 존재하지 않습니다. 첫 펫시팅 서비스를 이용해보세요.</p>
				</div>
			</div>
		</c:if>

		<c:if test="${cnt > 0}">
			<div class="row" id="divs"
				style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<c:forEach var="li" items="${list}" varStatus="status">
					<div class="col-md-12" style="background-color: #f5f5f5;">
						<h5>고객 : ${li.CUST_ID}</h5>
						&nbsp;
						<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
						<p>의뢰시작일 : ${li.START_DAY}</p>
						<p>의뢰종료일 : ${li.END_DAY}</p>
						<p>고객요청서비스 : ${li.REQ_SV}</p>
						<p>금액 : ${li.SQ_FEE} 원</p>

						<c:if test="${li.SQ_ST == 0}">
							<p>
								<input type="button" name="reqCancleByCus" value="요청취소"
									onclick="window.location='reqsitterSerCancle?SQ_CD=${li.SQ_CD}'">
							</p>
						</c:if>
						<c:if test="${li.SQ_ST == 1}">
							<p>
								<input type="button" name="payment" value="결제하기"
									onclick="window.location='/tpj/pay/request?item_name=펫 시터 결제&price=${li.SQ_FEE}&primarykey=${li.SQ_CD}'">
							</p>
						</c:if>
						<c:if test="${li.SQ_ST == 3}">
							<p>
								<input type="button" name="payment" value="결제하기" disabled>
							</p>
							<p>
								<input type="button" name="matchingConfirm" value="매칭확정"
									onclick="window.location='matchingConfirm?SQ_CD=${li.SQ_CD}'">
							</p>
						</c:if>
						<c:if test="${li.SQ_ST == 4}">
							<c:if test="${reviewCheckCnt[status.index] == 1}">
								<p>
									<input type="button" name="Mysitterreview" value="후기작성완료"
										disabled>
								</p>
							</c:if>
							<c:if test="${reviewCheckCnt[status.index] != 1}">
								<p>
									<input type="button" name="Mysitterreview" value="후기작성"
										onclick="window.location='Mysitterreview?SIT_ID=${li.SIT_ID}&SQ_CD=${li.SQ_CD}'">
								</p>
							</c:if>
						</c:if>
					</div>
				</c:forEach>
			</div>

			<div class = "row">
                 <div class="col-md-12" align="center">
                    <div class="block-27">
                         <ul>
                           <li><a class ="pageMoves" onclick="pageMove('');" >&lt;&lt;</a>
                           <li><a class ="pageMoves" onclick="pageMove(${startPage - pageBlock});">&lt;</a></li>
                           
                           <c:forEach var="i" begin="${startPage}" end="${endPage}">
                          <c:if test="${i == currentPage}">
                             <li class="active"><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                          </c:if>
  
                          <c:if test="${i != currentPage}">
                             <li><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                          </c:if>
                          
                       </c:forEach> 
                           
                           <li><a class ="pageMoves" onclick = "pageMove(${startPage + pageBlock});">&gt;</a></li>
                           <li><a class ="pageMoves" onclick = "pageMove(${pageCount});">&gt;&gt;</a></li>
                         </ul>
                    </div>
                 </div>
              </div>
		</c:if>
	</div>
</body>
</html>