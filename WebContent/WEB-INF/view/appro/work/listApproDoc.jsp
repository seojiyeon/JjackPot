<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" var="tdate"/>
<link href="/JackPot/css/appro.css?ver=2" rel="stylesheet" type="text/css">
<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=1" rel="stylesheet" type="text/css">
<html>
<head>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="resource/ckeditor.js"></script>
	<script src="/JackPot/js/jquery-3.1.1.min.js"></script>
 	<script src="/JackPot/js/jquery.bpopup.min.js"></script>
 	<script src="//code.jquery.com/jquery.min.js"></script>
 	
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
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			var value = $('#emp_choose').val();
			alert(value);
			$('#apprTitle').val(value);
			$('#test1').val(chkSplit[0]);
			e.preventDefault();
			document.getElementById("approForm").reset();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
	
	 $(document).ready (function () {                
     	$("#btn-show-checked").on("click", function() { //적용 버튼을 클릭시 체크박스의 체크된 부분을 ','기준으로 다같이 받아오는 부분. 
         	var chk = $("input[name='emp_inf']:checked").map(function() {
         		return $(this).val();
         	}).get().join(" , ");
     		var chkSplit = chk.split(',');
         	$("#emp_choose").val(chkSplit[0]+','+chkSplit[1]+','+chkSplit[2]);
         });
         
     }); // end ready  
     
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
    <form id="apprDocForm" name="apprDocForm" method="post" action="/JackPot/listApproDocPro.jp" enctype="multipart/form-data">
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
								<input type="hidden" name="branch" 		value="${edto.branch}">
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
									
									            
					    			        <input id="apprTitle" type="text" title="문서제목" name="apprTitle" value="" class="inputbox w100p" maxlength="65" placeholder="문서제목을 입력하세요. ">
								</td>
							</tr>
														
						</tbody>
					</table>
					<!--ckeditor 부분 -->
					<div>
						<textarea class="ckeditor" cols="1" id="editor" name="editor" rows="15"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('editor');
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
		<form id="approForm" action="*" method="post">
			<div class="modal-header">
					<h2 class="modal-title">결재선지정</h2>
			</div>
			<div>
				<input type="checkbox" name="emp_inf" value="신성무 사장(부서장)" />신성무 사장(부서장)<br/>
				<input type="checkbox" name="emp_inf" value="서지연 전무" />서지연 전무<br/>
				<input type="checkbox" name="emp_inf" value="유준상 부서장" />유준상 부서장<br/>
				<input type="checkbox" name="emp_inf" value="김민영 대리" />김민영 대리<br/>
				<input type="checkbox" name="emp_inf" value="박혜진 대리" />박혜진 대리<br/>
				<input type="checkbox" name="emp_inf" value="안진영 대리" />안진영 대리<br/>
			</div>
			
			<hr>
			<div>
				<input type="radio" name="appr_method" value="결재" checked="checked" />결재
				<input type="radio" name="appr_method" value="합의" />합의
			</div>
			
			<div>
				<input id='btn-show-checked' type="button" name="add" value=">"><br/>
				<input type="button" name="remove" value="<"><br/>
			</div>
			
			<div>
				<input id="emp_choose" type="text" name="emp_choose"><br/>
			
			</div>
			<a href="#" class="cbtn"><input type="button" id="#" class="cbtn" value="적용"></a>
		</form>
		<div class="btn-r">
			<a href="#" class="cbtn">닫기</a>
		</div>
		</div>
		<input type="hidden" value="${temp_num}" name="temp_num" class="temp_num" />

</body>
</html>
