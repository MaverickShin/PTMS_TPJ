<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>영양 정보</title>
</head>
<body>
<!-- 파일명 변경 - 21.09.23 -->
	<%@ include file="../../main/header.jsp"%>
	<section class="ftco-section bg-light ftco-faqs">
		<div class="container">
			<div class="container-fluid" style="display: inline;">
				<div style="display: flex; height: 700px; border-top: inset">
					<div style="margin: 10px; padding: 0;">
						<div style="rowspan: 3">
							<%@ include file="../../news/Symptom_Info.jsp"%>
						</div>
						<div>
							<img src="${imgPath}image_4.jpg" width="400px" height="300px" vspace=30>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../../main/footer.jsp"%>

</body>
</html>
