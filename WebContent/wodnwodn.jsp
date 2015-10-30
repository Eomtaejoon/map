<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml"> 
 <head>   
 <meta http-equiv="content-type" content="text/html; charset=euc-kr"/>
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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script> 
     <script type="text/javascript">
    
    
     var map
     
     var geocoder;
     var gmap;
     var mymap
    var lat,lng;
    
   function initialize() {
      navigator.geolocation.getCurrentPosition(GetLocation,
      {maximumAge:0, enableHighAccuracy:true});
      function GetLocation(location){
         lat = location.coords.latitude;
         lng = location.coords.longitude;
         
         mymap=document.getElementById("map_canvas");
         var latlng = [
            [lat,lng,"현재위치","http://google-maps-icons.googlecode.com/files/walking-tour.png"],
            [36.833293,127.149001,"두정역","http://sstatic.naver.net/search/img2/ico_cafeqna.gif"],
            [36.836321,127.146917,"두정초등학교","http://sstatic.naver.net/search/img2/ico_cafeqna.gif"]
         ];
         
         showMap(latlng);
        
      }
   }
         
  
   function showMap(latlng)
   {
	  
	   gmap = new google.maps.Map(
	            mymap,{zoom:14, left:new google.maps.LatLng(latlng[0][0], latlng[0][1]),center:new google.maps.LatLng(latlng[0][0], latlng[0][1]), mapTypeId:google.maps.MapTypeId.ROADMAP}
	         );
	         
	         var marker,i;
	         for(i=0;i<latlng.length;i++){
	            marker = new google.maps.Marker({
	               position:new google.maps.LatLng(latlng[i][0],latlng[i][1]),
	               map:gmap, title:latlng[i][2], icon:latlng[i][3]
	            });
	         }
	   
   }
 // 맵정보
  
     function gogo() {
    	 alert("시바라아어ㅐ");
        
         
         
         var address = document.forms[0].q.value;
         var marker = null;
         
         var geocoder = new google.maps.Geocoder();
         geocode
         
         r.geocode( { 'address': address},function(results, status) {
        	 
            if (status == google.maps.GeocoderStatus.OK) {
                     	
                     	
          	 var latlng = [
            	               [results[0].geometry.location.lat(),results[0].geometry.location.lng(),"현재위치","http://google-maps-icons.googlecode.com/files/walking-tour.png"]
            	          ];	 
          	
          
         	alert(results[0].geometry.location.lat() +','+ results[0].geometry.location.lng());
          	 
         	showMap(latlng);
            }
         });
     }
  
        
     </script>
   </head>
  
 <body onload="initialize()">
 <form onsubmit="showLocation();" method = "post" name = "google_s">
       <p>
         <b>주소입력:</b>
         <input type="text" name="q"  class="address_input" size="40"/>           
         <input type="button" id="button1" onclick="gogo();" value="버튼1"/>
       </p>
     </form>
     <div id="map_canvas" style="width: 500px; height: 400px">
 
  </div>
  </body>
 </html>