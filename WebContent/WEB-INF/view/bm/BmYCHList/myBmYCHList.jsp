<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script type="text/javascript" charset="UTF-8" src="/comon/ETC/js/jquery.leanModal.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=6" type="text/css" />   
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="resource/ckeditor.js"></script>
<html>
<head>
<html>
<title> 업무관리</title>
</head>    
 <body>
<!-- ========================================================사이드바======================================================================= -->		

	<div id="page-container">
		<div id="sidebar">
			</div>
			<div id="subarea">	
				<div id="leftmenu-jp">
					<div class="leftmenu-top">
						<h2><a href="/JackPot/bmList.jp">업무관리 </a></h2>
					</div>
					
					<div id="leftmenuarea">
					<ul class="menulist" style="margin:0;padding:0;list-style:none;">
						<li >
							<a href="/JackPot/bmForm.jp">업무등록 </a><br>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
			
						
					
						<li >
							<a style="display:inline-block;height:20px;">To - Do</a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
							   		<li style="text-align:center;"><a href="/JackPot/mytodoList.jp">나의 할일 </a></li>
							   		<li><hr color=" lightgrey " size="1"></li>
							   	</ul>
						</li>
							  
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmYCHList.jp">내가 한 업무 요청</a> </li>
								      <li><a href="/JackPot/SSBmYCHList.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/ChZBGBmYCHList.jp">참조  업무 요청</a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmBGList.jp">내가 한 보고 </a> </li>
								      <li><a href="/JackPot/SSBGBmList.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/ChZBGBmList.jp">참조  업무 보고 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li >
							<a style="display:inline-block;height:20px;">업무일지  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmWriteList.jp">내가 작성한 업무 일지  </a> </li>
								      <li><a href="/JackPot/SSBmList.jp">수신  업무 일지  </a></li>
								      <li><a href="/JackPot/ChZBmList.jp">참조  업무 일지 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a >업무보관함   </a>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
						
						<li>
							<a >업무보관함 관리    </a>
						</li>
					</ul>
				</div>
			</div>
			</div>
			</div>
<!-- ================================================================================================================================================= -->		




</html>