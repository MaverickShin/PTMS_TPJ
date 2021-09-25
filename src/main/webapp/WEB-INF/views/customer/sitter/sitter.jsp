<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>

	<div style="display: flex">
		<nav id="listdiv_id1" style="width: 400px; padding: 100px;">
			<ul>
				<li>-고객-</li>
				<li><a href="#">펫시터 찾기</a></li>
				<li><a href="MysitterSerList">나의 펫시터 이용 내역</a></li>
				<li><a href="feeInfo">요금안내</a></li>
				<li>-펫시터-</li>
				<li><a href="applySitter">펫시터 지원</a></li>
				<li><a href="requestForSitter">나에게 온 의뢰</a></li>
			</ul>
		</nav>

		<section
			style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
			<form action="sitterMatching" method="post" name="sitterMatching">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<div class="row no-gutters">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<h3 class="mb-4">펫시터 찾기</h3>
						<div class="row">

							<div class="col-md-6">
								<label class="label" for="SIT_TITLE">어디에 사시나요?</label> <input
									type="text" class="iptags" name="SV_AREA"
									placeholder="시 또는 구 입력">
							</div>
							
							<!-- <div>
	      					<p class="label">언제 맡기시나요?</p>
						      <input type="datetime-local" class="iptags" name="START_DAY" > ~
						      <input type="datetime-local" class="iptags" name="END_DAY" >
						   </div> -->

							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="SIT_TITLE">언제 맡기시나요?</label> <br>
									<input type="date" class="iptags" name="WK_START"> ~ <input
										type="date" class="iptags" name="WK_END">
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="trainerImg">몇시에 맡기시나요?</label> <br>
									<input type="time" class="iptags" name="START_TM">
									<!--  <input type="time" class="iptags" name="END_TM" > -->
								</div>
							</div>
							
							<div class="col-md-12">
                                 <div class="form-group">
                                       <div class="form-field">
                                           <div class="select-wrap">
                                              	 <label class="label" for="tr_kind">원하는 서비스를 선택해 주세요</label>
                                                 <label><input type="checkbox" value="1" name="SV1_NO" class="form-group">미용 서비스</label>
                                                 <label><input type="checkbox" value="2" name="SV2_NO" class="form-group">놀이 서비스</label>
                                                 <label><input type="checkbox" value="3" name="SV3_NO" class="form-group">산책 서비스</label>
												 <label><input type="checkbox" value="4" name="SV4_NO" class="form-group" checked onclick="return false;">응급처치 서비스<필수 서비스></label>
                                            </div>
                                        </div>
                                    </div>
                              </div>

							<div class="col-md-12">
								<div class="form-group" align="center">
									<input type="submit" value="펫시터 찾기" class="btn btn-primary">
									<div class="submitting"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>

	<%@ include file="../../main/footer.jsp"%>
</body>
</html>