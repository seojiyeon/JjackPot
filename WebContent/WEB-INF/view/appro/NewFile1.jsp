<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>결재문서양식</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link rel="StyleSheet" href="/opendesk/approval/approval.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="/opendesk/css/main/main.css">
<link rel="stylesheet" type="text/css" href="/opendesk/css/main/TalkChat.css">
<link rel="stylesheet" type="text/css" href="/opendesk/css/main/profile.css">
<link rel="stylesheet" type="text/css" href="/opendesk/css/main/community.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="/opendesk/js/socket.io.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>



</head>
<body>
   <div id="wrap" >
   	<div id="top" >
   		<div id="topleft"><a href="opendesk.hou"><img src="/opendesk/main/img/main/opendesklogo.png" width="130" height="60"></a></div>
   		<div id="topright" class="pop_bt"><img src="/opendesk/main/img/main/messenger.png" width="50" height="50"></div>
   			<table id="top_menu">
   				<tr>
   					<td><a href="opendesk.hou"><img src="/opendesk/main/img/main/home.png" width="40" height="40"><br />홈</a></td>
   					<td><a href="cmMain.hou"><img src="/opendesk/main/img/main/zjabslxl.png" width="40" height="40"><br />커뮤니티</a></td>
   					<td><a href="ap_docu.hou"><img src="/opendesk/main/img/main/wjswkrufwo.png" width="40" height="40"><br />전자결재</a></td>
   					<td><a href="./scheduler.hou"><img src="/opendesk/main/img/main/maincalendar.png" width="40" height="40"><br />일정</a></td>
   					<td><a href="attendance.hou"><img src="/opendesk/main/img/main/rmsxo.png" width="40" height="40"><br />근태관리</a></td>
				</tr>
   			</table> 
	     	<hr width=100% size=5 color="#00A2E8">		   	
	</div>	
	<div id="left">
     	<div id="leftTop">
     	<div id="leftTopright">
     	   <div class="dropdown">
			<button class="dropbtn"><%=session.getAttribute("memSawonName")%>
			  	<div class="dropdown-content">	<a href="logout.hou">Logout</a>
				</div>
			</div>
			<br/><br/><br/>${memdname}
		</div>
		<img src="${memSawonImg }" width="70" height="80">
     </div>
     	
     	
     	<div id="leftBottom" align="center">
     	<br />
			<table>
				 <h1 class="h_css">문서</h1>
				  <tr>
				    <td><a href="ap_docu.hou">결재문서양식</a></td>
				  </tr>
				  <tr>
				    <td><a href="temp_list.hou">임시저장</a></td>
				  </tr>
			</table>
			<br />
     		<table>
				<h1 class="h_css">상신함</h1>
				  <tr>
				    <td><a href="ap_list.hou">결재상신</a></td>
				  </tr>
				  <tr>
				    <td><a href="ap_ingList.hou">결재진행</a></td>
				  </tr>
				  <tr>
				    <td><a href="ap_finishList.hou">결재완료</a></td>
				  </tr>
				  <tr>
				    <td><a href="return_list.hou">결재반려</a>
				    <c:if test="${return_readCount != 0}">
				    <span id="leftMenuRight">${return_readCount }</span>
				    </c:if>
				    </td>
				  </tr>
			</table>
			     	<br />
     		<table>
				<h1 class="h_css">결재함</h1>
				  <tr>
				    <td><a href="re_List.hou">결재할문서</a>
				    <c:if test="${report_alarmCount != 0}">
				    <span id="leftMenuRight">${report_alarmCount }</span>
				    </c:if>
				    </td>
				  </tr>
				  <tr>
				    <td><a href="re_finish.hou">결재한문서</a></td>
				  </tr>
			</table>
			     	<br />
     		<table>
				<h1 class="h_css"> 결재임박함</h1>
				  <tr>
				    <td><a href="near_reportList.hou">상신함</a></td>
				  </tr>
				  <tr>
				    <td><a href="near_approveList.hou">결재함</a>
				    <c:if test="${impend_reCount != 0}">
				    <span id="leftMenuRight">${impend_reCount }</span>
				    </c:if>
				    </td>
				  </tr>
			</table>
     				<br />
     		<table>
				<h1 class="h_css">수신참조함</h1>
				  <tr>
				    <td><a href="ap_sCwPList.hou">수신참조함</a>
				    <c:if test="${refer_alarmCount != 0}">
				    <span id="leftMenuRight">${refer_alarmCount }</span>
				    </c:if>
				    </td>
				  </tr>
			</table>
     	</div>
     </div>
     
     <div id="content">
     
<h1 class="h_css">결재문서양식</h1>

<table class="approval_mainTableCss">
	<tr>
		<td width="80"><b>분류</b></td>
		<td width="400">
			<form method="post" action="ap_categorize.hou">
			<select name="categorize" style="width:90px;">
				<c:forEach var="cate" items="${cateList }">
				<option>${cate.categorizeName}</option>
				</c:forEach>
			</select>
			
			<input type="submit" value="검색" />
			</form>
			
		</td>
	</tr>
</table>


<br />
<table class="approval_mainTableCss">
	<tr>
		<td width="80" rowspan="2"><b>No.</b></td>
		<td width="150" rowspan="2"><b>분류</b></td>
		<td width="400" height="30"><b>양식명</b></td>
	</tr>
	<tr>
		<td height="30"><b>설명</b></td>
	</tr>
	
	<c:set var="geuntae" value="근태신청서" />
	
	<c:forEach var="docu" items="${dto }">
	<tr>
		<td width="80" rowspan="2">${docu.no }</td>
		<td width="150" rowspan="2">${docu.categorize }</td>
		<c:if test="${docu.categorize != geuntae}">
		<td width="400"><a href="" onClick="window.open('http://localhost:8080/opendesk/ap_Form.hou?no=${docu.no}', '', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-700)/2+', width=740px,height=650px');">${docu.formName }</a></td>
		</c:if>
		<c:if test="${docu.categorize == geuntae}">
		<td width="400"><a href="" onClick="window.open('http://localhost:8080/opendesk/ap_geuntaeForm.hou?no=${docu.no}', '', 'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-700)/2+', width=740px,height=650px');">${docu.formName }</a></td>
		</c:if>
	</tr>
	<tr>
		<td>${docu.explain }</td>
	</tr>
	
	</c:forEach>
	
</table>

<div>${pagingHtml }</div>
     </div>
     <div id="right" align="center">
     	    <br />
		    <hr width="100%" size=1 color="gray">
		     	일정
		    <hr width="100%" size=1 color="gray">
		    <table>
	     		<tr><td height="100" >
	     		</td></tr>
	     	</table>    	
		    <hr width="100%" size=1 color="gray">
	     	내 커뮤니티
	     	<hr width="100%" size=1 color="gray">
	     	<table >
	     		<tr><br />
	     		<select class="m_select select01" onchange="favorite(value)">
				<option value="1">즐겨찾기</option>
	     		<c:forEach var="f" items="${favoriteList}">
				<option value="cblist.hou?cname=${f.cname}">${f.cname}</option>
				</c:forEach>
	     		</select>
	     		</tr>
	     		
	     	</table>
	     	<br /><br />
	     	
	     	<hr width="100%" size=1 color="gray">
	     	진행중인 투표
	     	<hr width="100%" size=1 color="gray">
	     	<table>
	     		<tr><td height="100">
			<c:forEach var="poll" items="${poll}" varStatus="status">
     				<c:set var="poll_term" value="${poll.term}${hour}" />
     					<c:if test="${real_date<=poll_term}">
     							
     						<a href="#" onclick="window.open('cblist.hou?cname=${poll.cname}','popo1', 'left='+(screen.availWidth-900)/2+',top='+(screen.availHeight-600)/2+', width=900px,height=600px')">[${poll.cname}]</a>커뮤니티<br /> 
							<a href="#" onclick="window.open('pollmiddle.hou?cname=${poll.cname}','popo1', 'left='+(screen.availWidth-900)/2+',top='+(screen.availHeight-600)/2+', width=900px,height=600px')">${poll.subject}</a>	<br />
     						기간 ${poll.term }<hr />
     					</c:if>
     			</c:forEach>

			</td></tr>
	     	</table>
	     	<br />
     </div>
   </div>
   <!-- -------------------------------------------------------------------------------------------- --> 
   <!-- 메신저 첫화면 popup -->   
  <div id="pop" class="open" style="display:none;" >
    <div class="notice" >openTalk
        <div id="noticeright" style="text-align:right">
            <div id="close">X</div>
        </div>
    </div>
    <div class="contentsTop">
    	<table id="toptable">
		   	<tr>
		   		<td width="50px"><span id="mem" ><img src="/opendesk/main/img/messenger/member.png" width="50" height="50"></span></td>
		   		<td width="50px"><span id="mem2"><img src="/opendesk/main/img/messenger/talkroom.png" width="50" height="50"></span></td>
		   		<td width="50px"><span id=""></span></td>
		   		<td width="50px"><span id="mem3"><img src="/opendesk/main/img/messenger/setting.png" width="50" height="50"></span></td>
		   		<td width="100px">${sessionScope.memSawonName}</td>
		   	</tr>
    	</table>
    </div>
    <div class="contentsBottom">
    	<table id="bottomtable">
    		<tr>
    			<td width="30px"><span id="mem5"><img src="/opendesk/main/img/messenger/mem.png" width="20" height="20"></span></td>
    			<td width="30px"><span id="mem6"><img src="/opendesk/main/img/messenger/tree.png" width="20" height="20"></span></td>
    			<td collspan="3"><input type="text"  placeholder="이름이나 부서를 검색하세요" size="25" /></td>
    		</tr>
    	</table>
    </div>
    <div class="contents">
    	<span id="member"></span>
	</div>
</div>  
<!-- -------------------------------------------------------------------------------------------- -->
</body>
</html>