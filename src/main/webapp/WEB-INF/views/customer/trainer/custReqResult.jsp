<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#accept_button").click(function() {
		
		$.ajax({
			type: "get",
			url: "/tpj/trainer/custReqResultAccept",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#right_button").click(function() {
		
		$.ajax({
			type: "get",
			url: "/tpj/trainer/custReqResultDeny",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#center_button").click(function() {
		
		$.ajax({
			type: "get",
			url: "/tpj/trainer/trainingComplete",
			cache: false,
			success: function(result) {
				$(".result_div").html(result);
		},
		error : function(request, status, error) {
			alert("에러!");
		}
		});
	});
	
	$("#left_button").click(function() {
		
		$.ajax({
			type: "get",
			url: "/tpj/trainer/custReqResult2",
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

.result_div {
	background-color: #e3f2fd;
}

.pageMoves {
	cursor: pointer;
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

	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${path}images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Trainer<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">고객님의 요청사항을 알려드립니다.</h1>
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
				<p id="accept_button" onclick="accept();">수락된 요청</p>
				<p id="right_button" onclick="refuse();">거절된 요청</p>
				<p id="center_button" onclick="TrainingComplete();">매칭 완료</p>
			</div>

			<div class="result_div"
				style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
				<div class="container">
					<c:if test="${cnt == 0}">
						<div class="row" id="divs"
							style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
							<div class="col-md-12">
								<h3></h3>
								<p>아직 요청한 훈련이 없습니다. 훈련사 찾기로 나에게 딱맞는 훈련사를 찾아보세요!</p>
							</div>
						</div>
					</c:if>

					<c:if test="${cnt > 0}">
						<div class="row" id="divs"
							style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
							<c:forEach var="dtos" items="${dto}" varStatus="status">
								<div class="col-md-12"
									style="background-color: #f5f5f5; border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
									<h6>훈련받을 펫 : ${dtos.PET_NM}</h6>
									<h6>훈련사 : ${dtos.CUST_NM}</h6>
									<p>훈련일 : ${dtos.START_DAY}</p>
									<p>훈련종류 : ${dtos.TQ_AMT}</p>

									<c:if test="${dtos.TQ_ST == 0}">
										<p>
											<input type="button" value="요청취소"
												onclick="window.location='cancelRequestTraining?TQ_CD=${dtos.TQ_CD}'">
										</p>
									</c:if>
									<c:if test="${dtos.TQ_ST == 1}">
										<p>
											<input type="button" value="결제하기"
												onclick="window.location='/tpj/pay/request?item_name=펫 훈련 결제&price=${dtos.TQ_FEE}&primarykey=${dtos.TQ_CD}'">
										</p>
									</c:if>
									<c:if test="${dtos.TQ_ST == 3}">
										<p>
											<input type="button" value="매칭확정하기"
												onclick="window.location='updateTrainingComplete?TQ_CD=${dtos.TQ_CD}'">
										</p>
									</c:if>
									<c:if test="${dtos.TQ_ST == 4}">
										<c:if test="${reviewCheckCnt[status.index] == 1}">
											<p>
												<input type="button" value="후기작성완료" disabled>
											</p>
										</c:if>
										<c:if test="${reviewCheckCnt[status.index] != 1}">
											<p>
												<input type="button" value="후기쓰기"
													onclick="window.location='writeTrainingReview?TQ_CD=${dtos.TQ_CD}&TG_ID=${dtos.TA_CD}'">
											</p>
										</c:if>
									</c:if>
								</div>
							</c:forEach>
						</div>

						<div class="row">
							<div class="col-md-12" align="center">
								<div class="block-27">
									<ul>
										<c:if test="${startPage > pageBlock}">
											<li><a class="pageMoves" onclick="pageMove('');">&lt;&lt;</a>
											<li><a class="pageMoves" onclick="pageMove(${startPage - pageBlock});">&lt;</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<li class="active"><span><a class="pageMoves"
														onclick="pageNumbers(${i});">${i}</a></span></li>
											</c:if>

											<c:if test="${i != currentPage}">
												<li><span><a class="pageMoves"
														onclick="pageNumbers(${i});">${i}</a></span></li>
											</c:if>

										</c:forEach>
										<c:if test="${pageCount > endPage}">
											<li><a class="pageMoves" onclick="pageMove(${startPage + pageBlock});">&gt;</a></li>
											<li><a class="pageMoves" onclick="pageMove(${pageCount});">&gt;&gt;</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
				</div>
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