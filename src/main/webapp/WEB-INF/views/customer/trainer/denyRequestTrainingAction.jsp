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
	<!-- 거절 성공 -->
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("요청이 거절되었습니다.");
			window.location="denyTrainingList";
		</script>
	</c:if>
	
	<!-- 거절 실패 -->
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			alert("요청거절에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>