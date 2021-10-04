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
                     <li><a class ="pageMoves" onclick="pageMove('');" >&lt;&lt;</a>
                     <li><a class ="pageMoves" onclick="pageMove(${startPage - pageBlock});">&lt;</a></li>
                     
                     <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:if test="${i == currentPage}">
                       <li class="active"><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                    </c:if>

                    <c:if test="${i != currentPage}">
                       <li><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                    </c:if>
                    
                 </c:forEach> 
                     
                     <li><a class ="pageMoves" onclick = "pageMove(${startPage + pageBlock});">&gt;</a></li>
                     <li><a class ="pageMoves" onclick = "pageMove(${pageCount});">&gt;&gt;</a></li>
                   </ul>
              </div>
           </div>
       </div>
	</c:if>
	
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var pageNum = '<c:out value="${pageNum}"/>';
	
	function pageMove(e) {
		
		var urls = '<c:out value="${t
			}"/>';
		var param = e;
		var start = '<c:out value = "${startPage}"/>';
		var block = '<c:out value = "${pageBlock}"/>';
		var current = '<c:out value = "${currentPage}"/>';
		var pagecount = '<c:out value = "${pageCount}"/>';
		var end = '<c:out value = "${endPage}"/>';
		
		var left_one = start - block;
		var right_one = start + block;
		var right_two = pagecount;
		
		console.log('pageNum : ' + pageNum);
		console.log('param : ' + param);
		console.log('start : ' + start);
		console.log('block : ' + block);
		console.log('current : ' + current);
		console.log('end : ' + end);
		console.log('left_one : ' + left_one);
		console.log('right_one : ' + right_one);
		console.log('right_two : ' + right_two);
		
		
		// [<<] 버튼 눌렀을 때 조건
		if(param == '' && start > block) {
			
			alert("<<");
			
			$.ajax({
				type : "get",
				url : urls,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = 1;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		
		// [<] 조건
		}else if(param == start && start > block) {
			
			alert("<");
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		// [>] 버튼  조건
		}else if(param == right_one && pagecount > end) {
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
			
		// [>>] 버튼 조건 
		}else if(param == right_two && pagecount > end) {
			
			alert(">>");
			
			$.ajax({
				type : "get",
				url : urls,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		}
		
	}
	
	function pageNumbers(e) {
		
		alert("요깅");
		
		var urls = '<c:out value="${s}"/>';
		var param = e;
		var current = '<c:out value = "${currentPage}"/>';
		
		console.log('pageNum : ' + pageNum);
		console.log('param : ' + param);
		console.log('current : ' + current);
		
		if(param == current) {
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		
		}else {
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param,
				cache : false,
				success : function(result) {
					$(".result_div").empty();
					$(".result_div").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		}
		
	}
</script>
</html>