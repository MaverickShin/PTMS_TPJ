<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫등록 처리페이지</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

	<!-- insert 실패 -->
	<c:if test="${insertcnt == 0}" >
		<script type="text/javascript">
			alert("펫 등록 중 오류가 발생했습니다.\n 다시 시도해 주세요.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${insertcnt != 0}" >
		<script type="text/javascript">
			alert("펫이 등록되었습니다.");
			window.location="/tpj/cust/";
		</script>
	</c:if>
</body>
</html>