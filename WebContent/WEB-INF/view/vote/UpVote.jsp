<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />  
<link href="/JackPot/css/org.css?ver=13" rel="stylesheet" type="text/css">   
  	 <script type="text/javascript" src="/JackPot/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">

  	function test(v_num)
    	{
    		
    		window.location='UpVotePro.jp?v_num='+v_num;	
    		
    	}
  	
	function test2(v_num)
	{
		
		window.location='VoteResult.jp?v_num='+v_num;	
		
	}
    </script>	     


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
			<h2 style="margin:20;" >투표</h2>
</div>

<div class="leftmenu-inner-scroll mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" 
style="height: 100%; position: relative; overflow: visible;"><div id="mCSB_1" 
class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" 
style="max-height: none;" tabindex="0"><div id="mCSB_1_container" 
class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" 
style="position:relative; top:0; left:0;" dir="ltr">
			<ul class="menulist">	
				<li data-submenu="allList" class="current">
					<a href="UpVote.jp" class="sidebar-nav-menu"> 투표참여</a>
				</li>
				
				<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="BeforeSuc.jp"  class="sidebar-nav-menu">나의 투표목록</a><i class="fa fa-chevron-up"></i></a>
					<ul style="display: none;">
					</ul>
			    </li>
			    	<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="listVote.jp"  class="sidebar-nav-menu">마감된 투표목록</a><i class="fa fa-chevron-up"></i></a>
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
	투표 참여 
	</h2>
</div>
			
	    
    <form method="post" name="UPvote" >   
     
  <div class="content-list" style="border-bottom: 2px solid #e5a1a1;">  

    <c:forEach var="article" items="${articleList}" varStatus="status">
  
  <input type="hidden" name="v_num" value="${article.v_num}">
  <input type="hidden" name="emp_num" value="${article.emp_num }">
  
    
   <div class="person-info-photo" style="margin: 0 550 120;">
   
   
    <img src="/JackPot/save/vote2.png" width="50" height="50">
    ${article.jilmoon} </td>
      <tr></tr>
  
       <td width="100" align="center" ><br/>
       
       (1)&nbsp;<font size="4">${article.monhang}</font> <br/>
       <img src="/JackPot/save/${article.up_img}" id="up_img"  width=200px, height=200px />
    </tr>  
     <br/>
         <tr>
       <td width="100" align="center"><br/><font size="4">
       (2)&nbsp;<font size="4">${article.monhang2}</font><br/>
         <img src="/JackPot/save/${article.up_img2}" id="up_img2"  width=200px, height=200px />
    </td>
    </tr>
    
      <div class="pagination-button" style="margin: 30 30;">
   <ul class="pagination">
    <tr>
     <li align="center" style="font-size: 15;">
        

    <input type="button" id="success"  value="투표하기" onclick="test('${article.v_num}');" >
    <input type="button" value="결과보기" onclick="test2('${article.v_num}');">
    
    </li>
    </tr>
    </ul>
    </div>
 
    </div> 
        </c:forEach>
   
   </form>
</div>
</div>
</div>
</div>
</div>
</body>


  