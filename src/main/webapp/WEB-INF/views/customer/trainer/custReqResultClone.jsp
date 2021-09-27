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
		    
    <c:if test="${selectCnt == 0}">
    	<div class="about-author d-flex p-4 bg-light">
	      <div class="desc">
	        <h3></h3>
	        <p>아직 요청한 훈련이 없습니다. 훈련사 찾기로 나에게 딱맞는 훈련사를 찾아보세요!</p>
	      </div>
	    </div>
    </c:if>
	
	<c:if test="${selectCnt > 0}">
		<c:forEach var="dtos" items="${dto}">
			<div class="about-author d-flex p-4 bg-light" style="place-content:center;">
		      <div class="desc" style="background-color:#dfe3eb; padding:20px;">
		        <h6>훈련받을 펫 : ${dtos.PET_NM}</h6>&nbsp;<h6>훈련사 : ${dtos.CUST_NM}</h6>
		        <p>훈련일 : ${dtos.START_DAY}<br>훈련종류 : ${dtos.TQ_AMT}</p>
		        
		        <c:if test ="${dtos.TQ_ST == 0}">
		        	<input type="button" value="요청취소" class="btn btn-primary" onclick="window.location='cancelRequestTraining?TQ_CD=${dtos.TQ_CD}'">
		      	</c:if>
		      	
		      </div>
		    </div>
	    </c:forEach>
	</c:if>
	
</body>
</html>