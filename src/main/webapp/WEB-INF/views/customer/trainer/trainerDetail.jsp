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
	}
	
	function requestTrChk() {
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
	}

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
    
    <section class="ftco-section ftco-degree-bg">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 ftco-animate">
    				<p>
		              <img src="${imgPath}image_1.jpg" alt="" class="img-fluid">
		            </p>
		            <h2 class="mb-3">${dto.TA_TITLE}</h2>
		            <p>${dto.TA_APPEAL}</p>
		            <!-- <p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!</p>
		            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
		            <p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic non? Debitis commodi aut, adipisci.</p>
		            <p>
		              <img src="images/image_2.jpg" alt="" class="img-fluid">
		            </p>
		            <p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim veniam, modi rem maiores.</p>
		            <p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro explicabo soluta commodi libero voluptatem similique id quidem? Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia laboriosam harum excepturi ea.</p>
		            <p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae numquam nam ab voluptatibus culpa, tenetur recusandae!</p>
		            <p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit. Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p> -->
    			
    				<c:if test="${reviewCnt > 0}">
	    				<c:forEach var="dto" items="${reviewInfo}" varStatus = "st">
			    			<h4 class="mb-5">후기</h4>
				                  <div class="comment-body">
				                    <h5>${dto.CUST_ID}</h5>
				                    <div class="meta">${dto.TG_DT}</div>
				                    <p>${dto.TG_CON}</p>
				                  </div>
		              	</c:forEach>
					</c:if>
					<c:if test="${reviewCnt == 0}">
    					아직 등록된 후기가 없습니다.
    				</c:if>
    			</div>
	              
	              <form action="requestTraining" method="post" name="requestTrainerForm" onsubmit="return checkFee();">
	              <input type="hidden" value="${TA_CD}" name="TA_CD">
	              <input type="hidden" value="${TQ_LOC}" name="TQ_LOC">
	              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	              <input type="hidden" value="" name="TQ_FEE">
	              <!-- 훈련사 일정 받아오기, 가능한 일정 선택하기 -->
	              
	              <div class="col-lg-6">
	              	<div class="form-group">
		                <div class="form-group">
		                  <span class="fa fa-search"></span>
		                  <input type="date" class="iptags" name="START_DAY">
		                </div>
	              	</div>
	              	
	              	<!-- 훈련유형 선택 및 요금안내 -->
	              	<!-- <div class="sidebar-box ftco-animate"> -->
		              <div class="form-group">
		                <h3 style="font-size:18px">훈련유형 및 요금안내${TQ_LOC}</h3>
		                <c:if test="${dto.TS1_NO == 1}">
		                	<label><input type="radio" value="${dto.TS1_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">배변훈련</label><br>
		                	<input type="hidden" value="${dto.TS1_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 배변훈련 요금 : ${dto.TS1_FEE}</label><br>
		                </c:if>
				        <c:if test="${dto.TS2_NO == 2}">
				        	<label><input type="radio" value="${dto.TS2_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">분리불안</label><br>
				        	<input type="hidden" value="${dto.TS2_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 분리불안 요금 : ${dto.TS2_FEE}</label><br>
		                </c:if>
				        <c:if test="${dto.TS3_NO == 3}">
				        	<label><input type="radio" value="${dto.TS3_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">기본훈련</label><br>
				        	<input type="hidden" value="${dto.TS3_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 기본훈련 요금 : ${dto.TS3_FEE}</label><br>
		                </c:if>
				        <c:if test="${dto.TS4_NO == 4}">
				        	<label><input type="radio" value="${dto.TS4_NO}" id="TQ_AMT" class="iptags" name="TQ_AMT">짖음해결</label><br>
				        	<input type="hidden" value="${dto.TS4_FEE}" class="iptags" name="TQ_FEE">
		                	<label>1회차 당 짖음해결 요금 : ${dto.TS4_FEE}</label><br>
		                </c:if>
		              </div>
		           <!--  </div> -->
		           
		           <div class="form-group">
	                <h3 style="font-size:18px">훈련받을 마이펫</h3>
	                <c:if test="${selectCnt == 0}">
	                	훈련받을 마이펫이 존재하지 않습니다.
	                </c:if>
	                
	                <c:if test="${selectCnt != 0}">
	                	<c:forEach var="dtos" items="${petInfo}">
	                		<input type="checkbox" value="${dtos.PET_NM}" id="PET_NM" name="PET_NM">${dtos.PET_NM}
	                	</c:forEach>
	                </c:if>
	              </div>
		            
		            <div class="col-md-12">
                        <div class="form-group" align="center">
                           <input type="submit" value="훈련 신청하기" class="btn btn-primary">
                           <div class="submitting"></div>
                        </div>
                     </div>
	              </div>
	              </form>
    		</div>
    	</div>
    </section>
      
          
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>