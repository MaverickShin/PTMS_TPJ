<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyPet</title>
<meta charset="utf-8">

<style>
.hide {
	display:none;
	background-color: #00bd56;
	min-width: 160px;
	box-shadow: 10px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
	font-size: 12px;
	position: absolute;
	left: -15px;
	top: 0px;
}
.hide a {
	color: white;
  	padding: 12px 16px;
  	text-decoration: none;
  	display: block;
  	text-align: left;
}

.hide a:hover {
	color: #00bd56;
	font-weight: bold;
	background-color: white;
}

#mypages {
	position:relative;
	cursor: pointer;
	color:#00bd56;
}

#mypages:hover .hide {
	display: block;
}
.link {
	display: block;
	padding: 2rem 0rem; 
}
.contactForm .label {
	font-size: 20px !important;
	font-weight: normal !important;
}

.contactForm .input {
	font-size: 16px !important;
}

.petkinds {
	font-size: 16px !important;
}

.col-md-12 input[type=radio]{
    display: none;
}

.imogi {
    display: none;
    font-size: 40px;;
}

.col-md-12 label {
	cursor: pointer;
}

.col-md-12 input[type=radio] + label {
    color: #bdbdbd;
    font-size: 2em;
}
.col-md-12 input[type=radio]:checked + label{
    color: #000;
}

.col-md-12 input[type=radio]:checked + label a{
    display: inline-block;
}

</style>
</head>
<body>
<%@ include file = "../../main/header.jsp" %>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${path}images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="main">Home<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
				<h1 class="mb-0 bread">MyPet</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">반려인/반려동물 관리</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
				<%@ include file="MyInfobar.jsp"%>
					<div class="row no-gutters">
						<div class="col-md-7">
							<div class="contact-wrap w-100 p-md-5 p-4"  style = "font-family: 'Do Hyeon', sans-serif;">
								<h3 class="mb-4">MyPet 등록</h3>
								
								<form action="MyPetInsertAction" method="POST" id="contactForm" name="contactForm" class="contactForm" enctype="multipart/form-data">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<s:csrfInput/>
										<div class="row">
											<%-- <div class="col-md-6">
												<div class="form-group">
													<label class="label" for="CUST_ID">고객아이디</label> <input
														type="text" class="form-control" name="CUST_ID" id="CUST_ID"
														value="${PetVO.getCUST_ID()}" readonly>
												</div>
											</div> --%>
											
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PET_NM">펫이름</label> <input
														type="text" class="form-control" name="PET_NM" id="PET_NM"
														placeholder="펫이름">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="PET_AGE">펫나이</label> <input
														type="text" class="form-control" name="PET_AGE" id="PET_AGE"
														placeholder="펫나이">
												</div>
											</div>
											<div class="col-md-12">
												<label class="label" for="PK_CD">펫종류</label>&nbsp;&nbsp;
												<div>
													<input class="form-group" type="radio" id="PK_CD1" name="PK_CD" value="1"><label for= "PK_CD1" style = "width:200px;"><a class= "imogi" style = "font-size: 30px;">🐕</a>소형견(~7kg)&nbsp;</label>
													<input class="form-group" type="radio" id="PK_CD2" name="PK_CD" value="2"><label for= "PK_CD2"><a class= "imogi"style = "font-size: 35px;">🦮</a>중형견(8kg~15kg)&nbsp;</label><br>
													<input class="form-group" type="radio" id="PK_CD3" name="PK_CD" value="3"><label for= "PK_CD3" style = "width: 250px;"><a class= "imogi">🐕‍🦺</a>대형견(16kg~)&nbsp;</label>
													<input class="form-group" type="radio" id="PK_CD4" name="PK_CD" value="4"><label for= "PK_CD4"><a class= "imogi">🐈</a>고양이</label>
												</div>
											</div>
											
											<div class="col-md-12" style = "margin-top: 20px; border-top:1px solid #00bd56; padding-top: 20px;">
												<label class="label" for="PET_IMG">펫사진</label>&nbsp;&nbsp;
												 <label class="btn btn-primary" for="PET_IMG" style = "font-size: 16px !important; height:40px; font-weight:normal !important; line-height: 40px; padding: 0px; width: 80px;">사진등록</label> 
												<input class="form-group" type="file" id="PET_IMG" name="PET_IMG" accept="${imgPath}*"  style="display:none">
											</div>
											<div class="col-md-12" style = "padding-top: 20px; border-top:1px solid #00bd56; margin-top:20px;">
												<div class="form-group">
													<label class="label" for="PET_CON">특이사항</label> <input
														type="text" class="form-control" name="PET_CON"
														id="PET_CON" placeholder="특이사항">
												</div>
											</div>
											<div class="col-md-12" style = "margin-top: 20px; text-align:center">
												<div class="form-group">
													<input type="submit" value="등 록" class="btn btn-primary" style = "width: 150px; font-size: 20px !important; font-weight: normal !important">
												</div>
											</div>
										</div>
								</form>
							</div>
						</div>
						
						<div class="col-md-5 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-5 img"
								style="background-image: url(${path}images/gallery-3.jpg);"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file = "../../main/footer.jsp" %>
</body>
</html>