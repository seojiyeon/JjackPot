<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script> 

    
<style>

.root{
margin:auto;
width:100%;
height:800px;
}

.top{
color:white;
width:100%;
height:65px;
background-color:gray;
text-align:center;
vertical-align: bottom;

}

.menu{
    width: 200px;
    height: 800px;
    float: left;
    background-color: #e0e0eb;
    text-align: left;
    font-size: 14px;
}

.menu ul{
text-align:left;
}

.con{
width:75%;
height:800px;
float:left;
background-size:100%100%;
text-align:center;
}

.bottom{
width:100%;
height:65px;
clear:both;
background-color:green;
text-align:center;
}

.employee th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size : 12px;
}

.employee {
	width: 1000px;
    height: 250px;
    margin: 10px;
}

th, td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
    font-size : 12px;
}

.employee tr:hover{background-color: #ffe6ff}

li:hover{
background-color: #e6f2ff;
}

li {
margin: 5px 10px;
}


a:link {
    text-decoration: none;
    
}
    
</style>

<script type="text/javascript">

$(document).ready(function(){
    $(".write").click(function(){
        window.open("/JackPot/msgwrite.jp","네이벙","width=500, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    });
    
});

</script>



<div class="root">
<div class="top">쪽지</div>
<div class="menu">
<ul>

<li>받은 쪽지함</li>
<li>보낸 쪽지함</li>
<li>임시 보관함</li>
</ul>


</div>


<div class="con">

<div class="employee">
<%-- <c:if test="${count > 0}"> --%>
<table width="100%" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"  > 
     <th align="center"  width="100"  > <b><input type="checkbox" /></b></th>
     <th align="center"  width="100"  > <b>분류</b></th> 
      <th align="center"  width="100" ><b>제목</b></th> 
      <th align="center"  width="50" ><b>보낸사람</b></th>
      <th align="center"  width="100" ><b>일시</b></th>
      
    </tr>


 <c:forEach var="article" items="${articleList}" varStatus="st">
   <tr height="30" id="emp${st.count}">
    
    <th align="center"  width="100"  > <b><input type="checkbox" /></b></th>
    <td align="center">${article.department} </td>
	<td align="center">${article.hiredate}</td>	
    <td align="center"  width="150">${article.phone}</td>
    <td align="center"  width="50"> ${article.mail} </td>
  </tr>
  </c:forEach>
</table>

<button type="button" class="write" >쪽지 쓰기</button>
</div>






</div>


<div class="bottom">하단</div>



</div>





