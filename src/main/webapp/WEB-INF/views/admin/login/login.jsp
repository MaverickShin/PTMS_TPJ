<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-로그인</title>
<style>
	#join_sub {
		width: 100%; 
		background-color:#0ca678;
		outline:none;
		border: 1px solid #0ca678;
		color: white;
		font-size: 20px;
		font-weight: bolder;
		cursor:pointer;
		border-radius: 20px;
	}
	
	#join_sub:hover {
		background-color: #12b886;
	}
	
	#join_tag:hover a{
		color: #707070 !important;
		text-decoration: underline !important;
	}
</style>
</head>
<body>
	<section style = "width: 500px; margin:auto; margin-top: 200px; box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);">
	<form name="joinInform" action="${ad}adminloginaction" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div style = "height: 70px; background-color:#0ca678;"><center style = "line-height: 70px; color: white; font-size: 40px;">Pet Care System</center></div>
			<div class="row" style="width:400px; margin-left:auto; margin-right:auto; margin-top: 30px;">
				<div class="col-md-12">
					<div class="form-group">
						<label class="label" for="mg_id">아이디</label>
						<input type="text" class="form-control" name="mg_id" id="mg_id" placeholder="아이디">
					</div>
				</div>
								
				<div class="col-md-12">
					<div class="form-group">
						<label class="label" for="mg_pwd">비밀번호</label>
						<input type="password" class="form-control" name="mg_pwd" id="mg_pwd" placeholder="비밀번호" >
					</div>
				</div>
				
				
				<div class="col-md-12" style = "margin-top: 30px; margin-bottom: 30px;">
					<div class="form-group" align = "center">
						<input type="submit" value="관리자 로그인" id = "join_sub">
						<div class="submitting"></div>
					</div>
				</div>
				
				<div style = "width:100%; text-align:right; margin-bottom: 20px;"  id = "join_tag"><a href = "/tpj/admin/adminjoin" style = "text-decoration: none; color:#9e9e9e; font-size: 16px; font-weight: bolder;">관리자 등록</a></div>
			</div>
	</form>
</section>
</body>
</html>