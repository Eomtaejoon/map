<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>ī�װ��� ��� �˻��ϱ�</title>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
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
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}

</style>

</head>
<body>
<div id="asd" style = "display: none" >

<% String a = request.getParameter("aaaa");
String b = request.getParameter("bbbb");
String c = request.getParameter("cccc");
request.
setCharacterEncoding("euc-kr");
%>
<input type="text" name="aaa" id="aaaa" value="<%= a %>"><br>
<input type="text" name="bbb" id="bbbb" value="<%= b %>"><br>
<input type="text" name="ccc" id="cccc" value="<%= c %>"><br>

</div>
<form action="daummap.html"  name = "google_s">
       <p>           
         <input type="submit" name = "back" value="���" />
       </p>
     </form>
<div class="map_wrap">
    <div id="map" style="width:500px;height:500px;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            ����
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            ��Ʈ
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            �౹
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            ������
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            ī��
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            ������
        </li>      
    </ul>
</div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=e1ed9582bd6392c362316ba1da643322&libraries=services"></script>


<script>

// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�

var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
    markers = [], // ��Ŀ�� ���� �迭�Դϴ�
    currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(document.getElementById("aaaa").value, document.getElementById("bbbb").value), // ������ �߽���ǥ
        level: Number(document.getElementById("cccc").value)  // ������ Ȯ�� ����
        
    };  

// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 
if (navigator.geolocation) {
	
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
    	
        var lat = document.getElementById("aaaa").value, //position.coords.latitude, // ����
            lon = document.getElementById("bbbb").value;//position.coords.longitude; // �浵
            
            circlego(lat,lon);
        var sa;
            var sa1 =sa.getParameter("atat");
            alert(sa1);
        var locPosition = new daum.maps.LatLng(lat, lon),
         message = '<div style="padding:5px;">������ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
        
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);

    });
}
function circlego(lat, lon){
	var circle = new daum.maps.Circle({
	    center : new daum.maps.LatLng(lat, lon),  // ���� �߽���ǥ �Դϴ� 
	    radius: 500, // ���� ������ ���� �������Դϴ� 
	    strokeWeight: 5, // ���� �β��Դϴ� 
	    strokeColor: '#75B8FA', // ���� �����Դϴ�
	    strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
	    strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
	    fillColor: '#CFE7FF', // ä��� �����Դϴ�
	    fillOpacity: 0.7  // ä��� ������ �Դϴ�  
	}); 

	// ������ ���� ǥ���մϴ� 
	circle.setMap(map); 

	
}
function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // ���������쿡 ǥ���� ����
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}
// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places(map); 

// ������ idle �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'idle', searchPlaces);

// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
contentNode.className = 'placeinfo_wrap';

// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� daum.maps.event.preventMap �޼ҵ带 ����մϴ� 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// Ŀ���� �������� �������� �����մϴ�
placeOverlay.setContent(contentNode);  

// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
addCategoryClickEvent();

// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {
    
    // Ŀ���� �������̸� ����ϴ� 
    placeOverlay.setMap(null);

    if (!currCategory) {
        return;
    }
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB( status, data, pagination ) {
    if (status === daum.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
        displayPlaces(data.places);
    } 
}

// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    // ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
    // �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
    var order = document.getElementById(currCategory).getAttribute('data-order');

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {

            // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
            var marker = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order);

            // ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
            // ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, order) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(46, (order*36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   

    if (place.newAddress) {
        content += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
                    '  <span class="jibun" title="'
                    + place.address + '">(���� : ' + place.address + ')</span>';
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


// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
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

// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
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
var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.

// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�
daum.maps.event.addListener(map, 'click', function(mouseEvent) {

    // ���콺�� Ŭ���� ��ġ�Դϴ� 
    var clickPosition = mouseEvent.latLng;

    // ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�
    if (!drawingFlag) {
    	
        // ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�
        drawingFlag = true;
        
        // ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteClickLine();
        
        // ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteDistnce();

        // ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteCircleDot();
    
        // Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
        clickLine = new daum.maps.Polyline({
            map: map, // ���� ǥ���� �����Դϴ� 
            path: [clickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
            strokeWeight: 3, // ���� �β��Դϴ� 
            strokeColor: '#db4040', // ���� �����Դϴ�
            strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
        });
        
        // ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
        moveLine = new daum.maps.Polyline({
            strokeWeight: 3, // ���� �β��Դϴ� 
            strokeColor: '#db4040', // ���� �����Դϴ�
            strokeOpacity: 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�    
        });
    
        // Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
        displayCircleDot(clickPosition, 0);

            
    } else { // ���� �׷����� �ִ� �����̸�

        // �׷����� �ִ� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();

        // ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
        path.push(clickPosition);
        
        // �ٽ� ���� ��ǥ �迭�� �����Ͽ� Ŭ�� ��ġ���� ���� �׸����� �����մϴ�
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        displayCircleDot(clickPosition, distance);
    }
});
    
// ������ ���콺���� �̺�Ʈ�� ����մϴ�
// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

    // ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
    if (drawingFlag){
        
        // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
        var mousePosition = mouseEvent.latLng; 

        // ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();
        
        // ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
        var movepath = [path[path.length-1], mousePosition];
        moveLine.setPath(movepath);    
        moveLine.setMap(map);
        
        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
            content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�
        
        // �Ÿ������� ������ ǥ���մϴ�
        showDistance(content, mousePosition);   
    }             
});                 

// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

    // ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
    if (drawingFlag) {
        
        // ���콺����� �׷��� ���� �������� �����մϴ�
        moveLine.setMap(null);
        moveLine = null;  
        
        // ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();
    
        // ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
        if (path.length > 1) {

            // ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }

            var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
                content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�
                
            // �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
            showDistance(content, path[path.length-1]);  
             
        } else {

            // ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
            // ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
            deleteClickLine();
            deleteCircleDot(); 
            deleteDistnce();

        }
        
        // ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
        drawingFlag = false;          
    }  
});    

// Ŭ������ �׷��� ���� �������� �����ϴ� �Լ��Դϴ�
function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
function showDistance(content, position) {
    
    if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�
        
        // Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
        distanceOverlay.setPosition(position);
        distanceOverlay.setContent(content);
        
    } else { // Ŀ���� �������̰� �������� ���� �����̸�
        
        // Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
        distanceOverlay = new daum.maps.CustomOverlay({
            map: map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
            content: content,  // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
            position: position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3  
        });      
    }
}

// �׷����� �ִ� ���� �ѰŸ� ������ 
// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
function displayCircleDot(position, distance) {

    // Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
    var circleOverlay = new daum.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // ������ ǥ���մϴ�
    circleOverlay.setMap(map);

    if (distance > 0) {
        // Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
        var distanceOverlay = new daum.maps.CustomOverlay({
            content: '<div class="dotOverlay">�Ÿ� <span class="number">' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // ������ ǥ���մϴ�
        distanceOverlay.setMap(map);
    }

    // �迭�� �߰��մϴ�
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
function getTimeHTML(distance) {

    // ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

    // �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
    var bycicleTime = distance / 227 | 0;
    var bycicleHour = '', bycicleMin = '';

    // ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>�ð� '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>��'

    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">����</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">������</span>' + bycicleHour + bycicleMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}
</script>

</body>
</html>