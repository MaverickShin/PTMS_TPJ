<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.blog-entry:hover {
	width: 110%;
	height: 95%;
	border:box shadow;
	box-shadow: 3px 3px 5px 5px #e0e0e0;
}
</style>

</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Trainer<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">펫시터 매칭 결과</h1>
				</div>
			</div>
		</div>
	</section>

		<div style="display: flex; flex:1; justify-content:center;">
		
			<%@ include file = "sidebar.jsp" %>

			<div class="container" style="margin-top: 50px;">
				<div class="row"
					style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 15px;">
					<c:if test="${selectCnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<div class="col-md-12"
								onclick="window.location ='sitterDetail?SIT_ID=${dto.SIT_ID}&SV_AREA=${SV_AREA}'">
								<div class="blog-entry align-self-stretch" style = "border:1px solid #eeeeee;">
									<a class="block-20 rounded"
										style="background-image: url('${imgPath}daon.jpg');"> </a>
									<div class="text p-4">
										<div class="meta mb-2">
											<div>
												<a href="#">April 07, 2020</a>
											</div>
											<div>
												<a href="#">${dto.CUST_NM}</a>
											</div>
											<div>
												<a href="#" class="meta-chat"><span
													class="fa fa-comment"></span>3</a>
											</div>
											<!-- 이곳에 좋아요 갯수 또는 평점을 넣으면 좋지 않을까? -->
										</div>
										<h3 class="heading">
											<a href="sitterDetail?SIT_ID=${dto.SIT_ID}&SV_AREA=${SV_AREA}">${dto.SIT_TITLE}</a>
										</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${selectCnt == 0}">
						<div>
							매칭결과가 없습니다. 다시 조건을 입력해 주세요.
						</div>
					</c:if>
				</div>
		</div>
	</div>

	<%@ include file="../../main/footer.jsp"%>
	시터매칭
</body>
</html>