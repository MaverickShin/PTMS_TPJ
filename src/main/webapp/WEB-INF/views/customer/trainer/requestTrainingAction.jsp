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
	<!-- 훈련 요청 성공 -->
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("훈련이 요청되었습니다.");
			window.location="matchingMain";
		</script>
	</c:if>
	
	<!-- 훈련 요청 실패 -->
	<c:if test="${insertCnt != 1}">
		<script type="text/javascript">
			alert("훈련요청에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>