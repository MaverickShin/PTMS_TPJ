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
	
	<table>
		<tr>
			<td>제목</td>
		</tr>
		<tr>
			<td>${dto.QNA_TITLE}</td>
		</tr>
		
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td>${dto.QNA_CONTENT}</td>
		</tr>
		
		<c:if test="${dto.QNA_ANSWER == null}">
			<tr>
				<td>아직 답변이 등록되지 않았습니다.</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="글삭제" class="btn btn-primary"
						onclick="window.location='qnaDeleteAction?QNA_CD=${dto.QNA_CD}'">
				</td>
			</tr>
		</c:if>
		
		<c:if test="${dto.QNA_ANSWER != null}">
			<tr>
				<td>답변</td>
			</tr>
			
			<tr>
				<td>${dto.QNA_ANSWER}</td>
			</tr>
		</c:if>
	</table>
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>