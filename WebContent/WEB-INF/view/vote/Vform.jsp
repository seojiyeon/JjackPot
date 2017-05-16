<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />  
<link href="/JackPot/css/org.css?ver=13" rel="stylesheet" type="text/css">   
 
  	 <script type="text/javascript" src="/JackPot/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">

    $(document).ready(function(){
	    $("#menuTreeTitle>a").click(function(){
	        var boardmenu = $(this).next("ul");
	        if( boardmenu.is(":visible") ){
	            boardmenu.slideUp();
	        }else{
	            boardmenu.slideDown();
	        }
	    });
	});

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
<div class="leftmenu-top">
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
					<a href="UpVote.jp" class="sidebar-nav-menu" style="color:#d3292c"> 투표참여</a>
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
	투표등록
	</h2>
</div>

    <form method="post" action="VformPro.jp" name="Vform" enctype="multipart/form-data">
    <div  style="border-bottom: 2px solid #e5a1a1; margin:9 10;">  
  
  <table  cellspacing="0" cellpadding="3" align="center" >
    
    
    <tr>
      <td width="100"><font color="red">*</font>작성자</td>
        <td width="400" >${dto.emp_name}(${dto.emp_num })</td>     
          <input type="hidden" name="emp_num" value="${dto.emp_num}">
          <input type="hidden" name="emp_name" value="${dto.emp_name}">
    </tr>
    
    
     <tr>
      <td width="100"><font color="red">*</font>질문</td>
      <td width="400" > 
      	<textarea rows="1" cols="65" name="jilmoon"></textarea> 
      </td>
    </tr>
    
    <tr> 
      <td width="100"><font color="red">*</font> 문항</td>
      <td width="400" > 
      
        <textarea rows="1" cols="50" name="monhang"></textarea> 
        <input type="file" name="up_img" size="15" maxlength="12">
       <br/>   
        <textarea rows="1" cols="50" name="monhang2"></textarea> 
        <input type="file" name="up_img2" size="15" maxlength="12">
    </td>
      </tr>
   
   <tr >
   <td >
 
   </td>
  </tr>
  
</table>
</div>
  <input type="submit" value="저장" style="font-size: smaller; margin:5 480;">
</form>
</div>
</div>
</div>
</div>
</body>









    
    
    
    
    