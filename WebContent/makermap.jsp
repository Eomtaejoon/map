<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
<style type="text/css">
html { height : 100% }
body { height : 100%; margin: 0; padding: 0 }
#map_canvas { height : 100% }
</style>

<script type = "text/javascript">


var map;
var infoWindow; // infoWindow Object를 담을 변수
var markers; // Marker Object를 담을 변수


function initialize_multiMarkers3(){

var latlng = new google.maps.LatLng(37.478034,127.184032); // 중앙지점 좌표값 입력 – 남한산성 로터리
var myOptions = {
zoom: 15,
center:latlng,
mapTypeId: google.maps.MapTypeId.ROADMAP
};

map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
// map 변수를 위에 광역으로 잡아줬으므로 var map으로 표기하지 않음


var image = "http://google-maps-icons.googlecode.com/files/restaurant.png"; // 새롭게 적용할 아이콘 이미지 *

var shadow = "http://google-maps-icons.googlecode.com/files/restaurant.png"; // 새롭게 적용할 아이콘 이미지의 그림자 *

//– 영역설정부분 시작
var polygoneCoords = [ // 영역설정을 위한 Polygon의 꼭지점 좌표
new google.maps.LatLng(37.486233,127.174387),
new google.maps.LatLng(37.482487,127.190523),
new google.maps.LatLng(37.47588,127.202797),
new google.maps.LatLng(37.466411,127.193098),
new google.maps.LatLng(37.473496,127.17782),
new google.maps.LatLng(37.480171,127.171211)
];

namhansanseongPolygon = new google.maps.Polygon({
paths: polygoneCoords,
strokeColor: "#FF0000", // 선의 색상
strokeOpacity: 0.8, // 선의 투명도
strokeWeight: 1, // 선의 굵기 px
fillColor: "#784d9d", // 채우기 색상
fillOpacity: 0.2 // 채우기 색상의 투명도
});

namhansanseongPolygon.setMap(map);
//– 영역설정부분 끝

markers = [

{	lat: 37.477549, lng: 127.184826,
name: "남한산성 새마을금고",
info: "<strong>남한산성 새마을금고<strong>"
},
{ lat: 37.478604, lng: 127.185416,
name: "남한산초등학교",
info: "<strong>남한산초등학교<strong><br/><a href='http://itta.co.kr' target=_blank>www.itta.co.kr</a>"
},
{ lat: 37.478681, lng: 127.183485,
name: "침괘정",
info: "<strong>침괘정<strong><br/><a href='http://naver.com' target=_blank>www.naver.com</a>"
},
{	lat: 37.477727, lng: 127.186221,
name: "남한산성 파출소",
info: "<strong>남한산성 파출소<strong><br/><a href='http://itta.co.kr' target=_blank>www.itta.co.kr</a>"
},
{ lat: 37.477387, lng: 127.187272,
name: "남한산성 정보센터",
info: "<strong>남한산성 정보센터<strong><br/><a href='http://itta.co.kr' target=_blank>www.itta.co.kr</a>"
},
];

// 마커 생성

for (index in markers) addMarker(markers[index]);

function addMarker(data) {

var marker = new google.maps.Marker({
position: new google.maps.LatLng(data.lat, data.lng),
map: map,
icon: image,
shadow: shadow,
title: data.name,
draggable:true, // Bounce

animation: google.maps.Animation.DROP // Bounce
});

var contentString = data.info;

var infowindow = new google.maps.InfoWindow({ content: contentString});

google.maps.event.addListener(marker, "click", function() {

if (marker.getAnimation() != null) { // Bounce

marker.setAnimation(null); 

} else { 

marker.setAnimation(google.maps.Animation.BOUNCE); 

}

infowindow.open(map,marker);
});
}

// 마커들의 위치에 맞게 보는 화면을 꽉차게 해주는 부분
// 마커와 관련 없는 부분이므로 제외해도 상관없음

var bounds = new google.maps.LatLngBounds();
for (index in markers) {
var data = markers[index];
bounds.extend(new google.maps.LatLng(data.lat, data.lng));
}

}
</script>
</head>

<body onload="initialize_MarkerChange()">
<div id="map_canvas" style="width:910px; height:750px">
</div>
</body>
</html>