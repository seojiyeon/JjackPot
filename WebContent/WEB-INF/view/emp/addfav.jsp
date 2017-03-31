<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>   

   <body>
  <table border="1" width="900"  cellpadding="0" cellspacing="0" align="center">
   
   
    <c:forEach var="article" items="${favList}" varStatus="status">
  
   ${article.empfav}
   


   
   </c:forEach>
   
   
   
   
 
    
    </table>
    </body>
    