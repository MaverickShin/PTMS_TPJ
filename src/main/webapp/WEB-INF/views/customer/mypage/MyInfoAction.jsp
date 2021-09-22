<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 처리</title>
</head>
<body>
<c:if test="${updatecnt == 0}">
	<script type="text/javascript">
		alert("회원정보 수정중 문제가 발생했습니다.");
		window.history.back();
	</script>
</c:if>
<c:if test="${updatecnt != 0}">
	<%
		request.getSession().invalidate();
	%>
	<script type="text/javascript">
	setTimeout(function() {
		alert("회원정보가 수정되었습니다.");
		window.location = "/tpj/cust/" //메인화면
	}, 1000);
	</script>
</c:if>
</body>
</html>