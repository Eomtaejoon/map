<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

<sql:update dataSource="jdbc/OracleDB">
     update board
     set    b_hit=b_hit+1
     where  b_id=?
     <sql:param value="${param.b_id}" />
</sql:update>

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select b_id, b_pwd, b_name, b_email, b_title, b_content, 
            to_char(b_date,'yyyy-mm-dd') as bdate
     from   board
     where  b_id=?
    <sql:param value="${param.b_id}" />
</sql:query>

<c:forEach items="${rs.rows}" var="rs1" varStatus="status">
   <c:set var="b_name"     value="${rs1.b_name}" />
   <c:set var="b_email"    value="${rs1.b_email}" />
   <c:set var="b_title"    value="${rs1.b_title}" />
   <c:set var="b_content"  value="${rs1.b_content}" />
   <c:set var="b_date"     value="${rs1.bdate}" />	
</c:forEach>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" ...
<html>
   <head>
   <title>게시물 읽기</title>
      <link href="m3.css" type=text/css rel=stylesheet>
   </head>

<body topmargin=0 leftmargin=0 bgcolor=white>
<center><br>
<table border=1 width=550>
   <tr>
      <td align=center><b>[게시물] 읽 기</b></td>
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
      <td align=left><a href="mailto:${b_email}">${b_email}</a></td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>제 목</td>
      <td align=left>${b_title}</td>
   </tr>
   <tr>
      <td align=center bgcolor=#ffff33>내 용</td>
      <td>
      <table>
      <tr>
         <td><textarea cols=54 rows=10>${b_content}</textarea></td>
      </tr>
      </table>
      </td>
   </tr>
</table>
<table>
   <tr>
      <td>
          <a href="reply_form.jsp?b_id=${param.b_id}"><img src= "img/b_re.gif" border=0></a>
          <a href="update_form.jsp?b_id=${param.b_id}"><img src= "img/b_modify.gif" border=0></a>
          <a href="delete_form.jsp?b_id=${param.b_id}"><img src= "img/b_delete.gif" border=0></a>
          <a href="board_list.jsp"><img src="img/b_list.gif" border=0></a>
      </td>
   </tr>
</table></center>
</BODY>
</HTML>
