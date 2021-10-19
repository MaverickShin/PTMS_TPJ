<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
			
		$("#sitaccept_button").click(function() { //수락

			$.ajax({
				type : "get",
				url : "/tpj/sitter/sitterAcceptList",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#sitright_button").click(function() { //거절

			$.ajax({
				type : "get",
				url : "/tpj/sitter/sitterRefuseList",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#sitcenter_button").click(function() { //매칭완료

			$.ajax({
				type : "get",
				url : "/tpj/sitter/sitterserPayFinish",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#sitleft_button").click(function() { //요청수락대기

			$.ajax({
				type : "get",
				url : "/tpj/sitter/requestForSitter2",
				cache : false,
				success : function(result) {
					$(".result_div").html(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});
		
		$(".pageMove").click(function() {

			var urls = $(".pageMove").attr("href");
			
			alert("요깅 : " + urls);
		
			$.ajax({
				type : "get",
				url : urls,
				cache : false,
				success : function(result) {
					$('body').html(result);
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
	background-color: #DDDADA;
}
</style>
<script type="text/javascript">
	function sitterserPayFinish() {

		var lb = document.getElementById("sitleft_button");
		var cb = document.getElementById("sitcenter_button");
		var rb = document.getElementById("sitright_button");
		var ac = document.getElementById("sitaccept_button");

		cb.style.backgroundColor = "#DDDADA";
		cb.style.color = "white";

		lb.style.backgroundColor = "#f5f5f5";
		lb.style.color = "#808080";
		rb.style.backgroundColor = "#f5f5f5";
		rb.style.color = "#808080";
		ac.style.backgroundColor = "#f5f5f5";
		ac.style.color = "#808080";

	}

	function request() {

		var lb = document.getElementById("sitleft_button");
		var cb = document.getElementById("sitcenter_button");
		var rb = document.getElementById("sitright_button");
		var ac = document.getElementById("sitaccept_button");

		lb.style.backgroundColor = "#DDDADA";
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

		rb.style.backgroundColor = "#DDDADA";
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

		ac.style.backgroundColor = "#DDDADA";
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

	<c:if test="${doubleChk == 0}">
		<script type="text/javascript">
			alert("펫시터 등록 후 이용가능한 페이지 입니다.가입을  통해 펫시터로 활동해 보세요.");
			window.location = '${st}sitter';
		</script>
	</c:if>

	<c:if test="${doubleChk != 0}">
		<%@ include file="../../main/header.jsp"%>

		<section class="hero-wrap hero-wrap-2"
			style="background-image: url('${path}images/bg_2.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row no-gutters slider-text align-items-end">
					<div class="col-md-9 ftco-animate pb-5">
						<p class="breadcrumbs mb-2">
							<span class="mr-2"><a href="index.html">Sitter<i
									class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
								class="ion-ios-arrow-forward"></i></span>
						</p>
						<h1 class="mb-0 bread"
							style="font-family: 'Do Hyeon', sans-serif;">펫시터님의 의뢰사항을
							알려드립니다.</h1>
					</div>
				</div>
			</div>
		</section>

		<div style="display: flex; flex: 1; justify-content: center;">

			<%@ include file="sidebar.jsp"%>

			<section
				style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 30px;"
				class="sections">

				<div class="list_tab">
					<p id="sitleft_button"
						style="background-color: #DDDADA; color: white;"
						onclick="request();">요청 수락대기</p>
					<p id="sitaccept_button" onclick="accept();">수락</p>
					<p id="sitright_button" onclick="refuse();">거절</p>
					<p id="sitcenter_button" onclick="sitterserPayFinish();">매칭 완료</p>
				</div>

				<div class="result_div"
					style="width: 100%; padding-top: 10px; padding-bottom: 10px;">

					<div class="container">
						<c:if test="${cnt == 0}">
							<div class="row" id="divs"
								style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
								<div class="col-md-12">
									<h3></h3>
									<p align="center">매칭된 서비스 내역이 존재하지 않습니다. 일정 조정으로 매칭률을 높여보세요!</p>
								</div>
							</div>
						</c:if>

						<c:if test="${cnt > 0}">
							<div class="row" id="divs"
								style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
								<c:forEach var="li" items="${list}">
									<div class="col-md-12" 
										style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
									   border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
										<h5 style="color:#DBB9B8;">요청 고객 : ${li.CUST_ID}</h5>
										<h6 style="color:#DBB9B8;">서비스 요청 펫 : ${li.SQ_AMT}</h6>
										<p style="color:#DBB9B8;">의뢰시작일 : ${li.START_DAY}</p>
										<p style="color:#DBB9B8;">의뢰종료일 : ${li.END_DAY}</p>
										<p style="color:#DBB9B8;">고객요청서비스 : ${li.REQ_SV}</p>
										<p style="color:#DBB9B8;">금액 : <fmt:formatNumber value="${li.SQ_FEE}" pattern="###,###,###,###"/>원</p>
										<c:if test="${li.SQ_ST == 0}">
											<input type="button" value="수락" style="border-radius: 10px;"
												onclick="window.location='sitterAccept?SQ_CD=${li.SQ_CD}'">
											<input type="button" value="거절"	  style="border-radius: 10px;"
												onclick="window.location='sitterRefuse?SQ_CD=${li.SQ_CD}'">
										</c:if>
									</div>
								</c:forEach>
							</div>

								<div class="row">
			                      <div class="col-md-12" align="center">
			                        <div class="block-27">
			                           <ul>
			                                 <li><a class="pageMoves pageArrow" onclick="pageMove('', '${s}');">&lt;&lt;</a>
			                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${startPage - pageBlock}, '${s}');">&lt;</a></li>
			                              <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                                 <c:if test="${i == currentPage}">
			                                    <li class="active"><span><a class="pageMoves"
			                                          onclick="pageNumbers(${i}, '${s}');">${i}</a></span></li>
			                                 </c:if>
			
			                                 <c:if test="${i != currentPage}">
			                                    <li><span><a class="pageMoves"
			                                          onclick="pageNumbers(${i}, '${s}');">${i}</a></span></li>
			                                 </c:if>
			
			                              </c:forEach>
			                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${startPage + pageBlock}, '${s}');">&gt;</a></li>
			                                 <li><a class="pageMoves pageArrow" onclick="pageMove(${pageCount}, '${s}');">&gt;&gt;</a></li>
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
	</c:if>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var pageNum = '<c:out value="${pageNum}"/>';
	
	function pageMove(e, u) {
		
		var urls = u;
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
		} else if(param == right_one && pagecount > end) {
			
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
	
	function pageNumbers(e, u) {
		
		var urls = u;
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