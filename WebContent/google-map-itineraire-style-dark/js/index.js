
var directionDisplay;

  var directionsService = new google.maps.DirectionsService();
  var map;
  $(function(){
	$('#submit').click(function(){
		calcRoute();
	});
   calcRoute();
	initialize();
  });
  // initialize the Google Map API.
  function initialize() {
  var styleArray = [
    {
      stylers: [
        { visibility: "off" }
      ]
    },
    {
      featureType: "water",
      elementType: "geometry",
      stylers: [
        { visibility: "on" },
        { color: "#000000" },
        { lightness: 17 }
      ]
    },
    {
      featureType: "landscape",
      elementType: "geometry",
      stylers: [
        { visibility: "on" },
        { color: "#000000" },
        { lightness: 20 }
      ]
    },
    {
      featureType: "landscape",
      elementType: "labels",
      stylers: [
        { visibility: "on" },
        { color: "#000000" },
        { lightness: 16 }
      ]
    },
    {
      featureType: "road.highway",
      elementType: "geometry.fill",
      stylers: [
        { visibility: "on" },
        { color: "red" },
        { lightness: 100 }
      ]
    },
    {
      featureType: "road.highway",
      elementType: "labels.text.fill",
      stylers: [
        { visibility: "on" },
        { saturation: 36 },
        { color : "#000000" },
        { lightness : 16 }
      ]
    },
    {
      featureType: "road.highway",
      elementType: "labels.icon",
      stylers: [
        { visibility: "on" }
      ]
    },
    {
      featureType: "road.arterial",
      elementType: "geometry",
      stylers: [
        { visibility: "on" },
        { color : "#000000" },
        { lightness : 16 }
      ]
    },
    {
      featureType: "road.arterial",
      elementType: "labels.text",
      stylers: [
        { visibility: "on" },
        { color: "#ffffff" },
        { lightness: 16 }
      ]
    },
    {
      featureType: "road.arterial",
      elementType: "labels.text.fill",
      stylers: [
        { saturation: 6 },
        { color : "#ffffff" },
        { lightness : 40 }
      ]
    },
    {
      featureType: "road.local",
      elementType: "geometry.fill",
      stylers: [
        { visibility: "on" },
        { color: "#000000" },
        { lightness: 90 }
      ]
    },
    {
      featureType: "administrative.locality",
      elementType: "labels.text",
      stylers: [
        { visibility: "on" },
        { color: "#000000" },
        { lightness: 16 }
      ]
    },
    {
      featureType: "administrative.locality",
      elementType: "labels.text.fill",
      stylers: [
        { visibility: "on" },
        { color: "#ffffff" },
        { lightness: 100 }
      ]
    }
  ];
    directionsDisplay = new google.maps.DirectionsRenderer();
    var Paris = new google.maps.LatLng(48.856614, 2.352222);
    var mapOptions = {
      zoom:15,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: Paris,
      styles: styleArray
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);
  }

  //Find the Start and End Destination on google Map
  function calcRoute() {
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;
    var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
        directionsDisplay.setPanel(document.getElementById("route"));
      }
    });
  }