<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/JackPot/css/calendar.css?ver=4" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<html>
<head>

<style type="text/css">
a:link{color:black;}
a:hover{none;}
</style>

<script type="text/javascript">

var idlist = new Array();
var idlistname = new Array();

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
        
        $(".calendar-insert-bt").click(function(){
        	var contents = $('#main-container');
        		contents.fadeOut();
        	
        	var insertForm = $('#insertForm-container');
        		insertForm.fadeIn();
        });
        
        $(".branchlist>a").click(function(){
        	 var branchlist = $(this).next("ul");
        	 if(branchlist.is(":visible")){
        		 branchlist.slideUp();
        	 }else{
        		 branchlist.slideDown();
        	 }
        });
        
        $(".namelist>li>a").click(function(){
        	var namelist = $(this);
        	var id = $(this).attr('id');
        	var name = $(this).text();
        	var name2 = name.substring(0,3);
        	var selectedlist = $(".selected-list");
        	
        	var exist = false;
    		for(i = 0 ; i < idlist.length;i++){
    			if(idlist[i] == id){
    				exist = true;
    				break;
    			}
    		} 
    		if(! exist){
    			$(".selected-list").append("<li class="+id+"><a href=# onClick=selected_click("+id+")>"+name+"</a></li>");
    			idlist.push(id);
    			idlistname.push(name2);
    		}
        	namelist.css("background-color","turquoise");
        });
        
        $('#select').change(function(){
        	var state = $('#select option:selected').val();
        	if(state == '지점일정'){
        		$('.title-selected-branch').fadeIn();
        	} else { $('.title-selected-branch').hide(); }
        	if(state == '부서일정'){
        		$('.title-selected-department').fadeIn();
        	} else { $('.title-selected-department').hide(); }
        	if(state == '개인업무'){
        		$('.title-selected-private').fadeIn();
        	} else { $('.title-selected-private').hide(); }
        });
        
        $('.leftmenu-departmentmenu-bt').click(function(){
        	$.ajax({
        		type :"post",
        		url :"http://localhost:8080/JackPot/leftmenu-department.jp",
        		data : {id:$(this).text()},
        		success : function(departmentlist){

        		    jQuery("#calendar").fullCalendar({
        		          aspectRatio: 1.7
        		        , locale: 'ko'
        		        , eventLimit : true
        				, header: {
        					left: 'prev,next today',
        					center: 'title',
        					right: 'month,agendaWeek,agendaDay,listMonth'
        				}
        		        , defaultView: 'month'
        		        , editable : true
        				
        		        ,minTime: "07:00:00"
        		        ,maxTime: "23:00:00"
        		        
        		        , navLinks: true // can click day/week names to navigate views
        				, weekNumbers: true
        				, weekNumbersWithinDays: true
        				, weekNumberCalculation: '0'
        		        ,  
        		        events: function(start, end, timezone, callback) {
        		        	console.log(departmentlist);
        		                   var events = [];
        		                   $(departmentlist).each(function() {
        		                        events.push({
        		                           title: $(this).attr('title'),
        		                            start: $(this).attr('start'),
        		                            end: $(this).attr('end'),
        		                            color: $(this).attr('color'),
        		                            id: $(this).attr('id'),
        		                            allDay: $(this).attr('allDay')
        		                        });
        		                    });
        		                    callback(events);
        		                }
        		            })
        		}, 
        		error : function(){
        			alert("error");
        		}
        		});
        });
        
		$('.leftmenu-branch-bt').click(function(){
			$(this).text();
        });
    });
    function selected_click(id){
    	var select = id.getAttribute('id');
    	$("."+select).remove();
    	$("#"+select).css("background-color","white");
    	for(i=0;i < idlist.length; i++){
    		if(idlist[i] == select){
    			idlist.splice(i,1);
    			idlistname.splice(i,1);
    		}
    	}
    }  

function updatebutton_click(id){
	$.ajax({
		type :"post",
		url :"http://localhost:8080/JackPot/calendarcontents.jp",
		data : {id:id},
		success : function(contents){
			var lay = $('#layer2');lay.fadeOut();
        	var con = $('#main-container');con.fadeOut();
       		var insert = $('#insertForm-container');insert.fadeIn();
       		$(".insertForm-sdate-li").html("<input type=date name=sdate value="+contents.cl_sdate+"></input><input type=time name=stime step=1800 value="+contents.cl_stime+"></input>");
       		$(".insertForm-edate-li").html("<input type=date name=edate value="+contents.cl_edate+"></input><input type=time name=etime step=1800 value="+contents.cl_etime+"></input>");
       		$(".insertForm-name-li").html("<select name=title><optgroup label=업무일정><option value=회사일정>회사일정</option><option value=지점일정>지점일정</option><option value=부서일정>부서일정</option><option value=개인업무>개인업무</option></optgroup><optgroup label=개인일정><option value=출장>출장</option><option value=연차>연차</option></optgroup></select>");
       		$(".insertForm-suject-li").html("<input type=text placeholder= 제목 name=subject class=subject value="+contents.cl_subject+"></input>");
       		$(".insertForm-place-li").html("<input type=text placeholder= 장소 name=place class=place value="+contents.cl_place+"></input>");
       		
       		$(".insertForm-contents-li2").html("<textarea name=contents class=insertForm-contents placeholder= 내용 >"+contents.cl_contents+"</textarea>");
       		$(".insertForm-hidden").html("<input type=hidden name=num value="+contents.cl_num+"></input>");
		}, 
		error : function(){
			alert("error");
		}
		});
}

function checkIt(){
    var userinput = eval("document.userinput");
    if(!userinput.sdate.value) {
        alert("시작일을 선택하세요");
        return false;
    }
    if(!userinput.contents.value) {
        alert("내용을 입력하세요");
        return false;
    }
    if(userinput.edate.value){
    	if(!userinput.etime.value){
    		alert("종료시간을 선택하세요")
    		return false;
      }
    	if(userinput.sdate.value>userinput.edate.value){
    		alert("종료일이 시작일보다 작을 수 없습니다.")
    		return false;
  	  }
    	if(userinput.sdate.value==userinput.edate.value){
    		if(userinput.stime.value>userinput.etime.value){
    			alert("종료시간이 시작시간보다 작을 수 없습니다.")
        		return false;
    		}
    	}
    }
    idlist.splice(0,idlist.length);
    idlistname.splice(0,idlistname.length);
}

function checkIt2(){
    var userinput = eval("document.userinput2");
    if(!userinput.sdate.value) {
        alert("시작일을 선택하세요");
        return false;
    }
    if(!userinput.contents.value) {
        alert("내용을 입력하세요");
        return false;
    }
    if(userinput.edate.value){
    	if(!userinput.etime.value){
    		alert("종료시간을 선택하세요")
    		return false;
      }
    	if(userinput.sdate.value>userinput.edate.value){
    		alert("종료일이 시작일보다 작을 수 없습니다.")
    		return false;
  	  }
    	if(userinput.sdate.value==userinput.edate.value){
    		if(userinput.stime.value>userinput.etime.value){
    			alert("종료시간이 시작시간보다 작을 수 없습니다.")
        		return false;
    		}
    	}
    }
}

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

function add_open(addform){	
	var temp = $('#' + addform);
	temp.fadeIn();
	temp.find('a.add-cbtn').click(function(e){
		temp.fadeOut();
		e.preventDefault();
	});
	temp.find('a.add-addbtn').click(function(e){
		temp.fadeOut();
		$('.layer1-participants').html("<input type=text id=participants readonly value="+idlistname+"></input><input type=hidden name=participants value="+idlist+"></input>")
		e.preventDefault();
	})
	
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
							<li><button class="leftmenu-departmentmenu-bt">서비스</button></li>
							<li><button class="leftmenu-departmentmenu-bt">제조,화학</button></li>
							<li><button class="leftmenu-departmentmenu-bt">It,웹,통신</button></li>
						</ul>
					</li>
					<li class="branchmenu" style="width:208px;display:inline-block;text-align:center;">
					<a>지점</a>
						<ul style="-webkit-padding-start:0px;width:208px;list-style:none;display:none;">
							<li><button class="leftmenu-branch-bt">강남지점</button></li>
							<li><button class="leftmenu-branch-bt">종로지점</button></li>
							<li><button class="leftmenu-branch-bt">동작지점</button></li>
							<li><button class="leftmenu-branch-bt">수지지점</button></li>
							<li><button class="leftmenu-branch-bt">용인지점</button></li>
							<li><button class="leftmenu-branch-bt">인천서구지점</button></li>
						</ul>
					</li>
				</ul>	
				</div>
			</div>
		</div>
    </div>
	<div id="main-container">
		<div id="main-constop">
		
		</div>
	<div id="main-contents">
   		<jsp:include page="/fullcalendar.jp"></jsp:include>
	</div>
	</div>
	<div id="insertForm-container">
		<div id="insertForm-top">
		<ul>일정등록</ul>
		</div>
		<div id="insertForm-contents">
			<div class="insertForm-info">
				* 일정을 참여자 외 다른 직원과 공유하지 않을 경우 아래의 비공개를 선택하시기 바랍니다.
			</div>
			<div class="insertForm-cons">
			<form action="calendarPro.jp" name="userinput2" method="post" enctype="multipart/form-data" onSubmit="return checkIt2()">
				<div class="insertForm">
					<ul class="insertForm1">
						<li class="insertForm-name">* 기간</li>
						<li class="insertForm-sdate-li"><input type="date" name="sdate"/>
    					<input type="time" name="stime" step="1800" value="00:00"/></li>
    					<li class="insertForm-edate-li"><input type="date" name="edate"/>
    					<input type="time" name="etime" step="1800" /></li>
					</ul>
					<ul>
						<li class="insertForm-name">* 제목</li>
						<li class="insertForm-name-li">
						<select name="title">
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
  						<li class="insertForm-suject-li"><input type="text" placeholder=" 제목" name="subject" class="subject"></li>
					</ul>
					<ul>
						<li class="insertForm-name">장소</li><li class="insertForm-place-li"><input type="text" placeholder=" 장소" name="place" class="place"></li>
					</ul>
					<ul>
						<li class="insertForm-name">참여자</li><li><input type="text"id="participants" class="participants"/><input type="hidden" name="participants"></li><li id="addparticipants"><a>추가</a></li>
					</ul>
					<ul>
						<li class="insertForm-contents-li">내용</li><li class="insertForm-contents-li2"><textarea name="contents" class="insertForm-contents" placeholder=" 내용"></textarea></li>
					</ul>
					<ul>
						<li class="insertForm-name">알림</li><li></li>
					</ul>
					<ul>
						<li class="insertForm-name">파일 업로드</li><li class="insertForm-file-li"><input type="file" name="file" class="file"/></li>
					</ul>
					<ul>
						<li class="insertForm-hidden"></li>
					</ul>
				</div>
				<ul class="insertForm-submit-ul"><li class="insertForm-submit-li"><input type="submit" value="전송"><input type="reset" value="취소"></li></ul>
			</form>
			</div>
		</div>
	</div>
	
        <div id="layer1" class="pop-layer">
			<div id="calendarform">
				<div class="calendarformTop">
				  일정
				</div>
			<div class="calendarform">
    			<form action="calendarPro.jp" name="userinput" method="post" enctype="multipart/form-data" onSubmit="return checkIt()">
  					<ul>
  						<li><select id="select" name="title">
   						<optgroup label="업무일정">
  						<option value="회사일정" selected="selected">회사일정</option>
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
    					<li><input type="text" placeholder=" 제목" name="subject" style="width:300px"></li></ul>
   						<ul class="title-selected-branch" style="display:none;"><li>
   						<select name="branch">
   						<optgroup label="지점등록">
   						<option value="0" selected="selected">지점을 등록하세요.</option>
   						<option value="1">강남</option>
   						<option value="2">종로</option>
   						<option value="3">동작</option>
   						<option value="4">수지</option>
   						<option value="5">용인</option>
   						<option value="6">인천서구</option>
   						</optgroup>
   						</select></li></ul>
   						<ul class="title-selected-department" style="display:none;"><li>
   						<select name="department">
   						<optgroup label="부서등록">
   						<option value="0" selected="selected">부서를 등록하세요.</option>
   						<option value="1">서비스</option>
   						<option value="2">제조,화학</option>
   						<option value="3">it,웹,통신</option>
   						</optgroup>
   						</select></li></ul>
   						<ul class="title-selected-private" style="display:none;"><li>
   						<label><input type="checkbox" name="private" value="private" style="margin:0;vertical-align:middle;">비공개</label><br>* 일정을 참여자 외 다른 직원과 공유하지 않을 경우 비공개를 <br>  선택하시기 바랍니다.
   						</li></ul>   					
   						<ul><li><input type="text" placeholder=" 장소" name="place" style="width:398px"></li></ul>
   						<ul style="margin: 7 0 10 0;"><li style="width:398px">파일첨부<br/><input type="file" name="file" style="width:65%;padding-left: 0px;"></li></ul>
   						<ul><li>시작일    <input type="date" name="sdate" id="sdate" />
    					<input type="time" name="stime" step="1800" value="00:00"/></li></ul>
    					<ul><li>종료일    <input type="date" name="edate" />
    					<input type="time" name="etime" step="1800" /></li></ul>
						<ul><li class="layer1-participants">참여자<br/><input type="text" name="name" readonly id="participants"/></li><li id="addparticipants"><a href="#" class="add-btn2" onclick="add_open('participants-Form');return false;">추가</a></li></ul>
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
						일정
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
					<div class="contents-file">
					</div>
			<div class="btn">
				<ul>
					<li><a href="#" class="cbtn">닫기</a></li>
					<li class="contents-bt" style="margin:0;padding:0;border:none;">
					</li>
				</ul>
				</div>
				</div>
			</div>
	</div>
	
	<div id="participants-Form">
		<div class="participants-Form-container">
			<div class="participants-Form-top">
			</div>
			<div class="participants-Form-contents">
				<div class="participants-Form-con-tab">
					<ul>
						<li><a>조직도</a></li>
						<li><a>주소록</a></li>
						<li><a>거래처</a></li>
					</ul>
				</div>
				<div class="participants-Form-con-contents">
					<ul>
					<li>
						<ul>
							<li class="branchlist"><a href="#" class="강남">강남지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '강남'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>	
								</ul>
							</li>
						</ul>
						<ul>
							<li class="branchlist"><a href="#" class="종로">종로지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '종로'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="branchlist"><a href="#" class="동작">동작지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '동작'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="branchlist"><a href="#" class="수지">수지지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '수지'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="branchlist"><a href="#" class="용인">용인지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '용인'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="branchlist"><a href="#" class="인천서구">인천서구지점</a>
								<ul class="namelist">
								<c:forEach var="participantsDTO" items="${participants}">
								<c:if test="${participantsDTO.branch eq '인천서구'}">
								 <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
								</c:if></c:forEach>
								</ul>
							</li>
						</ul>
					</li>
					</ul>
				</div>
				<div class="participants-Form-con-selected">
					<ul class="selected-list">
					</ul>
				</div>
			</div>
			<div class="participants-Form-btn">
				<ul>
					<li><a href="#" class="add-cbtn">닫기</a></li>
					<li><a href="#" class="add-addbtn">추가</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>	
</body>
</html>