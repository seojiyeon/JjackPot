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
			<h2 style="margin:20;" >주소록</h2>
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
					<a href="Allorg.jp" class="sidebar-nav-menu" style="color:#d3292c">전체 구성원<i class="fa fa-chevron-up"></i></a>
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
	회사 전체 구성원
	</h2>
</div>

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
   <h2 style="margin:15 40;">서비스 부서</h2>
   </div>
<div class="content-list" style="border-bottom: 2px solid #e5a1a1;">
   <c:forEach var="article" items="${articleList}" varStatus="status">
   
 <div class="person-info-body" style="position: relative; border-right: 1px dotted #ddd;
        height:140; width:384px; display: inline-block; border-bottom: 1px solid #e5e5e5;"/> 

  
 <div class="person-info-photo">
    <span class="per50" style="margin-left: 5px;">
       <img src="/JackPot/save/${article.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
     </span>
  </div>  
   
    <div class="person-info">
       	<div class="name" style="margin: 10 30;">
       	
          <strong><input type="hidden" name="emp_name" value="${article.emp_name}">${article.emp_name} 
          <input type="hidden" name="position" value="${article.position}">${article.position}</strong>
          <br/> (${article.emp_num})
      <br/>
           <br/>
         
       
       <font size="2" color="gray">
       &nbsp;${article.phone} <input type="hidden" name="phone" value="${article.phone}"><br />
       &nbsp;${article.mail}  <input type="hidden" name="mail" value="${article.mail}">
      <!--  &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"> -->
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
  </div>
  </div>  
 </div>  
     </c:forEach>
</div>

 
 
 
 <div class="con-header">
   <h2 style="margin:15 40;">제조,화학 부서</h2>
   </div>
<div class="content-list" style="border-bottom: 2px solid #e5a1a1;">
   <c:forEach var="article2" items="${list}" varStatus="status">
   
 <div class="person-info-body" style="position: relative; border-right: 1px dotted #ddd;
        height:140; width:384px; display: inline-block; border-bottom: 1px solid #e5e5e5;"/> 

  
 <div class="person-info-photo">
    <span class="per50" style="margin-left: 5px;">
        <img src="/JackPot/save/${article2.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
     </span>
  </div>  
   
    <div class="person-info">
       	<div class="name" style="margin: 10 30;">
       	
          <strong><input type="hidden" name="emp_name" value="${article2.emp_name}">${article2.emp_name}
          <input type="hidden" name="position" value="${article2.position}">${article2.position} </strong> 
          <br/>(${article2.emp_num})
      <br/>
           <br/>
         
       
       <font size="2" color="gray">
       &nbsp;${article2.phone} <input type="hidden" name="phone" value="${article2.phone}"><br />
       &nbsp;${article2.mail}  <input type="hidden" name="mail" value="${article2.mail}">
      <!--  &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"> -->
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
  </div>
  </div>  
 </div>  
     </c:forEach>
</div>



      
 <div class="con-header">
   <h2 style="margin:15 40;">It,웹,통신</h2>
   </div>
<div class="content-list" style="border-bottom: 2px solid #e5a1a1;">
   <c:forEach var="article3" items="${list2}" varStatus="status">
   
 <div class="person-info-body" style="position: relative; border-right: 1px dotted #ddd;
       height:140; width:384px; display: inline-block; border-bottom: 1px solid #e5e5e5;"> 

  
 <div class="person-info-photo">
    <span class="per50" style="margin-left: 5px;">
        <img src="/JackPot/save/${article3.profilephoto}" 
         id="emp_num" title="profilephoto" width=60px, height=70px/> 
     </span>
  </div>  
   
    <div class="person-info">
       	<div class="name" style="margin: 10 30;">
       	
          <strong><input type="hidden" name="emp_name" value="${article3.emp_name}">${article3.emp_name}
          <input type="hidden" name="position" value="${article3.position}">${article3.position} </strong> 
          </br>(${article3.emp_num})
     
       
       <font size="2" color="gray">
       &nbsp;${article3.phone} <input type="hidden" name="phone" value="${article3.phone}"><br />
       &nbsp;${article3.mail}  <input type="hidden" name="mail" value="${article3.mail}">
      <!--  &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"> -->
       </font><br/>

      <!-- ${article.address} <br />
       ${article.position} <br />
       ${article.department} 
        -->
  </div>
  </div>  
 </div>  
 </div>
     </c:forEach>
     </div>
</div>
 
