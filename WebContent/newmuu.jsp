<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function geoFindMe() {

  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>������� �������� ���������̼��� �������� �ʽ��ϴ�.</p>";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = '<p>���� : ' + latitude + '�� <br>�浵 : ' + longitude + '��</p>';

    var img = new Image();
    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    output.appendChild(img);
  };

  function error() {
    output.innerHTML = "������� ��ġ�� ã�� �� �����ϴ�.";
  };

  output.innerHTML = "<p>Locating��</p>";
  navigator.geolocation.getCurrentPosition(success, error);

}
</script>
</head>
<body>
<p><button onclick = "geoFindMe()">�� ��ġ</button></p>
<div id = "out"></div>
</body>
</html>