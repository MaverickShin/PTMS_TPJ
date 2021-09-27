<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title {
	font-size: 20pt;
	height: 60px;
	margin-bottom: 10px;
}
table tr {
	text-align: center;
}
.big {
	width: 80%;
	margin: auto;
	align: center;
	margin-top: 20px;
	border-radius: 15px;
}
.seongbukNews1, .seongbukNews2 {
	width: 100%;
}
.seongbukNews1 tr, .seongbukNews2 tr {
	height: 50px;
}
div {
	text-align: center;
}
.seongbukNews1 tr, .seongbukNews1 td, .seongbukNews2 tr, .seongbukNews2 td
	{
	border-collapse: separate;
	border-spacing: 1px;
	border: 3px solid #ccc;
}
</style>
</head>


<body>
<%@ include file="../../main/header.jsp"%>
<section class="ftco-section bg-light ftco-faqs">
	<div class="container">
		<div class="row" >	
			<table class=big border=1>
				<thead>
					<tr class="title">
						<th colspan="3"> 반려동물 질병 정보 </th>
					</tr>
				</thead>
				<tbody>
					
					<!-- 제목 불러오는 공간 추가 - 21.09.23 -->
					<%-- <tr>
						<td>${item}</td>
					</tr> --%>
				
		 			<c:forEach var="i" items="${item}">
						<tr>
							<td align="center" style="height:100%; width:100%; will-change: transform; transform: translate3d(0px,0px,0px);">
								${i}<br>
							</td>
						</tr>
					</c:forEach>
					<c:forEach var="i1" items="${item1}">
						<tr>
							<td align="center"  style="height:100%; width:100%; will-change: transform; transform: translate3d(0px,0px,0px);">
								${i1}<br>
							</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
		</div>
	</div>
</section>
<%@ include file="../../main/footer.jsp"%>
</body>
</html>