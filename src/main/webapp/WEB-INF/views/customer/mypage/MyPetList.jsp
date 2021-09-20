<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 목록 페이지</title>
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
	top: 0px;
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
.link {
	display: block;
	padding: 2rem 0rem; 
}
</style>
</head>
<body>
<%@ include file = "../../main/header.jsp" %>
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${path}images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="main">Home<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
				<h1 class="mb-0 bread">MyPet</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">반려인/반려동물 관리</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<nav class="div_nav">
						<ul class="div_ul">
							<li class="div_li"><a href="/tpj/cust/MyInfoUser">내정보 관리</a></li>
							<li class="div_li" id = "mypages"><a class="link">MY PET</a>
								<div class = "hide">
					    			<a href="/tpj/cust/MyPet">펫 등록</a>
						    		<a href="/tpj/cust/MyPetList">펫 등록/수정</a>
								</div>
							</li>
							<li class="div_li"><a href="/tpj/cust/SitterProfile">시터 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사 프로필</a></li>
							<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
						</ul>
					</nav>
					
					<div class="row no-gutters">
						<div class="col-md-7" style="max-width: 100% !important; flex: 0 0 100% !important">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">MyPet 목록</h3>
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div class="row">
										<table class="col-md-12">
											<tr align="center">
												<!-- <th>No</th> -->
												<th>펫 사진</th>
												<th>펫 나이</th>
												<th>펫 이름</th>
												<th>특이사항</th>
												<th>수정/삭제</th>
											</tr>	
											<!-- 등록된게 있으면 -->
											<c:if test="${cnt > 0}">
												<c:forEach var="dto" items="${dtos}">
												<tr>
													<!-- 목록번호 -->
													<%-- <td align="center">${dto.PET_CD}</td> --%>
													<!-- 펫 사진 -->
													<td align="center"><img src="${dto.PET_IMG}" width="150px" height="150px"></td>
													<!-- 펫 나이 -->
													<td align="center">${dto.PET_AGE}</td>
													<!-- 펫 이름 -->
													<td align="center">${dto.PET_NM}</td>
													<!-- 특이사항 -->
													<td align="center">${dto.PET_CON}</td>
													<!-- 수정/삭제 -->
													<td align="center">
														<input class="btn btn-primary" type="button" id="update" value="수정" 
																onclick="window.location='MyPetUpdate?PET_CD=${dto.PET_CD}&pageNum=${pageNum}'">
														<input class="btn btn-primary" type="button" id="delete" value="삭제" 
																onclick="window.location='MyPetDelete?PET_CD=${dto.PET_CD}&pageNum=${pageNum}'">
													</td>
												</tr>
												</c:forEach>
											</c:if>
											
											<!-- 목록이 없으면 -->
											<c:if test="${cnt == 0 }">
												<tr>
													<td colspan="10" align="center">
														등록된 반려동물이 없습니다!
													</td>
												</tr>
											</c:if>
										</table>
										
										<!-- 페이지 컨트롤 -->
										<table class="col-md-12">
											<tr align="center">
												<th align="center">
													<!-- 게시글이 있으면 -->
													<c:if test="${cnt > 0 }">
														<!-- 처음블록 / 이전블록 -->
														<c:if test="${startPage > pageBlock }">
															<a href="MyPetList">[맨 앞]</a>
															<a href="MyPetList?pageNum=${startPage - pageBlock}">[이전]</a>
														</c:if>
										
														<!-- 블록페이지 -->
														<c:forEach var="i" begin="${startPage }" end="${endPage }">
															<c:if test="${i == currentPage }">
																<!-- 형재 해당되는 페이지 -->
																<span><b>[${i }]</b></span>
															</c:if>
															
															<c:if test="${i != currentPage }">
																<a href="MyPetList?pageNum=${i }">[${i }]</a>
															</c:if>
														</c:forEach>
														
														<!-- 다음블록 / 마지막블록 -->
														<c:if test="${pageCount > endPage}">
															<a href="MyPetList?pageNum=${startPage + pageBlock}">[다음]</a>
															<a href="MyPetList?pageNum=${pageCount}">[맨 끝]</a>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
										
									</div>
							</div>
						</div>
						
						<%-- <div class="col-md-5 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-5 img"
								style="background-image: url(${path}images/gallery-3.jpg);"></div>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file = "../../main/footer.jsp" %>
</body>
</html>