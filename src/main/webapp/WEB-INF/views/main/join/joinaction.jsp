
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>

<c:if test = "${insert == 1}"> 
	<script type="text/javascript">
		alert("회원가입 성공!");
		window.location = "/tpj/cust/login";
	</script>
</c:if>
20+5

<c:if test = "${insert == 0}">
	<script type="text/javascript">
		alert("회원가입 실패! ");
		window.history.back();
	</script>
</c:if>

</body>
</html>