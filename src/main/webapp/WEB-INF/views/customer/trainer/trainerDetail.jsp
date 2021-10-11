<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='${cssPath}calendar.css' rel='stylesheet' />
<script src='${jsPath}calendar.js'></script>
<script>
	
function checkFee() {
	var tq_amt = document.querySelectorAll('input[name="TQ_AMT"]');
	var tq_fee = document.querySelector('input[name="TQ_FEE"]');
	for(var i = 0; i < tq_amt.length; i++) {
		if(tq_amt[i].checked) {
			if(tq_amt[i].value == ${dto.TS1_NO}) {
				tq_fee.value = ${dto.TS1_FEE};
			} else if(tq_amt[i].value == ${dto.TS2_NO}) {
				tq_fee.value = ${dto.TS2_FEE};
			} else if(tq_amt[i].value == ${dto.TS3_NO}) {
				tq_fee.value = ${dto.TS3_FEE};
			} else {
				tq_fee.value = ${dto.TS4_FEE};
			}
		}
	}
	
	if(!document.requestTrainerForm.START_DAY.value){
		alert("날짜를 선택해주세요!");
		document.requestTrainerForm.START_DAY.focus();
		return false;
	} else if(!document.requestTrainerForm.TQ_AMT.value){
		alert("원하시는 훈련을 선택해주세요!");
		return false;
	} 
	/* else if(document.getElementById("PET_NM").checked == 0){
		alert("최소 한마리 이상 선택");
		return false;
	} */
	var chk_pet = document.getElementsByName("PET_NM");
	var chk_leng = chk_pet.length;
	var checked = 0;
	for(i = 0; i < chk_leng; i++){
		if(chk_pet[i].checked == true){
			checked += 1;
		}
	}
	if(checked == 0){
		alert("훈련받을 마이펫을 선택하세요.");
		return false;
	}
}

/* function requestTrChk() {
	if(!document.requestTrainerForm.START_DAY.value) {
		alert("훈련받을 날짜를 선택하세요.");
		document.requestTrainerForm.START_DAY.focus();
		return false;
	} else if(!document.requestTrainerForm.TQ_AMT.value) {
		alert("훈련유형을 선택하세요.");
		return false;
	} else if(!$("#PET_NM").is(":checked")) {
		alert("훈련받을 마이펫을 선택하세요.");
		return false;
	}
} */


</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 20%;
    margin: 1% auto;
  }

</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp" %>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">훈련사 매칭 결과</h1>
          </div>
        </div>
      </div>
    </section>
    
<form action="requestTraining" method="post" name="requestTrainerForm" onsubmit="return checkFee();">
    <section class="ftco-section ftco-degree-bg"
    		style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; padding-top: 30px;">
    	<div class="container">
    		<div class="row">
    		
    		<div class="col-md-12"
				style="margin-bottom: 30px; border-bottom: 2px solid #00bd56;">
				<div class="form-group">
					
					<div class="list_div2" style= "border-bottom: 1px solid #eeeeee;">
						<h5 style="padding-bottom: 20px; color: #00bd56;">훈련받을 마이펫</h5>
						<div style="display: grid; grid-template-columns: 1fr 1fr;">
							<c:if test="${selectCnt == 0}">
								<script type="text/javascript">
								alert("훈련받을 펫이 존재하지 않습니다. 등록 후 이용가능합니다.");
								window.history.back();
								</script>
							</c:if>
							
							<c:if test="${selectCnt != 0}">
								<c:forEach var="dtos" items="${petInfo}" varStatus="pst">
									<p class="chk_p1">
										<label class="chk_label1" for="PET_NM_${pst.index}">
											<input type="checkbox" id="PET_NM_${pst.index}" 
											class="sel_chk1 " name="PET_NM" value="${dtos.PET_NM}">	
											<span class="checkbox_icon"></span>
											<span class="list_label_span2">${dtos.PET_NM}</span>
										</label>
									</p>
									
								</c:forEach>
							</c:if>
						</div>
					</div>
				
					<h5 style="padding-bottom: 20px; margin-top: 30px; color: #00bd56;">서비스 지역</h5>
					<div class="form-group" style= "border-bottom: 1px solid #eeeeee;">
		                <div class="form-group">
		                  <span class="fa fa-search"></span>
		                  <input type="date" class="iptags" name="START_DAY" value="${dto.START_DAY}">
		                </div>
		                <b>${TQ_LOC}</b>
	              	</div>
					
					<h5 style="padding-bottom: 20px; margin-top: 30px; color: #00bd56;">훈련유형 및 요금안내</h5>
					<div style="display: grid; grid-template-columns: 1fr 1fr;">
		                <c:if test="${dto.TS1_NO == 1}">
		                	<label><input type="radio" value="${dto.TS1_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">배변훈련</label><br>
		                	<input type="hidden" value="${dto.TS1_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 배변훈련 요금 : <fmt:formatNumber value="${dto.TS1_FEE}" pattern="###,###,###,###" />원</label><br>
		                </c:if>
				        <c:if test="${dto.TS2_NO == 2}">
				        	<label><input type="radio" value="${dto.TS2_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">분리불안</label><br>
				        	<input type="hidden" value="${dto.TS2_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 분리불안 요금 : <fmt:formatNumber value="${dto.TS2_FEE}" pattern="###,###,###,###" />원</label><br>
		                </c:if>
				        <c:if test="${dto.TS3_NO == 3}">
				        	<label><input type="radio" value="${dto.TS3_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">기본훈련</label><br>
				        	<input type="hidden" value="${dto.TS3_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 기본훈련 요금 : <fmt:formatNumber value="${dto.TS3_FEE}" pattern="###,###,###,###" />원</label><br>
		                </c:if>
				        <c:if test="${dto.TS4_NO == 4}">
				        	<label><input type="radio" value="${dto.TS4_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">짖음해결</label><br>
				        	<input type="hidden" value="${dto.TS4_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 짖음해결 요금 : <fmt:formatNumber value="${dto.TS4_FEE}" pattern="###,###,###,###" />원</label><br>
		                </c:if>
		            </div>
				</div>
    		</div>
    		
    		
    		
    		
    		
    		
    		
    		
    			<div class="col-lg-6 ftco-animate">
    				<p>
		              <img src="${dto.getTA_IMG()}" alt="" class="img-fluid">
		            </p>
		            <h2 class="mb-3">${dto.TA_TITLE}</h2>
		            <p>${dto.TA_APPEAL}</p>
    				
    			</div>
	            
	            <div class="col-lg-6 ftco-animate">
				
	              <input type="hidden" value="${TA_CD}" name="TA_CD">
	              <input type="hidden" value="${TQ_LOC}" name="TQ_LOC">
	              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	              <input type="hidden" value="" name="TQ_FEE">
	              <!-- 훈련사 일정 받아오기, 가능한 일정 선택하기 -->
	              
	              <div class="col-lg-6">
	              	
	              	
	              	<!-- 훈련유형 선택 및 요금안내 -->
	              	<!-- <div class="sidebar-box ftco-animate"> -->
		              
		           <!--  </div> -->
		           
		          
		            
		            <!-- <div class="col-md-12">
                        <div class="form-group" align="center"> -->
                        	<c:if test="${reviewCnt > 0}">
			   					<h3 class="mb-5" class="label">후기</h3>
			    				<c:forEach var="dto" items="${reviewInfo}" varStatus = "st">
				                    <div class="meta"><b style="font-size:20px;">${dto.CUST_ID}</b>
				                    	&nbsp;&nbsp;${dto.TG_DT}</div>
				                    <p>${dto.TG_CON}</p>
				              	</c:forEach>
							</c:if>
							<c:if test="${reviewCnt == 0}">
								<h4 class="mb-5" class="label">후기</h4>
			   					아직 등록된 후기가 없습니다.
			   				</c:if>
                       <!--  </div>
                     </div> -->
	              </div>
				
				</div>
				<div class="col-lg-12 sidebar pl-lg-5 ftco-animate"
					style="margin-top: 30px; border-top: 1px solid #00bd56; padding-top: 40px;">
					<div class="col-md-12">
						<div class="form-group" align=center>
							<input type="submit" value="훈련 신청하기" class="btn btn-primary"
								style="text-align: center; padding-left: 35px; font-size: 24px !important;">
							<div class="submitting"></div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </section>
</form>
          
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>