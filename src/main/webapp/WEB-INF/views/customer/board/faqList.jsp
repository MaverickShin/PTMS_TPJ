<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#right_button").click(function() { //거절된요청

			$.ajax({
				type : "get",
				url : "/tpj/cust/faqlist2",
				cache : false,
				data : "fk_cd=" + 3,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#center_button").click(function() { //매칭완료

			$.ajax({
				type : "get",
				url : "/tpj/cust/faqlist2",
				cache : false,
				data: "fk_cd=" + 2,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});

		$("#left_button").click(function() { //요청수락대기

			$.ajax({
				type : "get",
				url : "/tpj/cust/faqlist2",
				cache : false,
				data : "fk_cd=" + 1,
				success : function(result) {
					$("#delivery").empty();
					$("#delivery").append(result);
				},
				error : function(request, status, error) {
					alert("에러!");
				}
			});
		});
		
	});
</script>
<script type="text/javascript">
	function macting() {

		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		lb.style.backgroundColor = "white";
		lb.style.color = "#37474f";
		lb.style.border = "4px solid #90a4ae";
		lb.style.borderBottom = "none";
		lb.style.fontWeight = "bolder";
		lb.style.fontSize = "24px";

		cb.style.backgroundColor = "#37474f";
		cb.style.color = "white";
		cb.style.border = "1px solid #bdbdbd";
		cb.style.borderBottom = "4px solid #90a4ae";
		cb.style.fontSize = "20px";
		cb.style.fontWeight = "normal";
		
		rb.style.backgroundColor = "#37474f";
		rb.style.color = "white";
		rb.style.border = "1px solid #bdbdbd";
		rb.style.borderBottom = "4px solid #90a4ae";
		rb.style.fontSize = "20px";
		rb.style.fontWeight = "normal";
		
	}

	function uses() {
		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		cb.style.backgroundColor = "white";
		cb.style.color = "#37474f";
		cb.style.border = "4px solid #90a4ae";
		cb.style.borderBottom = "none";
		cb.style.fontWeight = "bolder";
		cb.style.fontSize = "24px";

		lb.style.backgroundColor = "#37474f";
		lb.style.color = "white";
		lb.style.border = "1px solid #bdbdbd";
		lb.style.borderBottom = "4px solid #90a4ae";
		lb.style.fontSize = "20px";
		lb.style.fontWeight = "normal";
		
		rb.style.backgroundColor = "#37474f";
		rb.style.color = "white";
		rb.style.border = "1px solid #bdbdbd";
		rb.style.borderBottom = "4px solid #90a4ae";
		rb.style.fontSize = "20px";
		rb.style.fontWeight = "normal";

	}

	function pays() {

		var lb = document.getElementById("left_button");
		var cb = document.getElementById("center_button");
		var rb = document.getElementById("right_button");

		rb.style.backgroundColor = "white";
		rb.style.color = "#37474f";
		rb.style.border = "4px solid #90a4ae";
		rb.style.borderBottom = "none";
		rb.style.fontWeight = "bolder";
		rb.style.fontSize = "24px";

		cb.style.backgroundColor = "#37474f";
		cb.style.color = "white";
		cb.style.border = "1px solid #bdbdbd";
		cb.style.borderBottom = "4px solid #90a4ae";
		cb.style.fontSize = "20px";
		cb.style.fontWeight = "normal";
		
		lb.style.backgroundColor = "#37474f";
		lb.style.color = "white";
		lb.style.border = "1px solid #bdbdbd";
		lb.style.borderBottom = "4px solid #90a4ae";
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
		background-color: #37474f;
		color: white;
		border: 1px solid #bdbdbd;
		font-size: 20px;
		border-bottom:4px solid #90a4ae;
	}
	
	
	.q_table {
		width: 100%;
		height: 50px;
		border-top : 1px solid #e0e0e0;
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
		text-align:center;
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
		outline:none !important;
	}
	
	details > summary {
 		 list-style: none;
	}
	details > summary::-webkit-details-marker {
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
  		focus:none;
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
		display:inline-block;
		border-bottom: 0.5px solid #78909c;
	}
	
	.lay_button button {
		background-color: #37474f;
		color: white; 
		outline: none;
		cursor: pointer;
		width: 80px;
		border:none;
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
	
	.lay_td_right input{
		outline:none;
		height: 20px;
		margin-left: 10px;
		border:none;
		width: 80%;
	}
	
	.lay_td_right select{
		outline: none;
		height: 25px;
		margin-left: 10px;
	}
	
	
	#lay_top {
		width:	100%;
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
		border:none;
		outline: none;
		font-weight: normal !important;
		margin: 10px;
		height: 40px !important;
	}
	
	#delivery form {
		margin:0;
	}
	
	#refunds form {
		margin:0;
	}
	
	#orders form {
		margin:0;
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
		border:none;
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
		display:inline-block;
		border-bottom: 0.5px solid #78909c;
	}
	
	.modi_lay_button button {
		background-color: #37474f;
		color: white; 
		outline: none;
		cursor: pointer;
		width: 80px;
		border:none;
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
		text-align:center;
	}
	
	#modi_lay_top {
		width:	100%;
		height: 40px;
		background-color: #37474f;
		text-align: center;
		color: white;
		font-size: 18px;
		font-weight: bold;
		line-height: 40px;
	}
	
	.modi_reli {
		position:relative;
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
		display:none;
	}

</style>

</head>
<body>
	<%@ include file="../../main/header.jsp" %>

<section class="hero-wrap hero-wrap-2"
		data-stellar-background-ratio="0.5" style = "height: 200px !important; font-family: 'Do Hyeon', sans-serif;">
		<div class="overlay"></div>
		<div class="container">
			<div class="col-md-9 ftco-animate pb-5" style = "line-height: 200px;">
				<h1 class="mb-0 bread" style = "color: white; line-height: 200px;">FAQ - 자주 묻는 질문</h1>
			</div>
		</div>
	</section>


<div class = "qna_list_sec">
<div class = "qna_list">
	<div class = "qna_list_div">
		<h4 style = "font-size: 30px; font-weight: bolder;">FAQ - 자주 묻는 질문</h4>
		
		<div class = "list_tab">
			<p id = "left_button" style = "background-color: white; color:#37474f; border:4px solid #90a4ae; border-bottom:none; font-weight:bolder; font-size: 24px;" onclick = "macting();">매칭 서비스</p>
			<p id = "center_button" onclick = "uses();">이용 문의</p>
			<p id = "right_button" onclick = "pays();">결제 관련</p>
		</div>
		
		<div id = "delivery" style = "min-height: 300px; background-color: #f5f5f5;">
			<c:if test = "${cnt > 0}">
				<c:forEach var = "i" items = "${vo}">
					<div class = "q">
						<details>
							<summary>
								<table class = "q_table">
									<tr>
										<td style = "text-align:center;"><i class="fab fa-quora  fa-2x"></i></td>
										<td class = "q_s">
											${i.FAQ_TITLE}
										</td>
										<td style = "text-align:center;"><i class="fas fa-chevron-down fa-2x"></i></td>
									</tr>
								</table>
							</summary>
							
							<div class = "a">
								<table class = "a_table">
									<tr>
										<td style = "text-align:center; background-color: #eeeeee; border-right: 2px solid #e0e0e0;">문의 내용 </td>
										<td style = "text-align:center;" class = "a_s">
											${i.FAQ_CONTENT}
										</td>
									</tr>
								</table>
							</div>
						</details>
					</div>
				</c:forEach>
				
				<div style="padding-top: 150px;"></div>
				
				<!-- 페이지 컨트롤 -->
				<div class = "row numberings">
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
			
			<c:if test = "${cnt == 0}">
				<div class = "q" style = "text-align:center;">
					<p style = "font-size:30px; padding-top: 100px;">등록된 FAQ가 없습니다!</p>
				</div>
			</c:if>
		</div>
	</div>
</div>
</div>
	<%@ include file="../../main/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	var pageNum = '<c:out value="${pageNum}"/>';
	var kind = '<c:out value = "${fk_cd}"/>';
	
	function pageMove(e) {
		
		var urls = "/tpj/cust/faqlist2";
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
				data : "fk_cd="+kind,
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
				data : "pageNum="+param+"&fk_cd="+kind,
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
				data : "pageNum="+param+"&fk_cd="+kind,
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
				data : "fk_cd="+kind,
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
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param+"&fk_cd="+kind,
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
			
			$.ajax({
				type : "get",
				url : urls,
				data : "pageNum="+param+"&fk_cd="+kind,
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
</script>
</html>