<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>Insert title here</title>
<script type="text/javascript">
	var qk_cd = "<c:out value = '${qk_cd}'/>";

	$(document).ready(function(){
		
		$("#right_button").click(function() { //거절된요청

			$.ajax({
				type : "get",
				url : "/tpj/cust/qnalist2",
				cache : false,
				data : "qk_cd=" + 3,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					qk_cd = 3;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#center_button").click(function() { //매칭완료

			$.ajax({
				type : "get",
				url : "/tpj/cust/qnalist2",
				cache : false,
				data: "qk_cd=" + 2,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					qk_cd = 2;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#left_button").click(function() { //요청수락대기

			$.ajax({
				type : "get",
				url : "/tpj/cust/qnalist2",
				cache : false,
				data : "qk_cd=" + 1,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					qk_cd = 1;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});
		
	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#order_add").click(function(e){
	    $("#add_lay").fadeIn(1000);
	});
	$("#success_btn").click(function(e){
	    
		var title = $("#qna_title").val();
		var content = $("#qna_content").val();
		var kind = $("select[name='qk_id']").val();
		
		if(title != "" && content != "" ) {
			
			$.ajax({
				type: "get",
				url: "/tpj/cust/qnaadd",
				cache: false,
				data : "qna_title="+title+"&qna_content="+content+"&qk_cd="+kind,
				contentType: "charset=utf-8",
				beforeSend : function(jqXHR, settings)
				{
					var token = $("meta[name='_csrf_header']").attr("content");
					var header = $("meta[name='_csrf']").attr("content");
					console.log(token);
					console.log(header);
					jqXHR.setRequestHeader(header, token);
			},
			success: function(cnt) {
				$("#delivery").html(cnt);
			},
			error : function(request, status, error) {
				console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
			}
			});
			
		    $("#add_lay").fadeOut(1000);
			return true;
		} else {
			alert("필수정보를 입력 해주세요!");
			return false;
		}
		
	});	
	
	$("#close_btn").click(function(e){
		
		$("#seller_form").find('input').val('');
		e.preventDefault();
	    $("#add_lay").fadeOut(400);
	    return false;
	});
	
	
});

</script>

<script type="text/javascript">
	function macting() {

		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		lb.style.backgroundColor = "#90a4ae";
		lb.style.color = "white";
		lb.style.border = "3px solid #455a64";
		lb.style.borderBottom = "none";
		lb.style.fontWeight = "bolder";
		lb.style.fontSize = "24px";

		cb.style.backgroundColor = "#f5f5f5";
		cb.style.color = "#808080";
		cb.style.border = "1px solid #bdbdbd";
		cb.style.borderBottom = "3px solid #455a64";
		cb.style.fontSize = "20px";
		cb.style.fontWeight = "normal";
		
		rb.style.backgroundColor = "#f5f5f5";
		rb.style.color = "#808080";
		rb.style.border = "1px solid #bdbdbd";
		rb.style.borderBottom = "3px solid #455a64";
		rb.style.fontSize = "20px";
		rb.style.fontWeight = "normal";
		
	}

	function uses() {
		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		cb.style.backgroundColor = "#90a4ae";
		cb.style.color = "white";
		cb.style.border = "3px solid #455a64";
		cb.style.borderBottom = "none";
		cb.style.fontWeight = "bolder";
		cb.style.fontSize = "24px";

		lb.style.backgroundColor = "#f5f5f5";
		lb.style.color = "#808080";
		lb.style.border = "1px solid #bdbdbd";
		lb.style.borderBottom = "3px solid #455a64";
		lb.style.fontSize = "20px";
		lb.style.fontWeight = "normal";
		
		rb.style.backgroundColor = "#f5f5f5";
		rb.style.color = "#808080";
		rb.style.border = "1px solid #bdbdbd";
		rb.style.borderBottom = "3px solid #455a64";
		rb.style.fontSize = "20px";
		rb.style.fontWeight = "normal";

	}

	function pays() {

		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		rb.style.backgroundColor = "#90a4ae";
		rb.style.color = "white";
		rb.style.border = "3px solid #455a64";
		rb.style.borderBottom = "none";
		rb.style.fontWeight = "bolder";
		rb.style.fontSize = "24px";

		cb.style.backgroundColor = "#f5f5f5";
		cb.style.color = "#808080";
		cb.style.border = "1px solid #bdbdbd";
		cb.style.borderBottom = "3px solid #455a64";
		cb.style.fontSize = "20px";
		cb.style.fontWeight = "normal";
		
		lb.style.backgroundColor = "#f5f5f5";
		lb.style.color = "#808080";
		lb.style.border = "1px solid #bdbdbd";
		lb.style.borderBottom = "3px solid #455a64";
		lb.style.fontSize = "20px";
		lb.style.fontWeight = "normal";

	}

</script>

<style>
.qna_list {
	margin-right: auto;
	width: 900px;
	padding-top: 30px;
	margin-left: auto;
	height: 100%;
}

.qna_list_div {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}

.list_tab {
	display: flex;
	align-items: center;
}

.list_tab p {
	display: block;
	text-align: center;
	font-weight: normal;
	cursor: pointer;
	width: 300px;
	height: 60px;
	line-height: 60px;
	background-color: #f5f5f5;
	border: 1px solid #bdbdbd;
	font-size: 20px;
	border-bottom: 3px solid #455a64;
}

.q_table {
	width: 100%;
	height: 50px;
	border-top: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 18px;
}

.q_table i {
	margin-left: 10px;
	color: #37474f;
}

.a_table {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e0e0e0;
	background-color: #f5f5f5;
	font-size: 18px;
	text-align: center;
}

.a_table i {
	margin-left: 10px;
	margin-right: 20px;
	color: #2196f3;
	font-size: 18px !important;
}

.a_s {
	font-size: 18px;
	width: 690px;
	text-align: center;
	background-color: #eeeeee;
}

summary:focus {
	outline: none !important;
}

details>summary {
	list-style: none;
}

details>summary::-webkit-details-marker {
	display: none;
}

.q_s {
	font-size: 18px;
	width: 480px;
	text-align: left;
}

.q {
	width: 100%;
}

.buttons {
	width: 900px;
	text-align: center;
	margin-top: 30px;
}

.buttons button {
	font-size: 22px;
	font-weight: normal;
	background-color: #37474f;
	color: white;
	border: none;
	height: 50px;
	width: 200px;
	cursor: pointer;
	outline: none;
	border-collapse: collapse;
	border-radius: 20px;
	border-style: hidden;
	box-shadow: 0 0 0 0;
	focus: none;
}

.buttons button:hover {
	background-color: white;
	color: #37474f;
}

#add_button {
	margin-top: 20px;
	text-align: center;
	position: relative;
}

.lay_content table {
	width: 500px;
	border-collapse: collapse;
	border-spacing: 0;
	margin: auto;
	padding-top: 30px;
	display: inline-block;
	border-bottom: 0.5px solid #78909c;
}

.lay_button button {
	background-color: #37474f;
	color: white;
	outline: none;
	cursor: pointer;
	width: 80px;
	border: none;
	height: 30px;
	font-weight: normal;
	font-size: 18px;
	margin: 20px;
}

.add_layers {
	display: none;
	position: absolute;
	top: -300px;
	left: 150px;
	width: 600px;
	height: 280px;
	z-index: 1;
}

.lay_content {
	border: 2px solid #37474f;
	border-top: none;
	background-color: white;
}

.lay_td_left {
	text-align: left;
	background-color: #eceff1;
	font-size: 16px;
	font-weight: bold;
	height: 20px;
	padding: 10px;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 0.5px solid #78909c;
	width: 120px !important;
	border-right: 0.5px solid #78909c;
}

.lay_td_right {
	text-align: left;
	background-color: white;
	border-top: 0.5px solid #78909c;
	border-collapse: collapse;
	border-spacing: 0;
	width: 75%;
}

.lay_td_right input {
	outline: none;
	height: 20px;
	margin-left: 10px;
	border: none;
	width: 80%;
}

.lay_td_right select {
	outline: none;
	height: 25px;
	margin-left: 10px;
}

#lay_top {
	width: 100%;
	height: 40px;
	background-color: #37474f;
	text-align: center;
	color: white;
	font-size: 18px;
	font-weight: bold;
	line-height: 40px;
}

.page_control {
	width: 600px;
}

.page_control table {
	width: 600px;
	text-align: center;
}

.b {
	text-align: center;
}

.b input {
	color: white;
	width: 100px !important;
	font-size: 18px;
	background-color: #2196f3;
	cursor: pointer;
	border: none;
	outline: none;
	font-weight: normal !important;
	margin: 10px;
	height: 40px !important;
}

#delivery form {
	margin: 0;
}

#refunds form {
	margin: 0;
}

#orders form {
	margin: 0;
}

.m_i {
	margin-left: 10px;
	color: #37474f;
	width: 80px;
	text-align: center;
	width: 110px;
}

.m_table {
	width: 100%;
	height: 50px;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 18px;
	background-color: #eceff1;
}

.m_table i {
	margin-left: 10px;
	color: #37474f;
	width: 60px;
	text-align: center;
}

.b {
	text-align: center;
	padding-bottom: 20px;
}

.b input {
	color: white;
	width: 60px;
	background-color: #2196f3;
	cursor: pointer;
	border: none;
	outline: none;
	font-weight: bold;
	height: 25px;
	padding: 15px;
	line-height: 15px;
}

#delivery {
	position: relative;
}

.numberings {
	position: absolute;
	bottom: 10px;
	left: 15px;
	padding-top: 10px;
	border-top: 1px solid #00bd56;
	width: 100%;
	margin-top: 20px;
}

.modi_lay_content table {
	width: 500px;
	border-collapse: collapse;
	border-spacing: 0;
	margin: auto;
	padding-top: 30px;
	display: inline-block;
	border-bottom: 0.5px solid #78909c;
}

.modi_lay_button button {
	background-color: #37474f;
	color: white;
	outline: none;
	cursor: pointer;
	width: 80px;
	border: none;
	height: 30px;
	font-weight: normal;
	font-size: 18px;
	margin: 20px;
}

.modify_layers {
	display: none;
	position: absolute;
	top: -700px;
	left: 150px;
	width: 600px;
	height: 280px;
	z-index: 1;
}

.modi_lay_content {
	border: 2px solid #37474f;
	border-top: none;
	background-color: white;
	text-align: center;
}

#modi_lay_top {
	width: 100%;
	height: 40px;
	background-color: #37474f;
	text-align: center;
	color: white;
	font-size: 18px;
	font-weight: bold;
	line-height: 40px;
}

.modi_reli {
	position: relative;
}

.qna_list_sec {
	padding-bottom: 50px;
	font-family: 'Do Hyeon', sans-serif;
	min-height: 500px;
	background-image: url('${path}images/bg_1.jpg');
	overflow: auto;
	-ms-overflow-style: none;
	height: 100%;
}

.qna_list_sec::-webkit-scrollbar {
	display: none;
}
</style>

</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		data-stellar-background-ratio="0.5"
		style="height: 200px !important; font-family: 'Do Hyeon', sans-serif;">
		<div class="overlay"></div>
		<div class="container">
			<div class="col-md-9 ftco-animate pb-5" style="line-height: 200px;">
				<h1 class="mb-0 bread" style="color: white; line-height: 200px;">문의
					게시판</h1>
			</div>
		</div>
	</section>


	<div class="qna_list_sec">
		<div class="qna_list">
			<div class="qna_list_div">
				<h4 style="font-size: 30px; font-weight: bolder;">QnA - 문의하기</h4>

				<div class="list_tab">
					<p id="left_button"
						style="background-color: #90a4ae; color: white; border: 3px solid #455a64; border-bottom: none; font-weight: bolder; font-size: 24px;"
						onclick="macting();">매칭 서비스</p>
					<p id="center_button" onclick="uses();">이용 문의</p>
					<p id="right_button" onclick="pays();">결제 관련</p>
				</div>

				<div id="delivery"
					style="min-height: 300px; background-color: #f5f5f5;">
					<c:if test="${cnt > 0}">
						<c:forEach var="i" items="${vo}">
							<div class="q">
								<details>
									<summary>
										<table class="q_table">
											<tr>
												<td style="text-align: center;"><i
													class="fab fa-quora  fa-2x"></i></td>
												<td class="q_s">${i.QNA_TITLE}</td>
												<td style="text-align: center;"><i
													class="fas fa-chevron-down fa-2x"></i></td>
											</tr>
										</table>
									</summary>

									<details>
										<summary>
											<div class="a">
												<table class="a_table">
													<tr>
														<td
															style="text-align: center; background-color: #eeeeee; border-right: 2px solid #e0e0e0;">문의
															내용</td>
														<td style="text-align: center;" class="a_s">
															${i.QNA_CONTENT}</td>
													</tr>
												</table>
											</div>
										</summary>

										<c:if test="${i.QNA_ANSWER != null}">
											<div class="m">
												<table class="m_table">
													<tr>
														<td class="m_i" style="width: 210px !important;"><i
															class="fas fa-font fa-2x"></i></td>
														<td>${i.QNA_ANSWER}</td>
													</tr>
												</table>
											</div>

										</c:if>

										<c:if test="${i.QNA_ANSWER == null}">
											<div class="m">
												<table class="m_table">
													<tr>
														<td class="m_i" style="width: 210px !important;"><i
															class="fas fa-font fa-2x"></i></td>
														<td>아직 답변이 등록 되지 않았습니다!</td>
													</tr>
												</table>
											</div>

											<div class="b">
												<input type="button" class="in_buttons" id="order_modify"
													value="수정"
													onclick="modify_suc(${i.QNA_CD}, '${i.QNA_TITLE}', '${i.QNA_CONTENT}', '${i.QNA_DT}', ${i.QK_CD});">
												<input type="button" class="in_buttons" value="삭제"
													onclick="del_qna(${i.QNA_CD}, ${i.QK_CD});">
											</div>
										</c:if>
									</details>
								</details>
							</div>
						</c:forEach>

						<div style="padding-top: 150px;"></div>

						<!-- 페이지 컨트롤 -->
						<div class="row numberings">
							<div class="col-md-12" align="center">
								<div class="block-27">
									<ul>
										<li><a class="pageMoves" onclick="pageMove('');">&lt;&lt;</a>
										<li><a class="pageMoves"
											onclick="pageMove(${startPage - pageBlock});">&lt;</a></li>

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

										<li><a class="pageMoves"
											onclick="pageMove(${startPage + pageBlock});">&gt;</a></li>
										<li><a class="pageMoves"
											onclick="pageMove(${pageCount});">&gt;&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${cnt == 0}">
						<div class="q" style="text-align: center;">
							<p style="font-size: 30px; padding-top: 100px;">등록된 QnA가
								없습니다!</p>
						</div>
					</c:if>
				</div>

				<!-- qna 추가 -->
				<div id="add_button">
					<div class="buttons">
						<button type="button" id="order_add">QnA 등록</button>
					</div>
					<form id="seller_form">
						<div id="add_lay" class="add_layers">
							<div id="lay_top">QnA 등록</div>
							<div class="lay_content">
								<table>

									<tr>
										<td class="lay_td_left">QnA 유형</td>
										<td class="lay_td_right"><select name="qk_id" id="qk_id">
												<option value="1">매칭 서비스</option>
												<option value="2">이용 문의</option>
												<option value="3">결제 관련</option>
										</select></td>
									</tr>


									<tr>
										<td class="lay_td_left">QnA 제목</td>
										<td class="lay_td_right"><input type="text"
											id="qna_title" placeholder="제목을 입력해주세요." name="qna_title"
											required></td>
									</tr>

									<tr>
										<td class="lay_td_left">QnA 내용</td>
										<td class="lay_td_right"><textarea rows="10" cols="50"
												name="qna_content" id="qna_content"
												style="width: 390px !important; height: 300px !important; text-align: left !important; outline: none;"
												required placeholder="내용을 입력하세요!" word-break:break-all>
								</textarea></td>
									</tr>

								</table>

								<div class="lay_button">
									<button type="submit" id="success_btn">등록</button>
									<button type="reset" id="close_btn">취소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- qna 추가 끝 -->

				<div style="padding-bottom: 100px;"></div>

				<div class="modi_reli">
					<!-- qna 수정 -->
					<div id="modify_button">
						<form id="modify_forms">
							<div id="modify_lay" class="modify_layers">
								<div id="modi_lay_top">QnA 수정</div>
								<div class="modi_lay_content">
									<table>
										<tr>
											<td class="lay_td_left">QnA 유형</td>
											<td class="lay_td_right"><select name="qk_id_modi"
												id="qk_id_modi" disabled>
													<option value="1">매칭 서비스</option>
													<option value="2">이용 문의</option>
													<option value="3">결제 관련</option>
											</select></td>
										</tr>

										<tr>
											<td class="lay_td_left">등록일</td>
											<td class="lay_td_right"><input type="date"
												id="modi_qna_dt" name="modi_qna_dt" disabled></td>
										</tr>


										<tr>
											<td class="lay_td_left">QnA 제목</td>
											<td class="lay_td_right"><input type="text"
												id="modi_qna_title" placeholder="제목을 입력해주세요."
												name="modi_qna_title" required></td>
										</tr>

										<tr>
											<td class="lay_td_left">QnA 내용</td>
											<td class="lay_td_right"><textarea rows="10" cols="50"
													name="modi_qna_content" id="modi_qna_content"
													style="width: 390px !important; height: 300px !important; text-align: left !important; outline: none;"
													required placeholder="내용을 입력하세요!" word-break:break-all>
								</textarea></td>
										</tr>

									</table>

									<div class="lay_button">
										<button type="button" id="success_btn_modi">등록</button>
										<button type="reset" id="close_btn_modi">취소</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- qna 수정 끝 -->

			</div>
		</div>
	</div>
	<%@ include file="../../main/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var pageNum = '<c:out value="${pageNum}"/>';
	
	function pageMove(e) {
		
		var urls = "/tpj/cust/qnalist2";
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
				data : "qk_cd="+qk_cd,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
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
				data : "pageNum="+param+"&qk_cd="+qk_cd,
				cache : false,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
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
				data : "pageNum="+param+"&qk_cd="+qk_cd,
				cache : false,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			})
			
		// [>>] 버튼 조건 
		} else if(param == right_two && pagecount > end) {
			
			alert(">>");
			
			$.ajax({
				type : "get",
				url : urls,
				cache : false,
				data : "qk_cd="+qk_cd,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		}
		
	}
	
	function pageNumbers(e) {
		
		
		var urls = "/tpj/cust/qnalist2";
		var param = e;
		var current = '<c:out value = "${currentPage}"/>';
		
		console.log('pageNum : ' + pageNum);
		console.log('param : ' + param);
		console.log('current : ' + current);
		
		if(param == current) {
			console.log(qk_cd);
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param+"&qk_cd="+qk_cd,
				cache : false,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		
		}else {
			console.log(qk_cd);
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param+"&qk_cd="+qk_cd,
				cache : false,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
					pageNum = param;
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		}
		
	}
	
	function modify_suc(cd, t, c, d, k) {
		
	    
	    
	    $("#modi_qna_title").val(t);
	    $("#modi_qna_content").val(c);
	    $("#modi_qna_dt").val(d);
	    $("#qk_id_modi").val(k).prop("selected", true);

	    $("#modify_lay").fadeIn(1000);
		
		$("#success_btn_modi").click(function(e){
		    
			var qna_cd = cd;
			var title = $("#modi_qna_title").val();
			var content = $("#modi_qna_content").val();
			
			if(title != "" && content != "" ) {
				
				$.ajax({
					type: "get",
					url: "/tpj/cust/qnaupdate",
					cache: false,
					data : "qna_title="+title+"&qna_content="+content+"&qna_cd="+qna_cd+"&qk_cd="+k,
					contentType: "charset=utf-8",
					beforeSend : function(jqXHR, settings)
					{
						var token = $("meta[name='_csrf_header']").attr("content");
						var header = $("meta[name='_csrf']").attr("content");
						console.log(token);
						console.log(header);
						jqXHR.setRequestHeader(header, token);
				},
				success: function(cnt) {
					$("#delivery").empty();
					$("#delivery").append(cnt);
				},
				error : function(request, status, error) {
					console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
				}
				});
				
			    $("#modify_lay").fadeOut(1000);
				return true;
			} else {
				alert("필수정보를 입력 해주세요!");
				return false;
			}
			
		});	
		
		$("#close_btn_modi").click(function(e){
			
			$("#modify_forms").find('input').val('');
			e.preventDefault();
		    $("#modify_lay").fadeOut(400);
		    return false;
		});
		
	}
	
	function del_qna(e, q) {
		
		if(confirm('문의글을 삭제 하시겠습니까?')) {		
			$.ajax({
				type: "get",
				url: "/tpj/cust/qnadelete",
				cache: false,
				data : "qna_cd="+e+"&qk_cd="+q,
				contentType: "charset=utf-8",
				beforeSend : function(jqXHR, settings)
				{
					var token = $("meta[name='_csrf_header']").attr("content");
					var header = $("meta[name='_csrf']").attr("content");
					console.log(token);
					console.log(header);
					jqXHR.setRequestHeader(header, token);
			},
			success: function(cnt) {
				$("#delivery").html(cnt);
			},
			error : function(request, status, error) {
				console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
			}
			});
		}

	}
</script>
</html>