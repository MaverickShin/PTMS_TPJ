<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
<style type="text/css">
#mypages {
	position: relative;
	cursor: pointer;
	color: #00bd56;
}

#mypages:hover .hide {
	display: block;
}

.link {
	display: block;
	padding: 2rem 0rem;
}

.list_tab {
	display: flex;
	align-items: center;
	place-content: center;
}

.list_tab p {
	display: block;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	cursor: pointer;
	width: 200px;
	height: 60px;
	line-height: 60px;
	background-color: #f5f5f5;
	border: 1px solid #eeeeee;
}

.result_div {
	background-color: #DDDADA;
}

.pageMoves {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${path}images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="main">Home<i
								class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-0 bread">결제내역</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="result"
			style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<%@ include file="MyInfobar.jsp"%>
							<div class="row no-gutters">
								<div class="col-md-7"
									style="max-width: 100% !important; flex: 0 0 100% !important">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<div class="result_div"
											style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
											<div class="container">
												<c:if test="${cnt == 0}">
													<div class="row" id="divs"
														style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
														<div class="col-md-12">
															<h3></h3>
															<p>결제 내역이 없습니다.</p>
														</div>
													</div>
												</c:if>

												<c:if test="${cnt > 0}">
													<div class="row" id="divs"
														style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px; font-family: 'Do Hyeon', sans-serif;">
														<c:forEach var="li" items="${list}">
															<div class="col-md-12" style="background-color: #FFFFFF; border:solid 1px; box-shadow: 3px 3px 3px 3px #F3E0E0;
																 border-radius: 20px; text-align: center; padding: 20px 10px; margin: 10px">
																<h5 style="color:#DBB9B8;">결제코드 : ${li.BY_CD}</h5>
																<p style="color:#DBB9B8;">이용 서비스 : ${li.PAY_KIND}</p>
																<p style="color:#DBB9B8;">결제금액 : 
																	<fmt:formatNumber value="${li.BY_SUM}"
																	pattern="###,###,###,###" />원
																</p>
																<p style="color:#DBB9B8;">수수료 : 
																	<fmt:formatNumber value="${li.BY_FEES }"
																	pattern="###,###,###,###" />원
																</p>
																<p style="color:#DBB9B8;">결제일 : ${li.BY_DT}</p>
															</div>
														</c:forEach>
													</div>
												</c:if>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12" align="center">
												<div class="block-27">
													<ul>
														<li><a href="buyList">&lt;&lt;</a>
														<li><a href="buyList?pageNum=${startPage - pageBlock}">&lt;</a></li>
														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:if test="${i == currentPage}">
																<li class="active">
																	<span><a href="buyList?pageNum=${i}">${i}</a></span>
																</li>
															</c:if>

															<c:if test="${i != currentPage}">
																<li>
																	<span><a href="buyList?pageNum=${i}">${i}</a></span>
																</li>
															</c:if>

														</c:forEach>

														<li><a href="buyList?pageNum=${startPage + pageBlock}">&gt;</a></li>
														<li><a href="buyList?pageNum=${pageCount}">&gt;&gt;</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../../main/footer.jsp"%>
</body>

</html>