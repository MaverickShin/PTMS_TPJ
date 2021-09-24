<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터 탈퇴</title>
</head>
<body>
<c:if test="${deleteCnt == 0 }">
	<script type="text/javascript">
		alert("시터 삭제 중 오류가 발생했습니다.\n 다시 시도해 주세요.");
	</script>
</c:if>

<c:if test="${deleteCnt != 0 }">
	<script type="text/javascript">
		alert("시터 지원이 삭제되었습니다!!");
		window.location='/tpj/cust/';
	</script>
</c:if>
</body>
</html>