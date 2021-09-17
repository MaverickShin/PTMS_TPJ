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
		font-weight: bold;
		background-color: white;
	}
	
	#mypages {
		position:relative;
		cursor: pointer;
	}
	
	#mypages:hover .hide {
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
					<p class="mb-0 phone pl-md-2">
						<!-- <a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>
							+00 1234 567</a> <a href="#"><span class="fa fa-paper-plane mr-1"></span>
							youremail@email.com</a> -->
					</p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media">
						<p class="mb-0 d-flex">
							<a href="${ad}adminlogin" style="color:white; font-size:14px;  font-weight: bold; width:120px; padding-top:8px;">관리자 로그인</a>
							<a href="${ad}adminjoin" style="color:white; font-size:14px; font-weight: bold; width:120px; padding-top:8px;">관리자 등록</a>
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
			<a class="navbar-brand" href="main"><span
				class="flaticon-pawprint-1 mr-2"></span>Pet Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" id = "mypages"><a class="nav-link">게시판 관리</a>
						<div class = "hide">
			    			<a href="/tpj/admin/community_list">커뮤니티 게시판</a>
				    		<a href="/tpj/admin/qnalist">Q&A</a>
				    		<a href="/tpj/admin/faqlist">FAQ</a>
				    		<a href="/tpj/admin/noticelist">공지사항</a>
						</div>
					</li>
					<li class="nav-item"><a href="/tpj/admin/user_managerment" class="nav-link">회원관리</a></li>
					<li class="nav-item"><a href="/tpj/admin/sattle" class="nav-link">결산</a></li>
					<li class="nav-item"><a href="/tpj/admin/promotion" class="nav-link">홍보물 관리</a></li>
					<li class="nav-item"><a href="/tpj/admin/total" class="nav-link">질병통계</a></li>
					<li class="nav-item"><a href="/tpj/admin/subscriber" class="nav-link">구독자 현황</a></li>
					<li class="nav-item"><a href="/tpj/admin/enroll" class="nav-link">등록</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>