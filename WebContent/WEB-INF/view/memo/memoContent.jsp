<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<script>
	/* 첨부파일 슬라이드 업&다운 */
	$(document).ready(function() {
		$(".file-list>a").click(function() {
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
<jsp:include page="memo_sidebar.jsp" flush="false" />

<!-- 본문 -->
<!-- 메모 내용보기 -->
<div class="main-container" id="content-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">모든 메모</h2>
		</div>
		<form name="multiForm" method="post">
		<div class="content-write">
			<div class="note-write">
				<div class="note-write-head">
					<div class="content-title" style="width:500px;">
						<input type="hidden" name="memo_num" value="${dto.memo_num}" />
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
							<img src="/JackPot/save/${img.sys_img}" class="imgBig" name="sys_img" class="imgSh" style="width:200px; height:200px;" />
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div class="doc-file">
				<c:if test="${fileCount == 0}">
					<div></div>
				</c:if>
				<c:if test="${fileCount > 0}">
					<div class="file-list">
						<img src="/JackPot/images/memo/down-arrow.png" />&nbsp;
						<a>첨부 파일</a>
						
						<ul style="display:none;">
							<c:forEach var="file" items="${file}">
								<a href="memoFileDown.jp?fileName=${file.sys_file}">${file.org_file}</a><br/>
							</c:forEach>
						</ul>
					</div>
				</c:if>		
			</div>
			<div class="btn-wrap">
				<c:if test="${memoState > 0}">
					<button type="button" class="btnModify" onclick="window.location='memoModify.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}&memo_cate=${dto.memo_cate}&memoGroup=${memoGroup}'">수정</button>
					<button type="button" class="btnMove">이동</button>
					<button type="button" class="btnDelete" onclick="window.location='memoDeletePro.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}'">삭제</button>
				</c:if>
				<c:if test="${memoState == 0}">
					<button type="button" class="btnRecover">복구</button>
					<button type="button" class="btnRomove" onclick="window.location='memoRemovePro.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}'">삭제</button>
				</c:if>
				<button type="button" class="btnList" onclick="window.location='memoList.jp?pageNum=${pageNum}&memoGroup=${memoGroup}'">목록</button>
			</div>
		</div>
		</form>
	</div>
</div>

<!-- div class="img-back"></div>
<div class="img-pop">
	<div class="img-main">
		<button type="button" class="esc" title="esc" style="text-align:right;">x</button>
		<figure>
			<c:forEach var="img" items="${img}">
				<img src="/JackPot/save/${img.sys_img}" name="sys_img" class="imgSh" style="width:500px; height:500px;"/>
				<figcaption>
				<div class="img_title">${img.org_img}</div>
				</figcaption>
			</c:forEach>
		</figure>
	</div>
</div-->
</body>
</html>