<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Pet Sitting - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
</head>

<script type="text/javascript">
function showImage(){ 
	var imgNum=Math.round(Math.random()*3); 
	var objImg= $(".vJOb1e"); 
	var td = $(".big td");
	var tds = $(".bigs td");
	objImg.hide();
	td.hide();
	tds.hide();
	objImg[imgNum].style.display = 'block';
	td[imgNum].style.display = 'block';
	tds[imgNum].style.display = 'block';
	setTimeout(showImage,3000); 
}

</script>
<style>
	.GI74Re  {
		display:none;
	}
	.news {
		width: 100%;
		background-color: #2C3E50;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	
	.vJOb1e {
		display: none;
	}
	
	.CEMjEf {
		margin-bottom: 20px;
	}
	
	.big {
		width : 500px;
		margin-left:auto;
		margin-right:auto;
		margin-bottom: 30px;
		color: white;
		border: 1px solid white;
		font-family: 'Do Hyeon', sans-serif;
		border-collapse: collapse;
		border-left:none;
		border-right:none;
	}
	
	.big th {
		font-size: 20px;
		font-weight: bold;
		border-left:none;
		border-right:none;
		border-top: 1px solid white;
	}
	
	.big td {
		height: 100px;
		display: none;
		color: white;
		border-left: none;
		border-right: none;
	}
	
	.bigs {
		width : 500px;
		margin-left:auto;
		margin-right:auto;
		margin-bottom: 30px;
		color: white;
		border: 1px solid white;
		font-family: 'Do Hyeon', sans-serif;
		border-collapse: collapse;
		border-left: none;
		border-right:none;
	}
	
	.bigs th {
		font-size: 20px;
		font-weight: bold;
		border-left:none;
		border-right:none;
		border-top: 1px solid white;
	}
	
	.bigs td {
		height: 100px;
		display: none;
		color: white;
		border-left: none;
		border-right: none;
		text-align: center;
	}
	
	.bigs td a {
		display: block;
		font-size: 30px;
		color: white;
		margin-top: 30px;
	}	
	
	.basicList_link__1MaTN {
		font-size : 20px !important;
	}

	.FAkayc  {
		display: none;
	}
	
	.iRPxbe {
		color: white;
		padding: 20px;
	}
	
	.GI74Re:hover {
		color: green;
		font-weight: bold;
		margin-top: 10px;
	}
	
	.lO8SBd {
		display: none;	
	}
	
	.mCBkyc:hover {
		color: green;
		font-weight: bold;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.ZE0LJd {
		margin-top: 10px;
	}
	
	.S1FAPd {
		display: none;
	}
	
	.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before, .scrollax-performance *:after {
		pointer-events: none !important;
		-webkit-animation-play-state: paused !important;
		animation-play-state: paused !important;
	}

.vJOb1e {
	display: none;
}

.CEMjEf {
	margin-bottom: 20px;
}

.big {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	color: white;
	border: 1px solid white;
	font-family: 'Do Hyeon', sans-serif;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
}

.big th {
	font-size: 20px;
	font-weight: bold;
	border-left: none;
	border-right: none;
	border-top: 1px solid white;
}

.big td {
	height: 100px;
	display: none;
	color: white;
	border-left: none;
	border-right: none;
}

.bigs {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	color: white;
	border: 1px solid white;
	font-family: 'Do Hyeon', sans-serif;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
}

.bigs th {
	font-size: 20px;
	font-weight: bold;
	border-left: none;
	border-right: none;
	border-top: 1px solid white;
}

.bigs td {
	height: 100px;
	display: none;
	color: white;
	border-left: none;
	border-right: none;
	text-align: center;
}

.bigs td a {
	display: block;
	font-size: 30px;
	color: white;
	margin-top: 30px;
}

.FAkayc {
	display: none;
}

.iRPxbe {
	color: white;
	padding: 20px;
}

.GI74Re:hover {
	color: green;
	font-weight: bold;
	margin-top: 10px;
}

.lO8SBd {
	display: none;
}

.mCBkyc:hover {
	color: green;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
}

.ZE0LJd {
	margin-top: 10px;
}

.S1FAPd {
	display: none;
}
</style>
<body onload="showImage();">
	<%@ include file="header.jsp"%>

	<script
		src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

	<df-messenger intent="WELCOME" chat-title="PTMS"
		agent-id="0b66c0d5-09a4-4a16-aeb7-b92963e6f8ca" language-code="ko">
	</df-messenger>
	<div style="width: 100%; background-color: #2C3E50; height: 250px;">
		<section class="news"
			style="display: flex; width: 1200px; margin-left: auto; margin-right: auto;">
			<%@ include file="../news/newsletter.jsp"%>
			<%@ include file="../news/petIssue.jsp"%>
		</section>
	</div>
<<<<<<< HEAD
    <!-- END nav -->
    <div  style= "background-image: url('${path}images/bg_1.jpg'); width:100%; height: 100%;">
      
    </div>

    <section class="ftco-section bg-light ftco-no-pt ftco-intro">
    	<div class="container">
    		<div class="row">
          <div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate" >
            <div class="d-block services active text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<span class="flaticon-blind"></span>
              </div>
              <div class="media-body p-3">
                <h3 class="heading">펫 훈련사</h3>
                <p><br><br><br>배변? 분리불안? 반려동물의 행동이 걱정되시나요?<br>PTMS의 훈련사를 만나 반려동물과의 시간을 더 유익하게 만들어가세요!</p>
                <c:if test="${sessionScope.cust_id == null}">
                	<a class="btn-custom d-flex align-items-center justify-content-center" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location='/tpj/cust/login';"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                </c:if>
                <c:if test="${sessionScope.cust_id != null}">
                	<a href="/tpj/trainer/trainerSearch" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
              	</c:if>
              </div>
            </div>      
          </div>
          <div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<span class="flaticon-dog-eating"></span>
              </div>
              <div class="media-body p-3">
                <h3 class="heading">펫 시터</h3>
                <p><br><br><br>출장, 여행으로 집에 혼자있는 반려동물이 걱정되시나요?<br>이젠 PTMS의 시터에게 맡기세요!</p>
                <c:if test="${sessionScope.cust_id == null}">
                	<a class="btn-custom d-flex align-items-center justify-content-center" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location='/tpj/cust/login';"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
                </c:if>
                <c:if test="${sessionScope.cust_id != null}">
                	<a href="/tpj/sitter/sitter" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
              	</c:if>
              </div>
            </div>  
            </div>  
        </div>
    	</div>
    </section>

    <section class="ftco-section testimony-section" style="background-image: url('${imgPath}main.PNG');">
    	<div class="overlay"></div>
<%--       <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>Latest register SITTER&TRAINER </h2>
          </div>현정언니 내일 생일이랭
          
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${imgPath}person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${imgPath}person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${imgPath}person_3.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${imgPath}person_1.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(${imgPath}person_2.jpg)"></div>
                    	<div class="pl-3">
		                    <p class="name">Roger Scott</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> --%>
    </section>

    <section class="ftco-section bg-light ftco-faqs">
=======
	<!-- END nav -->
	<div
		style="background-image: url('${path}images/bg_1.jpg'); width:100%; height: 100%;">

	</div>

	<section class="ftco-section bg-light ftco-no-pt ftco-intro">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services active text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-blind"></span>
						</div>
						<div class="media-body p-3">
							<h3 class="heading">펫 훈련사</h3>
							<p>
								<br>
								<br>
								<br>배변? 분리불안? 반려동물의 행동이 걱정되시나요?<br>PTMS의 훈련사를 만나
								반려동물과의 시간을 더 유익하게 만들어가세요!
							</p>
							<c:if test="${sessionScope.cust_id == null}">
								<a
									class="btn-custom d-flex align-items-center justify-content-center"
									onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location='/tpj/cust/login';"><span
									class="fa fa-chevron-right"></span><i class="sr-only">Read
										more</i></a>
							</c:if>
							<c:if test="${sessionScope.cust_id != null}">
								<a href="/tpj/trainer/trainerSearch"
									class="btn-custom d-flex align-items-center justify-content-center"><span
									class="fa fa-chevron-right"></span><i class="sr-only">Read
										more</i></a>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-dog-eating"></span>
						</div>
						<div class="media-body p-3">
							<h3 class="heading">펫 시터</h3>
							<p>
								<br>
								<br>
								<br>출장, 여행으로 집에 혼자있는 반려동물이 걱정되시나요?<br>이젠 PTMS의 시터에게
								맡기세요!
							</p>
							<c:if test="${sessionScope.cust_id == null}">
								<a
									class="btn-custom d-flex align-items-center justify-content-center"
									onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location='/tpj/cust/login';"><span
									class="fa fa-chevron-right"></span><i class="sr-only">Read
										more</i></a>
							</c:if>
							<c:if test="${sessionScope.cust_id != null}">
								<a href="/tpj/sitter/sitter"
									class="btn-custom d-flex align-items-center justify-content-center"><span
									class="fa fa-chevron-right"></span><i class="sr-only">Read
										more</i></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section"
		style="background-image: url('${imgPath}bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2>Latest register SITTER&TRAINER</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(${imgPath}person_1.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(${imgPath}person_2.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(${imgPath}person_3.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(${imgPath}person_1.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(${imgPath}person_2.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
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

	<section class="ftco-section bg-light ftco-faqs">
>>>>>>> bb38d6165a7984e8691f17f4381c3321c0ae1285
		<div class="container">
			<div class="row">
				<div class="col-lg-6 order-md-last">

					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
						style="background-image: url(/tpj/resources/img/NUTRIENT/반려동물.jpeg);">

						<a href="https://www.youtube.com/watch?v=RHP5OXLsfSQ"
							class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
							<span class="fa fa-play"></span>
						</a>
					</div>
					<div class="d-flex mt-3">
						<div class="img img-2 mr-md-2"
							style="background-image: url(/tpj/resources/img/NUTRIENT/NUTRIENT_INFO2.jpg);"></div>
						<div class="img img-2 ml-md-2"
							style="background-image: url(/tpj/resources/img/NUTRIENT/NUTRIENT_INFO1.jpg);"></div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="heading-section mb-5 mt-5 mt-lg-0">
						<h2 class="mb-3">반려묘의 당뇨병 예방 식단은 어떻게 짜야 할까?</h2>
						<p>영양 섭취는 반려묘의 당뇨병 예방 및 치료에 핵심적인 역할을 한다. 체중 증가는 인슐린 민감성을 완화하므로
							반려묘가 적정 체중을 유지하도록 관리해야만 한다.</p>
					</div>
					<div id="accordion" class="myaccordion w-100"
						aria-multiselectable="true">
						<div class="card">
							<div class="card-header p-0" id="headingOne">
								<h2 class="mb-0">
									<button href="#collapseOne"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
										data-parent="#accordion" data-toggle="collapse"
										aria-expanded="false" aria-controls="collapseOne">
										<p class="mb-0">반려동물의 영양불균형, 알고 계신가요?</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse" id="collapseOne" role="tabpanel"
								aria-labelledby="headingOne" style>
								<div class="card-body py-3 px-0">
									<ol>
										<li>영양 불균형이 오래가면, 잦은 설사나 비만, 거친 모질과 눈물자국이 심하게 질 수 있어요.</li>
										<li>영양이 필요한 노령견, 임신견에게도 영양 불균형은 흔히 나타납니다.</li>
										<li>면역력이 부족한 반려동물은 다양한 질환에 걸리기 쉽기 때문에 꾸준한 관리가 필요합니다.</li>
										<li>유아기, 임신기, 회복기 등 시기에 따라, 상황에 따라 필요한 영양소를 적절하게 공급해 줄
											필요가 있어요.</li>
										<li>올바른 영양 공급이 이루어 진다면 가족과 오랜 기간을 함께 지낼 수 있어요</li>
									</ol>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header p-0" id="headingTwo" role="tab">
								<h2 class="mb-0">
									<button href="#collapseTwo"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
										data-parent="#accordion" data-toggle="collapse"
										aria-expanded="false" aria-controls="collapseTwo">
										<p class="mb-0">반려견 사료 선택 시 소비자 주의할 점은?</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse" id="collapseTwo" role="tabpanel"
								aria-labelledby="headingTwo">
								<div class="card-body py-3 px-0">
									<ol>
										<li>최근 반려견 사료는 수입제품 외 국내제품도 다양하게 출시돼 소비자 선택 폭이 넓어지고 있다</li>
										<li>소비자가 사료를 선택할 때 고려할 수 있도록 칼로리 표시가 필요</li>
										<li>피부유지, 체중감량 등 반려견 특성에 따른 사료를 선택해야한다</li>
										<li>장건강, 피부건강, 면역시스템 강화, 비타민 A, C, E, 성장발육</li>
										<li>프리미엄, 홀리스틱, 유기농 등 여러 문구가 있으나 사료 제조업체에서 사용하는 것으로 국내에서는
											사료에 대한 명확한 등급 기준이 없기 때문에 소비자가 업체의 등급광고보다는 원재료 성분표시를 확인하는 것이
											필요</li>
									</ol>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header p-0" id="headingThree" role="tab">
								<h2 class="mb-0">
									<button href="#collapseThree"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
										data-parent="#accordion" data-toggle="collapse"
										aria-expanded="false" aria-controls="collapseThree">
										<p class="mb-0">반려견 먹이의 수분 함량은 어떤 의미가 있을까?</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse" id="collapseThree" role="tabpanel"
								aria-labelledby="headingTwo">
								<div class="card-body py-3 px-0">
									<ol>
										<li>건식:수분 함량이 14% 이하인 건식이나 사료는 장기간 보관이 편리하다.</li>
										<li>주로 건식을 먹이면 치석이 잘 끼지 않아서 치아 관리에 도움이 된다.</li>
										<li>반건조식:수분 함량이 14%~34%인 반건조식은 흔히 보기 힘들지만 반려견 건강 관리에 좋다.</li>
										<li>습식:34% 이상의 수분을 포함한 습식은 흔히 볼 수 있는 반려견용 통조림을 생각하면 된다.</li>
										<li>먹이와 상관없이 치아 관리용 개껌을 주는 것도 좋다. 습식을 주로 급여한다면 구취 관리와
											장난감으로도 좋은 치아 관리용 개껌이 더욱더 유용하다.</li>
									</ol>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header p-0" id="headingFour" role="tab">
								<h2 class="mb-0">
									<button href="#collapseFour"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
										data-parent="#accordion" data-toggle="collapse"
										aria-expanded="false" aria-controls="collapseFour">
										<p class="mb-0">반려동물 영양 직접 설계하는 '펫푸드' 자격증 취득 정보</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse" id="collapseFour" role="tabpanel"
								aria-labelledby="headingTwo">
								<div class="card-body py-3 px-0">
									<p style="word-break: break-all;">독일, 일본 등을 기점으로 국내에서도 펫푸드
										산업은 크게 성장하고 있다. 농립축산식품부를 비롯해 창업지원이 이뤄지는 등 펫푸드에 대한 인식도 크게 향상된
										만큼 펫푸드 자격증에 대한 수요도 높아질 것이라는 기대를 모으고 있다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	<section class="ftco-counter" id="section-counter">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="50">0</strong>
						</div>
						<div class="text">
							<span>Customer</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="8500">0</strong>
						</div>
						<div class="text">
							<span>Professionals</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="20">0</strong>
						</div>
						<div class="text">
							<span>Products</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="50">0</strong>
						</div>
						<div class="text">
							<span>Pets Hosted</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2>Affordable Packages</h2>
				</div>
			</div>
			<%--     		<div class="row">
    			<div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${imgPath}pricing-1.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Personal</span>
	            	<span class="price"><sup>$</sup> <span class="number">49</span> <sub>/mos</sub></span>
	            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
		              <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
		              <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
		              <li><span class="fa fa-check mr-2"></span>Free Supports</li>
		            </ul>

    		        <c:if test="${sessionScope.cust_id == null}">
		            	<a class="btn btn-primary d-block px-2 py-3" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">Get Started</a>
		            </c:if>
		            <c:if test="${sessionScope.cust_id != null}">
		            	<a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
		            </c:if>
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${imgPath}pricing-2.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Business</span>
		            <span class="price"><sup>$</sup> <span class="number">79</span> <sub>/mos</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
		              <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
		              <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
		              <li><span class="fa fa-check mr-2"></span>Free Supports</li>
		            </ul>

    		        <c:if test="${sessionScope.cust_id == null}">
		            	<a class="btn btn-primary d-block px-2 py-3" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">Get Started</a>
		            </c:if>
		            <c:if test="${sessionScope.cust_id != null}">
		            	<a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
		            </c:if>
		            
	            </div>
	          </div>
	        </div>
	        <div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${imgPath}pricing-3.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">Ultimate</span>
		            <span class="price"><sup>$</sup> <span class="number">109</span> <sub>/mos</sub></span>
		            
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>5 Dog Walk</li>
		              <li><span class="fa fa-check mr-2"></span>3 Vet Visit</li>
		              <li><span class="fa fa-check mr-2"></span>3 Pet Spa</li>
		              <li><span class="fa fa-check mr-2"></span>Free Supports</li>
		            </ul>

		            <c:if test="${sessionScope.cust_id == null}">
		            	<a class="btn btn-primary d-block px-2 py-3" onclick="if(confirm('로그인 후 이용가능합니다. 로그인 하시겠습니까?')) window.location = '/tpj/cust/login';">Get Started</a>
		            </c:if>
		            <c:if test="${sessionScope.cust_id != null}">
		            	<a href="#" class="btn btn-primary d-block px-2 py-3">Get Started</a>
		            </c:if>
	            </div>
	          </div>
	        </div>
	      </div> --%>
<<<<<<< HEAD
    		<div class="row" style = "flex-column:1">
    			<div class="col-md-4 ftco-animate" style ="max-width: 50% !important; flex:0 0 50% !important">
	          <div class="block-7">
	          	<div class="img" style="background-image: url(${path}images/pricing-2.jpg);"></div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block">프리미엄 서비스</span>
		            <span class="price"><sup>￦</sup> <span class="number">29,900</span> <sub>/mos</sub></span>
		            
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
		            <span class="price"><sup>￦</sup> <span class="number">49,900</span> <sub>/mos</sub></span>
		            
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
    
<%@ include file = "footer.jsp" %>
    
  </body>
=======
			<div class="row" style="flex-column: 1">
				<div class="col-md-4 ftco-animate"
					style="max-width: 50% !important; flex: 0 0 50% !important">
					<div class="block-7">
						<div class="img"
							style="background-image: url(${path}images/pricing-2.jpg);"></div>
						<div class="text-center p-4">
							<span class="excerpt d-block">프리미엄 서비스</span> <span class="price"><sup>￦</sup>
								<span class="number">29900</span> <sub>/mos</sub></span>

							<ul class="pricing-text mb-5">
								<li><span class="fa fa-check mr-2"></span>캘린더 개방/ 일정 관리</li>
								<li><span class="fa fa-check mr-2"></span>모바일 푸시 알림</li>
								<li><span class="fa fa-check mr-2"></span>최초 구독시 시터 1회 무료
									이용권</li>
							</ul>

							<c:if test="${sessionScope.cust_id == null }">
								<a href="/tpj/cust/login"
									class="btn btn-primary d-block px-2 py-3"
									onclick="alert('로그인 후 이용가능한 서비스 입니다.\n로그인  페이지로 이동합니다.');">Get
									Started</a>
							</c:if>
							<c:if test="${sessionScope.cust_id != null }">
								<a
									href="/tpj/pay/request?item_name=프리미엄 결제&price=29900&primarykey=null"
									class="btn btn-primary d-block px-2 py-3">Get Started</a>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate"
					style="max-width: 50% !important; flex: 0 0 50% !important">
					<div class="block-7">
						<div class="img"
							style="background-image: url(${path}images/pricing-3.jpg);"></div>
						<div class="text-center p-4">
							<span class="excerpt d-block">비즈니스 서비스</span> <span class="price"><sup>￦</sup>
								<span class="number">49900</span> <sub>/mos</sub></span>

							<ul class="pricing-text mb-5">
								<li><span class="fa fa-check mr-2"></span>캘린더 개방 / 일정관리</li>
								<li><span class="fa fa-check mr-2"></span>모바일 푸시 알림</li>
								<li><span class="fa fa-check mr-2"></span>매칭 지원 (시터, 훈련사
									등록)</li>
							</ul>
							<c:if test="${sessionScope.cust_id == null }">
								<a href="/tpj/cust/login"
									class="btn btn-primary d-block px-2 py-3"
									onclick="alert('로그인 후 이용가능한 서비스 입니다.\n로그인 페이지로 이동합니다.');">Get
									Started</a>
							</c:if>
							<c:if test="${sessionScope.cust_id != null }">
								<a
									href="/tpj/pay/request?item_name=비지니스 결제&price=49900&primarykey=null"
									class="btn btn-primary d-block px-2 py-3">Get Started</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>

</body>
>>>>>>> bb38d6165a7984e8691f17f4381c3321c0ae1285
</html>