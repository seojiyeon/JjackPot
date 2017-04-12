<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

  <form>
<table border="1" width="900"  cellpadding="0" cellspacing="0" align="center"> 
  
<c:if test="${check==0}">
 <c:redirect url="UpVote.jp"/>
</c:if>

      <c:if test="${check==1}">
	    <script> 
	  alert("이미 투표하였습니다.");
      history.go(-1);
	   </script>
     
      </c:if>



</table>
</form>