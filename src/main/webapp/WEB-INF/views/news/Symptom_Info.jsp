<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bigss {
	width: 250px;
	height: 250px;
	align: center;
	margin-top: 20px;
	margin: auto;
}

.bigss td {
	width: 400px;
	height: 400px;
	color: black !important;
}

.bigss td img {
	width: 400px;
	height: 270px;
}

.tdss a{
	display:block;
	position:relative;
	color: #2C3E50;
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 16px;
	font-weight: bolder;
	text-align: center;
}

.tdss a:hover {
	font-size: 18px;
	font-weight: bold;
}

.symptomss a span {
	display:block;
	position:absolute;
	top: 300px;
	width: 100%;
}
</style>
</head>


<body>
	<table class=bigss>
		<tbody>

			<c:forEach var = "i" items = "${list}">			
				<tr>
					<td class= "tdss">${i}</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
</body>

</html>