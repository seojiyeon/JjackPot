<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<table border="0" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post"  action= name="result" >
    <c:forEach var="article" items="${list}" varStatus="status">
    
   ${article.monhang}
    ${article.monhang2}
     <img src="/JackPot/save/${article.up_img}" id="up_img"  width=200px, height=200px />
   
     
    
   </c:forEach> 
    </form>
    </table>
       