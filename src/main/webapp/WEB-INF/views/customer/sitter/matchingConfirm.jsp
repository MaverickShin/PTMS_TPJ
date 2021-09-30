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
	<!-- 업데이트 성공 -->
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert(" 서비스 구매 확정 되었습니다.");
			window.location="${st}MysitterSerList";
		</script>
	</c:if>
	
	<!-- 업데이트 실패 -->
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("매칭확정에 실패하였습니다. 다시한번 시도해 주세요.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>