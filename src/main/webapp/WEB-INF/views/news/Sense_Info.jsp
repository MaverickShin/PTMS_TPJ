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
.title {
	font-size: 20pt;
	height: 60px;
	margin-bottom: 10px;
}

table tr {
	text-align: center;
}

.big {
	width: 80%;
	margin: auto;
	align: center;
	margin-top: 20px;
	border-radius: 15px;
}

.seongbukNews1, .seongbukNews2 {
	width: 100%;
}

.seongbukNews1 tr, .seongbukNews2 tr {
	height: 50px;
}
/* div {
	text-align: center;
} */
.seongbukNews1 tr, .seongbukNews1 td, .seongbukNews2 tr, .seongbukNews2 td
	{
	border-collapse: separate;
	border-spacing: 1px;
	border: 3px solid #ccc;
}

.big td {
	width: 500px;
	height: 300px;
	color: black !important;
}

.contenst {
	text-align:center;
}

.contents img {
	width: 200px;
	height: 200px;
	display: block;
	margin-left: auto;
	margin-right:auto;
}

.contents a {
	display: block;
	color: black;
	font-size: 18px;
	font-weight: bolder;
	margin-top: 20px;
}

.contents a:hover {
	font-size: 22px;
	font-weight: bold;
}

</style>
</head>

<body>
	<table class=big border="1">
		<tbody>

		<!-- 제목 불러오는 공간 추가 - 21.09.23 -->
		<c:forEach var = "i" items="${list}">
			<tr>
				<td>${i}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>