<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link href="/JackPot/css/main.css?ver=19" rel="stylesheet" type="text/css">

<link href="css/fullcalendar.css" rel="stylesheet"/>
<link href="css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.js"></script>
<script type="text/javascript" src="js/locale-all.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	window.setInterval('callMsg2()', 3000); 
	window.setInterval('callAjax2()', 10000); 
});


function callMsg2(){
	if("${count != 0}"){
		callMsg();
		
	}else{
		return false;
	}	
	
}

function callMsg(){
	 $.ajax({
	        type: "post",
	        url : "msgNew.jp",
	        success: test,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
  	});
}
function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#ajaxReturn").html(aaa).fadeIn(4000).fadeOut(4000);	//id가 ajaxReturn인 부분에 넣어라
    
}
function whenError(){
    
}


$(document).ready(function(){
    $("#ajaxReturn").click(function(){
        open("/JackPot/msgmain.jp","쪽지보내기","width=1200, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    });
    
});


/* -------------------------------- */



function callAjax2(){
	if("${count2 != 0}"){
		callAjax();
		
	}else{
		return false;
	}	
	
}



function callAjax(){
 $.ajax({
        type: "post",
        url : "alarm.jp",
        success: test2,	// 페이지요청 성공시 실행 함수
        error: whenError	//페이지요청 실패시 실행함수
	});
}
function test2(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
$("#ajaxRetur").html(aaa).fadeToggle(5000);	//id가 ajaxReturn인 부분에 넣어라

}
function whenError(){    
}

$(document).ready(function(){
$("#ajaxRetur").click(function(){
	$("#ajaxRetur").hide();
    open("/JackPot/msgmain.jp","쪽지보내기","width=1200, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
});    
});

/* ------------------------------------------------------- */

jQuery(document).ready(function() {	 
    jQuery("#calendar").fullCalendar({
    	  height: 650
    	, contentHeight: 150
        , defaultDate : "2017-03-23"
        , locale: 'ko'
        , eventLimit : true
		, header: {}
        , defaultView: 'month'
        , editable : true
		
        , navLinks: true // can click day/week names to navigate views
		, weekNumbers: true
		, weekNumbersWithinDays: true
		, weekNumberCalculation: 'ISO'
        ,	dayClick: function() {
        	window.open("http://localhost:8080/JackPot/calendarinsert.jp",'insert','top=200px,left=500px,height=550px,width=430px ')
		}
    });
});
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
function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp() { 
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	
	function logout(){				
			alert("로그아웃 하셨습니다.");
			
		}
	
	

</script>

 <style>
.ajax{
position: absolute;
right: 0;
bottom: 0;
width: 400px;
height: 200px;
}

#ajaxReturn {
    background-color: #ffb3b3;
    width: 140;
    position: absolute;
    right: 0;
    bottom: 65;
    padding: 20;
    font-size: 14px;
    color: ghostwhite;
    text-align: center;
    margin-bottom: 5;
}

#ajaxRetur{
    background-color: #2d5461;
    width: 150px;
    position: absolute;
    right: 0;
    bottom: 0;
    padding: 15;
    font-size: 14px;
    color: ghostwhite;   
    text-align: center;   
    
 }
 </style>


<html>
<head>
<title>메인 페이지</title>
</head>
<body class="methods-page main-bg" data-page="methods">
    
    <div id="top">
    <c:if test="${memId != null}">  
    <font color="white">${memId} 님이 접속중입니다.</font>
    <a href="logout.jp" onClick="logout()"><img src="/JackPot/mainsave/logout.jpg"></a>
    </c:if>
    	<ul style="padding: 0;list-style-type: none; -webkit-padding-start:0px;    -webkit-margin-before: 0em;
   				   -webkit-margin-after: 0em;">
    	<li>
    		<div class="topetc" style="list-style:none;">
    		<ul style="height:40px;width:350px;float:right;padding:0px;margin:0px;">
    		<li style="text-align:center;">
    		
    			<div class="Search">
    			<c:if test="${memId == null}"> 
    			<input type="button" value="로그인폼가긔" onclick="window.location='loginform.jp'" />
    			</c:if>
    			<form>
       			<select><option>통합검색</option><option>직원검색</option></select>
  				<input type="text" name=""/>
    			<input  TYPE="IMAGE" src="/JackPot/mainsave/submit.jpg" name="Submit" value="Submit" align="absmiddle">
    			</form>
    			</div>
    		</li>
    		</ul>
    		</div>
    	</li>
    	</ul>
    </div>
	
	<div id="mainInfo-wrap"  style="height: 1798px;">
		<div class="mainlogo"><br/><br/><a href="/JackPot/main.jp"><img src="/JackPot/mainsave/logo.jpg"></a></div>
		<div class="user-info"></div>
		<div class="schedule"><div id="calendar"></div></div>
		<br/>
		<div class="main-basic-info"></div>
		
		
		 
		
		<ul style="list-style:none">

<c:if test="${memId == null}">
 <div class="m-box coworker">
     <h2 align="right"><a href="loginform.jp">로그인 해주세요</a></h2>
 </div>
</c:if>

<c:if test="${memId != null}">
  <div class="m-box coworker">
		



		 <h2><img src="/JackPot/save/star.jpg" width="18" height="18">&nbsp;자주 연락하는 사람들  <a href="orgChart.jp" style="margin:80; font-size:14;"> 수정하기 </a></h2> 
		 
		
  <div id="listFavoriteDiv" class="favorite-m user-list">
		<c:forEach var="article" items="${favList}" varStatus="status">
	<ul>	
  <li>
  
  <span id="favoriteProfileImgSpan1" class="per2">
  <img src="/JackPot/save/${article.profilephoto}" width="45" height="45" > 
  </span>
  
  <span class="name-team ellipsis">
        <strong  style="cursor: pointer;"> 
   ${article.emp_name}(${article.emp_num}) <br/>
 </strong></span>
 
 <span class="info">
       <span class="phone"    style= "font-size:15;" > ${article.phone}</span><br/>
       <span class="tel"  style= "font-size: 14;"> ${article.address}<br/></span>
 </span>
   
    </li >
    </ul>
   </c:forEach>
    </div>
    
    </div>                    
  </c:if>
  
  
   </div>
   </ul>
   
		</div>
		
</div>

  

   
	
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
    <div class="main-aside">
    <form name="rtcForm">
		<input type="text" name="rtcInput" size="20" readonly="readonly" />
	</form>
    </div> 
    
    <div class="contents">
    <ul>
    	<!-- <li><a href=""><br/><br/>메일 <br><img src="/JackPot/mainsave/메일.png"></a></li> -->
    	<li><a href="/JackPot/listApproTodo.jp"><br/><br/>전자결재<br><img src="/JackPot/mainsave/전자결재.png"></a></li>
    	<li><a href="/JackPot/community.jp"><br/><br/>게시판<br><img src="/JackPot/mainsave/게시판.png"></a></li>
    	<li><a href="/JackPot/calendar.jp"><br/><br/>일정<br><img src="/JackPot/mainsave/업무관리.png"></a></li>
    	<li><a href="/JackPot/myBmYCHList.jp"><br/><br/>업무관리 <br><img src="/JackPot/mainsave/업무관리.png"></a></li>    
    	<li><a href="/JackPot/msgmain.jp"><br/><br/>쪽지<br><img src="/JackPot/mainsave/쪽지.png"></a></li>    	
    	<li><a href="/JackPot/orgChart.jp"><br/><br/>주소록<br><img src="/JackPot/mainsave/주소록.png"></a></li>
    	<li><a href="/JackPot/memoList.jp?memoGroup=1"><br/><br/>메모<br><img src="/JackPot/mainsave/메모.png"></a></li>
    	<li><a href="/JackPot/UpVote.jp"><br/><br/>온라인투표<br><img src="/JackPot/mainsave/온라인투표.png"></a></li>
    	<li><a href="https://open.kakao.com/"><br/><br/>메신저<br><img src="/JackPot/mainsave/메신저.png"></a></li>
    	<li><a href="/JackPot/work.jp"><br/>인사관리폴더<br><img src="/JackPot/mainsave/인사관리폴더.png"></a></li>
    	<li><a href="/JackPot/emplist.jp"><br/>회계관리폴더<br><img src="/JackPot/mainsave/회계관리폴더.png"></a></li>
    	
    </ul>
    </div>
</body>
	 <div class="ajax">
	 <div id="ajaxRetur" style="display:none;">안읽은 쪽지</div> 
	 </div>
	 <div id="ajaxReturn" style="display:none;">새 쪽지</div>
</html>    