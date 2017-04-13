<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/JackPot/css/calendar.css?ver=2" rel="stylesheet" type="text/css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정관리</title>
</head>
<body>
	<div class="contents">	
		<div class="contentsTop">
			일정 <a href='javascript:window.close();'><img src="/JackPot/mainsave/logout.jpg" style="float:right"/></a>
		</div>
		<div class="contentsbody">
			<div class="contents-date">
				<ul><li>${contents.cl_sdate} ${contents.cl_stime} <c:if test="${!empty contents.cl_edate}">~ ${contents.cl_edate} ${contents.cl_etime}</c:if></li></ul>
			</div>
			<div class="contents-subject">
				<ul><li>[${contents.cl_title}] ${contents.cl_subject}</li></ul>
			</div>
			<div class="contents-info">
				<ul class="contents-writer">
					<li>[등록자] ${contents.cl_writer}</li><li>등록일 : ${contents.cl_sdate}</li>
				</ul>
				<ul>
					<li>참여자]${contents.cl_participants}<li>
				</ul>
			</div>
			<div class="contents-conts">
				<ul><li>${contents.cl_contents}</li></ul>
			</div>
			<div class="btn">
				<ul>
					<li><a href='javascript:window.close();'>닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>