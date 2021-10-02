<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<title>Insert title here</title>
<script>
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	
	$.ajax({
		type: "get",
		url: "/tpj/cust/nutrient",
		cache: false,
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		beforeSend : function(jqXHR, settings)
		{
			var token = $("meta[name='_csrf_header']").attr("content");
			var header = $("meta[name='_csrf']").attr("content");
			jqXHR.setRequestHeader(header, token);
	},
	success: function(cnt) {
	},
	error : function(request, status, error) {
		alert("에러!");
	}
	});
});
</script>
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
</style>
</head>

<body>
	<table class=big border="1">
		<thead>
			<tr class="title">
				<th colspan="3">반려동물 영양 정보</th>
			</tr>
		</thead>
		<tbody>

			<!-- 제목 불러오는 공간 추가 - 21.09.23 -->
			<tr>
				<td>${title}</td>
				<td>${i}</td>
			</tr>

<%-- 			<c:forEach var="i" items="${list}">
				<tr>
					<td>${i}</td>
				</tr>
			</c:forEach> --%>
		</tbody>
	</table>
</body>
</html>