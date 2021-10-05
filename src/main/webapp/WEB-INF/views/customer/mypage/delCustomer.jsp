<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<c:if test="${deleteCnt == 0 }">
	<script type="text/javascript">
		alert("회원 탈퇴 중 오류가 발생했습니다.\n 다시 시도해 주세요.");
	</script>
</c:if>

<c:if test="${deleteCnt != 0 }">
	<script type="text/javascript">
		alert("회원 탈퇴 되었습니다. 고객님의 만족을 위해 최선을 다하겠습니다.");
		session.invalidate();
		window.location='/tpj/cust/main';
	</script>
</c:if>
</body>
</html>