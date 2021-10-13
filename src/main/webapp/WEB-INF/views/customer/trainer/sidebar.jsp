<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){ // document ready
	   if ($('.list_div1').length) { // make sure ".list_div1" element exists
	      var el = $('.list_div1');
	      var stickyTop = $('.list_div1').offset().top; // returns number
	      var stickyHeight = $('.list_div1').height();

	      $(window).scroll(function(){ // scroll event
	          var limit = $('footer').offset().top - stickyHeight - 20;

	          var windowTop = $(window).scrollTop(); // returns number

	          if (stickyTop < windowTop){
	             el.css({ position: 'fixed', top: 100 });
	          }
	          else {
	             el.css('position','absolute');
	             el.css("top", "60px");
	          }

	          if (limit < windowTop) {
	          	var diff = limit - windowTop;
	          	el.css({top: diff});
	          }
	        });
	   }
	});
</script>
</head>
<body>

		<nav class ="list_nav1" style="width: 400px; padding: 100px; min-height:700px">
			<div class = "list_div1" id = "list_div_id1" style = "margin-bottom:150px;">
				<table class = "list_tb1">
					<tr>
						<th><strong>고객</strong></th>
					</tr>
					
					<tr>
						<td><a href="/tpj/trainer/trainerSearch">훈련사 찾기</a></td>
					</tr>
					
					<!-- <tr>
						<td><a href="/tpj/trainer/previewTraining">후기 미리보기</a></td>
					</tr> -->
					
					<tr>
						<td><a href="/tpj/trainer/custReqResult">요청내역 및 후기작성</a></td>
					</tr>
					<tr>
						<td><a href="/tpj/trainer/getReviewInfo">내후기 보기</a></td>
					</tr>
					<tr>
						<td style = "background-color: white; color:#00bd56; font-size: 24px;"><strong>펫 훈련사</strong></td>
					</tr>
					
					<tr>
						<td><a href="/tpj/trainer/applyTrainer">훈련사 지원</a></td>
					</tr>
					
					<tr>
						<c:if test="${trainerChkCnt == 0}">
							<td class="div_li"><a onclick="if(confirm('훈련사 등록 후  이용가능합니다. 등록 하시겠습니까?')) window.location = '/tpj/trainer/applyTrainer';">훈련사 프로필</a></td>
						</c:if>
						<c:if test="${trainerChkCnt != 0}">
						<td><a href="/tpj/cust/TrainerProfile2">훈련사 프로필 보기</a></td>
						</c:if>
					</tr>
					
					<tr>
						<td style = "margin-bottom:20px;"><a href="/tpj/trainer/requestTrainer">나에게 온 의뢰</a></td>
					</tr>
				</table>
			</div>
		</nav>


</body>
</html>