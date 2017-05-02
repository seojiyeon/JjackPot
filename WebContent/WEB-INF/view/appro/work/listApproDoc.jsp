<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>



<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" var="tdate"/>
<link href="/JackPot/css/appro.css?ver=3" rel="stylesheet" type="text/css">
<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=2" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=1" rel="stylesheet" type="text/css">
<html>
<head>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="ckeditor_appro/ckeditor.js"></script>
	<script src="/JackPot/js/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 	<script src="/JackPot/js/jquery.bpopup.min.js"></script>
 	<script src="//code.jquery.com/jquery.min.js"></script>
 	
<script>
	function approver_find(){
		
		var input = document.getElementById("approver_test").value;
		$.ajax({
			type:"post",
			url:"http://localhost:8080/JackPot/approverFind.jp",
			data: {ap:input},
			success: function(approver_info){ 
				alert(approver_info);
				approver_info.forEach(function(v,i){ // v <- object  i <- 횟수
					alert(v.emp_num)
				})
				
			},
			error:function(){
				alert("error");
			}
		});
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
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			document.approver_info.approver_test.value = "";
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});
	}
	
	function applyEvent(){
		
		var value = $('#approver').val();
		$('#approver_name').val(value)
		document.approver_info.approver_test.value = "";
	}
     
     
     function dialog() {

    	    var dialogBox = $('.dialog'),
    	        dialogTrigger = $('.dialog__trigger'),
    	        dialogClose = $('.dialog__close'),
    	        dialogTitle = $('.dialog__title'),
    	        dialogContent = $('.dialog__content'),
    	        dialogAction = $('.dialog__action');

    	    // Open the dialog
    	    dialogTrigger.on('click', function(e) {
    	        dialogBox.toggleClass('dialog--active');
    	        e.stopPropagation()
    	    });

    	    // Close the dialog - click close button
    	    dialogClose.on('click', function() {
    	        dialogBox.removeClass('dialog--active');
    	    });

    	    // Close the dialog - press escape key // key#27
    	    $(document).keyup(function(e) {
    	        if (e.keyCode === 27) {
    	            dialogBox.removeClass('dialog--active');
    	        }
    	    });
    	};
    	
    	$(document).ready(function() {

    		//When page loads...
    		$(".tab_content").hide(); //Hide all content
    		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
    		$(".tab_content:first").show(); //Show first tab content

    		//On Click Event
    		$("ul.tabs li").click(function() {

    			$("ul.tabs li").removeClass("active"); //Remove any "active" class
    			$(this).addClass("active"); //Add "active" class to selected tab
    			$(".tab_content").hide(); //Hide all tab content

    			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
    			$(activeTab).fadeIn(); //Fade in the active ID content
    			return false;
    		});

    	});
	</script>	
	
<script type="text/javascript">

$(document).ready(function(){
    $("#emp1").click(function(){
        $("#emp_name").val("Dolly Duck");
    });
    
    $("#emp2").click(function(){
        $("#emp_name").val("");
    });
    
});

function setId(e)
{		 
	opener.document.userinput.msg_receive.value=e;
	self.close(); 
	}

</script>
		
</head>

<title>JackPot 전자결재_양식목록</title>

<body>
<div id="page-container">
	<div id="sidebar-a">
	<span style="color:white">
	(사이드바)
	</span>
	</div>
	<div id="subarea">	
		<div id="leftmenu">
		전자결재
		(중간사이드)
			<table>
				<tr>
					<td>
							기안
					</td>
				</tr>
				<tr>
					<td>
						<a href="/JackPot/listApproForm.jp">기안문작성</a><br/>
						결재요청함<br/>
						임시저장함<br/>
						<hr>	
					</td>
				</tr>
				<tr>
					<td>
						결재<br/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="/JackPot/listApproTodo.jp">결재대기함</a><br/>
						결재진행함<br/>
						완료문서함<br/>
						반려문서함<br/>
						참조/열람문서함<br/>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="main-container">
		<div id="main-contents">
			<div class="con-header">
				<h2>
					기안문 작성
				</h2>
				<div id="navText" class="breadcrumb-line"></div>
			</div>
	
    <div class="content-wrap approval responsive">
    <div class="content-write">
    <form id="apprDocForm" name="apprDocForm" method="post" action="/JackPot/listApproDocPro.jp" enctype="multipart/form-data" onsubmit="return checkContents()">
		<h2>기안용지</h2>
				
		<div id="formButtonDiv" class="btn-wrap pt10">
    	<a href="#" onclick="layer_open('layer1');return false;"><button id="addApprLineButton" type="button" class="btn btn-color5 br">결재선</button></a>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    	</div>
				<div class="appline-wrap">
					<div class="fright" id="apprLine0Tr" style="display: block;">
						<div class="fleft">	
							<table class="appline-lst">
								<caption></caption>
								<tbody>
									<tr id="apprLine0TTr">
										<th rowspan="2">
											
												결<br><br class="last">재
											
												         
										</th>
										<th class="apprLine">기 안</th>
									</tr>
									<tr id="apprLine0BTr">									
									<td height="60">${emp_name}</td>
									</tr>
																		
								</tbody>
								
							</table>
							<input type="text" name="approver_name" id="approver_name" placeholder="결재권자">
							<input type="text" name="approver_num" id="approver_num">
						</div>
												
					</div>
					<br/>

					<div class="clearfix">
						<div class="fright" id="apprLine1Tr" style="display: none; width: 0px;">
							<table class="appline-lst">
								<caption></caption>
								<tbody>	
									</tbody><tbody>	
									<tr id="apprLine1TTr">	
										<th rowspan="2">					
										합<br><br>의
										</th>
									</tr>
									<tr id="apprLine1BTr">									
									</tr>
								
								</tbody>
							</table>						
						</div>						
					</div>
				</div>
								
				<div class="form-block bdr-t">

					<table class="table separate">
						<caption></caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>						
						<tbody>							
							<tr>
								<th>문서번호</th>
								<td>자동채번</td>
								<th>기안일자</th>
								<td>${tdate}</td>
							</tr>
							<tr>
								<th>기안자</th>
								<td>${emp_name}&nbsp;${position_name}</td>
								<th>기안부서</th>
								<td>${department_name}</td>
								<td>
								<input type="hidden" name="emp_name" 		value="${emp_name}">
								<input type="hidden" name="position" 		value="${emp_position}">
								<input type="hidden" name="department" 		value="${emp_department}">
								<input type="hidden" name="temp_num" 		value="${temp_num}">
								<input type="hidden" name="emp_num" 		value="${emp_num}">
								<input type="hidden" name="branch" 			value="${edto.branch}">
								<input type="hidden" name="doc_num" 		value="${doc_num}">
								<input type="hidden" name="approver_num" 	value="">
								</td>
							</tr>
							
							<tr>
								<th>참조자</th>
								<td>
									<div id="selectReferenceId" class="input-group organization"><div id="selectReferenceId_div" class="tagsinput"><input type="text" title="사용자" id="selectReferenceId_input" placeholder="사용자" style="box-shadow:none;"></div><a href="#a" title="사용자"><input type="button" value="검색"></a></div>
								</td>
								<th>기결재첨부</th>
								<td> 
							        <span id="apprRefInfoUl"></span>
								</td>
							</tr>
							<tr id="apprReceiveLineTr" style="display: none;">
								<th scope="row">수신처</th>
								<td colspan="3">
									<div id="apprReceiveLineInfoDiv"></div>
								</td>
							</tr>
							<tr>
								<th><span class="text-point-b">*</span>문서제목</th>
								<td colspan="3">
									
									            
					    			        <input id="doc_title" type="text" title="문서제목" name="doc_title" value="" class="inputbox w100p" maxlength="65" placeholder="문서제목을 입력하세요. ">
								</td>
							</tr>
														
						</tbody>
					</table>
					<!--ckeditor 부분 -->
					<div>
						<textarea class="ckeditor" cols="1" id="editor" name="doc_content" rows="15"></textarea>
						<script>
							CKEDITOR.replace(
									'editor',
									{
										toolbar:'Basic',
										skin:'moonocolor'
									}
								);
							
						</script>
					</div>
				</div>
					<div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>
     </form>
	</div>
			</div>

   
	</div>
</div>
</div>
	<div id="layer1" class="pop-layer">
		<form name="approver_form" method="post">
			
		
			<div class="modal-header">
					<h2 class="modal-title">결재선지정</h2>
			</div>
			
			
			<ul class="tabs">
	   			<li><a href="#tab1">조직도</a></li>
	    		<li><a href="#tab2">검색</a></li>
			</ul>
			<div class="tab_container">
    			<div id="tab1" class="tab_content">
	        		<!--Content-->
	    		</div>
		   		<div id="tab2" class="tab_content">
		       		<!--Content-->
		       		<form id="approver_info">
			       		<input type="text" id="approver_test" name="approver_test" onkeypress="if(event.keyCode==13){approver_find();event.returnValue=false}"/>
						<input type="button" value="검색" onclick="approver_find();"/>
					</form>
		    	</div>
		    	
			</div>
			<div class="btn-r">
				<input type="button" value="적용" onclick="applyEvent();">
				<a href="#" class="cbtn">닫기</a>
			</div>
			</form>
		</div>
			<hr>
			<input type="hidden" value="${temp_num}" name="temp_num" class="temp_num" />
</body>
</html>

<c:forEach var="a" items="${emp }">
${a.emp_no}
</c:forEach>
