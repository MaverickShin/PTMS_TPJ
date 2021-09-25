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
	<h3>펫 코드 및 요금 목록</h3>
	<div style="display: flex">
		<nav id="listdiv_id1" style="width: 400px; padding: 100px;">
			<ul>
				<li>-고객-</li>
				<li><a href="sitter">펫시터 찾기</a></li>
				<li><a href="MysitterSerList">나의 펫시터 이용 내역</a></li>
				<li><a href="#">요금안내</a></li>
				<li>-펫시터-</li>
				<li><a href="applySitter">펫시터 지원</a></li>
				<li><a href="requestForSitter">나에게 온 의뢰</a></li>
			</ul>
		</nav>

		<table>
			<tr>
				<th>펫 종류 코드</th>
				<th>펫 종류</th>
				<th>펫 세부분류</th>
				<th>서비스 요금</th>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.PK_CD}</td>
					<td>${dto.PK_KIND}</td>
					<td>${dto.PK_DETAIL}</td>
					<td>${dto.SF_FEE}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>