<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>

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
						<a href="">폴더 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>