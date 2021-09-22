<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp" %>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">훈련사 매칭 결과</h1>
          </div>
        </div>
      </div>
    </section>
	
	<div style="display: flex">
		<nav id="listdiv_id1" style="width: 400px; padding: 100px;">
			<ul>
				<li>-고객-</li>
				<li><a href="trainerSearch">훈련사 목록</a></li>
				<li><a href="">이용 후기</a></li>
				<li><a href="">훈련 종류</a></li>
				<li>-훈련사-</li>
				<li><a href="applyTrainer">훈련사지원</a></li>
				<li><a href="">활동 등록</a></li>
				<li><a href="">나에게 온 의뢰</a></li>
			</ul>
		</nav>
		
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row d-flex">
				<c:if test="${selectCnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<div class="col-md-4 d-flex ftco-animate">
				            <div class="blog-entry align-self-stretch">
				              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('${imgPath}${dto.TA_IMG}');">
				              </a>
				              <div class="text p-4">
				              	<div class="meta mb-2">
				                  <div><a href="#">April 07, 2020</a></div>
				                  <div><a href="#">${dto.CUST_ID}</a></div>
				                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a></div>
				                </div>
				                <h3 class="heading"><a href="#">${dto.TA_TITLE}</a></h3>
				              </div>
				            </div>
				        </div>
				    </c:forEach>
						<div class="col-md-4 d-flex ftco-animate">
				            <div class="blog-entry align-self-stretch">
				              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('images/image_2.jpg');">
				              </a>
				              <div class="text p-4">
				              	<div class="meta mb-2">
				                  <div><a href="#">April 07, 2020</a></div>
				                  <div><a href="#">Admin</a></div>
				                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
				                </div>
				                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
				              </div>
				            </div>
				        </div>
				        <div class="col-md-4 d-flex ftco-animate">
				           <div class="blog-entry align-self-stretch">
				              <a href="blog-single.html" class="block-20 rounded" style="background-image: url('images/image_3.jpg');">
				              </a>
				              <div class="text p-4">
				              	<div class="meta mb-2">
				                  <div><a href="#">April 07, 2020</a></div>
				                  <div><a href="#">Admin</a></div>
				                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
				                </div>
				                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
				              </div>
				           </div>
				        </div>
			    	
		    	</c:if>
	    	</div>
	    </div>	        
	</section>
	</div>
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>