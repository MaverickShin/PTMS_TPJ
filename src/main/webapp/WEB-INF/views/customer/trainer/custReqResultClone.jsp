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
		<div class="row" id="divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
			<c:forEach var="dtos" items="${dto}" varStatus="status">
				<div class="about-author d-flex p-4 bg-light" style="place-content:center;">
			      <div class="desc" style="background-color:#dfe3eb; padding:20px;">
			        <h6>훈련받을 펫 : ${dtos.PET_NM}</h6>&nbsp;<h6>훈련사 : ${dtos.CUST_NM}</h6>
			        
			        <p>훈련일 : ${dtos.START_DAY}<br>훈련종류 : ${dtos.TQ_AMT}${reviewCheckCnt[status.index]}</p>
			        
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
				        <c:if test="${reviewCheckCnt[status.index] == 1}">
				        	<input type="button" value="후기작성완료" class="btn btn-primary" disabled>
				        </c:if>
				        <c:if test="${reviewCheckCnt[status.index] != 1}">
				        	<input type="button" value="후기쓰기" class="btn btn-primary" onclick="window.location='writeTrainingReview?TQ_CD=${dtos.TQ_CD}&TG_ID=${dtos.TA_CD}'">
				        </c:if>
			        </c:if>
			      </div>
			    </div>
		    </c:forEach>
	    </div>
	    <div class = "row">
           <div class="col-md-12" align="center">
              <div class="block-27">
                   <ul>
                     <li><a href="${t}">&lt;&lt;</a>
                     <li><a href="${t}?pageNum=${startPage - pageBlock}">&lt;</a></li>
                     
                     <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:if test="${i == currentPage}">
                       <li class="active"><span><a href="${t}?pageNum=${i}">${i}</a></span></li>
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
	
</body>
</html>