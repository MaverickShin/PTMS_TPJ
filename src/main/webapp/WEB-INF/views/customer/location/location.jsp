<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../main/header.jsp" %>

	    	<div class="container">
	    		<img src="${path}img/location/weather.png" width="1500px" height="300px" name="weatherImg">
	    	</div>
	<div class="col-md-5 d-flex align-items-stretch">
		
	</div>
	<div id="map" class="map"></div>

<%@ include file="../../main/footer.jsp" %>	
</body>
</html>