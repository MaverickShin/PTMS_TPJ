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

	<c:if test="${cnt == 0}">
		<div class="row" id="divs"
			style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
			<div class="col-md-12">
				<h3></h3>
					<p align="center">매칭된 서비스 내역이 존재하지 않습니다. 일정 조정으로 매칭률을 높여보세요!</p>
			</div>
		</div>
	</c:if>

	<c:if test="${cnt > 0}">
		<div class="row" id="divs"
			style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
			<c:forEach var="li" items="${list}">
				<div class="col-md-12" 
					style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
				   border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
					<h5 style="color:#DBB9B8;">요청 고객 : ${li.CUST_ID}</h5>
					<h6 style="color:#DBB9B8;">서비스 요청 펫 : ${li.SQ_AMT}</h6>
					<p style="color:#DBB9B8;">의뢰시작일 : ${li.START_DAY}</p>
					<p style="color:#DBB9B8;">의뢰종료일 : ${li.END_DAY}</p>
					<p style="color:#DBB9B8;">고객요청서비스 : ${li.REQ_SV}</p>
					<p style="color:#DBB9B8;">금액 : <fmt:formatNumber value="${li.SQ_FEE}" pattern="###,###,###,###"/>원</p>
					<c:if test="${li.SQ_ST == 0}">
						<input type="button" value="수락" style="border-radius: 10px;"
							onclick="window.location='sitterAccept?SQ_CD=${li.SQ_CD}'">
						<input type="button" value="거절" style="border-radius: 10px;"
							onclick="window.location='sitterRefuse?SQ_CD=${li.SQ_CD}'">
					</c:if>
				</div>
			</c:forEach>
		</div>

					<div class="row">
                      <div class="col-md-12" align="center">
                        <div class="block-27">
                           <ul>
                                 <li><a class="pageMoves pageArrow" onclick="pageMove('', '${s}');">&lt;&lt;</a>
                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${startPage - pageBlock}, '${s}');">&lt;</a></li>
                              <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                 <c:if test="${i == currentPage}">
                                    <li class="active"><span><a class="pageMoves"
                                          onclick="pageNumbers(${i}, '${s}');">${i}</a></span></li>
                                 </c:if>

                                 <c:if test="${i != currentPage}">
                                    <li><span><a class="pageMoves"
                                          onclick="pageNumbers(${i}, '${s}');">${i}</a></span></li>
                                 </c:if>

                              </c:forEach>
                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${startPage + pageBlock}, '${s}');">&gt;</a></li>
                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${pageCount}, '${s}');">&gt;&gt;</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
	</c:if>
</body>
</html>