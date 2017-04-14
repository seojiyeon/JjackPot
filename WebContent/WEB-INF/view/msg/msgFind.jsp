<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
table {
    border-collapse: collapse;
    width: 100%;
}

.find th, td {
    text-align: left;
    padding: 8px;
     font-size : 12px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script type="text/javascript">

$(document).ready(function(){
    $("#emp1").click(function(){
        $("#emp_name").val("Dolly Duck");
    });
    
    $("#emp2").click(function(){
        $("#emp_name").val("");
    });
    
});

function setId(e)
{		 
	opener.document.userinput.msg_receive.value=e;
	self.close(); 
	}




</script>






<form name="msgFind" method="post" action="msgFind.jp" onSubmit="return checkIt()">
<table width="350" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       <b>사원 검색</b>
       <input type="text" size="10" maxlength="12" name="id"> 
       <input type="submit" value="검색" >
       
    </td></tr></table>
</form>


<c:if test="${count==0}">
 
</c:if>

<c:if test="${count!=0}">

<div class="find">
<table> 
     <tr height="30"  > 
     <th align="center"  width="50"  > <b>이름</b></th> 
     <th align="center"  width="100" ><b>사원번호</b></th> 
     <th align="center"  width="50" ><b>부서</b></th>
     <th align="center"  width="50" ></th>
     </tr>
     
      <c:forEach var="article" items="${articleList}" >
   
    <tr>
    <td align="center">${article.emp_name} </td>
	<td align="center" width="50">${article.emp_num} </td>
    <td align="center"  width="100"> ${article.department} </td>
    <td><input type="button" value="선택" onClick="setId('${article.emp_name}')" /></td>
  </tr>
  </c:forEach>
     
          
     </table>
     
    </div>
     
     </c:if>




 



</html>