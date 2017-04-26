<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<script>
	/* 메모 삭제 */
	function selectDelete() {
		document.multiForm.action="memoDeletePro.jp";
		document.multiForm.submit();
	}
	
	/* 메모 이동 : 레이어 팝업 */
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
		$('.btnMove').click(function(e){
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

<!-- 선택한 카테고리 메모 리스트  : 본문 -->
<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">${memoCateName}</h2>
		</div>
	
	<div class="table-header">
			<div class="listInfo">
				<select name="pageSize">
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				
				<div class="totalNum">
					<font color="#BDBDBD">전체</font> <span><font color="red">${viewCount}</font></span>
				</div>
				
				<select class="mr10" name="sortWord">
					<option value="REGIST_DATE:DESC" selected="selected">등록일(최신순)</option>
					<option value="REGIST_DATE:ASC">등록일(최신순)</option>
					<option value="TITLE:ASC">등록일(오름)</option>
					<option value="TITLE:DESC">등록일(내림)</option>
				</select>
			</div>
			<div class="table-search">
				<select name="tableSch" title="검색타입">
					<option value="1">제목</option>
				</select>
				<input type="text" title="검색어" name="searchWord" />
				<button type="button">검색</button> 
			</div>
		</div>
		
		<form name="multiForm">
		<div class="content-write" style="width:100%;">
			<table>
				<c:if test="${viewCount == 0}">
					<tr>
						<td>등록된 메모가 없습니다.</td>
					</tr>
				</c:if>
			
				<c:if test="${viewCount > 0}">
				<c:forEach var="memoViewList" items="${memoViewList}"> 
					<tr>
						<td>
							<input type="checkbox" value="${memoViewList.memo_num}" name="memo_num" />
							<img alt="중요" src="/JackPot/images/memo/notImp.png" />							
							<font size="3"><a href="memoContent.jp?emp_num=${memoViewList.emp_num}&memo_num=${memoViewList.memo_num}&pageNum=${pageNum}">${memoViewList.getMemo_title()}</a></font>
						</td>
					</tr>
					<tr>
						<td>
							<div class="memoNote">
								<pre>${memoViewList.getMemo_content()}</pre>
							</div>
						</td>
					</tr>
					<tr>	
						<td> ${memoViewList.getCate_title()} | 등록:${sdf.format(memoViewList.getMemo_enroll())} | 수정:${sdf.format(memoViewList.getMemo_modi())}</td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		</div>
		</form>
	</div>
	
	<div class="page-wrap">
		<table>
			<c:if test="${viewCount > 0}">
			
			<c:if test="${startPage > 10}">
				<a href="memoViewList.jp?pageNum=${startPage-10}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="memoViewList.jp?pageNum=${i}">${i}&nbsp;</a>
			</c:forEach>
		
			<c:if test="${endPage < pageCount}">
				<a href="memoViewList.jp?pageNum=${startPage+10}">[다음]</a>
			</c:if>
			
			</c:if>
		</table>
	</div>
	
	<div class="main-bottom">
		<button type="button" class="btnEnroll" onclick="window.location='memoInsert.jp'">등록</button>
		<button type="button" class="btnMove" onclick="">이동</button>
		<button type="button" class="btnDelete" onclick="selectDelete()">삭제</button>
	</div>
</div>

<div class="mask"></div>
<div class="window" style="background:white;">
	<div class="modal-header"><h2 style="margin:0px; height:20px;">메모 폴더</h2></div>
	<div class="modal-main">
		<c:if test="${memoCateCount == 0}">
			<li>등록된 폴더가 없습니다.</li>
		</c:if>
		
		<c:if test="${memoCateCount > 0}">
			<ul style="list-style:none; padding:10px; margin:0px; border: 1px solid #e7e7e7;">
				<li style=" height: 25px;">이동할 메모를 선택해 주세요.</li>
				<c:forEach var="memoCate" items="${memoCateList}">
					<li style=" height: 25px;">
						<img alt="체크" src="/JackPot/images/memo/point.png">
						<a href=" ">${memoCate.getCate_title()}</a>
					</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<div class="modal-footer">
			<button class="close" type="button" style="padding:3px;">닫기</button>
		</div>
	</div>
</div>
</body>
</html>