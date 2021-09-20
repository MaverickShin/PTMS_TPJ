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
	<!-- 등록성공 -->
	<c:if test="${insertCntdt == 1}">
		<script type="text/javascript">
			alert("훈련사로 등록되었습니다.");
			window.location="requestTrainer";
		</script>
	</c:if>
	
	<!-- 등록실패 -->
	<c:if test="${insertCntdt != 1}">
		<script type="text/javascript">
			alert("훈련사 등록에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>