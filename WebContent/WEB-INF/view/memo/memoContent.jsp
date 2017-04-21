<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

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

<html>
<body>
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
						<button type="button" class="chMemoCate" id="notePopup">메모 등록</button>
					</li>
					<li class="list">
						<a href="memoList.jp">모든 메모 ${count}</a>
					</li>
					<li class="list">
						<a href="">중요 메모 숫자</a>
					</li>
					<li class="listFolder">
						<a style="display:inline-block;height:30px;">나의 폴더</a>
							<ul style="-webkit-padding-start:0px;width:200px display:none;">
								<c:if test="${memoCateCount == 0}">
									<li>등록된 폴더가 없습니다.</li>
								</c:if>
								<c:if test="${memoCateCount > 0}">
									<c:forEach var="memoCate" items="${memoCateList}">
										<li>
											<a href="#">${memoCate.getCate_title()}</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
					</li>
					<li class="list">
						<a href="">휴지통</a>
					</li>
					<li class="list">
						<a href="">폴더 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 본문 -->
<!-- 메모 내용보기 -->
<div class="main-container" id="content-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2>모든 메모</h2>
			<div>
				<hr width="100%" size="1" color="silver">
			</div>
		</div>
		<form>
		<div class="content-write">
			<div class="note-write">
				<div class="note-write-head">
					<div class="content-title" style="width:500px;">
						<input type="checkbox" name="memo_state">중요여부체크
						&nbsp;
						${dto.getMemo_title()}
					</div>
					<div class="readnote-date" style="width:500px;">
						${dto.getCate_title()} | 등록:${sdf.format(dto.getMemo_enroll())}
					</div>			
				</div>
				<div class="note-body">
					<pre>${dto.getMemo_content()}</pre>
				</div>
			</div>
			<div class="doc-img">
				<c:if test="${imgCount == 0}">
					<div></div>
				</c:if>
				<c:if test="${imgCount > 0 }">
					<div>
						<c:forEach var="img" items="${img}">
							<img src="/JackPot/save/${img.sys_img}" name="sys_img" style="width:200px; height:200px;" />
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div class="doc-file">
				<c:if test="${fileCount == 0}">
					<div></div>
				</c:if>
				<c:if test="${fileCount > 0}">
					<div>
						<c:forEach var="file" items="${file}">
							<input type="hidden" name="${file.sys_file}" />
							<a href="memoFileDown.jp?fileName=${file.sys_file}">${file.org_file}</a><br/>
						</c:forEach>
					</div>
				</c:if>		
			</div>
			<div class="btn-wrap">
				<button type="button" class="btnModify" onclick="window.location='memoModify.jp?memo_num=${dto.memo_num}'">수정</button>
				<button type="button" class="btnMove">이동</button>
				<button type="button" class="btnDelete" onclick="window.location='memoDeletePro.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}'">삭제</button>
				<button type="button" class="btnList" onclick="window.location='memoList.jp?pageNum=${pageNum}'">목록</button>
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>