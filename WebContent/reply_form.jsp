<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select b_title, b_content, b_ref, b_order, b_order 
     from   board
     where  b_id=?
     <sql:param value="${param.b_id}" />
</sql:query>

<c:forEach items="${rs.rows}" var="rs1" varStatus="status">
     <c:set var="b_title"     value="${rs1.b_title}" />
     <c:set var="b_content"   value="${rs1.b_content}" />
     <c:set var="b_ref"       value="${rs1.b_ref}" />
     <c:set var="b_step"      value="${rs1.b_step}" />
     <c:set var="b_order"     value="${rs1.b_order}" />
</c:forEach>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" ...
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 입력 폼</title>
     <link href="m3.css" type=text/css rel=stylesheet>
<script>
function go_reply() {
   var form = document.reply_form;
   if(!form.name.value){
      alert("등록자 이름을 입력하세요");
      form.name.focus();
      return ;
   }
   if(!form.pwd.value){
      alert("비밀번호를 입력하세요");
      form.pwd.focus();
      return ;
   }
   if(!form.email.value){
      alert("eMail 주소를  입력하세요");
      form.email.focus();
      return ;
   }
   form.submit();
}
</script>
</head>

<body topmargin=0 leftmargin=0 bgcolor=white>
<center><br>
<form method="post" action="reply.jsp" name="reply_form" >
<table border=1 width=550 height=30>
   <tr>
      <th align=center><b>[게시물] 답 변</b></th>
   </tr>
</table>
<table width="550" border="1" cellspacing="0" cellpadding="0">
   <tr>
      <td align=center bgcolor=#ffff33>등록자 *</td>
      <td align="left">
      <input type="text" name="name" size=20 ></td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>비밀번호 *</td>
      <td align="left">
      <input type="password" name="pwd" size=20 value=""></td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>E-Mail주소 *</td>
      <td align="left">
      <input type="text" size=30 name="email" value=""></td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>제 목 *</td>
      <td align="left">
      <input type="text" size=40 name="title" value="[답변: ${b_title} ]"></td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>내 용 *</td>
      <td>
      <table>
      <tr>
         <td><textarea cols=54 rows=10 name="content">${b_content} </textarea></td>
      </tr>
      </table>
      </td>
   </tr>
   <tr>
      <td colspan=2> * 표시 는 반드시 입력하세요!!! </td>
   </tr>
</table>
<table>
   <tr>
      <td>
      <a href="javascript:go_reply()"><img src="img/b_reply.gif" border=0></a>
      <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
      </td>
   </tr>
</table>
   <input type="hidden" name="b_id"    value="${param.b_id}">
   <input type="hidden" name="b_ref"   value="${b_ref}">
   <input type="hidden" name="b_step"  value="${b_step}">
   <input type="hidden"  name="b_order"  value="${b_order}">
</form></center>
</body>
</html>
