<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <c:if test="${cnt == 0 || null}">
    	<div class="about-author d-flex p-4 bg-light">
	      <div class="desc">
	        <h3></h3>
	        <p>아직 들어온 의뢰가 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
	      </div>
	    </div>
    </c:if>
	
	<c:if test="${cnt > 0}">
		<c:forEach var="dtos" items="${dto}">
			<div class="about-author d-flex p-4 bg-light" style="place-content:center;">
		      <div class="desc" style="background-color:#dfe3eb; padding:20px;">
		        <h6>펫주인 : ${dtos.CUST_ID}</h6>&nbsp;<h6>훈련받을 펫 : ${dtos.PET_NM}</h6>
		        <p>훈련일 : ${dtos.START_DAY}&nbsp;훈련종류 : ${dtos.TQ_AMT}</p>
		        <c:if test = "${dtos.TQ_ST == 0}">
		       	 	<input type="button" value="수락" class="btn btn-primary" onclick="window.location='acceptRequestTraining?TQ_CD=${dtos.TQ_CD}'">
		        	<input type="button" value="거절" class="btn btn-primary" onclick="window.location='denyRequestTraining?TQ_CD=${dtos.TQ_CD}'">
		      	</c:if>
		      	
		      </div>
		    </div>
	    </c:forEach>
	    
	    <div class="page_control">
			<table>
				<tr>
					<th align="center">
						<!-- 게시글이 있으면 --> <!-- 처음[◀◀]    / 이전블록[◀]  / --> <c:if
							test="${startPage > pageBlock}">
							<a href="${t}"> [◀◀] </a>
							<a href="${t}?pageNum=${startPage - pageBlock}">
								[◀] </a>
						</c:if> <!-- 블록내의 페이지 번호 --> <c:forEach var="i" begin="${startPage}"
							end="${endPage}">
							<c:if test="${i == currentPage}">
								<span style="cursor: pointer;"><b>[${i}]</b></span>
							</c:if>

							<c:if test="${i != currentPage}">
								<a href="${t}?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach> <!-- 다음[▶]   /  마지막[▶▶]  / --> <c:if
							test="${pageCount > endPage}">
							<a href="${t}?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="${t}?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</c:if>
	
</body>
</html>