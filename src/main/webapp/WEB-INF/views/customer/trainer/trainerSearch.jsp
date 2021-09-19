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
					<li><a href="#">훈련사 목록</a></li>
					<li><a href="">이용 후기</a></li>
					<li><a href="">훈련 종류</a></li>
					<li>-훈련사-</li>
					<li><a href="applyTrainer">훈련사지원</a></li>
					<li><a href="">활동 등록</a></li>
					<li><a href="">나에게 온 의뢰</a></li>
				</ul>
			</nav>
			
			<form action="trainerMatchingList" method="post">
			  <div class="sitter">
			   <div>
			      <p class="label">어디에 사시나요?</p><br>
			      <input type="text" class="iptags" name="SQ_LOC" placeholder="어디에 사시나요?">
			   </div>   
			   
			   <!-- <div>
			      <p class="label">언제 맡기시나요?</p>
			      <input type="datetime-local" class="iptags" name="START_DAY" > ~
			      <input type="datetime-local" class="iptags" name="END_DAY" >
			   </div> -->
			   
			   <div>
			      <p class="label">몇회 훈련을 진행하고 싶으세요?(최대 3회 예약 가능)</p><br>
			      <select name="tr_count" class="iptags" required>
			      	<option value="1">1회</option>
			      	<option value="2">2회</option>
			      	<option value="3">3회</option>
			      </select>
			   </div>
			       
			   <div>
			      <p class="label">언제 맡기시나요?</p><br>
			      <input type="date" class="iptags" name="START_DAY" > ~
			      <input type="date" class="iptags" name="END_DAY" >
			   </div>
			   
			   <div>
			      <p class="label">나의 반려동물 선택</p>
			      
			   </div>
			   
			   <div>
			      <p class="label">훈련종류를 선택하세요.</p><br>
			      <select name="TQ_AMT" class="iptags" required>
			      	<option value="1">배변문제</option>
			      	<option value="2">분리불안</option>
			      	<option value="3">기본교육</option>
			      	<option value="4">짖음문제</option>
			      </select>
			   </div>
			   
			   <input type="submit" value="훈련사 찾기" class="btn btn-primary">
			  </div>   
			</form>
		</div>
		
		
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>