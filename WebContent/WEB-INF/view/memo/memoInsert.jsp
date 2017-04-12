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
	.imgWindow {
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
		var left = ($(window).scrollLeft() + ($(window).width() - $('.imgWindow').width())/2);
		var top = ($(window).scrollTop() + ($(window).height() - $('.imgWindow').height())/2);
		
		// css 스타일 변경
		$('.imgWindow').css({'left':left, 'top':top, 'position':'absolute'});

		// 레이어 팝업 띄운다.
		$('.imgWindow').show();
	}

	$(document).ready(function(){
		//검은 마스크 배경과 레이어 팝업 띄운다.
		$('.memoIns').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.imgWindow .close').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('.mask, .imgWindow').hide();  
		});       

		//검은 마스크을 눌렀을 때
		$('.mask').click(function () {  
		    $(this).hide();  
		    $('.imgWindow').hide();  
		});      
	});
</script>

<body>
<div class="header">
<h2>메모 등록</h2>
<div id="navText" class="line"></div>
</div>

<div class="mask"></div>
<div class="imgWindow">
<form>
	<table>
		<tr>
			<td>
				<input type="file" name="sys_img" />
			</td>
		</tr>
		<tr>
			<td>				
				업로드할 파일을 선택해주세요.<br/>
			</td>
		</tr>
		<tr>
			<td>
				<br/>
				<button type="button" id="btnSend" >전송</button>
				<button type="button" id="btnCancel" class="close">취소</button>
			</td>
		</tr>
	</table>
</form>
</div>

<form name="memoIns" method="post" action="memoInsertPro.jp" enctype="multipart/form-data" >
<table>
	<tr>
		<td>
			<select name="memo_cate">
				<c:forEach var="memoCate" items="${memoCateList}">
					<option value="${memoCate.getCate_num()}">${memoCate.getCate_title()}</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<input type="reset" value="새메모" />
 			<input type="button" class="memoIns" value="이미지 첨부" />  
<!--			<button style="width:40px; height:40px" class="memoIns">
			<img src='/JackPot/images/memo/img.png' /> 
			</button> -->
			<input type="file" name="sys_file" value="파일 첨부" />
	</tr>
</table>
<br/>
<table>
	<tr>
		<td>
			<input type="checkbox" name="memo_state" value="2" >중요
			<input type="text" name="memo_title" placeholder="제목을 입력하세요." />
		</td>
	</tr>
	<tr>
		<td>
			<textarea name="memo_content" rows="20" cols="100"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="저장" />
			<input type="button" value="취소" onClick="window.location='memoList.jp'" />
		</td>
	</tr>
</table>
</form>
</body>