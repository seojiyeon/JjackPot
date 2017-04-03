<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/JackPot/css/sub.css?ver=2" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<html>
<title> 커뮤니티 </title>
<head>
<script>

$(document).ready(function(){
    $(".boardmenu>a").click(function(){
        var boardmenu = $(this).next("ul");
        if( boardmenu.is(":visible") ){
            boardmenu.slideUp();
        }else{
            boardmenu.slideDown();
        }
    });
});
</script>
</head>

<body>
<div id="page-container">
	<div id="sidebar">

	</div>
	<div id="subarea">	
		<div id="leftmenu">
			<div class="leftmenu-top">
				<h2><a href="/JackPot/community.jp">게시판</a></h2>
			</div>
			<div id="leftmenuarea">
				<ul class="menulist" style="margin:0;padding:0;">
					<li style="text-align:center;height:40px;border-style:solid;border-width:thin;border-color:lightgray;">
					<a href="/JackPot/boardinsert.jp" style="text-decoration:none;">게시물 등록</a></li>
					<li style="text-align:center;height:40px;border-style:solid;border-top-style:none;border-width:thin;border-color:lightgray;">
					<a href="/JackPot/community.jp" style="text-decoration:none;">최근게시글</a></li>
					<li class="boardmenu" style="display:inline-block;text-align:center;border-style:solid;border-top-style:none;border-width:thin;border-color:lightgray;">
					<a><img src="" alt="게시판 목록" style="height:40px;width:210px;border-style:none;"/></a>
								   <ul>
								      <li>공지사항</li>
								      <li>자유게시판</li>
								      <li>게시판1</li>
								      <li>게시판2</li>
								      <li>게시판3</li>
								   </ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="main-container">
	<h2>최근게시글</h2>
	</div>
</div>
</body>
</html>