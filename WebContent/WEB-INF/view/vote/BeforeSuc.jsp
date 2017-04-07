<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
    <script type="text/javascript" src="/JackPot/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$('#sucess').click(function(){
    			
   		});    	
   });
    	
    	function test(v_num)
    	{
    		alert(v_num);
    		window.location='VoteSuc.jp?v_num='+v_num;	
    	}
    </script>
    
    
    
    
    <h2> 나의 투표 목록 </h2>
  <table border="0" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post"  action="VoteSuc.jp" name="vote" >    

    
    <c:forEach var="article" items="${articleList}" varStatus="status">
  
  <input type="hidden" name="v_num" value="${article.v_num}">
  <input type="hidden" name="emp_num" value="${article.emp_num }">
  
    <tr>
    <td>
    <img src="/JackPot/save/vote2.png" width="50" height="50"> 
    ${article.jilmoon} </td>
    
    <tr>
       <td width="100" align="center">(1)&nbsp;${article.monhang} 
       <img src="/JackPot/save/${article.up_img}" id="up_img"  width=150px, height=150px />
    </tr>  
         <tr>
       <td width="100" align="center">(2)&nbsp;${article.monhang2} 
         <img src="/JackPot/save/${article.up_img2}" id="up_img2"  width=150px, height=150px />
    </td>
    </tr>
       <tr><td></td></tr>
         <tr><td  align="center">
<input type="button" id="sucess"  value="투표오픈" onclick="test('${article.v_num}');" >
<input type="button" value="삭제" onclick="">
<input type="button" value="수정" onclick="">
        </td>  </tr>
    </c:forEach>
    <br/>
   
  </form>
   </table>
    