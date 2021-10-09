
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록 처리</title>
</head>
<body>
<c:if test = "${insert == 1}"> 
	<script type="text/javascript">
		alert("관리자 등록 성공!");
		window.location = "/tpj/admin/adminlogin";
	</script>
</c:if>
<c:if test = "${insert == 0}">
	<script type="text/javascript">
		alert("관리자 등록 실패!");
		window.history.back();
	</script>
</c:if>
</body>
</html>