<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#sitterMatching").each(function(){
		this.reset();
	});
});
</script>
</head>
<%@ include file="../../main/header.jsp"%>
<body>

	<div style="display: flex; flex:1; justify-content:center;">
		<%@ include file = "sidebar.jsp" %>
		
		<section style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;" class = "sections">
			<form action="sitterMatching" id="sitterMatching" method="post" name="sitterMatching" onsubmit="return sittingCheck();">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<div class="row no-gutters">
					<div class="contact-wrap w-100 p-md-5 p-4">
					
						<h2 class="mb-4" style = "padding-bottom:20px; border-bottom:1px solid #00bd56">펫시터 찾기</h2>
						
						<div class="row">

							<div class="col-md-4" style = "margin-bottom: 10px;">
								<div class="form-group">
									<label class="label" for="SV_AREA" style = "font-size: 20px !important;">어디에 사시나요?</label> 
									<input type="text" class="form-control" name="SV_AREA" id = "SV_AREA"
										placeholder="시 또는 구 입력">
								</div>
							</div>

							<div class="col-md-9" style = "margin-bottom: 10px;">
								<div class="form-group">
									<label class="label" for="SIT_TITLE" style = "font-size: 20px !important;">언제 맡기시나요?</label> <br>
									<input type="date" class="times" name="WK_START" id="WK_START"> 
									<span style = "font-size: 20px; font-weight:bold; color: black">&nbsp; ~ &nbsp;</span> 
									<input type="date" class="times" name="WK_END" id="WK_END">
								</div>
							</div>

							<div class="col-md-8" style = "margin-bottom: 10px;">
								<div class="form-group">
									<label class="label" for="trainerImg" style = "font-size: 20px !important;">몇시에 맡기시나요?</label> <br>
									<input type="time" class="times" name="START_TM">
								</div>
							</div>
							
							<div class="col-md-12" style = "margin-bottom: 30px; border-bottom: 1px solid #00bd56">
                                 <div class="form-group">
	                                 <div class="select-wrap" style = "margin-bottom: 30px;">
	                                 	<label class="label" style = "font-size: 20px !important;">원하는 서비스를 선택해 주세요</label>
	                                 </div>
                                           
                                     <div class="select-wrap">
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV1_NO"><span class = "list_label_span1">미용 서비스</span><input type="checkbox" value="1" name="SV1_NO" id = "SV1_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV2_NO"><span class = "list_label_span1">놀이 서비스</span><input type="checkbox" value="2" name="SV2_NO" id = "SV2_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV3_NO"><span class = "list_label_span1">산책 서비스</span><input type="checkbox" value="3" name="SV3_NO" id = "SV3_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
						 				 <p class = "chk_p1"><label class = "chk_label1" for = "SV4_NO"><span style = "margin-right: 79px;">응급처치 서비스 (필수)</span><input type="checkbox" value="4" name="SV4_NO" class="sel_chk1" id = "SV4_NO"checked onclick="return false;"><span class = "checkbox_icon"></span></label></p>
                                     </div>
                                     
                                    </div>
                              </div>

							<!-- 나의 반려동물  -->
							<div class="col-md-12" style = "margin-bottom:30px; border-bottom:1px solid #00bd56;">
								<div class="form-group">
									<h2>나의 반려동물</h2>
									<c:if test="${selectCnt > 0 }"> 
										<div style="display: grid; grid-template-columns: 1fr 1fr; border-bottom: 1px solid #eeeeee;">
											<c:forEach var="li" items="${list}" varStatus = "st" >
												<p class = "chk_p1">
													<label class = "chk_label1" for = "pet_li_${st.index}">
														<input type="checkbox" id = "pet_li_${st.index}" name="pet_cd" class = "sel_chk1 pets" value="${li.PET_CD}">
														<span class="checkbox_icon"></span>
														<span class = "list_label_span2" >${li.PET_NM}</span>
													</label>
												</p>
						        			</c:forEach>
					        			</div>
									</c:if>
		
									<c:if test="${selectCnt == 0}">
										<p>마이펫을 먼저 등록해 주세요</p>
									</c:if>
								</div>
							</div>

							<div class="col-md-12">
								<div class="form-group" align="center">
									<c:if test="${selectCnt == 0}">
										<input type="button" value="마이펫 등록하기" class="btn btn-primary" style = "font-size: 20px; width: 200px" onclick="window.location='/tpj/cust/MyInfoUser'">
									</c:if>
									<c:if test="${selectCnt != 0}">
										<input type="submit" value="찾기" class="btn btn-primary" style = "font-size: 20px; width: 150px" onclick = "sitterser();">
										<div class="submitting"></div>
									</c:if>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>

</body>

<%@ include file="../../main/footer.jsp"%>

</html>