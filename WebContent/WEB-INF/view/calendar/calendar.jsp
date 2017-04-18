<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/JackPot/css/calendar.css?ver=5" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<html>
<head>

<style type="text/css">
a:link{color:black;}
a:hover{none;}
</style>

<script>
    $(document).ready(function(){
        $(".departmentmenu>a").click(function(){
            var submenu = $(this).next("ul");
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
        
        $(".branchmenu>a").click(function(){
            var submenu = $(this).next("ul");
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });        
    });
</script>

<script type="text/javascript">

function layer_open(el){
	
	var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	
	if(bg){
		$('.layer').fadeIn();
	}else{
		temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

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

function checkIt() {
    var userinput = eval("document.userinput");
    if(!userinput.sdate.value) {
        alert("시작일을 선택하세요");
        return false;
    }
    if(!userinput.contents.value) {
        alert("내용을 입력하세요");
        return false;
    }
    if(!!userinput.edate.value){
    	if(!userinput.etime.value){
    		alert("종료시간을 선택하세요")
    		return false;
      }
    	if(userinput.sdate.value>userinput.edate.value){
    		alert("종료일이 시작일보다 작을 수 없습니다.")
    		return false;
  	  }
    }
}

</script>

</head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>풀캘린더</title>


<body style="height:100%;overflow-x:hidden;overflow-y:hidden;margin:0px;">
<div id="page-container">
	<div id="sidebar">

	</div>
	<div id="subarea">	
		<div id="leftmenu">
			<div class="leftmenu-top">
			 <a href="/JackPot/calendar.jp">일정</a>
			</div>
			<div class="leftmenu-menu">
				<div class="leftmenu-menu-button">
				<button type="button" class="calendar-insert-bt">일정등록</button>
				</div>
				<div class="leftmenu-department">
				<ul>
					<li class="departmentmenu" style="width:208px;display:inline-block;text-align:center;">
					<a>부서</a>
						<ul style="-webkit-padding-start:0px;width:208px;list-style:none;">
							<li><button>서비스</button></li>
							<li><button>품질</button></li>
						</ul>
					</li>
					<li class="branchmenu" style="width:208px;display:inline-block;text-align:center;">
					<a>지점</a>
						<ul style="-webkit-padding-start:0px;width:208px;list-style:none;display:none;">
							<li><button>강남지점</button></li>
							<li><button>용인지점</button></li>
							<li><button>부천지점</button></li>
						</ul>
					</li>
				</ul>	
				</div>
			</div>
		</div>
    </div>
	<div id="#main-container">
		<div id="main-constop">
		
		</div>
	<div id="main-contents">
   		<jsp:include page="/fullcalendar.jp"></jsp:include>
	</div>

        <div id="layer1" class="pop-layer">
			<div id="calendarform">
				<div class="calendarformTop">
				  일정 <a href='javascript:window.close();'><img src="/JackPot/mainsave/logout.jpg" style="float:right"/></a>
				</div>
			<div class="calendarform">
    			<form action="calendarPro.jp" name="userinput" method="post" enctype="multipart/form-data" onSubmit="return checkIt()">
  					<ul>
  						<li><select name="title">
   						<optgroup label="업무일정">
  						<option value="회사일정">회사일정</option>
  						<option value="지점일정">지점일정</option>
  						<option value="부서일정">부서일정</option>
  						<option value="개인업무">개인업무</option>
   	 					</optgroup>
   	 					<optgroup label="개인일정">
   	 					<option value="출장">출장</option>
    					<option value="연차">연차</option>
    					</optgroup>
  						</select>
    					</li>
    					<li><input type="text" placeholder=" 제목" name="subject" style="width:300px"></li>
    				</ul>
   						<ul><li><input type="text" placeholder=" 장소" name="place" style="width:398px"></li></ul>
   						<ul style="margin: 7 0 10 0;"><li style="width:398px">파일첨부<br/><input type="file" name="file" style="width:65%;padding-left: 0px;"></li></ul>
   						<ul><li>시작일    <input type="date" name="sdate" id="sdate" />
    					<input type="time" name="stime" step="1800" value="00:00"/></li></ul>
    					<ul><li>종료일    <input type="date" name="edate" />
    					<input type="time" name="etime" step="1800" /></li></ul>
						<ul><li>참여자<br/><input type="text" name="name" id="participants"/></li><li id="addparticipants"><a>추가</a></li></ul>
   						<ul><li><br/><textarea name="contents" placeholder=" 내용"style="width:398px;border-radius:3px;border:1px solid darkgray;"></textarea></li></ul>
  						<ul><li><input type="submit" value="전송"></li><li><input type="reset" value="취소"></li></ul>
    					<input type="hidden" name="writer" value=""/>
    			</form>
			</div>
			<div class="btn">
				<ul><li><a href="#" class="cbtn">닫기</a></li></ul>
			</div>
			</div>
		</div>
			
			<div id="layer2" class="pop-layer2">
				<div class="contents">	
					<div class="contentsTop">
						일정 <a href='javascript:window.close();'><img src="/JackPot/mainsave/logout.jpg" style="float:right"/></a>
					</div>
					<div class="contentsbody">
						<div class="contents-date">
						</div>
					<div class="contents-subject">
					</div>
					<div class="contents-info">
						<ul class="contents-writer">
						</ul>
					</div>
					<div class="contents-conts">
					</div>
			<div class="btn">
				<ul>
					<li><a href="#" class="cbtn">닫기</a></li>
					<li><a href="/JackPot/calendarupdate.jp">수정</a></li>
					<li><a href="/JackPot/calendardelete.jp">삭제</a></li>
				</ul>
			</div>
				</div>
				</div>
			</div>
	</div>
</div>
</body>
</html>