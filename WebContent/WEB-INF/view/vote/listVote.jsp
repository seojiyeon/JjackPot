<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />  
<link href="/JackPot/css/org.css?ver=15" rel="stylesheet" type="text/css">   

 	
 <script type="text/javascript">
 
    function test2(v_num)
	{
		
		window.location='VoteResult.jp?v_num='+v_num;	
		
	}
    </script>	  
    
    
<body>
<div id="page-container" class="sub sidebar-mini sidebar-subarea">

<div id="sidebar">
  <jsp:include page="/sidebar.jp"></jsp:include>
</div>
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
			<li>
		<div class="btn-wrap-leftMenu row">
					
					<button type="button" class="btn btn-color7 br w100p" onclick="window.location='Vform.jp'" 
					style="color: black; background-color: white; border-color: black;">투표 등록</button>
						
					
					</div>		
					</li>		
					
				<li data-submenu="allList" class="current">
					<a href="UpVote.jp" class="sidebar-nav-menu"> 투표참여</a>
				</li>
				
				<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="BeforeSuc.jp"  class="sidebar-nav-menu">나의 투표목록</a><i class="fa fa-chevron-up"></i></a>
					<ul style="display: none;">
					</ul>
			    </li>
			    	<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="listVote.jp"  class="sidebar-nav-menu" style="color:#d3292c">마감된 투표목록</a><i class="fa fa-chevron-up"></i></a>
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
	완료된 투표
	</h2>
</div>

	   		
  <div class="content-list" style="border-bottom: 2px solid #e5a1a1;">  
 <c:forEach var="article" items="${articleList}" varStatus="status">
    <input type="hidden" name="v_num" value="${article.v_num}">
  <div class="person-info-photo" style="margin: 0 550 120;">
   
   
    <img src="/JackPot/save/vote2.png" width="50" height="50">
    ${article.jilmoon} </td>
      <tr></tr><br/>
  
       <td width="100" align="center"><br/>(1)&nbsp;${article.monhang} <br/>
       <img src="/JackPot/save/${article.up_img}" id="up_img"  width=200px, height=200px />
    </tr>  
     
         <tr>
       <td width="100" align="center"><br/>(2)&nbsp;${article.monhang2}<br/>
         <img src="/JackPot/save/${article.up_img2}" id="up_img2"  width=200px, height=200px />
    </td>
    </tr>
    
      <div class="pagination-button" style="margin: 30 30;">
   <ul class="pagination">
    <tr>
     <li align="center" style="font-size: 15;">
        

    
    <input type="button" value="결과보기" onclick="test2('${article.v_num}');" style="margin: 0 30;">
    
    </li>
    </tr>
    </ul>
    </div>
 
    </div> 
    
  
  
  </c:forEach>
  </div>
  
</div>
</div>
</div>
</div>
</div>
</body>



