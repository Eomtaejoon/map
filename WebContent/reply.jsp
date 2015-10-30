<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8" />
<c:set var="ip" value="<%= request.getRemoteAddr()%>" />

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select max(b_id) as maxid from board
</sql:query>

<c:forEach items="${rs.rows}" var="rs1" >
     <c:set var="b_id" value="${rs1.maxid + 1}" />
</c:forEach>

<c:set var="b_ref"   value="${param.b_ref}" />
<c:set var="b_step"  value="${param.b_step + 1}" />
<c:set var="b_order" value="${param.b_order + 1}" />

<sql:update dataSource="jdbc/OracleDB">
     update board 
     set    b_order = b_order+1 
     where  b_ref =? and b_order >= ?
     <sql:param value="${b_ref}" />
     <sql:param value="${b_order}" />
</sql:update>

<sql:update dataSource="jdbc/OracleDB">
     insert into board
     (b_id, b_pwd, b_name, b_email, b_title, b_content, b_ip, b_ref, b_step, b_order)
     values
     (?,?,?,?,?,?,?,?,?,?)
     <sql:param value="${b_id}" />
     <sql:param value="${param.pwd}" />
     <sql:param value="${param.name}" />
     <sql:param value="${param.email}" />
     <sql:param value="${param.title}" />
     <sql:param value="${param.content}" />
     <sql:param value="${ip}" />
     <sql:param value="${b_ref}" />
     <sql:param value="${b_step}" />
     <sql:param value="${b_order}" />
</sql:update>

<c:redirect url="board_list.jsp" />
