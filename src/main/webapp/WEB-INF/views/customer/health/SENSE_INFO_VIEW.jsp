<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>반려동물 지식 정보</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>
	<section class="ftco-section bg-light ftco-faqs">
		<div class="container">
			<div class="row">
				<div style="display: flex; justify-content: center">
					<div style="margin: 10px; padding: 0;">
						<%@ include file="../../news/SENSE_INFO.jsp"%>
						<div>
							<img src="${imgPath}image_4.jpg" width="400px" height="300px"
								vspace=30>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../../main/footer.jsp"%>

</body>
</html>
