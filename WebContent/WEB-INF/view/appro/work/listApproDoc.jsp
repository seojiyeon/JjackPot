<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/sub.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

<html>

<head>
	
	<script src="resource/ckeditor.js"></script>
	<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
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

<title>JackPot 전자결재_양식목록</title>


<body>
<div id="page-container">
	<div id="sidebar">
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
		<div id="main-contents" style="position: fixed;left: 300px;top: 0;width: 84%;height: 100%;" >
			<div class="con-header">
				<h2>
					기안문 작성
				</h2>
				<div id="navText" class="breadcrumb-line"></div>
			</div>
			
    <div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>
    <div class="content-wrap approval responsive">
    <div class="content-write">
    <form id="apprDocForm" name="apprDocForm" method="post" action="/groupware/approval/work/apprWorkDoc/createApprDoc.do?OWASP_CSRFTOKEN=ZVYQ-0QVM-UKZ0-ENWZ-M9UY-HVY9-A9F5-V5BE" novalidate="novalidate">
				<h2>기안용지</h2>
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
									<th class="apprLine last">부서장</th></tr>
									<tr id="apprLine0BTr">									
									<td height="60" class="last"></td></tr>
								</tbody>
								
							</table>							
						</div>						
					</div>
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
								<td>${now}</td>
							</tr>
							<tr>
								<th>기안자</th>
								<td>유준상</td>
								<th>기안부서</th>
								<td>
									
									    
					                        <input type="hidden" name="apprGroupId" value="G102863">
					                    
					                    루크
					                
					                 
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
									
									            
					    			        <input type="text" title="문서제목" name="apprTitle" value="" class="inputbox w100p" maxlength="65" placeholder="문서제목을 입력하세요. ">
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
			</form>
	</div>
			</div>
	<div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>

		</div>
	</div>
</div>
</body>
</html>
