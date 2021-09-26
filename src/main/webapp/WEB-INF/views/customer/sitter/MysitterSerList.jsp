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
<script type="text/javascript">
function matchingFinish() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   cb.style.backgroundColor = "#1e88e5";
   cb.style.color = "white";
   
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "black";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "black";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "black";
   
   window.location = "${st}matchingFinish"
}

function request(){
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   rb.style.backgroundColor = "#1e88e5";
   rb.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "black";
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "black";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "black";
   
   window.location = "${st}MysitterSerList"
   
}

function accept() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   ac.style.backgroundColor = "#1e88e5";
   ac.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "black";
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "black";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "black";
   
   window.location = "${st}acceptSitterSer";
}

function refuse() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   
   rb.style.backgroundColor = "#1e88e5";
   rb.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "black";
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "black";
   
   window.location = "${st}refuseSitterSer"
}
</script>
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
            <h1 class="mb-0 bread">요청하신 펫시터 서비스가 수락대기 중입니다.</h1>
          </div>
        </div>
      </div>
    </section>
    
    <div class="list_tab">
      <p id="left_button" style="background-color: #a3cde3; color: white;">요청 수락대기</p>
      <p id="accept_button" onclick="accept();">수락된 요청</p>   
      <p id="right_button" onclick="refuse();">거절된 요청</p>      
      <p id="center_button" onclick ="matchingFinish();">매칭완료</p>

    </div>
    
    <div style="display:flex">
    
      <nav id="listdiv_id1" style="width:400px; padding:100px;">
         <ul>
           <li>-고객-</li>
           <li><a href="sitter">펫시터 찾기</a></li>
		   <li><a href="MysitterSerList">나의 펫시터 이용 내역</a></li>
           <li><a href="feeInfo">요금안내</a></li>
           <li>-펫시터-</li>
           <li><a href="applySitter">펫시터 지원</a></li>
           <li><a href="requestForSitter">나에게 온 의뢰</a></li>
        </ul>
      </nav>
    
    <c:if test="${selectCnt == 0}">
       <div class="about-author d-flex p-4 bg-light">
         <div class="desc">
           <h3></h3>
           <p>아직 요청한 펫시터 서비스가 없습니다.첫 펫시팅 서비스를 이용해 보세요!</p>
         </div>
       </div>
    </c:if>
   
   <c:if test="${selectCnt > 0}"> 
   	  <c:forEach var="li" items="${list}">
         <div class="about-author d-flex p-4 bg-light" style="place-content:center;">
            <div class="desc" style="background-color:#dfe3eb; padding:20px;">
              <h5>고객 : ${li.CUST_ID}</h5>&nbsp;<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
              <p>의뢰시작일 : ${li.START_DAY}</p>
              <p> 의뢰종료일 : ${li.END_DAY}</p>
              <p> 고객요청서비스 : ${li.REQ_SV}</p>
              <p><input type="button" name="reqCancleByCus" value="요청취소" onclick="window.location='reqsitterSerCancle?SQ_CD=${li.SQ_CD}'"></p>
            </div>
          </div>
       </c:forEach>
    </c:if> 
   
   </div>
   
   
   <%@ include file="../../main/footer.jsp" %>
</body>
</html>