<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>편의기능</title>
	<script src="https://kit.fontawesome.com/5d238a51aa.js" crossorigin="anonymous"></script>
<script>
const apiKey = "5919a06844059487fee67afcf1a1af26";
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul"+"&appid="+apiKey+"&lang=kr";
var imgURL = "";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );   
        imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
        
        var temp = resp.main.temp- 273.15;
        $("#result_img").attr("src", imgURL);
        $("#h1").append(temp.toFixed(1)+'<i class="fas fa-thermometer-quarter fa-1x" style = "margin-left: 10px;"></i>');
        $("#h2").append(resp.weather[0].main);
        $("#h3").append(resp.name+","+resp.sys.country);
        $("#h4").append(resp.wind.speed+'<span>m/s</span>');
        $("#h5").append(resp.main.humidity+'<span>%</span>');
        $("#h6").append(resp.clouds.all+'<span>%</span>');
    }
});

</script>
<style>
	.bottom {
		display:flex;
		justify-content:between;
		flex:1;
		color: #0277bd;
	}
	
	.bottom_div {
		width: 110px;
		text-align:center;
	}
	
	.bottom_div i {
		width: 30px;
		height: 30px;
		color: #0277bd;
		line-height: 50px;
	}
	
	.bottom_div p {
		color: #0277bd;
		font-weight: bolder;
		line-height: 50px;
	}
	
	#result {
		border: 2px solid #01579b;
		padding:0;
	}
	
	.weather_tb {
		text-align:center;
		background-color: #0277bd;
		width: 100%;
		padding:0;
		margin:0;
		border: hidden;
		border-collapse : collapse;
		border-spacing: 0;
	}
	
	.weather_tb td h5,i{
		color: white;
	}
	
	.weather_tb td {
		height: 50px;
	}
	
	.weather td h5 {
		font-weight: bolder;
	}
	
	.weather {
		padding:0;
		border:0;
		margin:0;
		background-color: #0277bd;
	}
</style>
</head>
<body>

	<%@ include file = "../../main/header.jsp" %>

	<div id = "result" style = "width:330px; height: 230px; margin-left:auto; margin-right:auto; margin-top: 50px;">
		<div class = "weather">
		
		<table class = "weather_tb">
			<tr>
				<td rowspan = "4"><i class="fas fa-smog fa-4x" style = "width: 150px; color:white;"></i></td>
			</tr>
			
			<tr>
				<td><h5 id = "h1"></h5></td>
			</tr>
			
			<tr>	
				<td><h5 id = "h2"></h5></td>
			</tr>
			
			<tr>
				<td><h5 id = "h3"></h5></td>
			</tr>
		</table>
		</div>
		<div class = "bottom">
			<div class = "bottom_div">
				<i class="fas fa-wind fa-2x"></i>
				<p id = "h4"></p>
			</div>
			
			<div class = "bottom_div">
				<i class="fas fa-tint fa-2x"></i>
				<p id = "h5"></p>
			</div>
			
			<div class = "bottom_div">
				<i class="fas fa-cloud fa-2x" style = "padding-right: 40px;"></i>
				<p id = "h6"></p>
			</div>
		</div>
	</div>

	<div id="map" style="width:600px;height:600px; margin-left:auto; margin-right:auto; margin-top: 30px; margin-bottom: 50px;"></div>

	<%@ include file = "../../main/footer.jsp" %>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3f081829ec2250ecac36edcd2f27812"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.53533, 126.96158), // 지도의 중심좌표
		        level: 5, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도 중심 좌표 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'center_changed', function () {
			console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});

		// 지도 확대 레벨 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'zoom_changed', function () {
			console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
		});

		// 지도 영역 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'bounds_changed', function () {
			var mapBounds = map.getBounds(),
				message = '지도의 남서쪽, 북동쪽 영역좌표는 ' +
							mapBounds.toString() + '입니다.';

			console.log(message);	
		});

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		});	

		// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
		kakao.maps.event.addListener(map, 'drag', function () {
			var message = '지도를 드래그 하고 있습니다. ' + 
							'지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
			console.log(message);
		});

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.53533, 126.96158), // 마커의 좌표
		    draggable : true, // 마커를 드래그 가능하도록 설정한다
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

		// 마커에 mouseover 이벤트를 등록한다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		    console.log('마커에 mouseover 이벤트가 발생했습니다!');
		});

		// 마커에 mouseout 이벤트 등록
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    console.log('마커에 mouseout 이벤트가 발생했습니다!');
		});

		// 마커에 dragstart 이벤트 등록
		kakao.maps.event.addListener(marker, 'dragstart', function() {
		    console.log('마커에 dragstart 이벤트가 발생했습니다!');
		});

		// 마커에 dragend 이벤트 등록
		kakao.maps.event.addListener(marker, 'dragend', function() {
		    console.log('마커에 dragend 이벤트가 발생했습니다!');
		});

		// 커스텀 오버레이를 생성하고 지도에 표시한다
		var customOverlay = new kakao.maps.CustomOverlay({
			map: map,
			content: '<div style="padding:0 5px;background:#fff;">1팀이에용 :D</div>', 
			position: new kakao.maps.LatLng(37.53533, 126.96158), // 커스텀 오버레이를 표시할 좌표
			xAnchor: 0.5, // 컨텐츠의 x 위치
			yAnchor: 0 // 컨텐츠의 y 위치
		});

	</script>
</body>
</html>