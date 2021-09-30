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

    <c:if test="${cnt == 0}">
    	<div class="about-author d-flex p-4 bg-light">
	      <div class="desc">
	        <h3></h3>
	        <p>아직 요청한 훈련이 없습니다. 훈련사 찾기로 나에게 딱맞는 훈련사를 찾아보세요!</p>
	      </div>
	    </div>
    </c:if>
	
	<c:if test="${cnt > 0}">
		<c:forEach var="dtos" items="${dto}">
			<div class="about-author d-flex p-4 bg-light" style="place-content:center;">
		      <div class="desc" style="background-color:#dfe3eb; padding:20px;">
		        <h6>훈련받을 펫 : ${dtos.PET_NM}</h6>&nbsp;<h6>훈련사 : ${dtos.CUST_NM}</h6>
		        
		        <p>훈련일 : ${dtos.START_DAY}<br>훈련종류 : ${dtos.TQ_AMT}</p>
		        
		        <c:if test ="${dtos.TQ_ST == 0}">
		        	<input type="button" value="요청취소" class="btn btn-primary" onclick="window.location='cancelRequestTraining?TQ_CD=${dtos.TQ_CD}'">
		      	</c:if>
		      	<c:if test="${dtos.TQ_ST == 1}">
		      		<input type="button" value="결제하기" class="btn btn-primary" onclick="window.location='/tpj/pay/request?item_name=펫 훈련 결제&price=${dtos.TQ_FEE}&primarykey=${dtos.TQ_CD}'">
		      	</c:if>
		      	<c:if test="${dtos.TQ_ST == 3}">
		      		<input type="button" value="매칭확정하기" class="btn btn-primary" onclick="window.location='updateTrainingComplete?TQ_CD=${dtos.TQ_CD}'">
		      	</c:if>
		      	<c:if test="${dtos.TQ_ST == 4}">
			        <c:if test="${reviewCheckCnt == 1}">
			        	<input type="button" value="후기작성완료" class="btn btn-primary" readonly>
			        </c:if>
			        <c:if test="${reviewCheckCnt != 1}">
			        	<input type="button" value="후기쓰기" class="btn btn-primary" onclick="window.location='writeTrainingReview?TQ_CD=${dtos.TQ_CD}&TG_ID=${dtos.TA_CD}'">
			        </c:if>
		        </c:if>
		      </div>
		    </div>
	    </c:forEach>
	    
	    <div class = "page_control">
			<table>
				<tr>
					<th align = "center">
						<!-- 게시글이 있으면 -->
						<!-- 처음[◀◀]	 / 이전블록[◀]  / -->
						<c:if test = "${startPage > pageBlock}">
							<a href = "${t}"> [◀◀] </a>
							<a href = "${t}?pageNum=${startPage - pageBlock}"> [◀] </a>
						</c:if>
						
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
							<c:if test = "${i == currentPage}">
								<span style = "cursor: pointer;"><b>[${i}]</b></span>
							</c:if>
							
							<c:if test = "${i != currentPage}">
								<a href = "${t}?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶]	/  마지막[▶▶]  / -->
						<c:if test = "${pageCount > endPage}">
							<a href = "${t}?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href = "${t}?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</c:if>
	
</body>
</html>