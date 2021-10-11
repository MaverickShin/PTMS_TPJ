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
	border: box shadow;
	box-shadow: 3px 3px 5px 5px #e0e0e0;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#detail_submit").click(function() {
			$("#detail_form").submit();
		});

	});
</script>

</head>
<%@ include file="../../main/header.jsp"%>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${imgPath}bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="#">Sitter<i
							class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
				<h1 class="mb-0 bread">펫시터 매칭 결과</h1>
			</div>
		</div>
	</div>
</section>

<div style="display: flex; flex: 1; justify-content: center;">

	<%@ include file="sidebar.jsp"%>

	<div class="container" style="margin-top: 50px;">
		<div class="row"
			style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 15px;">
			<c:if test="${cnt > 0}">
				<c:forEach var="dto" items="${dtos}" varStatus="i">
					<form action="sitterDetail" method="post" id="detail_form">
						<div class="col-md-12" id="detail_submit">
							<input type="hidden" name="SIT_ID" value="${dto.SIT_ID}">
							<input type="hidden" name="SV_AREA" value="${SV_AREA}"> <input
								type="hidden" name="total" value="${total}"> <input
								type="hidden" name="WK_END" value="${WK_END}"> <input
								type="hidden" name="WK_START" value="${WK_START}">
							<c:forEach var="pn" items="${PET_NM}">
								<input type="hidden" name="PET_NM" value="${pn}">
							</c:forEach>
							<c:forEach var="i" items="${pet}">
								<input type="hidden" name="pet" value="${i}">
							</c:forEach>
							<c:forEach var="j" items="${sv_no}">
								<input type="hidden" name="sv_no" value="${j}">
							</c:forEach>
							<div class="blog-entry align-self-stretch"
								style="border: 1px solid #eeeeee;">
								<a class="block-20 rounded"
									style="background-image: url(${dto.getSIT_IMG()});"> </a>
								<div class="text p-4">
									<div class="meta mb-2">
										<div>
											<a href="#">활동 시작일 : ${dto.SIT_DT}</a><br>
										</div>
										<div>
											<a href="#">이름 : ${dto.CUST_NM}</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a>
										</div>
									</div>
									<h3 class="heading">${dto.SIT_TITLE}</h3>

									<div class="form-group" align=center>
										<input type="submit" value="자세히 보기" class="btn btn-primary"
											style="text-align: center; width: 150px; font-size: 14px !important;">
									</div>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>

				
			</c:if>
		</div>
		
		<div>
			<c:if test="${cnt == 0}">
				<div style="text-align:center; font-size:30px; font-weight:900; padding-top:50px">매칭결과가 없습니다. 조건을 다시 입력해 주세요.</div>
				<div class="form-group" align="center">
				<input type="button" class="btn btn-primary" style = "font-size: 15px; width: 200px; margin-top:50px" value="조건 다시 검색하기" onclick="window.history.back();">
				<div class="submitting"></div>
				</div>
			</c:if>
		</div>

		<div class="row">
			<div class="col-md-12" align="center">
				<div class="block-27">
					<ul>
						<li><a href="sitterMatching">&lt;&lt;</a>
						<li><a
							href="sitterMatching?pageNum=${startPage - pageBlock}">&lt;</a></li>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li class="active"><span><a
										href="sitterMatching?pageNum=${i}">${i}</a></span></li>
							</c:if>

							<c:if test="${i != currentPage}">
								<li><span><a href="sitterMatching?pageNum=${i}">${i}</a></span></li>
							</c:if>

						</c:forEach>

						<li><a
							href="sitterMatching?pageNum=${startPage + pageBlock}">&gt;</a></li>
						<li><a href="sitterMatching?pageNum=${pageCount}">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../main/footer.jsp"%>
</body>
</html>