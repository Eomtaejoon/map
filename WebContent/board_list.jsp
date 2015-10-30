<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

<!-- 페이지 네비게이션 변수 선언 -->
<c:set var="pageSize"     value="10" />
<c:set var="grpSize"      value="5" />
<c:set var="pageNUM"      value="1" />
<c:set var="pageCount"    value="1" />
<c:set var="skipRow"      value="1" />
<c:set var="dbCount"/>


<c:set var="dbCount" value="${rs1.rowCount}"/>

<!-- 총 페이지 수 계산 -->
<c:choose>
   <c:when test="${dbCount % pageSize == 0}">
      <c:set var="pageCount" value="${dbCount / pageSize}" />
   </c:when>
   <c:otherwise>
      <c:set var="pageCount" value="${dbCount / pageSize + 1}" />
   </c:otherwise>
</c:choose>

<!-- 요청페이지 번호 구하기 -->
<c:set var="reqPage" value="${param.pageNUM}" />
<c:choose>
   <c:when test="${reqPage == null}">
      <c:set var="reqPage" 	value="1" />
   </c:when>
   <c:otherwise>
      <c:set var="skipRow" value="${(reqPage - 1) * pageSize + 1}" />
   </c:otherwise>
</c:choose>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <title>게시판목록</title>
     <link href="m3.css" type=text/css rel=stylesheet>
   </head>
<body topmargin=0 leftmargin=0 bgcolor=white>
<center><br>
<table cellpadding=3 border=1 width=550>
   <tr height=30>
       <th width=420 align=center><b>자 유 게 시 판</b></th>
       <th width=130>총게시물 : ${dbCount}</th>
   </tr>
</table>
<table cellpadding=3 border=1 width=550> 
   <tr bgcolor=#ffff33 align=center>
       <th width="40">순번</th>
       <th width="270">제목</th>
       <th width="80">등록자</th>
       <th width="100">등록일</th>
       <th width="60">조회수</th>
   </tr>

<!-- 현재 페이지에 해당하는 게시물만 출력 -->
<c:if test="${reqPage != null}">
   <c:set var="seq_no" value="${(dbCount -(reqPage-1)*pageSize)}" />
</c:if>	 
<c:forEach var="rs" items="${rs.rows}" varStatus="vs">
   <tr bgcolor="#dddddd" onMouseOver=this.style.backgroundColor="#fff8de" onMouseOut=this.style.backgroundColor="#dddddd">
      <td align=center>${seq_no - (vs.count)+1}</td>
      <td><a href='show.jsp?b_id=${rs.b_id}'>${rs.b_title}</a></td>
      <td align=center>${rs.b_name}</td>
      <td align=center>${rs.bdate}</td>
      <td align=center>${rs.b_hit}</td>
   </tr>
</c:forEach>
</table>

<!-- 페이지 네비게이션 -->
<table width=550 border=0>
   <tr bgcolor=ffffff>
      <td width=400 align=center height=50>
      <c:set var="grpChk"    value="${(reqPage - 1) % grpSize}" />
      <c:set var="startPage" value="${reqPage - grpChk}"/>

      <c:if test="${(startPage - grpSize) > 0 }">
        <a href='board_list.jsp?pageNUM=${startPage - 1}'>[Prev]</a>
     </c:if>

     <c:forEach var="i" begin="${startPage}" 
                        end="${(startPage+grpSize) - 1}" step="1">
         <c:choose>
            <c:when test="${i == reqPage}">&nbsp;${i}&nbsp;</c:when>
            <c:when test="${i > pageCount}">
            <c:set var="i" value="${(startPage+grpSize) - 1}" />
            </c:when>
            <c:otherwise>
                <a href='board_list.jsp?pageNUM=${i}'> [${i}] </a>
            </c:otherwise>
         </c:choose>
      </c:forEach>

      <c:if test="${(startPage + grpSize) <= pageCount}">
        <a href='board_list.jsp?pageNUM=${startPage+grpSize}'> [Next]</a>
      </c:if>
      </td>
      <td width=150 height=30 valign=middle align=right>
        <a href="write_form.jsp"><img src="img/b_write.gif" border=0></a>
      </td>
   </tr>
</table></center>
</body>
</html>
