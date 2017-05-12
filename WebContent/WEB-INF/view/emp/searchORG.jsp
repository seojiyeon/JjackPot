<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/JackPot/css/org.css?ver=15" rel="stylesheet" type="text/css">
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />   
<link rel="stylesheet" href="/JackPot/css/org.css" type="text/css" /> 
<html lang="ko">


<body>
<div id="page-container" class="sub sidebar-mini sidebar-subarea">

<div id="sidebar">
<div class="sidebar-content"> 
 <h1>
		 <a href="main.jp"  class="sidebar-brand otherMenu menuTooltip" >
		   <img src="/JackPot/save/home.png" width=50px, height=50px style="margin:5;">
   <span id="brand" class="brand none">  
	</span>	 
   </a>
 </h1>
</div>

<div id="subarea">
<div class="leftmenu">
		<h1 class="blind">Left Menu</h1>
<div class="leftmenu-top" >
			<h2 style="margin:20;" >조직도</h2>
</div>

<div class="leftmenu-inner-scroll mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" 
style="height: 100%; position: relative; overflow: visible;"><div id="mCSB_1" 
class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" 
style="max-height: none;" tabindex="0"><div id="mCSB_1_container" 
class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" 
style="position:relative; top:0; left:0;" dir="ltr">
			<ul class="menulist">	
				<li data-submenu="allList" class="current">
					<a href="orgChart.jp" class="sidebar-nav-menu">같은 부서 구성원 목록</a>
				</li>
				
				<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="Allorg.jp" class="sidebar-nav-menu">전체 조직도<i class="fa fa-chevron-up"></i></a>
					<ul style="display: none;">
					</ul>
			    </li>

</div>
</div>
</div>
</div>


<div id="main-container">
<div id="mainmain">
<div class="con-header">
	<h2 style="margin:15 40;">
	 구성원 검색
	</h2>
</div>

</style>
<head>
<div class="table-header">	
 	   <form action="searchORG.jp">
 <div class="table-search">
	    <select name="searchName" title="검색타입" style="font-size: small;">	 	
	 		<option value="emp_name">사원이름 검색</option>
	 		<option value="phone">전화번호 검색</option>
	 		<option value="address">주소 검색</option>
       </select>
     <div class="input-search">  
     <input name="searchValue" id="searchKeyword" value="" title="검색어" type="text" class="w150" style="font-size: small;">
    	  
    	  <input type="image" src="/JackPot/save/search.png" width="25" height="25" value="submit" align="absmiddle">
</div>
    </form>
</div>
</div> 		

	
    <div class="con-header">			
<form method="post"  name="orginput" enctype="multipart/form-data">

<table border="1" width="900"  cellpadding="0" cellspacing="0" align="center"> 

      
 
 <tr align="center" style="background-color: gainsboro;">
 
 
 <td>사원번호</td>
  <td>이름</td>
   <td>핸드폰 번호</td>
    <td>주소</td>
    
 </tr>
 
 
 <c:forEach var="article" items="${list}" varStatus="status">
 
 
 
 <tr>
<td> 
${article.emp_num }</td>
<td>
${article.emp_name }</td>
<Td>
${article.phone }</td>
<td>

${article.address }</td>

 </td>
 </tr>
 </c:forEach>
   
  </table>


  </form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

 
  