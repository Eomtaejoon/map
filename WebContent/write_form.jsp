<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" ...
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 입력 폼</title>
   <link href="m3.css" type=text/css rel=stylesheet>
<script>
function writeCheck() {
   var form = document.write_form;	
   if(!form.b_name.value){
      alert("등록자를 입력하세요");
      form.b_name.focus();
      return ;
   }
   if(!form.b_pwd.value){
      alert("비밀번호를 입력하세요.");
      form.pwd.focus();
      return ;
   }
   if(!form.b_email.value){
      alert("E-Maill을 입력하세요.");
      form.b_email.focus();
      return ;
   }
   if(!form.b_title.value){
      alert("제목을 입력하세요.");
      form.b_title.focus();
      return ;
   }
   if(!form.b_content.value){
      alert("내용을 입력하세요.");
      form.b_content.focus();
      return;
   }
   form.submit();
}
</script>
</head>

<body topmargin=0 leftmargin=0 bgcolor=white>
<center><br>
<form method=post action="write.jsp" name=write_form>
<table border=1 width=550 height=30>
   <tr>
      <th align=center><b>[ 게 시 물 ] 쓰  기</b></th>
   </tr>
</table>
<table width=550 border=1>
   <tr>
      <td bgcolor=#ffff33>등 록 자 *</td>
      <td align=left><input type="text" name="b_name" size=20 maxlength=20></td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>비밀번호 *</td>
      <td align=left><input type="password" name="b_pwd" size=20 maxlength=20></td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>E-Mail주소  *</td>
      <td align=left><input type="text" name="b_email" size=30 maxlength=30></td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>제   목 *</td>
      <td align=left><input type="text" name="b_title" size=40 maxlength=40></td>
   </tr>
   <tr>
      <td bgcolor=#ffff33>내  용 *</td>
      <td>
      <table>
      <tr>
         <td><textarea cols=54 rows=10 name="b_content"> </textarea></td>
      </tr>
      </table>
      </td>
   </tr>
   <tr>
      <td colspan=2> * 표시는 반드시 입력하세요!!! </td>
   </tr>
</table>
<table>
   <tr>
      <td colspan=4 align=right height=25>
         <a href="javascript:writeCheck()"><img src="img/b_save.gif" border=0></a>
         <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
      </td>
   </tr>
</table>
</form></center>
</body>
</html>
