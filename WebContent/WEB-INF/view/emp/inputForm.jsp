	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<link href="/JackPot/css/community.css?ver=14" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/JackPot/css/community.css" type="text/css" />
<html>
<head>
<title>회원가입</title>


<style>
table {
    border-collapse: collapse;
    width: 700px;
}

th, td {
    text-align: left;
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

</style>

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
	<body>
<div id="page-container" class="sub sidebar-mini sidebar-subarea">

<div id="sidebar">
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
<div class="leftmenu-top" >
			<h2 style="margin:20;" >회원가입</h2>
</div>

<div class="leftmenu-inner-scroll mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" 
style="height: 100%; position: relative; overflow: visible;"><div id="mCSB_1" 
class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" 
style="max-height: none;" tabindex="0"><div id="mCSB_1_container" 
class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" 
style="position:relative; top:0; left:0;" dir="ltr">
			<ul class="menulist">	
				<li data-submenu="allList" class="current">
					<a href="inputForm.jp" class="sidebar-nav-menu">회원가입</a>
				</li>
				
				
</div>
</div>
</div>
</div>


<div id="main-container">
<div style="margin:20 400;">

<div class="con-header">
	<h2 >
	회원가입
	</h2>
</div>
			
	

 <div id="mainmain">
<form method="post" action="inputPro.jp" name="userinput" 
  onSubmit="return checkIt()" enctype="multipart/form-data">
  <table  cellspacing="0" cellpadding="3" align="center" >
    
 <tr> 
      <td width="200"> 프로필 사진</td>
      <td width="400" > 
        <input type="file" name="profilephoto" size="15" maxlength="12">
      </td>
      </tr>
    
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
    </tr>  
       
       <tr> 
      <td width="200"> 사용자 이름</td>
      <td width="400" > 
        <input type="text" name="emp_name" size="15" maxlength="12">
      </td>
    </tr>  
    
     
    <tr> 
      <td width="200"> 싸인 이미지</td>
      <td width="400" > 
        <input type="file" name="signimg" size="15" maxlength="12">
      </td>
    </tr>  
    
    <tr> 
      <td width="200">입사날짜 (YYYYMMDD로 입력)</td>
      <td width="400" > 
        <input type="text" name="hiredate" size="15" maxlength="12">
      </td>
    </tr>  
    
    <tr> 
      <td width="200">봉급</td>
      <td width="400" > 
        <input type="text" name="rank" size="15" maxlength="12">만원
      </td>
    </tr>  
       

        <tr> 
      <td width="200"> 부서</td>
      <td width="400" > 
        <input type="text" name="department" size="15" maxlength="12">
      </td>
    </tr>  
       
        
        <tr> 
      <td width="200">직급</td>
      <td width="400" > 
        <input type="text" name="position" size="15" maxlength="12">
      </td>
    </tr>  
    
     <tr> 
      <td width="200">지점</td>
      <td width="400" > 
        <input type="text" name="branch" size="15" maxlength="12">
      </td>
    </tr>  
    
     <tr> 
      <td width="200"> 사원 점수</td>
      <td width="400" > 
        <input type="text" name="emp_point" size="15" maxlength="12">
      </td>
    </tr>  
  
       </table>
       
       <input type="submit" value="제출">
       <input type="button" value="취소" onclick="window.location='loginform.jp'">
    
       
       </form>
       </div>
       </div>
       </div>
       </div>
       </div>
       </div>
    
       </body>
       </html>
       




