<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class = "container">

  <c:if test="${selectCnt == 0}">
       <div class="row" id = "divs" style = "width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
         <div class="col-md-12">
           <h3></h3>
           <p>이용한 서비스가 존재하지 않습니다. 첫 펫시팅 서비스를 이용해보세요.</p>
         </div>
       </div>
    </c:if>
   
   <c:if test="${selectCnt > 0}"> 
   	<div class="row" id = "divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
   	  <c:forEach var="li" items="${list}">
            <div class="col-md-12" style="background-color:#f5f5f5; ">
              <h5>고객 : ${li.CUST_ID}</h5>&nbsp;<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
              <p>의뢰시작일 : ${li.START_DAY}</p>
              <p>의뢰종료일 : ${li.END_DAY}</p>
              <p>고객요청서비스 : ${li.REQ_SV}</p>
              <p>금액 : ${li.SQ_FEE} 원</p> 
              <c:if test = "${li.SQ_ST == 1}">
              	<p><input type="button" name="reqCancleByCus" value="결제하기" onclick="window.location='/tpj/pay/request?item_name=펫 시터 결제&price=${li.SQ_FEE}&primarykey=${li.SQ_CD}'"></p>
              </c:if>
              
              <c:if test = "${li.SQ_ST == 0}">
              	<p><input type="button" name="reqCancleByCus" value="요청취소" onclick="window.location='reqsitterSerCancle?SQ_CD=${li.SQ_CD}'"></p>
              </c:if>
              <c:if test = "${li.SQ_ST == 3}">
	              	<c:if test="${reviewCheckCnt > 0}">
	              		<p><input type="button" name="Mysitterreview" value="후기작성완료" disabled></p>
	              	</c:if> 
	              	<c:if test="${reviewCheckCnt == 0}">
              			<p><input type="button" name="Mysitterreview" value="후기작성" onclick="window.location='Mysitterreview?SIT_ID=${li.SIT_ID}'"></p>
              		</c:if>	
              </c:if>
            </div>
       </c:forEach>
        </div>
    </c:if> 
    
    </div>
</body>
</html>