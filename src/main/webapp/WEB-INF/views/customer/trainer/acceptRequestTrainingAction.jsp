<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 수락 성공 -->
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("요청이 수락되었습니다.");
			window.location="requestTrainer";
		</script>
	</c:if>
	
	<!-- 수락 실패 -->
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("요청수락에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>