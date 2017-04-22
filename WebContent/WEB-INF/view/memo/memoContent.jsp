<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<script>
	/* 레이어 팝업 */
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
		$('.imgSh').click(function(e){
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
							<img src="/JackPot/save/${img.sys_img}" name="sys_img" class="imgSh" style="width:200px; height:200px;" />
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
				<c:if test="${memoState > 0}">
					<button type="button" class="btnModify" onclick="window.location='memoModify.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}'">수정</button>
					<button type="button" class="btnMove">이동</button>
					<button type="button" class="btnDelete" onclick="window.location='memoDeletePro.jp?memo_num=${dto.memo_num}&pageNum=${pageNum}'">삭제</button>
				</c:if>
				<c:if test="${memoState == 0}">
					<button type="button" class="btnRecover" onclick="window.location=''">복구</button>
					<button type="button" class="btnRomove" onclick="window.location='">삭제</button>
				</c:if>
				<button type="button" class="btnList" onclick="window.location='memoList.jp?pageNum=${pageNum}'">목록</button>
			</div>
		</div>
		</form>
	</div>
</div>

<div class="mask"></div>
<div class="window">
	<c:forEach var="img" items="${img}">
		<img src="/JackPot/save/${img.sys_img}" name="sys_img" class="imgSh" style="width:500px; height:500px;"/>
		<div class="img_title">	${img.org_img}</div>
	</c:forEach>
</div>
</body>
</html>