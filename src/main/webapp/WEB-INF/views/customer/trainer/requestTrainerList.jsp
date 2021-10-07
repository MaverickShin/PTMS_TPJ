<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

		$("#accept_button").click(function() {

			$.ajax({
				type : "get",
				url : "/tpj/trainer/acceptTrainingList",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#right_button").click(function() {

			$.ajax({
				type : "get",
				url : "/tpj/trainer/denyTrainingList",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#center_button").click(function() {

			$.ajax({
				type : "get",
				url : "/tpj/trainer/TrainingServiceComplete",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#left_button").click(function() {

			$.ajax({
				type : "get",
				url : "/tpj/trainer/requestTrainer2",
				cache : false,
				success : function(result) {
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
	place-content: center;
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
	function TrainingComplete() {

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

	function request() {
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
		var ac = document.getElementById("accept_button");

		rb.style.backgroundColor = "#a3cde3";
		rb.style.color = "white";

		cb.style.backgroundColor = "#f5f5f5";
		cb.style.color = "#808080";
		lb.style.backgroundColor = "#f5f5f5";
		lb.style.color = "#808080";
		ac.style.backgroundColor = "#f5f5f5";
		ac.style.color = "#808080";

	}
</script>

<title>Insert title here</title>
</head>
<body>
	<c:if test="${trainerChkCnt != 1}">
       	<script type="text/javascript">
          alert("훈련사로 등록 후 이용 가능합니다.");
          window.history.back();
    	</script>
    </c:if>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${path}images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="">Trainer<i class="ion-ios-arrow-forward"></i></a></span> 
						<span>Blog <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">훈련사님의 의뢰사항을 알려드립니다.</h1>
				</div>
			</div>
		</div>
	</section>

	<div style="display: flex; flex: 1; justify-content: center;">

		<%@ include file="sidebar.jsp"%>

		<section
			style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 30px; font-size: 20px;"
			class="sections">

			<div class="list_tab">
				<p id="left_button" style="background-color: #a3cde3; color: white;"
					onclick="request();">요청 수락대기</p>
				<p id="accept_button" onclick="accept();">수락</p>
				<p id="right_button" onclick="refuse();">거절</p>
				<p id="center_button" onclick="TrainingComplete();">매칭 완료</p>

			</div>

			<div class="result_div">

				<c:if test="${cnt == 0}">
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
							<div class="about-author d-flex p-4 bg-light"
								style="place-content: center;">
								<div class="desc"
									style="background-color: #dfe3eb; padding: 20px;">
									<h6>펫주인 : ${dtos.CUST_ID}</h6>
									&nbsp;
									<h6>훈련받을 펫 : ${dtos.PET_NM}</h6>
									<p>
										<b>훈련일</b> <br>
										${dtos.START_DAY}<br>
										<b>훈련종류 </b><br>
										${dtos.TQ_AMT}<br>
										<fmt:formatNumber value="${dtos.TQ_FEE}" pattern="###,###,###,###" />원
									</p>
									<input type="button" value="수락" class="btn btn-primary"
										onclick="window.location='acceptRequestTraining?TQ_CD=${dtos.TQ_CD}'">
									<input type="button" value="거절" class="btn btn-primary"
										onclick="window.location='denyRequestTraining?TQ_CD=${dtos.TQ_CD}'">
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
					

			</div>

		</section>

	</div>


	<%@ include file="../../main/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var pageNum = '<c:out value="${pageNum}"/>';
	
	function pageMove(e) {
		
		var urls = '<c:out value="${t}"/>';
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
		
		var urls = '<c:out value="${t}"/>';
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