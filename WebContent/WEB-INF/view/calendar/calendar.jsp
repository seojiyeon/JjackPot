<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/JackPot/css/calendar.css?ver=1" rel="stylesheet" type="text/css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>풀캘린더</title>


<body style="height:100%;overflow-x:hidden;overflow-y:hidden;margin:0px;">
<div id="page-container">
	<div id="sidebar">

	</div>
	<div id="subarea">	
		<div id="leftmenu">
		</div>
    </div>
	<div id="#main-container">
		<div id="main-contents">
   			<jsp:include page="/fullcalendar.jp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>