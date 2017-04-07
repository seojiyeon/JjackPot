<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   



 <html>
<head>
<title>투표</title>   
    
    <form method="post" action="VformPro.jp" name="documentFrm" enctype="multipart/form-data">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" >
       <font size="+1" ><b>투표하기</b></font></td>
    </tr>
    
     <tr>
      <td width="100"><font color="red">*</font>질문</td>
      <td width="400" > 
      	<textarea rows="2" cols="65" name="jilmoon"></textarea> 
      </td>
    </tr>
    
    <tr> 
      <td width="100"><font color="red">*</font> 문항</td>
      <td width="400" > 
      
&nbsp; <textarea rows="1" cols="50" name="monhang"></textarea> 
        <input type="file" name="up_img" size="15" maxlength="12">
          
             <textarea rows="1" cols="50" name="monhang2"></textarea> 
        <input type="file" name="up_img2" size="15" maxlength="12">
      </td>
    </tr>
   
   <tr>
   <td>
   <input type="submit" value="제출">
   </td>
   </tr>


</body>
</table>
</form>
</head>
</html>









    
    
    
    
    