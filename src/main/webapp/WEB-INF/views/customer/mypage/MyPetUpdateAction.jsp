<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 수정 처리페이지</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

	<!-- insert 실패 -->
	<c:if test="${updatecnt == 0}" >
		<script type="text/javascript">
		alert("펫 수정 중 오류가 발생했습니다.\n 다시 시도해 주세요.");
		</script>
	</c:if>
	<c:if test="${updatecnt != 0}" >
		<script type="text/javascript">
			alert("정상적으로 펫이 수정되었습니다.");
			window.location="/tpj/cust/";
		</script>
	</c:if>
</body>
</html>