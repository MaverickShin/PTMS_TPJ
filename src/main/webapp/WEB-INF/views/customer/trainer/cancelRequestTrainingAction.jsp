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
	<!-- 취소 성공 -->
	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			alert("요청이 취소되었습니다.");
			window.location="custReqResult";
		</script>
	</c:if>
	
	<!-- 취소 실패 -->
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("요청이 취소되지 않았습니다. \n 확인 후 다시 시도해주세요.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>