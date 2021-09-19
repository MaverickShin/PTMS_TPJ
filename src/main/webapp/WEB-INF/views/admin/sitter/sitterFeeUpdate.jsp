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
<%@ include file = "../header.jsp" %>

	<div>
		<<p> 상품수정 </p>
	</div>
	<form action="sitterFeeUpdateAction" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >	
		<input type="hidden" name="hiddenPK_CD" value="${dtos.PK_CD}">
		<div>
			<p>펫 코드 및 요금 수정</p>
		</div>
		<div>
			<!--  펫 종류 코드 : <input type="number" class="iptags" name="PK_CD" value=""><br> -->
			 펫 종류 : <input type="text" class="iptags" name="PK_KIND" value="${dtos.PK_KIND}"><br>
			 펫 세부 분류 : <select size="1" id="iptags" name="PK_DETAIL">
			 			<option value="해당없음">해당없음</option>
			 			<option value="대형견">대형견</option>
			 			<option value="중형견">중형견</option>
			 			<option value="소형견">소형견</option>
			 		   </select><br>
			 서비스요금 : <input type="text" class="iptags" name="SF_FEE" value="${dtos.SF_FEE}">   
		</div>

		<input type="submit" class="btn btn-primary" value="수정">
		<input type="reset" class="btn btn-primary" value="수정취소">
	</form>
<%@ include file = "../footer.jsp" %>	
</body>
</html>