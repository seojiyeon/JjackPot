<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>   

<script type="text/javascript">
		

function fav(){
	   var sum=0;
       var count=document.orgchart.emp_num.length;
       for(var i=0;i<count;i++){
    	   if(document.orgchart.emp_num[i].checked == true){
    		   sum +=1;
    	   }
       }
      if(sum <=0){
    	  alert("하나 이상 선택해 주세요.");
    	  return false;
      }
      
	 if(confirm("즐겨찾기에 추가하시겠습니까?")==true){
		 document.orgchart.action="/JackPot/orgChartPro.jp";
		 document.orgchart.submit();
	 }else{
	 return ;
	   }
	
	}

function favd(){
	
	 if(confirm("즐겨찾기를 해제하겠습니까?")==true){
		 document.orgchart.action="/JackPot/orgChartDEL.jp";
		 document.orgchart.submit();
	 }else{
	 return ;
	   }
	
	}

</script>

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

	
<table border="1" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
<form method="post"  actione="addfav.jp" name="orgchart" >
 
 
<c:if test="${memId!=null}">


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
       
       &nbsp;&nbsp;<input type="checkbox" name="emp_num" value="${article.emp_num}">
       
          <strong><input type="hidden" name="emp_name" value="${article.emp_name}">${article.emp_name}
          <input type="hidden" name="position" value="${article.position}">${article.position} </strong> (${article.emp_num})
          
          <c:forEach items="${list}" var="list">
          	<c:if test="${article.emp_num eq list.emp_num }">
          		<img src="/JackPot/save/star.jpg" width="20" height="20">
          		</c:if>
          </c:forEach>

          <br /> 
        </font><br/>
       <font size="2">
       &nbsp;${article.phone} <input type="hidden" name="phone" value="${article.phone}"><br />
       &nbsp;${article.mail}  <input type="hidden" name="mail" value="${article.mail}"><br />
       &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"><br />
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
       </font>
       </td>
   
     </c:forEach>
 </c:if>    

  <table border="1" width="900"  cellpadding="0" cellspacing="0" align="center">
    <tr>
     <Td align="center" >
        <input type="button" value="즐겨찾기 추가"  onclick="fav()">
        <input type="button" value="즐겨찾기 해제"  onclick="favd()">&nbsp;&nbsp;&nbsp;
        <input type="button" value="전체구성원 보기" onclick="window.location='Allorg.jp'">&nbsp;&nbsp;
        <input type="button" value="메인" onclick="window.location='main.jp'">
 
    </Td>
   </tr>
  </table>

    </form>
   

   </body>
     </head>
       </html>
 
  
  
  
  
  
  
    