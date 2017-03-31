<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>   
<html>

<style type="text/css">
 #box1{ 
        width:900px;
        align:right;
        list-style:none;
 }
</style>
<head>
<title>부서 구성원</title>
<h2 align="center">같은 부서 구성원</h2>
<body>
<div border="0" width="900">
<ul id="box1">
 <li style="text-align:right;width:900; margin-left:500px;">
 	<form action="searchORG.jp" >
	 	<select name="searchName">
	 		<option value="emp_name">사원이름 검색</option>
	 		<option value="phone">전화번호 검색</option>
	 		<option value="address">주소 검색</option>
	 	</select>
  		<input type="text" name="searchValue" />
    	<input  TYPE="submit" name="Submit" value="검색">
    </form>
</li>
</ul>    		
</table>	


	
    			
<form method="post"  name="orginput" enctype="multipart/form-data">

<table border="1" width="900"  cellpadding="0" cellspacing="0" align="center"> 

   <c:forEach var="article" items="${articleList}" varStatus="status">
   <c:if test="${status.index%2==0}" >
   <tr></tr>
   </c:if>
     
      <td align="center"  width="100" >
       <img src="/JackPot/save/${article.profilephoto}" 
         id="emp_num" title="profilephoto" width=90px, height=80px/> 
      </td>
      <td>
      <font size="2.9">
       
       &nbsp;&nbsp;<strong>${article.emp_name} ${article.position} </strong> (${article.emp_num})<br /> 
       </font><br/>
       <font size="2">
       &nbsp;${article.phone} <br />
       &nbsp;${article.mail} <br />
       &nbsp;${article.address} <br />
       </font>
    


    
      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
       </font>
       </td>
   
     </c:forEach>
      



   
  </table>


  </form>
</body>
  </head>
  </html>
 
  
  
  
  
  
  
    