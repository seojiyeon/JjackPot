<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>사원번호 중복확인</title>
<link href="/spring/css/style.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("euc-kr");%>
       <c:if test="${check ==true }">
<table width="270" border="0" cellspacing="0" cellpadding="5">

    <td height="39" > [${emp_num}]이미 사용중인 번호입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirm.jp">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
   
       다른 번호를 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="emp_num"> 
       <input type="submit" value="번호 중복확인">
    </td>
  </tr>
</table>
</form>
</c:if>
         <c:if test="${check==false }">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  
    <td align="center"> 
      <p>입력하신 [${emp_num}] 는 사용하실 수 있는 번호입니다. </p>
      <input type="button" value="닫기" onclick="setEMP()">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>  

<script language="javascript">

  function setEMP()
        {		
    	opener.document.userinput.emp_num.value="${emp_num}";
		self.close();
		}
		
</script>
