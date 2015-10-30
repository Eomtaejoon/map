<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8" />
<c:set var="ip" value="<%= request.getRemoteAddr()%>" />

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select max(b_id) as mid, max(b_ref) as mref from board
</sql:query>

<c:forEach items="${rs.rows}" var="rs" >
     <c:set var="bid" value="${rs.mid + 1}" />
     <c:set var="ref" value="${rs.mref + 1}" />
</c:forEach>
<c:if test="${empty bid}"><c:set var="bid" value="${1}" /></c:if>

<sql:update dataSource="jdbc/OracleDB">
    insert into board
    (b_id, b_name, b_pwd, b_email, b_title, b_content, b_ip, b_ref, b_step, b_order) 
    values
    (?,?,?,?,?,?,?,?,0,0)
    <sql:param value="${bid}" />
    <sql:param value="${param.b_name}" />
    <sql:param value="${param.b_pwd}" />
    <sql:param value="${param.b_email}" />
    <sql:param value="${param.b_title}" />
    <sql:param value="${param.b_content}" />
    <sql:param value="${ip}" />
    <sql:param value="${ref}" />
</sql:update>
<c:redirect url="board_list.jsp" />
