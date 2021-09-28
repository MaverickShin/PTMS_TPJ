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
<!-- 삭제 실패  -->
<c:if test="${insertCnt !=1}">
	<script type="text/javascript">
		alert("펫시터 지원에 실패하셨습니다. 정보를 다시 입력해 주세요.");
		window.history.back();
	</script>
</c:if>

<!-- 삭제 성공 -->
<c:if test="${insertCnt ==1}">
	<script type="text/javascript">
		alert("펫시터가 되신것을 축하드립니다!");
		window.location='${cu}matchingMain';
	</script>
</c:if>	
</body>
</html>