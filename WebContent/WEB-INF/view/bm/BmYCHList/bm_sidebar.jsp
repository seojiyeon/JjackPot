<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=8" type="text/css" />  
 
<script src="resource/ckeditor.js"></script>
<html>
<head>
<style type="text/css">

.scrollBlind{
	width:230px;
	height:100%;
	overflow-y:scroll;

} 
</style>

<script>
	/* 메뉴 슬라이드 업&다운 */
	$(document).ready(function() {
		$(".listFolder>a").click(function() {
			var subMenu = $(this).next("ul");
			
			if(subMenu.is(":visible")) {
				subMenu.slideUp();
			} else {
				subMenu.slideDown();
			}
		});
	});
	


</script>

	<div id="page-container">
		<div id="sidebar">
		<a href="main.jp" class="sidebar-brand otherMenu menuTooltip">
		    <img src="/JackPot/save/home.png" style="background-color: white;width: 60;height: 60px;">
   <span id="brand" class="brand none">  
	</span>	 
   </a>
			</div>
			
			<div id="subarea">	
				<div id="leftmenu-jp">
					<div class="leftmenu-top">
						<h2><a href="/JackPot/myBmYCHList.jp">업무관리 </a></h2>
					</div>
					
					<div id="leftmenuarea" class="scrollBlind">
					<ul class="menulist" style="margin:0;padding:0;list-style:none;">
						<li >
							<a href="/JackPot/bmForm.jp">업무등록 </a><br>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
			
						
					
						<li >
							<a style="display:inline-block;height:20px;">To - Do</a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
							   		<li ><a href="/JackPot/mytodoList.jp">나의 할일 </a></li>
							   		<li ><a href="/JackPot/mytodook.jp">나의 할일 완성  </a></li>
							   		<li><hr color=" lightgrey " size="1"></li>
							   	</ul>
						</li>
							  
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmBGList.jp">내가 한 업무 보고 </a> </li>
								      <li><a href="/JackPot/myBmBGokList.jp">내가 한 업무 보고 완료</a> </li>
								      <li><a href="/JackPot/myBmBGnoList.jp">내가 한 업무 보고 반려</a> </li>										      
								      <li><a href="/JackPot/SSBGBmList.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/SSBmBGokList.jp">수신 업무  보고 완료</a> </li>
								      <li><a href="/JackPot/SSBmBGnoList.jp">수신 업무 보고 반려</a> </li>										      
								      <li><a href="/JackPot/ChZBGBmList.jp">참조  업무 보고 </a></li>
								      <li><a href="/JackPot/cHzBmBGokList.jp">참조 업무 보고 완료</a> </li>
								      <li><a href="/JackPot/cHzBmBGnoList.jp">참조 업무  보고 반려</a> </li>										      
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmYCHList.jp">내가 한 업무 요청</a> </li>
								      <li><a href="/JackPot/myBmYCHokList.jp">내가 한 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/myBmYCHnoList.jp">내가 한 업무 요청 반려</a> </li>
									  <li><a href="/JackPot/SSBmYCHList.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/SSBmYCHnoList.jp">수신 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/SSBmYCHnoList.jp">수신 업무 요청 반려</a> </li>							      
								      <li><a href="/JackPot/ChZBmYCHList.jp">참조  업무 요청</a></li>
								      <li><a href="/JackPot/cHzBmYCHokList.jp">참조 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/cHzBmYCHnoList.jp">참조 업무 요청 반려</a> </li>								      
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
