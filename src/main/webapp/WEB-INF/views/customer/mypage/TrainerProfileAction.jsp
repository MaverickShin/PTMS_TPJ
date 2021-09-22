<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

	<!-- update 실패 -->
	<c:if test="${updateCnt == 0}" >
		<script type="text/javascript">
		alert("훈련사 수정 중 문제가 발생했습니다.\n 다시 시도해 주세요.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}" >
		<script type="text/javascript">
			alert("정상적으로 수정되었습니다.");
			window.location="/tpj/cust/";
		</script>
	</c:if>
</body>
</html>