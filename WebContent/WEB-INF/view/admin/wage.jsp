<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script> 

    
<style>

.root{
margin:auto;
width:100%;
height:1000px;
}

.top{
width:100%;
height:65px;
background-color:gray;
text-align:center;
}

.menu{
    width: 25%;
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
height:1200px;
float:left;
background-size:100%100%;
text-align:center;
}

.bottom{
width:100%;
height:100px;
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
    border: 1px solid black;
    overflow: scroll;
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

<div class="root">
<div class="top">메인</div>
<div class="menu">
<ul>
<li><a href="/JackPot/wage.jp">급여 기본 정보</a></li>
<li>급여 조회</li>
<li>급여 대장</li>
<li>급여 이체 현황</li>
</ul>


</div>


<div class="con">

<div class="employee">
<%-- <c:if test="${count > 0}"> --%>
<table width="100%" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"  > 
     <th align="center"  width="100"  > <b>사원번호</b></th> 
      <th align="center"  width="100" ><b>성명</b></th> 
      <th align="center"  width="50" ><b>직책</b></th>
      <th align="center"  width="100" ><b>부서</b></th>
      <th align="center"  width="150" ><b>입사일자</b></th>
      <th align="center"  width="150" ><b>주소</b></th> 
      <th align="center"  width="80" ><b>핸드폰</b></th>
      <th align="center"  width="50" ><b>이메일</b></th>
    </tr>


 <c:forEach var="article" items="${articleList}" varStatus="st">
   <tr height="30" id="emp${st.count}">
    <td align="center"  width="50" >
	  ${article.emp_num}
	</td>
    <td  width="130"> ${article.emp_name} </td>	
	<td width="100" align="center"> ${article.rank}	</td>
	<td align="center">${article.department} </td>
	<td align="center">${article.hiredate}</td>	
    <td align="center"  width="100"> ${article.address} </td>
    <td align="center"  width="150">${article.phone}</td>
    <td align="center"  width="50"> ${article.mail} </td>
  </tr>
  </c:forEach>
</table>
</div>





</div>


<div class="bottom">하단</div>



</div>

















