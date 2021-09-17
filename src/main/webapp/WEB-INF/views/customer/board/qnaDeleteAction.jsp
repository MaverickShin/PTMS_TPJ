<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 삭제 성공 -->
	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			alert("문의글이 삭제되었습니다.");
			window.location='qnaList?pageNum=${pageNum}';
		</script>
	</c:if>
	
	<!-- 삭제 실패 -->
	<c:if test="${deleteCnt != 1}">
		<script type="text/javascript">
			alert("문의글 삭제에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>