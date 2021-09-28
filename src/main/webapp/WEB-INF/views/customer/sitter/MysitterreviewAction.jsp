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
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("후기가 작성되었습니다.");
			window.location="${st}sitter";
		</script>
	</c:if>
	
	<!-- 취소 실패 -->
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("후기 작성에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>