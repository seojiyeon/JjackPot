<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   


 <h2> 온라인 투표  </h2>
<table border="0" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post"  action=".jp" name="UPvote" >    


  
  <input type="hidden" name="v_num" value="${dto.v_num}">
  <input type="hidden" name="emp_num" value="${dto.emp_num }">
  
    <tr>
    <td>
    <img src="/JackPot/save/vote2.png" width="50" height="50">
    ${dto.jilmoon} </td>
      <tr></tr>
    <tr>
       <td width="100" align="center"><br/>(1)&nbsp;${dto.monhang}
       <input type="checkbox" name="v_num" value="${dto.v_num}"> <br/>
       <img src="/JackPot/save/${dto.up_img}" id="up_img"  width=200px, height=200px />
    </tr>  
     
         <tr>
       <td width="100" align="center"><br/>(2)&nbsp;${dto.monhang2} 
        <input type="checkbox" name="v_num" value="${dto.v_num}"> <br/>
         <img src="/JackPot/save/${dto.up_img2}" id="up_img2"  width=200px, height=200px />
    </td>
    </tr>
    
        <tr><td  align="center"> <br/>
    <input type="button" value="투표하기" onclick="">     
        </td>
        </tr>
      
   
   
   
   </form>
  </table>
  