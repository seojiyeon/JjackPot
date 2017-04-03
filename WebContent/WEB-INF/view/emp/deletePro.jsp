<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원탈퇴</title>
</head>

<c:if test="${check==1 }">

<form method="post" action="main.jp" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  
    <td height="39" align="center">
	  <font size="+1" ><b>회원정보가 삭제되었습니다.</b></font></td>
	  <input type="button" value="완료" onclick="window.location='loginform.jp'">
  </tr>
  </table>
  </form>
  </c:if>
  
  
   <c:if test="${check!=1 }">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>
  
  
  </html>
  