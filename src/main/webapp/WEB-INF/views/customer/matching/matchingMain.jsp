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
	
	<section class="ftco-section bg-light">
    	<div class="container" style = "margin-left:auto; margin-right:auto;">
    		<div class="row">
          <div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate" style = "height:400px">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<span class="flaticon-blind"></span>
              </div>
              <div class="media-body p-3">
                <h3 class="heading">펫 훈련사</h3>
                <p><br><br><br>배변? 분리불안? 반려동물의 행동이 걱정되시나요?<br>PTMS의 훈련사를 만나 반려동물과의 시간을 더 유익하게 만들어가세요!</p>
                <a href="/tpj/trainer/trainerSearch" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
              </div>
            </div>      
          </div>
          <div class="col-md-6 d-flex align-self-stretch px-4 ftco-animate" style = "height:400px">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<span class="flaticon-dog-eating"></span>
              </div>
              <div class="media-body p-3">
                <h3 class="heading">펫 시터</h3>
                <p><br><br><br>출장, 여행으로 집에 혼자있는 반려동물이 걱정되시나요?<br>이젠 PTMS의 시터에게 맡기세요!</p>
                <a href="/tpj/sitter/sitter" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
              </div>
            </div>    
          </div>
        </div>
    	</div>
    </section>
    
    <%@ include file="../../main/footer.jsp" %>
</body>
</html>