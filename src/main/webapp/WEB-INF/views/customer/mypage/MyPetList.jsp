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
	color:#00bd56;
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
				<%@ include file="MyInfobar.jsp"%>
					<div class="row no-gutters">
						<div class="col-md-7" style="max-width: 100% !important; flex: 0 0 100% !important">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">MyPet 목록</h3>
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
											
											<c:if test = "${cnt == 0}">
												<tr>
													<td colspan = "5">아직 등록된 펫이 없습니다!</td>
												</tr>
											</c:if>
											
											<!-- 등록된게 있으면 -->
											<c:if test="${cnt > 0}">
												<c:forEach var="dto" items="${vo}">
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
									</table>
								</div>
								
								<c:if test = "${cnt > 0}">
									<div class = "row">
										<div class="col-md-12" align="center">
											<div class="block-27">
								              <ul>
								                <li><a href="${s}">&lt;&lt;</a>
								                <li><a href="${s}?pageNum=${startPage - pageBlock}">&lt;</a></li>
								                
								                <c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:if test="${i == currentPage}">
														<li class="active"><span><a href="${s}?pageNum=${i}">${i}</a></span></li>
													</c:if>
					
													<c:if test="${i != currentPage}">
														<li><span><a href="${s}?pageNum=${i}">${i}</a></span></li>
													</c:if>
													
												</c:forEach> 
								                
							                	<li><a href="${s}?pageNum=${startPage + pageBlock}">&gt;</a></li>
							                	<li><a href="${s}?pageNum=${pageCount}">&gt;&gt;</a></li>
								              </ul>
											</div>
										</div>
									</div>
								</c:if>
								
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