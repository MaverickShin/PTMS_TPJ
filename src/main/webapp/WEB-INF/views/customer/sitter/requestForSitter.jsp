<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.list_tab {
   display: flex;
   align-items: center;
   place-content : center;
}

.list_tab p {
   display: block;
   text-align: center;
   font-weight: bold;
   cursor: pointer;
   width: 200px;
   height: 60px;
   line-height: 60px;
   background-color: #f5f5f5;
   border: 1px solid #eeeeee;
}
</style>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="../../main/header.jsp" %>
   
   <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">펫시터님의 의뢰사항을 알려드립니다.</h1>
          </div>
        </div>
      </div>
    </section>
    
    <div class="list_tab">
      <p id="left_button" style="background-color: #a3cde3; color: white;">요청
         수락대기</p>
      <p id="center_button" onclick="cancles();">매칭서비스 완료</p>
      <p id="right_button" onclick="pays();">거절</p>
    </div>
    
    <div style="display:flex">
    
      <nav id="listdiv_id1" style="width:400px; padding:100px;">
         <ul>
           <li>-고객-</li>
           <li><a href="sitter">펫시터 찾기</a></li>
           <li><a href="">이용후기</a></li>
           <li><a href="feeInfo">요금안내</a></li>
           <li>-펫시터-</li>
           <li><a href="applySitter">펫시터 지원</a></li>
           <li><a href="">활동 등록</a></li>
           <li><a href="#">나에게 온 의뢰</a></li>
        </ul>
      </nav>
    
<%--     <c:if test="${selectCnt == 0}"> 
       <div class="about-author d-flex p-4 bg-light">
         <div class="desc">
           <h3></h3>
           <p>아직 들어온 의뢰가 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
         </div>
       </div>
    </c:if> --%>
   
<%--    <c:if test="${selectCnt > 0}"> --%>
   	  <c:forEach var="li" items="${list}">
         <div class="about-author d-flex p-4 bg-light" style="place-content:center;">
            <div class="desc" style="background-color:#dfe3eb; padding:20px;">
              <h6>펫주인 : ${li.CUST_ID}</h6>&nbsp;<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
              <p>의뢰시작일 : ${li.START_DAY}&nbsp; 의뢰종료일 : ${li.END_DAY}&nbsp; 고객요청서비스 : ${li.REQ_SV}</p>
              <input type="button" value="수락" class="btn btn-primary" style="backgrount-color:#a3cde3;" onclick="window.location='acceptRequestSitting?SIT_ID=${li.SIT_ID}'">
              <input type="button" value="거절" class="btn btn-primary" style="backgrount-color:#a3cde3;" onclick="window.location='acceptRequestSitting?SIT_ID=${li.SIT_ID}'">
            </div>
          </div>
       </c:forEach>
<%--    </c:if> --%>
   
   </div>
   
   
   <%@ include file="../../main/footer.jsp" %>
</body>
</html>