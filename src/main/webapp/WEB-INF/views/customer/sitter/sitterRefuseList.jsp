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
function sitterserPayFinish() {
	
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
	
	window.location = "${st}sitterserPayFinish"
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
	
	window.location = "${st}requestForSitter"
	
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
	
	window.location = "${st}sitterAcceptList"
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
	
	window.location = "${st}sitterRefuseList"
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
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Sitter<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">고객 요청 거절 리스트 입니다.</h1>
          </div>
        </div>
      </div>
    </section>
    
 <div style="display: flex; flex:1; justify-content:center;">
    
     <%@ include file = "sidebar.jsp" %>
    
   
    <section style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
    <div class="list_tab">
      <p id="left_button" onclick ="request();">요청 수락대기</p>
      <p id="accept_button" onclick="accept();">수락</p>   
      <p id="right_button" style="background-color: #a3cde3; color: white;">거절</p>      
      <p id="center_button" onclick ="sitterserPayFinish();">결제 완료</p>
    </div>   
   
    <c:if test="${selectCnt == 0}">
      <p id="center_button" onclick="sitterserPayFinish();">시터서비스 완료</p>
  <c:if test="${selectCnt == 0}">
       <div class="about-author d-flex p-4 bg-light">
         <div class="desc">
           <h3></h3>
           <p>거절한 의뢰가 없습니다. 일등 펫시터 님이시군요~!</p>
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
            </div>
          </div>
       </c:forEach>
    </c:if> 
  	 </section>
   </div>     
  
   
  <%@ include file="../../main/footer.jsp" %>  
</body>
</html>