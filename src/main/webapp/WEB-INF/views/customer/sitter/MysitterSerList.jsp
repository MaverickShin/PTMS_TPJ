<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#accept_button").click(function() { //수락된요청
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/acceptSitterSer",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#right_button").click(function() { //거절된요청
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/refuseSitterSer",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#center_button").click(function() { //매칭완료
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/matchingFinish",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#left_button").click(function() { //요청수락대기
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/MysitterSerList2",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
}); 
</script>

<style type="text/css">
.list_tab {
   display: flex;
   align-items: center;
   place-content : center;
}

.list_tab p {
   display: block;
   text-align: center;
   font-size: 20px;
   font-weight: bolder;
   cursor: pointer;
   width: 200px;
   height: 60px;
   line-height: 60px;
   background-color: #f5f5f5;
   border: 1px solid #eeeeee;
}

.result_div {
	background-color: #e3f2fd;
}
</style>
<script type="text/javascript">
function matchingFinish() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   cb.style.backgroundColor = "#a3cde3";
   cb.style.color = "white";
   
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "#808080";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "#808080";
   
}

function request(){
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   lb.style.backgroundColor = "#a3cde3";
   lb.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "#808080";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "#808080";
   
   
}

function accept() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ac = document.getElementById("accept_button");
   
   ac.style.backgroundColor = "#a3cde3";
   ac.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "#808080";
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "#808080";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   
}

function refuse() {
   
   var lb = document.getElementById("left_button");
   var cb = document.getElementById("center_button");
   var rb = document.getElementById("right_button");
   var ab = document.getElementById("accept_button");
   
   rb.style.backgroundColor = "#a3cde3";
   rb.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "#808080";
   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "#808080";
   ab.style.backgroundColor = "#f5f5f5";
   ab.style.color = "#808080";
   
}
</script>

<title>Insert title here</title>
</head>
<body>
   <%@ include file="../../main/header.jsp" %>
   
   <section class="hero-wrap hero-wrap-2" style="background-image: url('${path}images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">sitter<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">요청하신 펫시터 서비스내역 입니다.</h1>
          </div>
        </div>
      </div>
    </section>
  
    <div style="display: flex; flex:1; justify-content:center;">
    	<%@ include file = "sidebar.jsp" %>
	
	<section style="width: 800px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
	    
	    <div class="list_tab">
	      <p id="left_button" style="background-color: #a3cde3; color: white;" onclick = "request();">요청 수락대기</p>
	      <p id="accept_button" onclick="accept();">수락된 요청</p>   
	      <p id="right_button" onclick="refuse();">거절된 요청</p>      
	      <p id="center_button" onclick ="matchingFinish();">매칭완료</p>
	    </div>
	    
	    
	    <div class = "result_div" style = "width:100%; padding-top: 10px; padding-bottom:10px;">
	    
	    	<div class = "container">
			    <c:if test="${selectCnt == 0}">
			       <div class="row" id = "divs" style = "display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 20px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">			         
			       <div class="col-md-12">
			           <h3></h3>
			           <p>아직 요청한 펫시터 서비스가 없습니다.첫 펫시팅 서비스를 이용해 보세요!</p>
			         </div>
			       </div>
			    </c:if>
			   
			   <c:if test="${selectCnt > 0}"> 
			   	<div class="row" id = "divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 15px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
			   	  <c:forEach var="li" items="${list}">
			            <div class="col-md-12" style="background-color:#dfe3eb; padding:20px;">
			              <h5>고객 : ${li.CUST_ID}</h5>&nbsp;<h6>훈련받을 펫 : ${li.SQ_AMT}</h6>
			              <p>의뢰시작일 : ${li.START_DAY}</p>
			              <p> 의뢰종료일 : ${li.END_DAY}</p>
			              <p> 고객요청서비스 : ${li.REQ_SV}</p>
			              <p>금액 : ${li.SQ_FEE} 원</p> 
			              <p><input type="button" name="reqCancleByCus" value="요청취소" onclick="window.location='reqsitterSerCancle?SQ_CD=${li.SQ_CD}'"></p>
			           	  </div>
			         
			       </c:forEach>
			        </div>
			    </c:if>
		    </div>
	    </div> 
	    
  	 </section>
  	 
  	
   </div>
   
   
   <%@ include file="../../main/footer.jsp" %>
</body>
</html>