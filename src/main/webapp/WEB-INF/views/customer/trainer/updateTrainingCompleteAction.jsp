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
	<!-- 매칭확정 성공 -->
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("매칭이 확정되었습니다.");
			window.location="custReqResult";
		</script>
	</c:if>
	
	<!-- 매칭확정 실패 -->
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			alert("매칭 확정에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>