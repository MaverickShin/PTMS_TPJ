<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('.filesub').click(function(){
			
			var form = $('#fileUploadForm')[0];
			
			var data = new FormData(form);
			
			$.ajax({
				type: "POST",
				url: "/tpj/cust/urineimg",
				enctype: 'multipart/form-data',  
				processData: false,
				contentType: false,
				cache: false,
				data: data,
				timeout: 600000,
				beforeSend : function(jqXHR, settings)
				{
					var token = $("meta[name='_csrf_header']").attr("content");
					var header = $("meta[name='_csrf']").attr("content");
					console.log(token);
					console.log(header);
					jqXHR.setRequestHeader(header, token);
			},
			success: function(cnt) {
				$('.img').attr('src', cnt);
			},
			error : function(request, status, error) {
				alert("에러!");
			}
			});
		});
	});
</script>
</head>
<body>

<div class = "test_img" style = "width: 600px; height: 600px;">
	<img class = "img" src = "">
	
	<form method="post" id="fileUploadForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type = "file" name = "urine_img" class = "upload">	
		<input type = "button" value = "선택완료" class = "filesub">
	</form>
</div>


</body>
</html>