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
<link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">
<script src="https://fengyuanchen.github.io/cropper/js/cropper.js"></script>
<script type="text/javascript">
/* 	$(document).ready(function(){
		
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
		Jcrop.attach('target');
	}); */
	
	$(function(){
		var cropper;
	    // 사진 업로드 버튼
	    $('#photoBtn').on('change', function(){
	        $('.them_img').empty().append('<img id="image" src="">');
	        var image = $('#image');
	        var imgFile = $('#photoBtn').val();
	        var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
	        // 이미지가 확장자 확인 후 노출
	        if(imgFile.match(fileForm)) {
	        	var reader = new FileReader(); 
	        	reader.onload = function(event) { 
	        		image.attr("src", event.target.result);
	        		cropper = image.cropper( {
	        			dragMode: 'move',
	        			viewMode:1,
	        			aspectRatio: 1,
	        			autoCropArea:0.5,
	        			Scalable: true,
	        			zoomOnWheel: true,
	       				restore: false,
	                    guides: false,
	                    center: false,
	                    highlight: false,
	                    cropBoxMovable: false,
	                    cropBoxResizable: false,
	                    toggleDragModeOnDblclick: false
	                });
	            }; 
	        	reader.readAsDataURL(event.target.files[0]);
	        } else{
	        	alert("이미지 파일(jpg, png형식의 파일)만 올려주세요");
	        	$('#photoBtn').focus();
	        	return; 
	        }
		});
	    // 사진 다시 올리기 버튼
	    $('#resetPhoto').on('click', function(){
	        if($('input[type="file"]').val() != ""){
	        	$('#photoBtn').val('');
	        	$('.them_img img').attr('src','').remove();
	        	$('.btn_wrap a:last-child').removeClass('bg1');
	        	$('input[type="file"]').click();
	        }else{
	        	//alert('업로드된 사진이 없습니다.');
	        }
	    });
	    // 업로드 버튼
	    $('#complete').on('click', function(){
	    	$('.them_img').append('<div class="result_box"><img id="result" src=""></div>');
	    	var image = $('#image');
	    	var result = $('#result');
	    	var canvas;
	    	if($('input[type="file"]').val() != ""){
	    	canvas = image.cropper('getCroppedCanvas',{
	    		width:200,
	    		height:200
	    	});
	    	result.attr('src',canvas.toDataURL("image/jpg"));
	    	
	    	
	    	canvas.toBlob(function (blob) {
	    		
	    		var form = $('#fileUploadForm')[0];
	    		
				var data = new FormData(form);
	    		
				data.append('croppedImage', blob, 'example.png' , 0.7);
				
	    		$.ajax({
	    			url:'/tpj/cust/urineimg',
	           		type:'POST',
	           		enctype: 'multipart/form-data',
	                data: data,
	                processData: false,
	                contentType: false,
	                timeout: 600000,
					beforeSend : function(jqXHR, settings)
					{
						var token = $("meta[name='_csrf_header']").attr("content");
						var header = $("meta[name='_csrf']").attr("content");
						console.log(token);
						console.log(header);
						jqXHR.setRequestHeader(header, token);
					},
	                success: function (cnt) {
	                	alert('업로드 성공');
	                },
	                error: function () {
	                	alert('업로드 실패');
	                	$('.result_box').remove()
	                },
	    		});
	    	})
	      }else{
	          alert('사진을 업로드 해주세요');
	          $('input[type="file"]').focus();
	          return;
	      }
	    });
	});
</script>
<style>
.photo_box{margin:0 auto ;max-width:500px;} 
.upload_btn{overflow:hidden;width:100%;}
.upload_btn #photoBtn {display:none;}
.upload_btn .upload, .upload_btn a{float:left;width:calc(50% - 10px);text-align:center;text-decoration: none;color:#fff;padding:15px 0;}
.upload_btn .upload{background-color:steelblue;} 
.upload_btn a{margin-left:20px; background:#ccc;}
.photo_them{position:relative;margin-top:20px;width:100%;height:250px;background:#eee;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:20px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: steelblue;}
</style>

</head>
<body>

<%-- <div class = "test_img" style = "width: 600px; height: 600px;">
	<img class = "img" src = "${path}img/urine/이미지없음.jpg">
	
	<form method="post" id="fileUploadForm" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type = "file" name = "urine_img" class = "upload" id = "target">	
		<input type = "button" value = "선택완료" class = "filesub">
	</form>
</div> --%>

<form method="POST" enctype="multipart/form-data" id="fileUploadForm"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
<div class="photo_box">
  <div class="upload_btn">
    <div class="upload">
    	<input type="file" name="photoBtn" accept="image/jpeg, image/png" capture="camera" id="photoBtn"><label for="photoBtn">사진 첨부하기</label>
    </div>
  	<a href="javascript:void(0);" id="resetPhoto">다시 올리기</a>
  </div>
  <div class="photo_them">
    <div class="them_img">
    	<img id="image" src="${path}img/urine/이미지없음.jpg">
    </div>
  </div>
  <a href="javascript:void(0);" id="complete">업로드</a>
</div>
</form>
</body>
</html>