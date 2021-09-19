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
<!-- 상품추가 성공 -->
	<c:if test="${insertCnt ==2 }" >
		<script type="text/javascript"> 
			alert("등록을 완료하였습니다");
			window.location='enroll';
		</script>
	</c:if>
<!-- 상품추가 실패 -->
	<c:if test="${insertCnt !=2 }" >
		<script type="text/javascript">
		alert("등록실패!")
		window.location.back();
		</script>
	</c:if>
</body>
</html>