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
	
	<div style="display: flex; flex:1; justify-content:center;">
		
		<%@ include file = "sidebar.jsp" %>
		
		<section style = "width:800px; margin-left:auto; margin-right:auto; margin-top:30px;" 
		class = "sections">
		
		<center style = "margin-bottom: 30px; border-bottom:2px solid #00bd56; padding-bottom:20px"><h2>펫 코드 및 요금 목록</h2></center>
		
		<div style = "padding-bottom:30px; border-bottom:2px solid #00bd56;">
		
			<table class= "list_tb2">
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
		
		<div style = "width: 800px; height: 800px; background-image: url('${path}images/peticon2.png'); background-repeat : no-repeat; background-size : cover; ">
		
		</div>
		
		</section>
	   
	</div>
	
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>