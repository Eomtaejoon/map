<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select b_id, b_pwd, b_name, b_email, b_title, b_content, 
            to_char(b_date,'yyyy-mm-dd') as bdate
     from   board
     where  b_id=?
     <sql:param value="${param.b_id}" />
</sql:query>

<c:forEach items="${rs.rows}" var="rs1" varStatus="status">
     <c:set var="b_name"      value="${rs1.b_name}" />
     <c:set var="b_email"     value="${rs1.b_email}" />
     <c:set var="b_title"     value="${rs1.b_title}" />
     <c:set var="b_content"   value="${rs1.b_content}" />
     <c:set var="b_date"      value="${rs1.bdate}" />
</c:forEach>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" ...
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제글보기화면</title>
   <link href="m3.css" type=text/css rel=stylesheet>
<head>
<script>
  function  go_delete(){
   var form = document.delete_form;
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
<center><br>
<form method="post" action="delete.jsp" name="delete_form" >
<table border=1 width=550>
   <tr>
      <td align=center><b>[게시물] 삭  제 </b></td>
   </tr>
</table>
<table width="550" border=1>
   <tr>
      <td align=center bgcolor=#ffff33>등록자</td>
      <td align=left>${b_name}</td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>등록일</td>
      <td align=left>${b_date}</td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>E-Mail 주소</td>
      <td align=left>${b_email}</td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>제 목</td>
      <td align=left>${b_title}</td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>내 용</td>
      <td><table>
      <tr>
      <td><textarea cols=54 rows=10>${b_content}</textarea></td>
      </tr>
      </table>
      </td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>비밀번호 *</td>
      <td align="left">
      <input type="password" name="pwd" size=20 >
      </td>
   </tr>
   <tr>
      <td colspan=2> * 표시 는 반드시 입력하세요!!! </td>
   </tr>
</table>
<table>
   <tr>
      <td align="right">
       <a href="javascript:go_delete()"><img src="img/b_delete.gif" border=0></a>
       <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
       <input type="hidden" name="b_id" value="${param.b_id}"> 
      </td>
   </tr>
   </table>
</form></center>
</body>
</html>
