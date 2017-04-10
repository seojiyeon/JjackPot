<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>

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
<input type="button" class="chMemoCate" value="메모 등록" />

<div id="header">
<h2>모든 메모</h2>
<div id="navText" class="line"></div>
</div>

<div class="mask"></div>
<div class="window">
	<table>
		<tr>
			<td>등록할 메모폴더를 선택해 주세요.</td>
		</tr>
		<c:if test="${memoCateCount == 0}">
		<tr>
			<td>등록된 폴더가 없습니다.<br>
				폴더를 생성 해주시기 바랍니다.	
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
			<td>
				<input type="button" class="close" value="닫기" />
			</td>
		</tr>
	</table>
</div>

<div id="memoCon">
<table>
	<tr>
		<td>
			<select name="pageSize">
				<option>10</option>
				<option>20</option>
				<option>30</option>
				<option>40</option>
				<option>50</option>
			</selecT>
			&nbsp;
			전체 ${count}
			&nbsp;
			<select>
				<option>등록일(최신순)</option>
				<option>등록일(오래된순)</option>
				<option>제목(오름차순)</option>
				<option>제목(내림차순)</option>
			</select>
		</td>
		<td>
			<input type="checkbox" name="" />첨부파일 있는 메모만
			&nbsp;
			<select name="">
				<option>제목</option>
			</select>
			<input type="text" name="" />
			<input type="button"  value="검색" onClick="" />
</table>
</div>
<form>
<div>
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
<table>
	<c:if test="${count > 0}">
		<c:if test="${startPage > 10}">
			<a href="memoList.jp?pageNum=${startPage-10}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="memoList.jp?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="memoList.jp?pageNum=${startPage+10}">[다음]</a>
		</c:if>
	</c:if>
</table>
</div>
</form>

</body>