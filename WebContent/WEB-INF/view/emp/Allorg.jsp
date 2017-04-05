<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>전체부서 구성원</title>

<h2 align="center">회사 전체 구성원</h2>
<br/>
<br/>
<table border="1" width="1000"  cellpadding="0" cellspacing="0" align="center"> 
    			
 
   <h2 align="left">서비스 부서</h2>



   <c:forEach var="article" items="${articleList}" varStatus="status">
   <c:if test="${status.index%3==0}" >
   <tr></tr>
   </c:if>
 
      <td align="center"  width="50" >
       <img src="/JackPot/save/${article.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
      </td>
      <td>
      <font size="2.9">
         &nbsp;&nbsp;
       
          <strong><input type="hidden" name="emp_name" value="${article.emp_name}">${article.emp_name}
          <input type="hidden" name="position" value="${article.position}">${article.position} </strong> (${article.emp_num})
          
  <br/>
       
       <font size="2">
       &nbsp;${article.phone} <input type="hidden" name="phone" value="${article.phone}"><br />
       &nbsp;${article.mail}  <input type="hidden" name="mail" value="${article.mail}">
      <!--  &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"> -->
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
       </font>
       </td>
   
     </c:forEach>
   </table>  
 
 
   <h2>제조,화학 부서</h2>

<table border="1" width="1000"  cellpadding="0" cellspacing="0" align="center"> 
    			

   <c:forEach var="article2" items="${list}" varStatus="status">
   <c:if test="${status.index%2==0}" >
   <tr></tr>
   </c:if>
 
      <td align="center"  width="50" >
       <img src="/JackPot/save/${article2.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
      </td>
      <td>
      <font size="2.9">
        &nbsp;&nbsp;
          <strong><input type="hidden" name="emp_name" value="${article2.emp_name}">${article2.emp_name}
          <input type="hidden" name="position" value="${article2.position}">${article2.position} </strong> (${article2.emp_num})
  <br/>        
      
       <font size="2">
       &nbsp;${article2.phone} <input type="hidden" name="phone" value="${article2.phone}"><br />
       &nbsp;${article2.mail}  <input type="hidden" name="mail" value="${article2.mail}">
      
       </font><br/>

       </font>
       </td>
   
     </c:forEach>

 
 
</form>
</table>


<h2>It,웹,통신</h2>

<table border="1" width="1000"  cellpadding="0" cellspacing="0" align="center"> 
    			

   <c:forEach var="article3" items="${list2}" varStatus="status">
   <c:if test="${status.index%3==0}" >
   <tr></tr>
   </c:if>
 
      <td align="center"  width="50" >
       <img src="/JackPot/save/${article3.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
      </td>
      <td>
      <font size="2.9">
        &nbsp;&nbsp;
          <strong><input type="hidden" name="emp_name" value="${article3.emp_name}">${article3.emp_name}
          <input type="hidden" name="position" value="${article.position}">${article.position} </strong> (${article3.emp_num})
  <br/>        
      
       <font size="2">
       &nbsp;${article3.phone} <input type="hidden" name="phone" value="${article3.phone}"><br />
       &nbsp;${article3.mail}  <input type="hidden" name="mail" value="${article3.mail}">
      
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
       </font>
       </td>
   
     </c:forEach>

 
 
</form>
</table>

