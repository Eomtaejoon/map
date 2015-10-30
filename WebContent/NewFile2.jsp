
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
 <meta name="description" content="지도에 주소표시 위도 경도 찾기 " />
 <meta name="keywords" content="위도, 경도, 구글맵API, 구글맵 주소표시"/>
 <meta name="robots" content="ALL">
 <meta name="revisit-after" content="1 week">
 <meta name="rating" content="general">
<style>
 body, p, input, button { font-family:Tahoma,굴림; font-size:9pt; color:#222222; }
 form { margin:0px; }
 </style>

   <script src="http://code.jquery.com/jquery-latest.min.js"></script>   
    <script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script> 
     <script type="text/javascript">
    
    
     
     var map;
     var geocoder;
    
    var lat,lng;
    
   function initialize() {
      navigator.geolocation.getCurrentPosition(GetLocation,
      {maximumAge:0, enableHighAccuracy:true});
      function GetLocation(location){
         lat = location.coords.latitude;
         lng = location.coords.longitude;
         
         var mymap=document.getElementById("map_canvas");
         var latlng = [
            [lat,lng,"현재위치","http://google-maps-icons.googlecode.com/files/walking-tour.png"],
            [36.833293,127.149001,"두정역","http://sstatic.naver.net/search/img2/ico_cafeqna.gif"],
            [36.836321,127.146917,"두정초등학교","http://sstatic.naver.net/search/img2/ico_cafeqna.gif"]
         ];
         var gmap = new google.maps.Map(
            mymap,{zoom:16, left:new google.maps.LatLng(latlng[0][0], latlng[0][1]),center:new google.maps.LatLng(latlng[0][0], latlng[0][1]), mapTypeId:google.maps.MapTypeId.ROADMAP}
         );
         
         var marker,i;
         for(i=0;i<latlng.length;i++){
            marker = new google.maps.Marker({
               position:new google.maps.LatLng(latlng[i][0],latlng[i][1]),
               map:gmap, title:latlng[i][2], icon:latlng[i][3]
            });
         }
      }
   }
         
  
 // 맵정보
    function addAddressToMap(response) {
       map.clearOverlays();
       if (!response || response.Status.code != 200) {
         alert("주소를 확인해주세요!");
       } else {
       
         place = response.Placemark[0];
         point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);
       
       
         marker = new GMarker(point);
        
       map.addOverlay(marker);
       
         marker.openInfoWindowHtml(
         '<b><b>위치</b></b><br>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
         '<b><주소></b><br>' + place.address);
       
       document.google_s.w.value = place.Point.coordinates[1];
       document.google_s.g.value = place.Point.coordinates[0];
       
         return place.Point.coordinates[2];
       }
     }
  
     function showLocation() {
       var address = document.forms[0].q.value;
       geocoder.getLocations(address, addAddressToMap);
     }
  
     function findLocation(address) {
       document.forms[0].q.value = address;
       showLocation();
     }
        
     </script>
   </head>
  
 <body onload="initialize()">
 <form  onsubmit="showLocation(); return false;" method = "post" name = "google_s">
       <p>
         <b>주소를 입력해주세요 : </b>
         <input type="text" name="q"  class="address_input" size="40"/>
         <input type = "text" name = "w" placeholder="위도가 표시됩니다." readonly style="background-color:gray;color:#545454">
         <input type = "text" name = "g" placeholder="경도가 표시됩니다." readonly style="background-color:gray;color:#545454">
         <input type="submit" name="find" value="Search" />
       </p>
     </form>
     <div id="map_canvas" style="width: 100%; height: 100%">
 
  </div>
  </body>
 </html>