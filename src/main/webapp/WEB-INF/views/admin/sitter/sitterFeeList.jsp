<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../header.jsp" %>
<h3> 펫 코드 및 요금 목록 </h3>
	<table>
		<tr>
			<th>펫 종류 코드 </th>
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
			<td><input type="button" class="btn btn-primary" value="수정" onclick="window.location='sitterFeeUpdate?PK_CD=${dto.PK_CD}'"></td>
			<td><input type="button" class="btn btn-primary" value="삭제" onclick="window.location='sitterFeeDelete?PK_CD=${dto.PK_CD}'"></td>
		</tr>
		</c:forEach>
	</table>
	
<%@ include file = "../footer.jsp" %>	
</body>
</html>