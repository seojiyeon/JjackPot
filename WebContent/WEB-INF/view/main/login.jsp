<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   


<script LANGUAGE="JavaScript">

function checkCapsLock( e ) {
    var myKeyCode=0;
    var myShiftKey=false;
    var myMsg='[Caps Lock] 키가 켜져 있습니다.\n[Caps Lock] 키를 끄고 비밀번호를 입력해 주시기 바랍니다.';
    // Internet Explorer 4+
    if ( document.all ) {
        myKeyCode=e.keyCode;
        myShiftKey=e.shiftKey;
    // Netscape 4
    } else if ( document.layers ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    // Netscape 6
    } else if ( document.getElementById ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    }
     if ( ( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey ) {
    	 alert( myMsg );
        
    } else if ( ( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey ) {
    	alert( myMsg );
        
    }
     
  }
  

</script>


<html>
<head>
<title>메인 페이지</title>


<form name="myform" action="loginPro.jp" method="post" onSubmit="return checkIt()">

<c:if test="${memId==null}">
<div class="logintab">
<input type="text" name="emp_num" placeholder="사원번호">
<input type="password" name="pw" placeholder="비밀번호" onKeyPress="checkCapsLock( event )"> 
<input type="submit" value="로그인">
</div>
</c:if>
<c:if test="${memId==null}">
<div class="util" style=left:1270px;>
 </div>
 </c:if>
 
<c:if test="${memId!=null}">
<div class="util" style=left:1170px;>
 <a href="/JackPot/logout.jp">로그아웃</a>
 |
 <a href="/JackPot/orgChart.jp">조직도</a>
 |
  <a href="/JackPot/modifyForm.jp">정보수정</a>
 
 <c:if test="${memId=='admin12'}">
 |
 <a href="/JackPot/delete.jp">탈퇴</a>
 |

 </c:if>
 </div>
 </c:if>
 </form>
 </head>
 </html>
 