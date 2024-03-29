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
	
	.hides {
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
	.hides a {
		color: white;
	  	padding: 12px 16px;
	  	text-decoration: none;
	  	display: block;
	  	text-align: left;
	}
	
	.hides a:hover {
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
	
	#boards {
		position:relative;
		cursor: pointer;
	}
	
	#boards:hover .hides {
		display: block;
	}
	
</style>

</head>
<body>

<!-- header -->
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2" align="left">
						<a href="${ad}adminlogin" style="color:white; font-size:16px;width:70px; padding-top:8px;">Manager Home</a>
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
								<a href = "/tpj/cust/logoutrequest" style="color:white; font-size:16px; width:80px; padding-top:8px;">로그아웃</a>
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
				class="flaticon-pawprint-1 mr-2"></span>Pet Care System</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav" style = "font-family:'Do Hyeon', sans-serif;">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" id = "mypages"><a class="nav-link">반려인/펫 관리</a>
						<div class = "hide">
						
							<c:if test="${sessionScope.cust_id == null}">
								<a class="nav-item" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">캘린더</a>	
							</c:if>
							<c:if test="${sessionScope.cust_id != null}">
				    			<a href="/tpj/sch/calendar">캘린더</a>
				    		</c:if>
				    			
				    		<c:if test="${sessionScope.cust_id == null}">
				    			<a class="nav-item" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">내정보관리</a>
				    		</c:if>
				    		
				    		<c:if test="${sessionScope.cust_id != null}">
				    			<a href="/tpj/cust/MyInfoUser">내정보관리</a>
				    		</c:if>	
				    		<a href="/tpj/cust/contact">건강관리</a>
						</div>
					</li>
					<li class="nav-item" id = "boards"><a class="nav-link">게시판</a>
						<div class = "hides">
			    				<a href="/tpj/cust/faqlist">FAQ</a>
			    				<c:if test="${sessionScope.cust_id == null}">
			    					<a class="nav-item" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">QnA</a>
			    				</c:if>
			    				<c:if test="${sessionScope.cust_id != null}">
				    				<a href="/tpj/cust/qnalist">QnA</a>
				    			</c:if>
						</div>
					</li>
					
					<c:if test="${sessionScope.cust_id == null}">
						<li class="nav-item"><a class="nav-link" onclick = "if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">매칭서비스</a></li>
					</c:if>
					<c:if test="${sessionScope.cust_id != null}">
						<li class="nav-item"><a href="/tpj/cust/matchingMain" class="nav-link">매칭서비스</a></li>
					</c:if>
					<li class="nav-item"><a href="/tpj/cust/location" class="nav-link">위치안내</a></li>
					<li class="nav-item"><a href="/tpj/cust/subscribe" class="nav-link">정기구독</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>