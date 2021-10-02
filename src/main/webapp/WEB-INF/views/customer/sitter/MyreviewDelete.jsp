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
<!-- 수정 실패  -->
<c:if test="${deleteCnt !=1}">
	<script type="text/javascript">
		alert("후기삭제에 실패하였습니다. 다시 시도해 주세요");
		window.history.back();
	</script>
</c:if>

<!-- 수정 성공 -->
<c:if test="${deleteCnt ==1}">
	<script type="text/javascript">
		alert("후기가 삭제되었습니다.후기작성은 다른 고객님들에게도 큰 힘이 됩니다.");
		window.location='${st}MyreviewList';
	</script>
</c:if>	
</body>
</html>