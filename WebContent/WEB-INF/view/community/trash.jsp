<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
<html>
<head>
<title>답글 삭제</title>
</head>

<c:if test="${check==1 }">

 
    <c:redirect url="content.jp?com_num=${com_num}">
     </c:redirect>
     
  </c:if>
  
   <c:if test="${check!=1 }">
	<script> 
	  alert("자신이 쓴 답글이 아닙니다.");
      history.go(-1);
	</script>
</c:if>
  
  
  </html>
  
  


