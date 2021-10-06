<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="div_nav">
		<ul class="div_ul">
			<li class="div_li"><a href="/tpj/cust/MyInfoUser">내정보 관리</a></li>
			<li class="div_li" id="mypages"><a class="link">MY PET</a>
				<div class="hide">
					<a href="/tpj/cust/MyPet">펫 등록</a> <a href="/tpj/cust/MyPetList">펫
						목록/수정</a>
				</div></li>
			<c:if test="${signchkCnt == 0}">
				<li class="div_li"><a
					onclick="if(confirm('펫시터 등록 후  이용가능합니다. 펫시터로 등록 하시겠습니까?')) window.location = '/tpj/sitter/applySitter';">시터
						프로필</a></li>
			</c:if>
			<c:if test="${signchkCnt != 0}">
				<li class="div_li"><a href="/tpj/cust/SitterProfile">시터 프로필</a></li>
			</c:if>
			<c:if test="${trainerChk == 0}">
				<li class="div_li"><a onclick="if(confirm('훈련사 등록 후  이용가능합니다. 등록 하시겠습니까?')) window.location = '/tpj/trainer/applyTrainer';">훈련사 프로필</a></li>
			</c:if>
			<c:if test="${trainerChk != 0}">
				<li class="div_li"><a href="/tpj/cust/TrainerProfile">훈련사 프로필</a></li>
			</c:if>
			<li class="div_li"><a href="/tpj/cust/buyList">결제내역</a></li>
		</ul>
	</nav>

</body>
</html>