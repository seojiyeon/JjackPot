<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <h2>즐겨찾기 추가</h2>
   <body>

 
   <form>
<table border="1" width="900"  cellpadding="0" cellspacing="0" align="center"> 
  


<c:if test="${check==0}">
 <c:redirect url="addfav.jp"/>
</c:if>

      <c:if test="${check==1}">
	    <script> 
	  alert("즐겨찾기에 이미 있습니다.");
      history.go(-1);
	   </script>
     
      </c:if>
  
 <c:if test="${check==2}">
	<script> 
	  alert("자기자신은 추가 안됩니다.");
      history.go(-1);
	</script>
</c:if>

  </table>
 </form>
  </html>
  </body> 