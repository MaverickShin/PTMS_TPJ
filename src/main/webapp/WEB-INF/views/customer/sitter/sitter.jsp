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
<%@ include file= "../../main/header.jsp" %>

<div style="display:flex">
	<nav id="listdiv_id1" style="width:400px; padding:100px;">
		<ul>
           <li>-고객-</li>
           <li><a href="#">펫시터 찾기</a></li>
           <li><a href="">이용후기</a></li>
           <li><a href="feeInfo">요금안내</a></li>
           <li>-펫시터-</li>
           <li><a href="applySitter">펫시터 지원</a></li>
           <li><a href="">활동 등록</a></li>
           <li><a href="">나에게 온 의뢰</a></li>
        </ul>
	</nav>
	
	<form action="sitterMatching" method="post">
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
	      <p class="label">언제 맡기시나요?</p><br>
	      <input type="date" class="iptags" name="START_DAY" > ~
	      <input type="date" class="iptags" name="END_DAY" >
	   </div>   
	   
	   <div>
	      <p class="label">몇시에 맡기시나요?</p><br>
	      <input type="time" class="iptags" name="START_TM" >
	     <!--  <input type="time" class="iptags" name="END_TM" > -->
	   </div>      
	   
	   <div>
	      <p class="label">나의 반려동물 선택</p>
	   </div>
	   
	   <input type="submit" value="펫시터 찾기" class="btn btn-primary">
	  </div>   
	</form>
</div>

<%@ include file= "../../main/footer.jsp" %>
</body>
</html>