<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var chk1 = document.tr_kind.tr_kind1.checked;
	var chk2 = document.tr_kind.tr_kind2.checked;
	var chk3 = document.tr_kind.tr_kind3.checked;
	var chk4 = document.tr_kind.tr_kind4.checked;
	
	var result1 = document.getElementById("tr_kind1_fee");
	
	if(chk1) {
		result1.style.display = "block";
	}
	if(chk2) {
		result.style.display = "block"
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp" %>
	
	<div style="display:flex">
		<nav id="listdiv_id1" style="width:400px; padding:100px;">
			<ul>
				<li>-고객-</li>
				<li><a href="#">훈련사 목록</a></li>
				<li><a href="">이용 후기</a></li>
				<li><a href="">훈련 종류</a></li>
				<li>-훈련사-</li>
				<li><a href="applyTrainer">훈련사지원</a></li>
				<li><a href="">활동 등록</a></li>
				<li><a href="">나에게 온 의뢰</a></li>
			</ul>
		</nav>
		
		<section style = "width:700px; margin-left:auto; margin-right:auto; margin-top:30px;">
			<form name="joinInform" action="${cu}joinaction" method="post" onsubmit="return joinCheck();">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="row no-gutters" >
						<div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">훈련사 등록</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
		   										<div class="form-field">
		       										<div class="select-wrap">
		       											<label class="label" for="tr_kind">훈련가능 유형</label>
							                      		<label><input type="checkbox" value="1" name="tr_kind" id="tr_kind1" class="form-control">배변훈련</label>
							                      		<div id="tr_kind1_fee" style = "display:none">
							                      			<label>한 회차당 배변훈련 요금</label>
                           									<input type="number" id="tr_kind1_fee" class="form-control">
                        								</div>
							                      		<label><input type="checkbox" value="2" name="tr_kind" id="tr_kind2" class="form-control">분리불안</label>
							                      		<label><input type="checkbox" value="3" name="tr_kind" id="tr_kind3" class="form-control">기본훈련</label>
							                      		<label><input type="checkbox" value="4" name="tr_kind" id="tr_kind4" class="form-control">짖음해결</label>
		                 							</div>
		             							</div>
		   									</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="service_loc">훈련 가능 지역</label>
												<input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
											</div>
										</div>
										
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="address1">도로명 주소</label>
												<input type="text" class="form-control" name="address1" id="address1" placeholder="도로명 주소" readonly>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="address2">지번 주소</label>
												<input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
											</div>
										</div>
										
									    <div>
									      <p class="label">언제 맡기시나요?</p><br>
									      <input type="date" class="iptags" name="START_DAY" > ~
									      <input type="date" class="iptags" name="END_DAY" >
									   </div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="trainingDay">훈련가능일</label>
												<input type="date" class="iptags" name="START_DAY" >~
												<input type="date" class="iptags" name="END_DAY" >
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="cust_age">나이</label>
												<input type="number" class="form-control" maxlength="3" min="1" name="cust_age" id="cust_age" placeholder="나이">
											</div>
										</div>
										
										<div class="col-md-7">
											<div class="form-group">
												<label class="label" for="postcode">우편번호</label>
												<input type="text" class="form-control" name="zipcode" id="postcode" placeholder="우편번호" readonly>
											</div>
										</div>
										
										<div class="col-md-4">
											<div class="form-group" style = "margin-top: 10px;">
												<input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
												<div class="submitting"></div>
											</div>
										</div>
										
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="address1">도로명 주소</label>
												<input type="text" class="form-control" name="address1" id="address1" placeholder="도로명 주소" readonly>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="address2">지번 주소</label>
												<input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
											</div>
										</div>
										
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="subaddress">상세주소</label>
												<input type="text" class="form-control" name="subaddress" id="subaddress" placeholder="상세주소">
											</div>
										</div>
										
										<div class="col-md-12">
											<div class="form-group" align = "center">
												<input type="submit" value="회원가입" class="btn btn-primary" id = "join_sub">
												<div class="submitting"></div>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
			</form>
		</section>
	</div>
	
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>