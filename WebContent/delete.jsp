<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="pwd" value="${param.pwd}" />

<sql:query var="rs" dataSource="jdbc/OracleDB">
     select b_pwd from board where  b_id=?
     <sql:param value="${param.b_id}" />
</sql:query>

<c:forEach items="${rs.rows}" var="rs1" varStatus="status">
     <c:set var="b_pwd" value="${rs1.b_pwd}" />
</c:forEach>
<c:choose>
   <c:when test="${pwd != b_pwd}">
      <script>
         alert("비밀번호가 틀립니다. 다시 입력하세요!!!");
         history.back();
      </script>
   </c:when>
   <c:otherwise>
      <sql:update dataSource="jdbc/OracleDB">
           delete from board where b_id=?
           <sql:param value="${param.b_id}" />
      </sql:update>
      <c:redirect url="board_list.jsp" />
   </c:otherwise>
</c:choose>
