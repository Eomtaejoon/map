<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />


    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" ...
<html>
   <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>게시물수정폼</title>
     <link href="m3.css" type=text/css rel=stylesheet>
<script>
  function go_update(){
	var form = document.update_form;
	if(!form.pwd.value){
		alert("비밀번호를  입력하세요!!!");
		form.pwd.focus();
		return ;
	}
	form.submit();
   }
</script>
</head>

<body topmargin=0 leftmargin=0 bgcolor=white>
<center><p>
<form method="post" action="update.jsp" name="update_form">
<table border=1 width=550 height=30>
   <tr>
      <th align=center><b>[ 게 시 물 ] 수   정</b></th>
   </tr>
</table>
<table width=550 border=1>
   <tr>
      <td bgcolor=#ffff33>등록자</td>
      <td align="left">${boardlist1.b_name}</td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>등록일</td>
      <td align="left">${boardlist1.b_date}</td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>E-Mail주소 #</td>
      <td align="left">
      <input type="text" size=30 name="email" value="${boardlist1.b_email}"> </td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>제 목 #</td>
      <td align="left">
      <input type="text" size=40 name="title" value="${boardlist1.b_title}"></td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>내 용 #</td>
      <td>
      <table>
      <tr>
         <td><textarea cols=53 rows=10 name="content">${boardlist1.b_content} </textarea></td>
      </tr>
      </table>
      </td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>비밀번호 *</td>
      <td align="left">
         <input type="password" size=20 name="pwd" ></td>
   </tr>
   <tr>
      <td colspan=2> # 표시만 수정가능합니다. * 표시 는 반드시 입력하세요!!!</td>
   </tr>
</table>
<table>
   <tr>
      <td align=right>
      <a href="javascript:go_update()"><img src="img/b_edit.gif" border=0></a>
      <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
      </td>
   </tr>
</table>
   <input type="hidden" name="b_id" value="${param.b_id}">
</form></center>
</body>
</html>
