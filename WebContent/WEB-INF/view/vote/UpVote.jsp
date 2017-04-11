<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
  	
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
    
 <h2> 투표 참여  </h2>
<table border="0" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post" name="UPvote" >    


    <c:forEach var="article" items="${articleList}" varStatus="status">
  
  <input type="hidden" name="v_num" value="${article.v_num}">
  <input type="hidden" name="emp_num" value="${article.emp_num }">
  
    <tr>
    <td>
    <img src="/JackPot/save/vote2.png" width="50" height="50">
    ${article.jilmoon} </td>
      <tr></tr>
    <tr>
       <td width="100" align="center"><br/>(1)&nbsp;${article.monhang} <br/>
       <img src="/JackPot/save/${article.up_img}" id="up_img"  width=200px, height=200px />
    </tr>  
     
         <tr>
       <td width="100" align="center"><br/>(2)&nbsp;${article.monhang2}<br/>
         <img src="/JackPot/save/${article.up_img2}" id="up_img2"  width=200px, height=200px />
    </td>
    </tr>
    
        <tr><td  align="center"> <br/>
        

    <input type="button" id="success"  value="투표하기" onclick="test('${article.v_num}');" >
    <input type="button" value="결과보기" onclick="test2('${article.v_num}');">
    
        </td>
        </tr>
        
        
        </c:forEach>
   
   </form>
  </table>
  