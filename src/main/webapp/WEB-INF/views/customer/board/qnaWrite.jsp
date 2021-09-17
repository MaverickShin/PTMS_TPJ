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
	<%@ include file="../../main/header.jsp" %>
	
	<form action="qnaWriteAction" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<table>
		<tr>
			<td>
				<select name="QK_CD" required>
					<option>문의 유형</option>
					<option value="1">결제</option>
					<option value="2">매칭서비스</option>
					<option value="3">마이펫찾기</option>
					<option value="4">자가진단</option>
					<option value="5">기타</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" name="QNA_TITLE" placeholder="문의글제목">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="QNA_CONTENT" placeholder="문의글내용">
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="글 등록하기" class="btn-primary">
			</td>
		</tr>
	</table>
	
	
	</form>
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>