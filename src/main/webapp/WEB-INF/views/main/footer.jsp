<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>푸터</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	$.ajax({
		type: "get",
		url: "/tpj/cust/hospitalInfo",
		cache: false,
		contentType: "application/json; charset=utf-8",
		beforeSend : function(jqXHR, settings)
		{
			var token = $("meta[name='_csrf_header']").attr("content");
			var header = $("meta[name='_csrf']").attr("content");
			jqXHR.setRequestHeader(header, token);
	},
	success: function(cnt) {
		$(".hospital_info").append(cnt);
	},
	error : function(request, status, error) {
		console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
	}
	});
});

$(document).ready(function() {
	
	$.ajax({
		type: "get",
		url: "/tpj/cust/shopInfo",
		cache: false,
		contentType: "application/json; charset=utf-8",
		beforeSend : function(jqXHR, settings)
		{
			var token = $("meta[name='_csrf_header']").attr("content");
			var header = $("meta[name='_csrf']").attr("content");
			jqXHR.setRequestHeader(header, token);
	},
	success: function(cnt) {
		$(".shop_info").append(cnt);
	},
	error : function(request, status, error) {
		console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
	}
	});
});
</script>
<style>
	.hos_tb span {
		color: rgba(255, 255, 255, 0.7) !important;
		font-size: 16px;
		font-family: 'Do Hyeon', sans-serif;
		display:block;
	}
</style>
</head>
<body>
	<footer class="footer">
		<div class="container">
			<div class="row">
				
				<!--<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">Petsitting</h2>
						<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
						<ul class="ftco-footer-social p-0">
	             			 <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="fa fa-twitter"></span></a></li>
	             			 <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="fa fa-facebook"></span></a></li>
	           			     <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="fa fa-instagram"></span></a></li>
          			    </ul>
					</div> -->

				<div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
					<h2 class="footer-heading">Quick Links</h2>
					<ul class="list-unstyled">
						<li><a href="/tpj/cust/main" class="py-2 d-block">Home</a></li>
						<li><a href="/tpj/cust/faqlist" class="py-2 d-block">FAQ</a></li>
						<li><a href="/tpj/cust/location" class="py-2 d-block">INFORMATION</a></li>
						<li><a href="/tpj/cust/subscribe" class="py-2 d-block">PREMIUM</a></li>
					</ul>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Hospital</h2>
					<div class = "hospital_info"></div>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Beauty Shop</h2>
					<div class = "shop_info"></div>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon fa fa-map"></span><span class="text">203
									Fake St. Mountain View, San Francisco, California, USA</span></li>
							<li><a href="#"><span class="icon fa fa-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span class="icon fa fa-paper-plane"></span><span
									class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>