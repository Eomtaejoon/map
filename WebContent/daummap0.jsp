<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bean.mapBean"%>
<%@page import="java.util.List"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% List <mapBean> boardList=(List)session.getAttribute("boardlist1"); 
request.setCharacterEncoding("euc-kr");
%>


<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>카테고리별 장소 검색하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {width:100%;height:500px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

.map_serch, .map_serch * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_serch a, .map_serch a:hover, .map_serch a:active{color:#000;text-decoration: none;}
.map_serch {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:-250px;left:0;bottom:0;height:200px;width:250px;margin:10px 0 30px 10px;padding:5px;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}

.customoverlay img {
max-width: 100% ;
width: expression(this.width > 70 ? 70: true) ;
height: auto ;
}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:0px;padding:10px 15px;font-size:14px;font-weight:bold;}

#container {overflow:hidden;height:500px;position:relative;}

#rvWrapper {width:50%;height:500px;top:0;right:0;position:absolute;z-index:0;}
#container.view_roadview .map_wrap {width: 50%;}
#roadviewControl {position:absolute;top:100px;left:5px;width:65px;height:24px;padding:2px;z-index: 1;background: #f7f7f7;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;cursor: pointer;}
#roadviewControl span {background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker.png) no-repeat;  padding-left:23px;height:24px;font-size: 12px;display: inline-block;line-height: 2;font-weight: bold;}
#roadviewControl.active {background: #ccc;box-shadow: 0px 1px #5F616D;border: 1px solid #7F818A;}
#roadviewControl.active span {background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker_on.png) no-repeat;color: #4C4E57;}
#close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
#close .img {display: block;background: url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}
</style>

</head>

<body >

<form action="daummap.jsp" method = "post" name = "google_s">
	
       <p>           
   	  <div id="qqq">
		
	  </div>
         <input type="submit" name="find" value="거리계산하기" onclick = "num();" />
       </p>
     </form>
     <div id="container">
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
<div class="map_wrap">
     <div id="map" style="width:100%;height:100%;overflow:hidden;"></div>
     <div id="roadviewControl" onclick="setRoadviewRoad()"><span>로드뷰</span></div>
    <ul id="category">   
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            보건소
        </li>     
        <li id="sm2" data-order="6"> 
            <span class="category_bg store"></span>
           제로존
        </li>        
    </ul>
</div>
</div>
<div class="map_serch">
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form onsubmit="gogo(); return false;">
                키워드 : <input type="text"  id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a95dd9327a3a37bad5a59ab83cf0cb5d&libraries=services"></script>


<script>

// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
var locPosition
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        circlego(lat,lon);
        locPosition = new daum.maps.LatLng(lat, lon),
         message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
          // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
	
    });
}

var overlayOn = false, // 지도 위에 로드뷰 오버레이가 추가된 상태를 가지고 있을 변수
container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
mapWrapper = document.getElementById('map_wrap'), // 지도를 감싸고 있는 div 입니다
mapContainer = document.getElementById('map'), // 지도를 표시할 div 입니다 
rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div 입니다
var rv = new daum.maps.Roadview(rvContainer); 

//좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
var rvClient = new daum.maps.RoadviewClient(); 

//로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
daum.maps.event.addListener(rv, 'position_changed', function() {

 // 현재 로드뷰의 위치 좌표를 얻어옵니다 
 var rvPosition = rv.getPosition();

 // 지도의 중심을 현재 로드뷰의 위치로 설정합니다
 map.setCenter(rvPosition);

 // 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
 if(overlayOn) {
     // 마커의 위치를 현재 로드뷰의 위치로 설정합니다
     marker.setPosition(rvPosition);
 }
});

//마커 이미지를 생성합니다
var markImage = new daum.maps.MarkerImage(
 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/roadview_wk.png',
 new daum.maps.Size(35,39), {
 //마커의 좌표에 해당하는 이미지의 위치를 설정합니다.
 //이미지의 모양에 따라 값은 다를 수 있으나, 보통 width/2, height를 주면 좌표에 이미지의 하단 중앙이 올라가게 됩니다.
 offset: new daum.maps.Point(14, 39)
});

//드래그가 가능한 마커를 생성합니다
var marker = new daum.maps.Marker({
 image : markImage,
 position: locPosition,
 draggable: true
});

//마커에 dragend 이벤트를 등록합니다
daum.maps.event.addListener(marker, 'dragend', function(mouseEvent) {

 // 현재 마커가 놓인 자리의 좌표입니다 
 var position = marker.getPosition();

 // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
 toggleRoadview(position);
});

//지도에 클릭 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent){
 
 // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
 if(!overlayOn) {
     return;
 }

 // 클릭한 위치의 좌표입니다 
 var position = mouseEvent.latLng;

 // 마커를 클릭한 위치로 옮깁니다
 marker.setPosition(position);

 // 클락한 위치를 기준으로 로드뷰를 설정합니다
 toggleRoadview(position);
});

//전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
//로드뷰를 설정하는 함수입니다
function toggleRoadview(position){
	
 rvClient.getNearestPanoId(position, 50, function(panoId) {
     // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
     if (panoId === null) {
         toggleMapWrapper(true, position);
     } else {
      toggleMapWrapper(false, position);

         // panoId로 로드뷰를 설정합니다
         rv.setPanoId(panoId, position);
     }
 });
}

//지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
function toggleMapWrapper(active, position) {
 if (active) {

     // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
     container.className = '';

     // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
     map.relayout();

     // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
     map.setCenter(position);
 } else {

     // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
     // 로드뷰가 함께 표시되게 합니다
     if (container.className.indexOf('view_roadview') === -1) {
         container.className = 'view_roadview';

         // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
         map.relayout();

         // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
         map.setCenter(position);
     }
 }
}

//지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
function toggleOverlay(active) {
	
 if (active) {
     overlayOn = true;

     // 지도 위에 로드뷰 도로 오버레이를 추가합니다
     map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

     // 지도 위에 마커를 표시합니다
     marker.setMap(map);

     // 마커의 위치를 지도 중심으로 설정합니다 
     marker.setPosition(map.getCenter());

     // 로드뷰의 위치를 지도 중심으로 설정합니다
     toggleRoadview(map.getCenter());
 } else {
     overlayOn = false;

     // 지도 위의 로드뷰 도로 오버레이를 제거합니다
     map.removeOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

     // 지도 위의 마커를 제거합니다
     marker.setMap(null);
 }
}

//지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
function setRoadviewRoad() {
 var control = document.getElementById('roadviewControl');

 // 버튼이 눌린 상태가 아니면
 if (control.className.indexOf('active') === -1) {
     control.className = 'active';

     // 로드뷰 도로 오버레이가 보이게 합니다
     toggleOverlay(true);
 } else {
     control.className = '';

     // 로드뷰 도로 오버레이를 제거합니다
     toggleOverlay(false);
 }
}

//로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
function closeRoadview() {
	
 var position1 = marker.getPosition();
 toggleMapWrapper(true, position1);
}
function circlego(lat, lon){
	
	
	var circle = new daum.maps.Circle({
	    center : new daum.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
	    radius: 500, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 3, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'line', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
	}); 

	// 지도에 원을 표시합니다 
	circle.setMap(map); 

	
}
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
    
}

function num(){
	
	   
	 var latlng = map.getCenter();
	 var lat1 = latlng.getLat();
	 var level = map.getLevel();
	 var lng1 = latlng.getLng();
	  
	  var addText1 = document.createElement("input");
		addText1.setAttribute("type","text");
		addText1.setAttribute("value",lat1);
		addText1.setAttribute("name","aaaa");
		document.getElementById("qqq").appendChild(addText1); 
		
		var addText2 = document.createElement("input");
		addText2.setAttribute("type","text");
		addText2.setAttribute("value",lng1);
		addText2.setAttribute("name","bbbb");
		document.getElementById("qqq").appendChild(addText2); 
	  
		 var addText3 = document.createElement("input");
			addText3.setAttribute("type","text");
			addText3.setAttribute("value",level);
			addText3.setAttribute("name","cccc");
			document.getElementById("qqq").appendChild(addText3); 
	 
	
	  

}

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    if (!currCategory) {
        return;
    }    if (currCategory === "sm2") {    	
    	  	smsm();
    }else{
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true});
    }
}



function smsm(){
	

	removeMarker();

		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		
	
<%
if( boardList != null){ 
for(int i=0;i<boardList.size();i++){
	mapBean bean = boardList.get(i);
  
 %> 
	var latlng = [ 
 {
     title: '<%=bean.getTitle()%>', 
     latlng: new daum.maps.LatLng(<%=bean.getLat()%>, <%=bean.getLng()%>)
 }
         

];
	
	        
 for(var i=0; i<latlng.length; i++){
		addMarker(latlng[i].latlng,latlng[i].title,<%=bean.getLat()%>,<%=bean.getLng()%>);
	  }                

		// 마커를 생성하고 지도위에 표시하는 함수입니다.
 <%} }%> 
		
		
		function addMarker(position, title,a,b) {
			

		  var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		  var imageSize = new daum.maps.Size(24, 35); 
		     var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		      position: position,
		      title : title,
		      image : markerImage, // 마커 이미지 
		      clickable: true
		    });
		
		    
                daum.maps.event.addListener(marker, 'click', function() {
                	
                	abd(map,position,title,a,b);
                });
          
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);		    
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
	
		}

		
		
		
 	}  
function abd(map,position,title,a,b){
	var content = '<div class="customoverlay">' +
    ' 	 <img src=tt.jpg >'+
    '    <span class="title">'+title+ ' <a href="http://www.naver.com" target="_blank"><strong>    태그요</strong></a></span>' +    
    '</div>' ;
// 커스텀 오버레이를 생성합니다
 	
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(a,b));
    placeOverlay.setMap(map); 
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {
	
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data.places);
    } 
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    // 지도에 표시되고 있는 마커를 제거합니다
    
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                	displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
    }  else {
        content += '    <span title="' + place.address + '">' + place.address + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.latitude, place.longitude));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
function gogo(){
	var markers = [];


	// 지도를 생성합니다    
	

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data.places);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === daum.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<1; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
	         
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	            

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].title);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.title + '</h5>';

	    if (places.newAddress) {
	        itemStr += '    <span>' + places.newAddress + '</span>' +
	                    '   <span class="jibun gray">' +  places.address  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=1; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	 
}
</script>

</body>
</html>