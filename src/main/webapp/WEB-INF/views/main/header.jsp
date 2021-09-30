<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.hide {
		display:none;
		background-color: #00bd56;
		min-width: 160px;
		box-shadow: 10px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
		font-size: 12px;
		position: absolute;
		left: -15px;
		top: 80px;
	}
	.hide a {
		color: white;
	  	padding: 12px 16px;
	  	text-decoration: none;
	  	display: block;
	  	text-align: left;
	}
	
	.hide a:hover {
		color: #00bd56;
		background-color: white;
	}
	
	#mypages {
		position:relative;
		cursor: pointer;
	}
	
	#mypages:hover .hide {
		display: block;
	}
	
	#ftco-nav a{
		font-size: 18px !important;
		font-weight: normal !important;
	}
	
</style>

</head>
<body>

<!-- header -->
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<!-- <a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>
							+00 1234 567</a> <a href="#"><span class="fa fa-paper-plane mr-1"></span>
							youremail@email.com</a> -->
					</p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end" style = "font-family:'Do Hyeon', sans-serif;">
					<div class="social-media" style = "display:flex;">
						<p class="mb-0 d-flex" align="center">
							<c:if test = "${sessionScope.cust_id == null}">
								<a href="${cu}login" style="color:white; font-size:16px;  width:70px; padding-top:8px;">로그인</a>
								<a href="${cu}join" style="color:white; font-size:16px;  width:70px; padding-top:8px;">회원가입</a>
							</c:if>
							
							<c:if test = "${sessionScope.cust_id != null}">
								<a style="color:white; font-size:16px; width:80px; padding-top:8px;">${sessionScope.cust_nm} 님</a>
								<form action = "${cu}logout" name = "logoutform" method = "post" style = "margin:0; padding:0;">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<a href = "javascript:logoutform.submit();" style="color:white; font-size:16px; width:60px; line-height:44px; cursor:pointer;">로그아웃</a>
								</form>
							</c:if>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/tpj/cust/main"><span
				class="flaticon-pawprint-1 mr-2"></span>Pet Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav" style = "font-family:'Do Hyeon', sans-serif;">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" id = "mypages"><a class="nav-link">반려인/펫 관리</a>
						<div class = "hide">
			    			<a href="/tpj/sch/calendar">캘린더</a>
				    		<a href="/tpj/cust/MyInfoUser">내정보관리</a>
				    		<a href="/tpj/cust/contact">건강관리</a>
						</div>
					</li>
					<li class="nav-item"><a href="/tpj/cust/board" class="nav-link">게시판</a></li>
					<li class="nav-item"><a href="/tpj/cust/gps" class="nav-link">마이 펫 찾기</a></li>
					<li class="nav-item"><a href="/tpj/cust/matchingMain" class="nav-link">매칭서비스</a></li>
					<li class="nav-item"><a href="/tpj/cust/location" class="nav-link">위치안내</a></li>
					<li class="nav-item"><a href="/tpj/cust/subscribe" class="nav-link">정기구독</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>