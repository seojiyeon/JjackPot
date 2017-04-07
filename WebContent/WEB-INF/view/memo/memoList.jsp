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
	.window{
	  display: none;
	  position:absolute;  
	  left:100px;
	  top:100px;
	  z-index:10000;
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
<a href="#" class="chMemoCate">메모 등록</a>

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
		
		<c:forEach var="memoCate" items="${memoCateList}">
		<tr>
			<td>
				<a href="memoInsert.jp?memo_cate=${memoCate.getCate_num()}">${memoCate.getCate_title()}</a>
			</td>
		</tr>			
		</c:forEach>
		
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
			<select>
				<option>10</option>
				<option>20</option>
				<option>30</option>
				<option>40</option>
				<option>50</option>
			</selecT>
			&nbsp;
			전체 숫자
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
			<input type="text" value="" />
			<input type="button"  value="검색" onClick="" />
</table>
</div>
<form>
<div>
<table>
	<c:forEach var="memoCont" items="${memoCont}">
		<tr>
			<td>
				중요여부 체크
				<font size="3"><a href="#">${memoCont.getMemo_title()}</a></font>
			</td>
		</tr>
		<tr>
			<td><pre>${memoCont.getMemo_content()}</pre></td>
		</tr>
	</c:forEach>
</table>
</div>
</form>

</body>