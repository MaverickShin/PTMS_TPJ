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
<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("요청 취소를 실패하셨습니다. 다시한번 시도해 주세요.")
		window.history.back();
	</script>
</c:if>

<!-- 거절 성공 -->
<c:if test="${deleteCnt != 0}">
	<script type="text/javascript">
		alert("요청한 서비스가 취소되었습니다. 다른 서비스도 이용해 주실거죠~~?");
		window.location='${cu}matchingMain';
	</script>
</c:if>	
</body>
</html>