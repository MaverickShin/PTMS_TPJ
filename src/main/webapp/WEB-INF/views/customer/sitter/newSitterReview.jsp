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
    <c:if test="${selectCnt == 0}">
       <div class="about-author d-flex p-4 bg-light">
         <div class="desc">
           <h3></h3>
           <p>작성된 후기글이 없습니다. 첫 후기를 작성할수 있는 기회를 놓치지 마세요~!!</p>
         </div>
       </div>
    </c:if>
   
   <c:if test="${selectCnt > 0}"> 
   	  <c:forEach var="li" items="${list}">
         <div class="about-author d-flex p-4 bg-light" style="place-content:center;">
            <div class="desc" style="background-color:#dfe3eb; padding:20px;">
              <h5>고객 : ${li.CUST_ID}</h5>&nbsp;<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
              <p>후기 등록일 : ${li.SG_DT}</p> 
              <p>시터평점 : ${li.SG_GRADE}</p>
              <p>시터이용후기 : ${li.SG_CON}</p>
              <p>시터이용후기 이미지 : ${li.SG_IMG}</p>
            </div>
          </div>
       </c:forEach>
    </c:if>


</body>
</html>