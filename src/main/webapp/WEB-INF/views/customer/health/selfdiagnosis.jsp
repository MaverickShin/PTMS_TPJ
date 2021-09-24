<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>자가진단 이력</title>
</head>
<body>

<!-- 파일명 변경 - 21.09.23 -->
	<%@ include file="../../main/header.jsp"%>
	<section class="ftco-section bg-light ftco-faqs">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 order-md-last">
					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
						style="background-image: url(/tpj/resources/img/NUTRIENT/NUTRIENT_INFO3.jpg);">
						<a href="https://vimeo.com/45830194"
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
						<p>영양 섭취는 반려묘의 당뇨병 예방 및 치료에 핵심적인 역할을 한다. 체중 증가는 인슐린 민감성을 완화하므로 반려묘가 적정 체중을 유지하도록 관리해야만 한다.</p>
					</div>
					<div id="accordion" class="myaccordion w-100"
						aria-multiselectable="true">
						<div class="card">
							<div class="card-header p-0" id="headingOne">
								<h2 class="mb-0">
									<button href="#collapseOne"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
										data-parent="#accordion" data-toggle="collapse"
										aria-expanded="true" aria-controls="collapseOne">
										<p class="mb-0">반려동물의 영양불균형, 알고 계신가요?</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse show" id="collapseOne" role="tabpanel"
								aria-labelledby="headingOne">
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
										aria-expanded="true" aria-controls="collapseTwo">
										<p class="mb-0">반려견 사료 선택 시 소비자 주의할 점은?</p>
										<i class="fa" aria-hidden="true"></i>
									</button>
								</h2>
							</div>
							<div class="collapse show" id="collapseTwo" role="tabpanel"
								aria-labelledby="headingTwo" style="">
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
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link collapsed"
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
										<li>습식:34% 이상의 수분을 포함한 습식은 흔히 볼 수 있는 반려견용 통조림을 생각하면 된다. </li>
										<li>먹이와 상관없이 치아 관리용 개껌을 주는 것도 좋다. 습식을 주로 급여한다면 구취 관리와 장난감으로도 좋은 치아 관리용 개껌이 더욱더 유용하다.</li>
									</ol>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header p-0" id="headingFour" role="tab">
								<h2 class="mb-0">
									<button href="#collapseFour"
										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link collapsed"
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
	<%@ include file="../../main/footer.jsp"%>

</body>
</html>
