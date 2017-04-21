<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>

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
<!-- 레이어 팝업 -->
<div class="mask"></div>
<div class="window">
	<div id="MemoCateName">
		<div>등록할 메모폴더를 선택해주세요.</div>
		<div id="selectCate">
			<table>
				<c:if test="${memoCateCount == 0}">
					<tr>
						<td>등록된 폴더가 없습니다.<br>
						폴더를 생성해주시기 바랍니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${memoCateCount > 0}">
				
				<c:forEach var="memoCate" items="${memoCateList}">
					<tr>
						<td>
							<a href="memoInsert.jp?memo_cate=${memoCate.getCate_num()}">${memoCate.getCate_title()}</a>
						</td>
					</tr>
				</c:forEach>
				
				</c:if>
				<tr>
					<td align="right">
						<button class="close">닫기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

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
						<a href="memoList.jp">모든 메모 <font color="red">${count}</font></a>
					</li>
					<li class="list">
						<a href="">중요 메모 숫자</a>
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
	
<!-- 메모 전체 리스트 : 본문 -->
<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">모든 메모</h2>
			<ul style="height:20px; margin:5px; width: 100px;">
				<li>
					<button type="button">화면 설정</button>
				</li>
			</ul>
			<div>
				<hr width="100%" size="1" color="silver">
			</div>
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
					<font color="#BDBDBD">전체</font> <span><font color="red">${count}</font></span>
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
			<div>
					<hr width="100%" size="2" color="silver">
			</div>			
		</div>
		
		<div class="content-write" style="width:100%;">
			<table>
				<c:if test="${count == 0}">
					<tr>
						<td>등록된 메모가 없습니다.</td>
					</tr>
				</c:if>
			
				<c:if test="${count > 0}">
				<c:forEach var="memoCont" items="${memoCont}"> 
					<tr>
						<td>
							중요여부 체크
							<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}">${memoCont.getMemo_title()}</a></font>
						</td>
					</tr>
					<tr>
						<td>
							<div class="memoNote">
								<pre>${memoCont.getMemo_content()}</pre>
							</div>
						</td>
					</tr>
					<tr>	
						<td> ${memoCont.getCate_title()} | 등록:${sdf.format(memoCont.getMemo_enroll())} | 수정:${sdf.format(memoCont.getMemo_modi())}</td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		</div>
	</div>
	
	<div class="page-wrap">
		<table>
			<c:if test="${count > 0}">
			
			<c:if test="${startPage > 10}">
				<a href="memoList.jp?pageNum=${startPage-10}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="memoList.jp?pageNum=${i}">${i}&nbsp;</a>
			</c:forEach>
		
			<c:if test="${endPage < pageCount}">
				<a href="memoList.jp?pageNum=${startPage+10}">[다음]</a>
			</c:if>
			
			</c:if>
		</table>
	</div>
	
	<div class="main-bottom">
		<button type="button" class="btnEnroll" onclick="window.location='memoInsert.jp'">등록</button>
		<button type="button" class="btnMove">이동</button>
		<button type="button" class="btnDelete" onclick="window.location=''">삭제</button>
	</div>
</div>
</body>
</html>