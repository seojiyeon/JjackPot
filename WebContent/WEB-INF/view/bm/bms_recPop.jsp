<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=5" type="text/css" />   


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


<html>
<script type="text/javascript">

$(document).ready(function(){
    $("#emp1").click(function(){
        $("#emp_name").val("");
    });
    
    $("#emp2").click(function(){
        $("#emp_name").val("");
    });
    
});
function setId(e)
{	
	opener.document.bminput.rec_name.value=e;
	self.close(); 
	}




</script>

<head>
<title>수신자  </title>


<form name=bms_recPop method="post" action="bms_recPop.jp" onSubmit="return checkIt()">
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
    <td align="center"  width="100"> ${article.department2} </td>
    <td><input type="button" value="선택" onClick="setId('${article.emp_name}')" /></td>
  </tr>
  </c:forEach>
     
          
     </table>
     
    </div>
     
     </c:if>

     </head>
     

</html>