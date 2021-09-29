<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../../main/header.jsp"%>

	<div style = "width: 1000px; height: 1000px;">

	
	<center><a href = "/tpj/pay/request?paykind=1&payPrice=20000&item_name=시터결제">결제하기</a></center>


	<div id = "result_div">
	
	</div>
</div>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>