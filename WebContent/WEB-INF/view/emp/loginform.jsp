<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<title>로그인</title>

<form name="myform" action="loginPro.jp" method="post" onSubmit="return checkIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle"><STRONG>로그인</STRONG></TD></TR>
  
  <TR height="30">
    <TD width="110"  align=center>사원번호</TD>
    <TD width="150" align=center>
       <INPUT type="text" name="emp_num" size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110"align=center>비밀번호</TD>
    <TD width="150"  align=center>
      <INPUT type=pw name="pw"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle"  >
      <INPUT type=submit value="로그인"> 
      <INPUT type=reset value="다시입력">
      <input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jp'"></TD></TR>
</TABLE>
</form>

</BODY>

