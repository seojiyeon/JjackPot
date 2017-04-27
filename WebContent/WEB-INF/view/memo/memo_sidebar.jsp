<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

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
		$('.btnMove').click(function(e){
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
	$(document).ready(function() {
		$('.memoNum').click(function() {
			var memoNumArray = new Array();
		});
	});
	
	function selectMove(a) {
		document.multiForm.action="memoCateMove.jp?memo_cate="+a;
		document.multiForm.submit();
	}
</script>

<div id="page-container">
	<!-- 왼쪽 사이드바 -->
	<div id="sidebar"></div>
	<div id="subarea">
		<div id="leftMenu">
			<div class="leftMenuTop">
				<h2><a href="memoList.jp">메모</a></h2>
			</div>
			
			<div id="leftMenuArea">
				<ul class="menuList" style="margin:0;padding:0;list-style:none;">
					<li class="list" style="text-align:center">
						<button type="button" class="chMemoCate" id="notePopup" onclick="window.location='memoInsert.jp'">메모 등록</button>
					</li>
					<li class="list">
						<a href="memoList.jp">모든 메모 <font color="red">${count}</font></a>
					</li>
					<li class="list">
						<a href="memoImp.jp">중요 메모 <font color="red">${impCount}</font></a>
					</li>
					<li class="listFolder">
						<a style="display:inline-block;height:30px;">나의 폴더</a>
							<ul style="-webkit-padding-start:0px;width:200px; display:none;" >
								<c:if test="${memoCateCount == 0}">
									<li>등록된 폴더가 없습니다.</li>
								</c:if>
								<c:if test="${memoCateCount > 0}">
									<c:forEach var="memoCate" items="${memoCateList}">
										<li>
											<a href="memoViewList.jp?memo_cate=${memoCate.cate_num}">${memoCate.getCate_title()}</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
					</li>
					<li class="list">
						<a href="memoRemoveList.jp">휴지통 <font color="red">${removeCount}</font></a>
					</li>
					<li class="list">
						<a href="memoCateManage.jp">폴더 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>



<!-- 레이어 팝업 : 메모 이동 -->
<div class="maskMove"></div>
<div class="windowMove">
	<div class="modal-header"><h2>메모 폴더</h2></div>
	<div class="modal-main">
		<c:if test="${memoCateCount == 0}">
			<ul>
				<li>등록된 폴더가 없습니다.</li>
			</ul>
		</c:if>
		
		<c:if test="${memoCateCount > 0}">
			<ul style="list-style:none;">
				<li>이동할 메모를 선택해 주세요.</li>
				<c:forEach var="memoCate" items="${memoCateList}">
					<li style=" height: 25px;">
						<input type="hidden" value="${memoCate.cate_num}" name="memo_cate" />
						<img alt="before" src="/JackPot/images/memo/right-arrow.png" />
						<a onclick="selectMove(${memoCate.cate_num})">${memoCate.getCate_title()}</a>
						<input type="hidden" value="${memoCate.cate_num}" name="memo_cate" />
					</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<div class="modal-footer">
			<button class="close" type="button" style="padding:3px;">닫기</button>
		</div>
	</div>
</div>