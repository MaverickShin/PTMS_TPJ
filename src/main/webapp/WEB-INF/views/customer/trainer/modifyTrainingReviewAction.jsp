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
	<!-- 수정성공 -->
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("후기 수정이 완료되었습니다.");
			window.location="getReviewInfo";
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			alert("후기 수정에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>