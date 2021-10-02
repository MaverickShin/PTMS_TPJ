<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>건강관리 - 건강정보 등</title>
<script type="text/javascript">
function showImage(){ 
	var imgNum=Math.round(Math.random()*3); 
	var td = $(".big td");
	td.hide();
	td[imgNum].style.display = 'block';
	setTimeout(showImage,3000); 
}
</script> 
<style>
.section01_img>a>img {
	width: 100%;
}

.section01_txt {
	align-self: center;
}

.section01_txt>h3 {
	text-align: center;
	padding-bottom: 40px;
}

<!--
-->
.section02_img>a>img {
	width: 100%;
}

.section02_txt {
	align-self: center;
}

.section02_txt>h3 {
	text-align: center;
	padding-bottom: 40px;
}

<!--
-->
.section03_img>a>img {
	width: 100%;
}

.section03_txt {
	align-self: center;
}

.section03_txt>h3 {
	text-align: center;
	padding-bottom: 40px;
}

.big {
	width: 250px;
	height: 250px;
	align: center;
	margin-top: 20px;
	margin: auto;
}

.big td {
	width: 250px;
	height: 250px;
	color: black !important;
}

.contents {
	text-align:center;
	height: 250px;
	border-collapse: collapse;
  	border-radius: 20px;
  	border-style: hidden;
  	box-shadow: 0 0 0 3px #2C3E50;
}

.contents:hover {
	background-color: #2C3E50;
	cursor: pointer;
}

.contents:hover a {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.contents img {
	width: 150px;
	height: 150px;
	display: block;
	margin-left: auto;
	margin-right:auto;
	padding-top : 20px;
}

.contents a {
	display: block;
	color: black;
	font-size: 18px;
	font-weight: bolder;
	margin-top: 30px;
	text-align:center;
	margin-bottom: 20px;
}
</style>

</head>
<body onload = "showImage();">
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2" style="background-image: url('${path}images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="contact">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">훈련사님의 의뢰사항을 알려드립니다.</h1>
          </div>
        </div>
      </div>
    </section>

	<section class="">
		<form action="" id="">
			<div class="container-fluid">
				<div>
					<table border="1" align="center">
						<tr>
							<td width="200px" align="center"><a href="/tpj/cust/contact">펫
									건강관리</a></td>
							<td width="200px" align="center"><a href="/tpj/cust/selfdiagnosis">자가진단 이력</a></td>

						</tr>
					</table>
				</div>

				<div class="container-fluid" style="display: inline;">

					<div style="display: flex; justify-content: center">
						<table style="margin: 10px; padding: 0;">
							<tr>
								<td rowspan="4"><img src="${imgPath}about-1.jpg"
									width="500px" vspace=30 hspace=50></td>
								<td><img src="${imgPath}image_4.jpg" width="500px"
									height="300px" vspace=30>
									<p
										style="width: 500px; height: 20px; word-break: break-all; text-align: center;">소변검사,
										외형검사 등 다양한 체험부터 행동교정 동영상, 맞춤식단 등 반려동물 헬스케어 및 질병예방을 효과적으로 할 수
										있는 반려동물 지식정보 콘텐츠를 정기적인 서비스를 받을 수 있다.</p></td>
							</tr>

						</table>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-sm-6 section01_img" style="text-align: center">
							
								<!-- SYMPTOM => symptom 소문자로 수정 - 21.09.23-->
							</div>
							
							<div class="col-sm-6 section01_txt">
								<h3>◀ 질병정보</h3>
								<p>국내 반려견들을 가장 많이 괴롭히는 질병은 피부병으로 나타났습니다. 그 중에서도 피부염과 습진이
									6.4%로 가장 높았습니다. 두 번째로 높은 질병도 같은 피부병의 일환인 외이염으로 나타났습니다. 세 번째로 많은
									질병은 설사였습니다. 전문가들은 이같은 조사결과가 나오는데에는 원인이 있다고 입을 모읍니다.</p>
							</div>
						</div>
					</div>


					<div class="container">
						<div class="row">
							<div class="col-sm-6 section02_txt">
								<h3>반려동물 관련 지식 ▶</h3>
								<p>반려동물 영양제 정보는 얻기 힘들 뿐만 아니라, 관련분야의 전문가 아니면 교육 및 상담을 받는 것도
									사실상 불가능한 현실이다. 펫통합관리시스템에서는 영양제 성분정보와 반려동물 건강정보를 결합해 예측 가능하고
									효율적으로 복용 관리할 수 있도록 최적화된 종합 펫케어 솔루션을 목표로 한다. 서비스는 10대부터 60대까지
									누구나 언제 어디서든 쉽게 관리할 수 있도록 성분정보를 확인할 수 있다.</p>
							</div>
							<div class="col-sm-6 section02_img" style="align-items: center">
								<table class=big>
									<tbody>
							
									<!-- 제목 불러오는 공간 추가 - 21.09.23 -->
									<c:forEach var = "i" items="${list}">
										<tr>
											<td>${i}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="container">
						<div class="row">
							<div class="col-sm-6 section03_img" style="text-align: center">
								<%@ include file="../../news/Nutrient_Info.jsp"%>
							</div>
							<div class="col-sm-6 section03_txt">
								<h3>◀ 영양정보</h3>
								<p>국내 펫케어 시장이 성숙해지면서 펫푸드 구매시에도 재료와 영양성분이 중요해졌다. 각종 원재료와 구성
									성분, 첨가물 여부 등을 꼼꼼하게 따져 만든 프리미엄 펫푸드가 펫팸족들의 선택을 받고 있으며, 단순한 사료나
									간식을 넘어 영양을 보충해주는 제품 등으로 종류와 목적이 점차 다양해지고 있다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>

	<%@ include file="../../main/footer.jsp"%>

</body>
</html>
