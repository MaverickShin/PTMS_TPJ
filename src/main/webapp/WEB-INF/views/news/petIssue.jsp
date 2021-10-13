<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class=bigs border="1">
		<thead>
			<tr>
				<th colspan="3" style="text-align:center">Today's Issue</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${list2}">
				<tr>
					<td>
					${i}<br>
					</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table> 
</body>
</html>