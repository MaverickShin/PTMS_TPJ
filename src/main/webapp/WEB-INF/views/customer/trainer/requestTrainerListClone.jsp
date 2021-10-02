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
		<div class="row" id="divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
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
	    </div>
	    <div class = "row">
           <div class="col-md-12" align="center">
              <div class="block-27">
                   <ul>
                     <li><a href="${t}">&lt;&lt;</a>
                     <c:if test="${endPage == 1}">
                     	<li><a href="${t}">&lt;</a></li>
                     </c:if>
                     <c:if test="${endPage != 1}">
                     	<li><a href="${t}?pageNum=${startPage - pageBlock}">&lt;</a></li>
                     </c:if>
                     
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