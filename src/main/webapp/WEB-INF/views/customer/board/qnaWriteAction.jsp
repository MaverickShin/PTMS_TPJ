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
	<!-- 글쓰기 성공 -->
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("문의글 등록이 완료되었습니다.");
			window.location='qnaList?pageNum=${pageNum}';
		</script>
	</c:if>
	
	<!-- 글쓰기 실패 -->
	<c:if test="${insertCnt != 1}">
		<script type="text/javascript">
			alert("문의글 등록에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
</body>
</html>