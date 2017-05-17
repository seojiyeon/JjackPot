<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script>   
<html>
<head>
<title>정보수정</title>

<script language="JavaScript">


function checkIt(){
	var userinput=eval("document.userinput");
	var regx=/^[a-zA-Z0-9]*$/; 
	var chk1= /\d/; 
	var chk2 = /[a-z]/i;
	var chk3 =/^[가-힣a-zA-Z]+$/;
	var num_reg = /^[0-9]*$/;
	

	 
	  if(!userinput.pw.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
	 
	 
	   if (chk1.test(userinput.phone.value) ) {
	 }else{		
		alert("핸드폰번호는 숫자만 가능합니다.")
		return false;
	}

	
	 if (chk1.test(userinput.birthday.value) ) {
	 }else{		
		alert("생일은 숫자만 가능합니다.")
		return false;
	}
	
	 
	 if(!userinput.address.value){
			alert("주소를 입력하세요");
			return false;
		}
	 
	 if (chk1.test(userinput.mail.value) || chk2.test(userinput.mail.value)) {
	 }else{		
		alert("메일은 영어 숫자만 입력 가능합니다.")
		return false;
	}
	
}
	 
</script>	 	 
	 
<form method="post" action="modifyPro.jp" name="userinput" 
  onSubmit="return checkIt()" enctype="multipart/form-data">
  <table width="1000" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center"  >
       <font size="+1" ><b>사원정보 수정</b></font></td>
    </tr>
 <tr> 
      <td width="300"> 프로필 사진</td>
      <td width="400" > 
        <img src="/JackPot/save/${dto.profilephoto}" id="emp_num" title="profilephoto" width=150px, height=100px  />
         <input type="hidden" name="profilephoto" value="${dto.profilephoto}">
        <input type="file" name="profilephoto"  size="10" maxlength="10">  
        
        
      </td>
    <tr>  
    <tr> 
      <td width="200"> 사원번호</td>
      <td width="400"> 
      <input type="hidden" name="emp_num" value="${dto.emp_num}" >
         ${dto.emp_num}
       </td>
       </tr>
       
       <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" value="${dto.pw}" size="15" maxlength="12">
      </td>
    <tr>  
       
       <tr> 
      <td width="200"> 사원 이름</td>
      <td width="400" > 
        ${dto.emp_name}
      </td>
    <tr>  
    
      <tr> 
      <td width="200"> 주소</td>
      <td width="800" > 
        <input type="text" name="address" size="80" maxlength="40" value="${dto.address }"> 
      </td>
    <tr>  
    
    <tr> 
      <td width="200"> 핸드폰 번호</td>
      <td width="400" > 
        <input type="text" name="phone" size="15" maxlength="12" value="${dto.phone }"> 
      </td>
    <tr>  
    
    <tr> 
      <td width="200"> 이메일</td>
      <td width="400" > 
        <input type="text" name="mail" size="40" maxlength="40" value="${dto.mail }"> 
      </td>
    <tr>  
    
    <tr> 
      <td width="200"> 생일</td>
      <td width="400" > 
        <input type="text" name="birthday" size="15" maxlength="12" value="${dto.birthday }">
      </td>
    <tr>  
    
    <tr> 
      <td width="200"> 싸인 이미지</td>
      <td width="400" > 
       <img src="/JackPot/save/${dto.signimg}" id="emp_num" title="signimg" width=90px, height=90px />
       <input type="hidden" name="signimg" value="${dto.signimg}">
        <input type="file" name="signimg"  size="15" maxlength="12"   >
      </td>
    <tr>  
    
    <tr> 
      <td width="200">입사날짜</td>
      <td width="400" > 
       ${dto.hiredate}
      </td>
    <tr>  
    
    <tr> 
      <td width="200">봉급</td>
      <td width="400" > 
        ${dto.rank}만원
      </td>
    <tr>  
       

        <tr> 
      <td width="200"> 부서</td>
      <td width="400" > 
        ${dto.department}
      </td>
    <tr>  
       
        
        <tr> 
      <td width="200">직급</td>
      <td width="400" > 
       ${dto.position}
      </td>
    <tr>  
    
     <tr> 
      <td width="200">지점</td>
      <td width="400" > 
        ${dto.branch}
      </td>
    <tr>  
    
     <tr> 
      <td width="200"> 사원 점수</td>
      <td width="400" > 
       ${dto.emp_point}
      </td>
    <tr>  
    
    <tr> 
    <td colspan="2" height="39" align="center"  >
       <font size="+1" >
    <input type="submit" value="제출">
       <input type="button" value="취소" onclick="window.location='main.jp'">
    </font></td>
    </td>
    </Tr>
       </table>









