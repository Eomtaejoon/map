<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>getCurrentPosition</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   if (navigator.geolocation){
         navigator.geolocation.getCurrentPosition(showPosition1);
   }else{
         $("#setPosition").html("Geolocation is not supported by this browser.");
   }
   function showPosition1(position){
      $("#setPosition").html("위도: " + position.coords.latitude + "<br />경도: " + position.coords.longitude);
   }
//-->
</script>
</head>
<body>
<p id="setPosition"></p>
</body>
</html>