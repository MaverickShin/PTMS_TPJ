<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp" %>
		
		<div style="display:flex">
			<nav id="listdiv_id1" style="width:400px; padding:100px;">
				<ul>
					<li>-고객-</li>
					<li><a href="#">훈련사 찾기</a></li>
					<li><a href="">이용 후기</a></li>
					<li><a href="">훈련 종류 및 요금안내</a></li>
					<li>-훈련사-</li>
					<li><a href="applyTrainer">훈련사지원</a></li>
					<li><a href="">활동 등록</a></li>
					<li><a href="">나에게 온 의뢰</a></li>
				</ul>
			</nav>
			
			<section
         style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 30px;">
         <form action="trainerMatchingList" method="post" name="sitterMatching">
            <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}">
            <div class="row no-gutters">
               <div class="contact-wrap w-100 p-md-5 p-4">
                  <h3 class="mb-4">훈련사 찾기</h3>
                  <div class="row">

                     <div class="col-md-6">
                        <label class="label" for="TQ_AMT">원하는 훈련을 선택하세요.</label><br>
                        <label><input type="radio" value="1" class="iptags" name="TQ_AMT">배변훈련</label>&nbsp;
				        <label><input type="radio" value="2" class="iptags" name="TQ_AMT">분리불안</label><br>
				        <label><input type="radio" value="3" class="iptags" name="TQ_AMT">기본훈련</label>&nbsp;
				        <label><input type="radio" value="4" class="iptags" name="TQ_AMT">짖음해결</label>
                     </div>

                     <div class="col-md-6">
                        <div class="form-group">
                           <label class="label" for="SQ_LOC">어디서 훈련을 진행할까요?</label> <br>
                           <input type="text" class="iptags" name="SQ_LOC" placeholder="시 또는 구 입력">
                        </div>
                     </div>

                     <div class="col-md-6">
                        <div class="form-group">
                           <label class="label" for="trainingDay">언제 훈련을 진행할까요?</label> <br>
                           <input type="date" class="iptags" name="START_DAY"> ~ 
                           <input type="date" class="iptags" name="END_DAY"><br>
                                                      조정가능<input type="checkbox" class="iptags" name="ADJUSTABLE" value="1">
                           <!--  <input type="time" class="iptags" name="END_TM" > -->
                        </div>
                     </div>

                     <!-- <div class="col-md-6">
                        <div class="form-group">
                           <label class="label" for="trainerImg">나의 반려동물 선택</label>
                        </div>
                     </div> -->

                     <div class="col-md-12">
                        <div class="form-group" align="center">
                           <input type="submit" value="훈련사 찾기" class="btn btn-primary">
                           <div class="submitting"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </form>
      </section>
			
		</div>
		
		
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>