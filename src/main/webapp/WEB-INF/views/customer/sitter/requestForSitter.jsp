<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#sitaccept_button").click(function() { //수락
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/sitterAcceptList",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#sitright_button").click(function() { //거절
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/sitterRefuseList",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#sitcenter_button").click(function() { //매칭완료
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/sitterserPayFinish",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#sitleft_button").click(function() {  //요청수락대기
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/requestForSitter2",
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
   cursor: pointer;
   width: 220px;
   height: 60px;
   line-height: 60px;
   background-color: #f5f5f5;
   border: 1px solid #eeeeee;
}
</style>
<script type="text/javascript">
function sitterserPayFinish() {
	
	var lb = document.getElementById("sitleft_button");
	var cb = document.getElementById("sitcenter_button");
	var rb = document.getElementById("sitright_button");
	var ac = document.getElementById("sitaccept_button");
	
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
	
	var lb = document.getElementById("sitleft_button");
	var cb = document.getElementById("sitcenter_button");
	var rb = document.getElementById("sitright_button");
	var ac = document.getElementById("sitaccept_button");
   
   lb.style.backgroundColor = "#a3cde3";
   lb.style.color = "white";
   
   cb.style.backgroundColor = "#f5f5f5";
   cb.style.color = "#808080";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "#808080";
}

function refuse() {
	
	var lb = document.getElementById("sitleft_button");
	var cb = document.getElementById("sitcenter_button");
	var rb = document.getElementById("sitright_button");
	var ac = document.getElementById("sitaccept_button");
	
	rb.style.backgroundColor = "#a3cde3";
	rb.style.color = "white";
	
	cb.style.backgroundColor = "#f5f5f5";
	cb.style.color = "#808080";
	lb.style.backgroundColor = "#f5f5f5";
	lb.style.color = "#808080";
	ac.style.backgroundColor = "#f5f5f5";
	ac.style.color = "#808080";
	
}

function accept() {
	
	var lb = document.getElementById("sitleft_button");
	var cb = document.getElementById("sitcenter_button");
	var rb = document.getElementById("sitright_button");
	var ac = document.getElementById("sitaccept_button");
	
	ac.style.backgroundColor = "#a3cde3";
	ac.style.color = "white";
	
	cb.style.backgroundColor = "#f5f5f5";
	cb.style.color = "#808080";
	lb.style.backgroundColor = "#f5f5f5";
	lb.style.color = "#808080";
	rb.style.backgroundColor = "#f5f5f5";
	rb.style.color = "#808080";
	
}

</script>
<title>Insert title here</title>
</head>
<body>

   <c:if test="${selectCnt == 0}">
   		<script type="text/javascript">
   			alert("펫시터 등록 후 이용가능한 페이지 입니다.가입을  통해 펫시터로 활동해 보세요.");
   			window.location='${st}sitter';
		</script>
   	</c:if>
   	
   <c:if test="${selectCnt != 0}">	
	   <%@ include file="../../main/header.jsp" %>
	   
	   <section class="hero-wrap hero-wrap-2" style="background-image: url('${path}images/bg_2.jpg');" data-stellar-background-ratio="0.5">
	      <div class="overlay"></div>
	      <div class="container">
	        <div class="row no-gutters slider-text align-items-end">
	          <div class="col-md-9 ftco-animate pb-5">
	             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Sitter<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
	            <h1 class="mb-0 bread" style = "font-family: 'Do Hyeon', sans-serif;">펫시터님의 의뢰사항을 알려드립니다.</h1>
	          </div>
	        </div>
	      </div>
	    </section>
	    
	    <div style="display: flex; flex:1; justify-content:center;">
	    
	      <%@ include file = "sidebar.jsp" %>
	    
	      <section style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
			  
			  <div class="list_tab">
		         <p id="sitleft_button" style="background-color: #a3cde3; color: white;" onclick = "request();">요청 수락대기</p>
		      	 <p id="sitaccept_button" onclick="accept();">수락</p>   
		      	 <p id="sitright_button" onclick="refuse();">거절</p>
		         <p id="sitcenter_button" onclick="sitterserPayFinish();">매칭 완료</p>
		      </div>
		  
		  	  <div class= "result_div">
		  	  
			    <c:if test="${selectCnt == 0}">
			       <div class="about-author d-flex p-4 bg-light">
			         <div class="desc">
			           <h3></h3>
			           <p>아직 들어온 의뢰가 없습니다. 일정 조정으로 매칭률을 높여보세요!</p>
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
			              <p>금액 : ${li.SQ_FEE} 원</p> 
			              <input type="button" value="수락" class="btn btn-primary" style="backgrount-color:#a3cde3;" onclick="window.location='sitterAccept?SQ_CD=${li.SQ_CD}'">
			              <input type="button" value="거절" class="btn btn-primary" style="backgrount-color:#a3cde3;" onclick="window.location='sitterRefuse?SQ_CD=${li.SQ_CD}'">
			            </div>
			          </div>
			       </c:forEach>
			    </c:if> 
			    </div>
	    	</section>
	   </div>
	   
	   <%@ include file="../../main/footer.jsp" %>
	</c:if>   
</body>
</html>