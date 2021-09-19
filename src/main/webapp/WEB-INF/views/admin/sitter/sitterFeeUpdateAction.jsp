<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

	<h2>수정처리 페이지</h2>

	<!-- insert 실패 -->
	<c:if test="${updateCnt == 0}" >
		<script type="text/javascript">
			alert("업데이트 실패")
		</script>
	</c:if>
	<c:if test="${updateCnt != 0}" >
		<script type="text/javascript">
			alert("수정 성공.");
			window.location="sitterFeeList";
		</script>
	</c:if>
</body>
</html>