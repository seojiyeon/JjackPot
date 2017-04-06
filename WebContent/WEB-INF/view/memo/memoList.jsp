<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>메모</title>

<style>
	#mask {  
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

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function wrapWindowByMask(){
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width':maskWidth,'height':maskHeight});  

		//애니메이션 효과
		$('#mask').fadeTo("slow",0.5);    

		// id=window를 띄운다.
		$('.window').show();
	}

	$(document).ready(function(){
		//검은 막 띄우기
		$('.memoCate').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.window .close').click(function (e) {  
		    //링크 기본동작은 작동하지 않도록 한다.
		    e.preventDefault();  
		    $('#mask, .window').hide();  
		});       

		//검은 막을 눌렀을 때
		$('#mask').click(function () {  
		    $(this).hide();  
		    $('.window').hide();  
		});      
	});
</script>

<body>
<input type="button" value="메모 등록" onclick="window.location=''" />

<h2 class="memoCate">모든 메모</h2>

<div id="mask"></div>
<div class="window">
	<input type="button" class="close" value="닫기" />
</div>
<a href="#" class="openMask">검은 막 띄우기</a>

</body>