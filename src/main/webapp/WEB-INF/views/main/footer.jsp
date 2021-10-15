<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  <script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
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
		$(".text").html(cnt);
	},
	error : function(request, status, error) {
		console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : "+ error);
	}
	});
});
</script>-->
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
					<h2 class="footer-heading">동물병원</h2>
					<%@ include file="../news/Convenience_Info.jsp" %>
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
			<!-- 				<div class="row mt-5">
          <div class="col-md-12 text-center">

            <p class="copyright">Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
          </div> 
        </div>-->
		</div>
	</footer>




	<!-- loader -->
	<!-- <div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div> -->

</body>
</html>