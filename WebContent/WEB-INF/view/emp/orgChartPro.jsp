<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <h2>즐겨찾기 추가</h2>
   <body>
   <from>
 
  
   
<c:if test="${check==0 }">

 <c:redirect url="addfav.jp"/>

  </c:if>
  
  
   <c:if test="${check!=0 }">
	<script> 
	  alert("즐겨찾기에 이미 있습니다.");
      history.go(-1);
	</script>
</c:if>
  
  
  </html>
  </from>
  </body> 