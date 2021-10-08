<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>구독 서비스</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

  </head>
  <body>
	<%@ include file = "../../main/header.jsp" %>
	
    <section class="hero-wrap hero-wrap-2" style="background-image: url('${path}images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>구독 서비스 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">구독 서비스</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>이용 가능 패키지</h2>
          </div>
        </div>
    		<div class="row" style = "flex-column:1">
    			<div class="col-md-4 ftco-animate" style ="max-width: 50% !important; flex:0 0 50% !important">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${path}images/pricing-2.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">프리미엄 서비스</span>
		            <span class="price"><sup>￦</sup> <span class="number">29900</span> <sub>/mos</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>캘린더 개방/ 일정 관리</li>
		              <li><span class="fa fa-check mr-2"></span>모바일 푸시 알림</li>
		              <li><span class="fa fa-check mr-2"></span>최초 구독시 시터 1회 무료 이용권</li>
		            </ul>
					<c:if test="${sessionScope.cust_id == null }">
					 <a href="/tpj/cust/login" class="btn btn-primary d-block px-2 py-3" onclick="alert('로그인 후 이용가능한 서비스 입니다.\n로그인  페이지로 이동합니다.');">Get Started</a>
		            </c:if>
					<c:if test="${sessionScope.cust_id != null }">
		            <a href="/tpj/pay/request?item_name=프리미엄 결제&price=29900&primarykey=null" class="btn btn-primary d-block px-2 py-3">Get Started</a>
		            </c:if>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate"  style ="max-width: 50% !important; flex:0 0 50% !important">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${path}images/pricing-3.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">비즈니스 서비스</span>
		            <span class="price"><sup>￦</sup> <span class="number">49900</span> <sub>/mos</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>캘린더 개방 / 일정관리</li>
		              <li><span class="fa fa-check mr-2"></span>모바일 푸시 알림</li>
		              <li><span class="fa fa-check mr-2"></span>매칭 지원 (시터, 훈련사 등록) </li>
		            </ul>
		            <c:if test="${sessionScope.cust_id == null }">
					 <a href="/tpj/cust/login" class="btn btn-primary d-block px-2 py-3" onclick="alert('로그인 후 이용가능한 서비스 입니다.\n로그인 페이지로 이동합니다.');">Get Started</a>
		            </c:if>
		            <c:if test="${sessionScope.cust_id != null }">
		            <a href="/tpj/pay/request?item_name=비지니스 결제&price=49900&primarykey=null" class="btn btn-primary d-block px-2 py-3">Get Started</a>
		            </c:if>
	            </div>
	          </div>
	        </div>
	      </div>
    	</div>
    </section>

	<%@ include file = "../../main/footer.jsp" %>

  </body>
</html>