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
<!-- 거절 실패  -->
<c:if test="${upadateCnt == 0}">
	<script type="text/javascript">
		alert("요청 거절에 실패하셨습니다. 다시한번 시도해 주세요.")
		window.history.back();
	</script>
</c:if>

<!-- 거절 성공 -->
<c:if test="${upadateCnt != 0}">
	<script type="text/javascript">
		alert("고객 요청을 거절하였습니다.");
		window.location='${st}requestForSitter';
	</script>
</c:if>	
</body>
</html>