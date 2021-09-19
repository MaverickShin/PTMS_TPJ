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
	
	<img src="${imgPath}communityBoard.jpg" style="display:block; margin:auto;" />
	<form action="qnaWrite?pageNum=${pageNum}" method="post">
	<table>
		<tr>
			<th>#</th>
			<th>제목</th>
			<th>아이디</th>
			<th>등록일</th>
		</tr>
		
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${number}</td>
					<td>
						<a href="/tpj/qna/qnaDetail?num=${dto.QNA_CD}&pageNum=${pageNum}&number=${number+1}">${dto.QNA_TITLE}</a>
					</td>
					<td>${dto.CUST_ID}</td>
					<td>${dto.QNA_DT}</td>
					<td>${dto.QNA_CD}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="4" align="center">
					게시글이 없습니다.
				</td>
			</tr>
		</c:if>
	</table>
	</form>
	
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀]/이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="qnaList">[◀◀]</a>
						<a href="qnaList?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<!-- 볼록내의 페이지번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="qnaList?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶]/마지막[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="qnaList?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="qnaList?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
		
		<tr>
			<td><input type="submit" value="문의하기" class="btn btn-primary"></td>
		</tr>
	</table>
	
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>