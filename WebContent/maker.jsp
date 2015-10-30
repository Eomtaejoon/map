<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
 <meta http-equiv="content-type" content="text/html; charset=euc-kr"/>

  
<title>getCurrentPosition + marker </title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>  
    

<script type="text/javascript">
	var map1;
	var geocoder;
	var lat;
	var lng;

	 
   function fnGetCurrentPosition() {
        if (navigator.geolocation)
      {
         $("#latlng").html("");
         $("#errormsg").html("");
         navigator.geolocation.watchPosition (function (pos)
        		 
         {
        	
            lat = pos.coords.latitude; //위도
            lng = pos.coords.longitude; //경도
         

           $("#latlng").html("latitude : " + lat + "<br/> longitude : "+ lng); 

            var mapOptions = {
               zoom: 16,
               mapTypeId: google.maps.MapTypeId.ROADMAP,
               center: new google.maps.LatLng(lat,lng)
            };


            
            map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
			
            
            /*
            var myIcon = new google.maps.MarkerImage("http://google-maps-icons.googlecode.com/files/restaurant.png", null, null, null, new google.maps.Size(17,17));
            var marker = new google.maps.Marker({
               position: new google.maps.LatLng(lat,lng),
               map: map,
               draggable: false,
               icon: myIcon
            });
            markers.push(marker);
			*/
			
         },function(error)
         {
     	 
            switch(error.code)
            {
               case 1:
                  $("#errormsg").html("User denied the request for Geolocation.");
                  break;
               case 2:
                  $("#errormsg").html("Location information is unavailable.");
                  break;
               case 3:
                  $("#errormsg").html("The request to get user location timed out.");
                  break;
               case 0:
                  $("#errormsg").html("An unknown error occurred.");
                  break;
            }
         });
      }
      else
      {
         $("#errormsg").html("Geolocation is not supported by this browser.");
      }
   
      }

 
</script>
</head>
<body onload="fnGetCurrentPosition()">

 <form onsubmit="showLocation(); return false;" method = "post" name = "google_s">
       <p>
         <b></b><h2>adress insert :</h2></b>
         <input type="text" name="q"  class="address_input" size="40"/>
         <input type="submit" name="find" value="Search" />
       </p>
     </form>
<div id="map_canvas" style="width:760px;height:400px;margin-top:20px;"></div>
</body>
</html>