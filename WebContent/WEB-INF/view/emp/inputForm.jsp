	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>회원가입</title>

<script language="JavaScript">


function checkIt(){
	var userinput=eval("document.userinput");
	var regx=/^[a-zA-Z0-9]*$/; 
	var chk1= /\d/; 
	var chk2 = /[a-z]/i;
	var chk3 =/^[가-힣a-zA-Z]+$/;
	var num_reg = /^[0-9]*$/;
	
	
	if(!userinput.emp_num.value){
		alert("사원번호를 입력하세요");
		return false;
	}
	
	 if (chk1.test(userinput.emp_num.value) && chk2.test(userinput.emp_num.value)) {
	 }else{		
		alert("사원번호는 영어,숫자 조합입니다.")
		return false;
	}
	 
	 if(!userinput.pw.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
	 
	 if(!userinput.emp_name.value){
			alert("사원이름을 입력하세요");
			return false;
		}
	 
	 if(!chk3.test(userinput.emp_name.value)){
			alert("사원이름은 한글 또는 영어만 가능합니다.")
			userinput.emp_name.focus();
			return false;
		}
	 
	 if(!userinput.hiredate.value){
			alert("입사날짜를 입력하세요");
			return false;
		}
	 
	 if (chk1.test(userinput.hiredate.value) ) {
	 }else{		
		alert("입사날짜는 숫자만 가능합니다.")
		return false;
	}
	 
	 if(!userinput.rank.value){
			alert("봉급을 입력하세요");
			return false;
		}
	 
	 if (chk1.test(userinput.rank.value) ) {
	 }else{		
		alert("봉급은 숫자만 가능합니다.")
		return false;
	}
	 
	 if(!userinput.department.value){
			alert("부서를 입력하세요");
			return false;
		}
	 
	 if (chk1.test(userinput.department.value) ) {
	 }else{		
		alert("부서는 숫자만 가능합니다.")
		return false;
	}
	 
	 if(!userinput.position.value){
			alert("직급을 입력하세요");
			return false;
		}
	 if (chk1.test(userinput.position.value) ) {
	 }else{		
		alert("직급은 숫자만 가능합니다.")
		return false;
	}
	 
	 if(!userinput.branch.value){
			alert("지점을 입력하세요");
			return false;
		}
	 
	 if (chk1.test(userinput.branch.value) ) {
	 }else{		
		alert("지점은 숫자만 가능합니다.")
		return false;
	}
	 
	 
	 if(!userinput.emp_point.value){
			alert("사원점수를 입력하세요");
			return false;
		}
	 if (chk1.test(userinput.emp_point.value) ) {
	 }else{		
		alert("사원점수는 숫자만 가능합니다.")
		return false;
	}
	 
	 
	 if(!userinput.profilephoto.value){
			alert("프로필 사진을 업로드 하세요");
			return false;
		}
	 
	 if(!userinput.signimg.value){
			alert("사인 이미지를 업로드 하세요");
			return false;
		}
}

function openConfirm(userinput) {
    // 아이디를 입력했는지 검사
    if (userinput.emp_num.value == "") {
        alert("아이디를 입력하세요");
        return;
    }
    // url과 사용자 입력 id를 조합합니다.
    url = "confirm.jp?emp_num="+userinput.emp_num.value ;
    
    
    // 새로운 윈도우를 엽니다.
    open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}


</script>	 
	 
<form method="post" action="inputPro.jp" name="userinput" 
  onSubmit="return checkIt()" enctype="multipart/form-data">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center"  >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
 <tr> 
      <td width="200"> 프로필 사진</td>
      <td width="400" > 
        <input type="file" name="profilephoto" size="15" maxlength="12">
      </td>
    <tr>  
    <tr> 
      <td width="200"> 사원번호</td>
      <td width="400"> 
        <input type="text" name="emp_num" size="10" maxlength="12">
         <input type="button" name="confirm_emp" value="번호 중복확인" 
        							OnClick="openConfirm(this.form)">
       </td>
       </tr>
       
       <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" size="15" maxlength="12">
      </td>
    <tr>  
       
       <tr> 
      <td width="200"> 사용자 이름</td>
      <td width="400" > 
        <input type="text" name="emp_name" size="15" maxlength="12">
      </td>
    <tr>  
    
     
    <tr> 
      <td width="200"> 싸인 이미지</td>
      <td width="400" > 
        <input type="file" name="signimg" size="15" maxlength="12">
      </td>
    <tr>  
    
    <tr> 
      <td width="200">입사날짜 (YYYYMMDD로 입력)</td>
      <td width="400" > 
        <input type="text" name="hiredate" size="15" maxlength="12">
      </td>
    <tr>  
    
    <tr> 
      <td width="200">봉급</td>
      <td width="400" > 
        <input type="text" name="rank" size="15" maxlength="12">만원
      </td>
    <tr>  
       

        <tr> 
      <td width="200"> 부서</td>
      <td width="400" > 
        <input type="text" name="department" size="15" maxlength="12">
      </td>
    <tr>  
       
        
        <tr> 
      <td width="200">직급</td>
      <td width="400" > 
        <input type="text" name="position" size="15" maxlength="12">
      </td>
    <tr>  
    
     <tr> 
      <td width="200">지점</td>
      <td width="400" > 
        <input type="text" name="branch" size="15" maxlength="12">
      </td>
    <tr>  
    
     <tr> 
      <td width="200"> 사원 점수</td>
      <td width="400" > 
        <input type="text" name="emp_point" size="15" maxlength="12">
      </td>
    <tr>  
    
    <tr> 
    <td colspan="2" height="39" align="center"  >
       <font size="+1" >
    <input type="submit" value="제출">
       <input type="button" value="취소" onclick="window.location='loginform.jp'">
    </font></td>
    </td>
    </Tr>
       </table>




