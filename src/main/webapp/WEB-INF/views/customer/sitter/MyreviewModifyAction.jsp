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
<c:if test="${updateCnt !=1}">
	<script type="text/javascript">
		alert("후기수정에 실패하였습니다. 다시 시도해 주세요");
		window.history.back();
	</script>
</c:if>

<!-- 수정 성공 -->
<c:if test="${updateCnt ==1}">
	<script type="text/javascript">
		alert("수정성공");
		window.location='${st}MyreviewList';
	</script>
</c:if>	
</body>
</html>