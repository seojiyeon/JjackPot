<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link href="/JackPot/css/main.css?ver=5" rel="stylesheet" type="text/css">

<link href="css/fullcalendar.css" rel="stylesheet"/>
<link href="css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.js"></script>
<script type="text/javascript" src="js/locale-all.js"></script>
<script type="text/javascript">

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

</script>


<html>
<head>
<title>메인 페이지</title>
</head>
<body onload="realtimeClock()">
    
    <div id="top">
    	<ul style="padding: 0;list-style-type: none; -webkit-padding-start:0px;    -webkit-margin-before: 0em;
   				   -webkit-margin-after: 0em;">
    	<li>
    		<div class="topetc" style="list-style:none;">
    		<ul style="height:40px;width:350px;float:right;padding:0px;margin:0px;">
    		<li style="text-align:center;">
    			<div class="Search">
    			<form>
       			<select><option>통합검색</option><option>직원검색</option></select>
  				<input type="text" name=""/>
    			<input  TYPE="IMAGE" src="/JackPot/mainsave/submit.jpg" name="Submit" value="Submit" align="absmiddle">
    			</form><a href="logout.jp"><img src="/JackPot/mainsave/logout.jpg"></a>
    			</div>
    		</li>
    		</ul>
    		</div>
    	</li>
    	</ul>
    </div>
	
	<div id="mainInfo-wrap">
		<div class="mainlogo"><br/><br/><a href="/JackPot/main.jp"><img src="/JackPot/mainsave/logo.jpg"></a></div>
		<div class="user-info"></div>
		<div class="schedule"><div id="calendar"></div></div>
		<br/>
		<div class="main-basic-info">
		
		
		<h2>즐겨찾기 <input type="button" value="즐겨찾기 수정" onclick="window.location='orgChart.jp'">
		</h2> 
		
		<c:forEach var="article" items="${favList}" varStatus="status">
		<ul style="list-style:none">
  
  <li>
    <div align="center" width="300" >
  <img src="/JackPot/save/star.jpg" width="20" height="20"> &nbsp; <img src="/JackPot/save/${article.profilephoto}" width="50" height="55" > ${article.emp_name}(${article.emp_num}) <br/>
 
   ${article.address}<br/>
   ${article.phone}<br/>
   </div>
 </li>
   </ul>
   
   </c:forEach>
		</div>
		<div class="main-coworker"></div>
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
    	<li><a href=""><br/><br/>메일 <br><img src="/JackPot/mainsave/메일.png"></a></li>
    	<li><a href=""><br/><br/>전자결재<br><img src="/JackPot/mainsave/전자결재.png"></a></li>
    	<li><a href="/JackPot/community.jp"><br/><br/>게시판<br><img src="/JackPot/mainsave/게시판.png"></a></li>
    	<li><a href="/JackPot/calendar.jp"><br/><br/>일정<br><img src="/JackPot/mainsave/업무관리.png"></a></li>
    	<li><a href=""><br/><br/>SNS<br><img src="/JackPot/mainsave/SNS.png"></a></li>
    	<li><a href=""><br/><br/>쪽지<br><img src="/JackPot/mainsave/쪽지.png"></a></li>
    	<li><a href=""><br/><br/>거래처<br><img src="/JackPot/mainsave/거래처.png"></a></li>
    	<li><a href=""><br/><br/>주소록<br><img src="/JackPot/mainsave/주소록.png"></a></li>
    	<li><a href=""><br/><br/>메모<br><img src="/JackPot/mainsave/메모.png"></a></li>
    	<li><a href=""><br/><br/>온라인투표<br><img src="/JackPot/mainsave/온라인투표.png"></a></li>
    	<li><a href=""><br/><br/>메신저<br><img src="/JackPot/mainsave/메신저.png"></a></li>
    	<li><a href=""><br/><br/>웹팩스<br><img src="/JackPot/mainsave/웹팩스.png"></a></li>
    	<li><a href="/JackPot/work.jp"><br/>인사관리폴더<br><img src="/JackPot/mainsave/인사관리폴더.png"></a></li>
    	<li><a href=""><br/>회계관리폴더<br><img src="/JackPot/mainsave/회계관리폴더.png"></a></li>
    	<li><a href=""><br/>영업관리폴더<br><img src="/JackPot/mainsave/영업관리폴더.png"></a></li>
    </ul>
    </div>
</body>
</html>    