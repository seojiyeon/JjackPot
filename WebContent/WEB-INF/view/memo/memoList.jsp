<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<link href="/JackPot/css/memo.css?ver=4" rel="stylesheet" type="text/css">

<head>
<title>메모</title>

<style>
	.mask {  
	  position:absolute;  
	  z-index:9000;  
	  background-color:#000;  
	  display:none;  
	  left:0;
	  top:0;
	}
	.window {
	  display: none;
	  position:absolute;  
	  left:100px;
	  top:100px;
	  z-index:10000;
	}
	
	.memoNote {
		margin: 12px 0 6px;
    	line-height: 18px;
    	max-height: 52px;
    	text-overflow: ellipsis;
    	overflow: hidden;
    	-webkit-line-clamp: 3;
    	-webkit-box-orient: vertical;
    	display: -webkit-box;
    	word-wrap: break-word;
	}
</style>
</head>

<script>
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면의 높이와 너비로 설정한다.
		$('.mask').css({'width':maskWidth,'height':maskHeight});  

		//애니메이션 효과
		$('.mask').fadeTo("slow",0.5);   
		
		// 레이어 팝업을 가운데로 띄운다.
		var left = ($(window).scrollLeft() + ($(window).width() - $('.window').width())/2);
		var top = ($(window).scrollTop() + ($(window).height() - $('.window').height())/2);
		
		// css 스타일 변경
		$('.window').css({'left':left, 'top':top, 'position':'absolute'});

		// 레이어 팝업 띄운다.
		$('.window').show();
	}

	$(document).ready(function(){
		//검은 마스크 배경과 레이어 팝업 띄운다.
		$('.chMemoCate').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.window .close').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('.mask, .window').hide();  
		});       

		//검은 마스크을 눌렀을 때
		$('.mask').click(function () {  
		    $(this).hide();  
		    $('.window').hide();  
		});      
	});
</script>

<body>
<!-- 레이어 팝업 -->
<div class="mask"></div>
<div class="window">
	<div id="MemoCateName">
	
	</div>
</div>

<div id="page-container">
	<!-- 왼쪽 사이드바 -->
	<div id="sidebar"></div>
	<div id="subarea">
		<div id="leftMenu">
			<div class="leftMenuTop">
				<h2><a href="#">메모</a></h2>
			</div>
			
			<div id="leftMenuArea">
				<ul class="menuList" style="margin:0;padding:0;list-style:none;">
					<li>
						<button type="button" class="chMemoCate" id="notePopup">메모 등록</button>
					</li>
					<li>
						<a href="memoList.jp">모든 메모 ${count}</a>
					</li>
					<li>
						<a href="">중요 메모 숫자</a>
					</li>
					<li>
						<a style="display:inline-block;height:40px;">나의 폴더</a>
							<ul style="-webkit-padding-start:0px;width:208px;">
								<c:if test="${memoCateCount == 0}">
									등록된 폴더가 없습니다.
								</c:if>
								<c:if test="${memoCateCount > 0}">
									<c:forEach var="memoCate" items="${memoCateList}">
										<li style="width:20%;background-color:#f5f5f5;">
											<a href="#">${memoCate.getCate_title()}</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
					</li>
					<li>
						<a href="">휴지통</a>
					</li>
					<li>
						<a href="">폴더 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
	
<!-- 본문 -->
<div id="main-container">
	<div class="content-wrap">
		<div class="content-write" style="width:100%;">
			<div class="form-block">
			
			</div>
		</div>
	</div>
</div>
</body>
