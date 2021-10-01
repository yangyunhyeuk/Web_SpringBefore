<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글맵 실습</title>
<style type="text/css">
* {
	margin: 5px;
	padding: 5px;
}

#map {
	border: 2px solid black;
	width: 500px;
	height: 300px;
}
</style>
<script
	src="http://maps.google.com/maps/api/js?key=APIKEY&region=kr"></script>
</head>
<body>
	<div id="map"></div>
	<button id="btn1">지도변경1</button>
	<button id="btn2">지도변경2</button>
	<button id="btn3">다중마크업</button>

	<script type="text/javascript">
		// 다중마크업 표시될 정보

		//버튼등록
		var btn1 = document.getElementById("btn1");
		var btn2 = document.getElementById("btn2");
		var btn3 = document.getElementById("btn3");

		btn1.addEventListener("click", changeMap1);
		btn2.addEventListener("click", changeMap2);
		btn3.addEventListener("click", multipleMarker);

		// 다중마크업
		// 코리아it : 37.50003 127.03559
		// 502커피로스터 역삼점 : 37.49974 127.03475
		// 스타벅스 역삼점역점 : 37.50070 127.03527 
		// 바나프레소 역삼GFC점  37.49960 127.03580
		var cafeIcon = new google.maps.MarkerImage("img/cafemarker.png")
		function multipleMarker() {
			// 다중마크업 표시될 정보
			var location = [ {
				place : "502커피로스터역삼점",
				lat : 37.49974,
				lng : 127.03475
			}, {
				place : "스타벅스역삼역점",
				lat : 37.50070,
				lng : 127.03527
			}, {
				place : "바나프레소역삼GFC점",
				lat : 37.49960,
				lng : 127.03580
			} ];
			for (var i = 0; i < location.length; i++) {
				var marker = new google.maps.Marker({
					map : map,
					position : new google.maps.LatLng(location[i].lat,
							location[i].lng),
					label : location[i].place,
					icon : cafeIcon
				});
			}
		}

		//지도의 중심을 변경하는 작업 
		function changeMap1() {
			var ll = {
				lat : 33.369515,
				lng : 126.564646
			};
			map.panTo(ll);
			map.setZoom(9);
		}

		//새로운 지도 로드
		function changeMap2() {
			var ll = {
				lat : -40.339098,
				lng : 175.609729
			};
			map = new google.maps.Map(document.getElementById("map"), {
				zoom : 13,
				center : ll
			});
		}

		// GoogleMAP 등록
		var map; //편의상 map변수 선언
		function initMap() {
			var ll = {
				lat : 37.50003,
				lng : 127.03559
			}; // 위도 : latitude (lat) //경도 : longitude (lng)
			map = new google.maps.Map // Map(어디에,무엇을)  
			(document.getElementById("map"), {
				zoom : 17,
				center : ll
			} //center라는 속성은 맵에서 내 현재위치를 표시하는 화살표 같은것 
			); // zoom: 숫자가 클수록 확대가된다.
			new google.maps.Marker({
				position : ll,
				map : map,
				label : "내현재위치"
			});//마커 추가
		}
		initMap(); // 선언즉시 맵 생성
	</script>
</body>
</html>
