<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link href="/JackPot/css/org.css?ver=17" rel="stylesheet" type="text/css">   
    <!--  jQuery UI CSS파일 --> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- // jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- // jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
	<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
	
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
<div class="leftmenu-top" style="background:#363636;">
			<h2 style="margin:20; " >투표</h2>
</div>

<div class="leftmenu-inner-scroll mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" 
style="height: 100%; position: relative; overflow: visible;"><div id="mCSB_1" 
class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" 
style="max-height: none;" tabindex="0"><div id="mCSB_1_container" 
class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" 
style="position:relative; top:0; left:0;" dir="ltr">
			<ul class="menulist">	
				<li data-submenu="allList" class="current">
					<a href="UpVote.jp" class="sidebar-nav-menu" style="color:black;"> 투표참여</a>
				</li>
				
				<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="BeforeSuc.jp"  class="sidebar-nav-menu">나의 투표목록</a><i class="fa fa-chevron-up"></i></a>
					<ul style="display: none;">
					</ul>
			    </li>
			    	<li id="commGroupTree" data-submenu="commGroup" data-emitem="addr.organogram">
					<a href="listVote.jp"  class="sidebar-nav-menu" >마감된 투표목록</a><i class="fa fa-chevron-up"></i></a>
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
 <h2> 온라인 투표  </h2>
</div>	
 <div class="content-wrap" id="pollGallery">
	
<title>온라인 투표</title>


<table border="0" width="500"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post" name="result" >
 <tr>
    <td>
    <br/>
        <img src="/JackPot/save/vote2.png" width="50" height="50">${dto.jilmoon} </td>
    
    
  <c:if test="${dto.notice==1}"> <br/>    
    <tr >
        <td>&nbsp;&nbsp;&nbsp;<font size="2.8"  color="gray">진행자 : ${dto.emp_name}&nbsp; / 투표시작일 : ${sdf.format(dto.v_start)}&nbsp; / 참여자 : ${check3 }명</font>
         </td>
    </tr>
    </c:if>  
    
    <c:if test="${dto.notice==2}"> <br/>    
    <tr >
        <td>&nbsp;&nbsp;&nbsp;<font size="2.8" color="gray">진행자 : ${dto.emp_name}&nbsp; / 투표일 : ${sdf.format(dto.v_start)} ~ ${sdf.format(dto.v_end)}&nbsp; / 참여자 : ${check3 }명</font>
         </td>
    </tr>
    </c:if> 
     
        <tr>
        <td width="100" align="center"> <br/><br/>
       (1)${dto.monhang} ${check }/${check3 } </td></tr>  
       <tr><td width="100" align="center">
     <br/><img src="/JackPot/save/${dto.up_img}" id="up_img"  width=200px, height=200px />
        </td>
        </tr>
       </Tr>
       
           <tr>
            <td width="100" align="center"><br/>
       (2)${dto.monhang2}  ${check2}/${check3} </td></tr>
       <tr><td width="100" align="center">
        <br/><img src="/JackPot/save/${dto.up_img2}" id="up_img2"  width=200px, height=200px />
   </td>
   </Tr>
   
       <tr>
       <td width="100" align="center"><br/>
         <input type="button" value="목록" onclick="window.location='UpVote.jp'">
       </td>
       </tr>

    </form>
    </table>

 
   
    <table width="700" border="3" align="center" bordercolor="gray" cellpadding="0" cellspacing="0" align="center">
      <form action="reply.jp">
      
    <tr height="20" >
        <td bgcolor="gray" align="center">
        <font color="white">Comment</font></td></tr>
       
      <input type="hidden" name="v_num" value="${dto.v_num}"/>
      <input type="hidden" name="emp_num" value="${dto.emp_num}"/>
      <input type="hidden" name="emp_name" value="${ddto.emp_name}"/>
      
         
<div class="comment-wrap op">
	<div class="reply-wrap"><span><i class="icon reply">  </i></span>  ${check10 } </div>
		<div class="input-group">
			<form  action="/vote/reply.jp" novalidate="novalidate">								
				<input name="itemId" type="hidden" value="8501850">
				<textarea title="textarea" id="8501850_contents" name="content" rows="2" class="form-control original" placeholder="댓글을 입력하세요."></textarea>
   <span class="input-group-btn">
      	<input TYPE="IMAGE" src="/JackPot/save/speech.png"  width="40" height="40"  name="Submit" value="Submit" align="absmiddle" style="margin : 5 10">
   </span>  
     </Td>    
      </tr>   
        
     <tr >
     <td>
     
      <c:forEach var="article" items="${articleList}" varStatus="status">
 
    
     <li class="last">
		        <ul>		        	                                                                                                                                                                             
		        	<li class="name" style="margin : 5 5;">
					<font color="gray" size="2"	style="margin: 3px;">${article.emp_name}(${article.emp_num})&nbsp;&nbsp;&nbsp;${article.reg}</font>

            <c:if  test="${sessionScope.memId == article.emp_num }">    
                    <a href="/JackPot/garbage.jp?comm_num=${article.comm_num}&v_num=${dto.v_num}">
					<img src="/JackPot/save/garbage2.png" width="20" height="20" style="margin: 2 10;">			   
				</a>
		    </c:if>    
		         
		            </li> 
		            
		             <li class="content" style="margin : 5 19;">
		             ${article.content}</li>
		              
		            
		            <li class="btn-mody" data-itemid="" data-linereplyid="">
	                    <a href="javascript:void(0)" onclick="showUpdateForm('8624883UpdateForm','8501850');"><i class="fa fa-pencil" data-toggle="tooltip" title="수정" data-original-title="수정"></i></a>
	                </li>
	                
	                
	                
	                <li class="btn-del" data-itemid="" data-linereplyid="">
	                    <a href="javascript:void(0)" onclick="userDeleteBoardLinereply('8501850', '8624883');"><i class="fa fa-trash-o" data-toggle="tooltip" title="삭제" data-original-title="삭제"></i></a>
	                </li>		 
	                           
		        </ul>
	
		         </div>
		    </li>
     
     
     
      
      </c:forEach>
     </td>
     </tr>
     
  
      </form>    
    </table>
   </div>    