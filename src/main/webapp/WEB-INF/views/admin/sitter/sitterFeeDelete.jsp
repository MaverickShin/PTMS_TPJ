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

	<!-- delete 실패 -->
	<c:if test="${deleteCnt == 0}" >
		<script type="text/javascript">
			alert("삭제에 실패하였습니다. 다시한번 확인해 주세요")
		</script>
	</c:if>
	<!-- delete 성공 -->	
	<c:if test="${deleteCnt != 0}" >
		<script type="text/javascript">
			alert("삭제 성공.");
			window.location="sitterFeeList";
		</script>
	</c:if>
</body>
</html>