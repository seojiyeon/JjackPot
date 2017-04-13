<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<title>온라인 투표</title>
 <h2> 온라인 투표  </h2>
<table border="0" width="900"  cellpadding="0" cellspacing="0" align="center"> 
    			
    <form method="post"  action= name="result" >
 
 <tr>
    <td>
    <br/>
    <img src="/JackPot/save/vote2.png" width="50" height="50">${dto.jilmoon} </td>
    <tr>
    <td>&nbsp;&nbsp;&nbsp;<font size="2">진행자 : ${dto.emp_name} / 투표시작일 : ${dto.v_start} / 참여자 : ${check3 }</font>
    </td>
    </tr>
      
     
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
       (2)${dto.monhang2}  ${check2}/${check3 } </td></tr>
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
       