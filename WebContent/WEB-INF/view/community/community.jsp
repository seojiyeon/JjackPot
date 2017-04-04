<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/JackPot/css/sub.css?ver=3" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<html>
<title> 커뮤니티 </title>
<head>
<script type="text/javascript">

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

function layer_open(el){

	var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();
	}else{
		temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(page-container).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(page-container).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
		}
		e.preventDefault();
	});

	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});

}			

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
				<ul class="menulist" style="margin:0;padding:0;list-style:none;">
					<li style="text-align:center;height:40px;border-style:solid;border-width:thin;border-color:lightgray;">
						<a href="#" class="btn-example" onclick="layer_open('layer1');return false;">게시물 등록</a>
							<div id="layer1" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<!--content //-->
											<p class="ctxt mb20">Thank you.<br>
											Your registration was submitted successfully.<br>
											Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
											Hope to see you soon!
											</p>
									<div class="btn-r">
										<a href="#" class="cbtn">Close</a>
									</div>
									<!--// content-->
									</div>
								</div>
							</div>
					</li>
					<li style="text-align:center;height:40px;border-style:solid;border-top-style:none;border-width:thin;border-color:lightgray;">
					<a href="/JackPot/community.jp" style="text-decoration:none;">최근게시글</a></li>
					<li class="boardmenu" style="width:208px;display:inline-block;text-align:center;border-style:solid;border-top-style:none;border-width:thin;border-color:lightgray;">
					<a style="display:inline-block;height:40px;">게시판 목록</a>
								   <ul style="-webkit-padding-start:0px;width:208px;">
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