// gps 위치 정보 획득

function init_gps()
{
	// gps 위치 불러옴
	/* 
	 * <21.09.16 - update 내용> 
	 * 현재는 db에 gps 정보를 업데이트 할 수 없어서 임의의 고정 값을넣었지만,
	 * 추후에는 db에 실시간으로 업데이트되는 gps 정보를 가져올 예정
	 */
	var LatLng = new google.maps.LatLng(37.47874, 126.8792873);
	
	/*
	 * mapProp: 지도의 속성 지정
	 * center: 위치 선정 적용
	 * zoom: 확대 단계
	 * mapTypeId: 맵 타입을 설정
	 *   1) ROADMAP: normal 타입의 기본 2D map
	 *   2) Satellite: 위성 사진 맵
	 *   3) Hybrid: 위성 + 길 또는 지역 이름
	 *   4) Terrain: 산과 강 등과 함께 표시하는 맵
	 */
	var mapProp = {
			center: LatLng,	// 위치
			zoom:16,	// 어느정도까지 볼 것인지 설정, 지도 줌
			mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	
	// 맵을 담기위한 div를 생성 후, mapProp을 통해 설정한 맵을 적용
	var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
	
	// 지정 위치에 마커 찍기
	var marker = new google.maps.Marker({

		// 내가 선정한 위치
		position: LatLng,
		
		// 내가 생성한 맵
		map: map,
	})
}
google.maps.event.addDomListener(window,'load',init_gps)