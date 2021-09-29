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
	
	$("#star_button").click(function() { //별점 높은순
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/bestStarSitter",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#big_button").click(function() { //후기많은순
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/bigSitterReview",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#new_button").click(function() { //최신등록순
		
		$.ajax({
			type: "get",
			url: "/tpj/sitter/newSitterReview",
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
</style>
<script type="text/javascript">
function newList(){
   var lb = document.getElementById("new_button");
   var rb = document.getElementById("big_button");
   var ac = document.getElementById("star_button");
   
   lb.style.backgroundColor = "#a3cde3";
   lb.style.color = "white";

   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   ac.style.backgroundColor = "#f5f5f5";
   ac.style.color = "#808080";
   
   
}

function star() {
   
   var lb = document.getElementById("new_button");
   var rb = document.getElementById("big_button");
   var ac = document.getElementById("star_button");
   
   ac.style.backgroundColor = "#a3cde3";
   ac.style.color = "white";

   lb.style.backgroundColor = "#f5f5f5";
   lb.style.color = "#808080";
   rb.style.backgroundColor = "#f5f5f5";
   rb.style.color = "#808080";
   
}

function big() {
   
   var lb = document.getElementById("new_button");
   var rb = document.getElementById("big_button");
   var ab = document.getElementById("star_button");
   
   rb.style.backgroundColor = "#a3cde3";
   rb.style.color = "white";

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
            <h1 class="mb-0 bread">서비스 신청 전 믿음직스런 후기들을 둘러보세요 .</h1>
          </div>
        </div>
      </div>
    </section>   
 
     <div style="display: flex; flex:1; justify-content:center;">
    	<%@ include file = "sidebar.jsp" %>  
    	<section style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
    		
    	<div class="list_tab">
	      <p id="new_button" style="background-color: #a3cde3; color: white;" onclick ="newList();">최신 등록순</p>
	      <p id="star_button" onclick="star();">평점순</p>   
	      <p id="big_button" onclick="big();">후기 많은 순</p>      
	    </div>
	    
	    <div class = "result_div">
	    
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
		       	  <a href=""><img src="${imgPath}${dtos.TA_IMG}"></a><br>
	              <h6>${dtos.CUST_NM}&nbsp;훈련사</h6><br>
	              <h6><i class="fas fa-star"></i>${dtos.TG_AVG}&nbsp;<span class="fa fa-comment"></span>${dtos.TG_COUNT}</h6>
	              <p>서비스지역 : ${dtos.TS_AREA}<br>${dtos.TA_TITLE}</p>
		        </div>
	          </div>
	         </c:forEach>
	       </c:if>
	     </div>  
    	</section>
    </div>	
<%@ include file="../../main/footer.jsp" %>
</body>
</html>