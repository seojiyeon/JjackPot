<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script> 

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
	
	
	/* 메모 이동 : 레이어 팝업 */
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면의 높이와 너비로 설정한다.
		$('.maskMove').css({'width':maskWidth,'height':maskHeight});  

		//애니메이션 효과
		$('.maskMove').fadeTo("slow",0.5);   
	
		// 레이어 팝업을 가운데로 띄운다.
		var left = ($(window).scrollLeft() + ($(window).width() - $('.windowMove').width())/2);
		var top = ($(window).scrollTop() + ($(window).height() - $('.windowMove').height())/2);
	
		// css 스타일 변경
		$('.windowMove').css({'left':left, 'top':top, 'position':'absolute'});

		// 레이어 팝업 띄운다.
		$('.windowMove').show();
	}

	$(document).ready(function(){
		//검은 마스크 배경과 레이어 팝업 띄운다.
		$('.btnMove, .btnRecover').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.windowMove .close').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
	    	e.preventDefault();  
		    $('.maskMove, .windowMove').hide();  
		});       

		//검은 마스크을 눌렀을 때
		$('.maskMove').click(function () {  
	    	$(this).hide();  
		    $('.windowMove').hide();  
		});      
	});
	
	
	/* 메모 카테고리 선택 후 페이지 이동 */
	function selectMove(a, memoGroup) {
		if(memoGroup > 0) {   // 체크박스 체크 여부 확인 후 경고창 띄우는거도 하기
			document.multiForm.action="memoCateMove.jp?memoGroup=${memoGroup}&memo_cate="+a;
			document.multiForm.submit();
		} else if(memoGroup == 0) {
			document.multiForm.action="memoRecover.jp?memoGroup=${memoGroup}&memo_cate="+a;
			document.multiForm.submit();
		}
	}
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
							  
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmYCHList.jp">내가 한 업무 요청</a> </li>
								      <li><a href="/JackPot/myBmYCHokList.jp">내가 한 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/myBmYCHnoList.jp">내가 한 업무 요청 반려</a> </li>
<!-- 								      <li><a href="/JackPot/SSBmYCHList.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/SSBmYCHnoList.jp">수신 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/SSBmYCHnoList.jp">수신 업무 요청 반려</a> </li>	 -->							      
								      <li><a href="/JackPot/ChZBmYCHList.jp">참조  업무 요청</a></li>
								      <li><a href="/JackPot/cHzBmYCHokList.jp">참조 업무 요청 완료</a> </li>
								      <li><a href="/JackPot/cHzBmYCHnoList.jp">참조 업무 요청 반려</a> </li>								      
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmBGList.jp">내가 한 업무 보고 </a> </li>
								      <li><a href="/JackPot/cHzBmBGokList.jp">내가 한 업무 보고 완료</a> </li>
								      <li><a href="/JackPot/cHzBmBGnoList.jp">내가 한 업무 보고 반려</a> </li>										      
								      <li><a href="/JackPot/SSBGBmList.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/cHzBmBGokList.jp">수신 업무  보고 완료</a> </li>
								      <li><a href="/JackPot/cHzBmBGnoList.jp">수신 업무 보고 반려</a> </li>										      
								      <li><a href="/JackPot/ChZBGBmList.jp">참조  업무 보고 </a></li>
								      <li><a href="/JackPot/cHzBmBGokList.jp">참조 업무 보고 완료</a> </li>
								      <li><a href="/JackPot/cHzBmBGnoList.jp">참조 업무  보고 반려</a> </li>										      
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li >
							<a style="display:inline-block;height:20px;">업무일지  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmWriteList.jp">내가 작성한 업무 일지  </a> </li>
								      <li><a href="/JackPot/cHzBmIjokList.jp">내가 작성한 업무 일지 완료</a> </li>
								      <li><a href="/JackPot/cHzBmIjnoList.jp">내가 작성한 업무 일지 반려</a> </li>										      
								      <li><a href="/JackPot/SSBmList.jp">수신  업무 일지  </a></li>
								      <li><a href="/JackPot/cHzBmIjokList.jp">참조 업무 일지 완료</a> </li>
								      <li><a href="/JackPot/cHzBmIjnoList.jp">참조 업무 일지 반려</a> </li>										      
								      <li><a href="/JackPot/ChZBmList.jp">참조  업무 일지 </a></li>
								      <li><a href="/JackPot/cHzBmIjokList.jp">참조 업무 일지 완료</a> </li>
								      <li><a href="/JackPot/cHzBmIjnoList.jp">참조 업무 일지 반려</a> </li>										      
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
