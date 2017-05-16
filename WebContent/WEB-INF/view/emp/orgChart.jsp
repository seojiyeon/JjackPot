<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/JackPot/css/org.css?ver=12" rel="stylesheet" type="text/css">
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />   
<link rel="stylesheet" href="/JackPot/css/org.css" type="text/css" /> 
<html lang="ko">
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
					<a href="orgChart.jp" class="sidebar-nav-menu" style="color:#d3292c">같은 부서 구성원 목록</a>
				</li>
				
				<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="Allorg.jp" class="sidebar-nav-menu">전체 구성원<i class="fa fa-chevron-up"></i></a>
					<ul style="display: none;">
					</ul>
			    </li>

</div>
</div>
</div>
</div>


<div id="main-container">
<div>

<div class="con-header">
	<h2 style="margin:15 40;">
	전체 구성원 목록
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
 		

<form method="post"  action="addfav.jp" name="orgchart" >
   <c:if test="${memId!=null}">
<div class="content-list" style="border-bottom: 2px solid #e5a1a1;">
 <c:forEach var="article" items="${articleList}" varStatus="status">

    <div class="person-info-body" style="position: relative; border-right: 1px dotted #ddd;
        height: 120; width:625px; display: inline-block; border-bottom: 1px solid #e5e5e5;"/>
 
	<span class="person-info-check" style="position:absolute; margin-left: 5px;">
	<input type="checkbox" title="checkbox" name="emp_num" id="chkDelMyPeople" value="${article.emp_num}">
	</span>
	
	<div class="person-info-photo">
	<c:forEach items="${list}" var="list">
	    <c:if test="${article.emp_num == list.emp_num }">
	    	<img src="/JackPot/save/star.jpg" width="20" height="20" >
	    </c:if>	
	        			
    </c:forEach>
          			<span class="per50" style="margin-left: 5px;">
							   <img src="/JackPot/save/${article.profilephoto}" 
         id="emp_num" title="profilephoto" width=90px, height=80px > 
                   </span>
    </div>
                       
<div class="person-info">
	<div class="name" style="margin: 10 30;">

          <strong><input type="hidden" name="emp_name" value="${article.emp_name}">${article.emp_name}
          <input type="hidden" name="position" value="${article.position}">${article.position} </strong> (${article.emp_num})
          <br/>
           <br/>
         
      
       <font size="2" color="gray">
       &nbsp;${article.phone} <input type="hidden" name="phone" value="${article.phone}"><br />
       &nbsp;${article.mail}  <input type="hidden" name="mail" value="${article.mail}"><br />
       &nbsp;${article.address} <input type="hidden" name="address" value="${article.address}"><br />
       </font><br/>
</div>
</div>
</div>
 </c:forEach>
   
   
    </c:if>

</form>
</div>


   <div class="pagination-wrap">
   <ul class="pagination">
    <tr>
     <li align="center" style="font-size: 15;">
        <input type="button" value="즐겨찾기 추가"  onclick="fav()">
        <input type="button" value="즐겨찾기 해제"  onclick="favd()">&nbsp;&nbsp;&nbsp;
        <input type="button" value="전체구성원 보기" onclick="window.location='Allorg.jp'">&nbsp;&nbsp;&nbsp;
        <input type="image" src="/JackPot/save/house.png" width="30" height="30" value="메인" onclick="window.location='main.jp'">
      </li>
    </Td>
   </tr>
 </ul>

</div>
</div>
</div>
</body>
</html>
  
  
  
  
  
  
    