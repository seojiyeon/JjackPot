<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

    <!--  jQuery UI CSS파일 --> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- // jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- // jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
	<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
	
 <div class="content-wrap" id="pollGallery">
	
<title>온라인 투표</title>

 <h2> 온라인 투표  </h2>
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
      <input type="hidden" name="emp_name" value="${dto.emp_name}"/>
         
<div class="comment-wrap op">
	<div class="reply-wrap"><span><i class="icon reply"></i></span></div>
		<div class="input-group">
			<form id="8501850_pollLinereplyForm" name="8501850_pollLinereplyForm" action="/vote/reply.jp" novalidate="novalidate">								
				<input name="itemId" type="hidden" value="8501850">
				<textarea title="textarea" id="8501850_contents" name="content" rows="2" class="form-control original" placeholder="댓글을 입력하세요."></textarea>
  
      <input type="submit" value="댓글 달기">     
     </Td>    
      </tr>   
        
     <tr >
     <td>
     
      <c:forEach var="article" items="${articleList}" varStatus="status">
 
    
     <li class="last">
		        <ul>		        	
		        	<li class="name">
					<font color="gray" size="2"	>${article.emp_name}(${article.emp_num})&nbsp;&nbsp;&nbsp;${article.reg}</font>

		            </li> 
		            
		             <li class="content">${article.content}</li>
		              
		            
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