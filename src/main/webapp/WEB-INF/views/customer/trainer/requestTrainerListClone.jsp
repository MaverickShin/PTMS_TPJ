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
<div class="result_div" style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
	<div class="container">
	    <c:if test="${cnt == 0 || null}">
	    	<div class="row" id="divs"
				style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
				<div class="col-md-12">
		        <h3></h3>
		        <p>아직 들어온 의뢰가 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
		      </div>
		    </div>
	    </c:if>
		
		<c:if test="${cnt > 0}">
			<div class="row" id="divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
				<c:forEach var="dtos" items="${dto}">
					<div class="col-md-12" 
						style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
					   border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
    					<h6 style="color:#DBB9B8;">펫주인 : ${dtos.CUST_ID}</h6>
						<h6 style="color:#DBB9B8;">훈련받을 펫 : ${dtos.PET_NM}</h6>
						<p style="color:#DBB9B8;">훈련일 : ${dtos.START_DAY}</p>
						<p style="color:#DBB9B8;">훈련종류 : ${dtos.TQ_AMT}</p>
						<p style="color:#DBB9B8;"><fmt:formatNumber value="${dtos.TQ_FEE}" pattern="###,###,###,###" />원 </p>
				        <c:if test = "${dtos.TQ_ST == 0}">
				       	 	<input type="button" value="수락" style="border-radius: 20px;" onclick="window.location='acceptRequestTraining?TQ_CD=${dtos.TQ_CD}'">
				        	<input type="button" value="거절" style="border-radius: 20px;" onclick="window.location='denyRequestTraining?TQ_CD=${dtos.TQ_CD}'">
				      	</c:if>
				    </div>
			    </c:forEach>
		    </div>
		    <div class = "row">
	           <div class="col-md-12" align="center">
	              <div class="block-27">
	                   <ul>
	                     <li><a class ="pageMoves pageArrow" onclick="pageMove('', '${t}');" >&lt;&lt;</a>
	                     <li><a class ="pageMoves pageArrow" onclick="pageMove(${startPage - pageBlock}, '${t}');">&lt;</a></li>
	                     <c:forEach var="i" begin="${startPage}" end="${endPage}">
		                    <c:if test="${i == currentPage}">
		                       <li class="active"><span style="background-color:#DBB9B8;"><a class ="pageMoves" onclick = "pageNumbers(${i}, '${t}');">${i}</a></span></li>
		                    </c:if>
		
		                    <c:if test="${i != currentPage}">
		                       <li><span style="background-color:#DBB9B8;"><a class ="pageMoves" style="color:#DBB9B8;" onclick = "pageNumbers(${i}, '${t}');">${i}</a></span></li>
		                    </c:if>
		                    
		                 </c:forEach> 
	                     <li><a class ="pageMoves pageArrow" onclick = "pageMove(${startPage + pageBlock}, '${t}');">&gt;</a></li>
	                     <li><a class ="pageMoves pageArrow" onclick = "pageMove(${pageCount}, '${t}');">&gt;&gt;</a></li>
	                   </ul>
	              </div>
	           </div>
	       </div>
		</c:if>
	</div>
</div>
</body>
</html>