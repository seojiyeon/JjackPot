<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/appr.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

<html>



<head>
<script type="text/javascript" >
			
						
			function layer_open(el){

				   var temp = $('#' + el);      //레이어의 id를 temp변수에 저장
				   var bg = temp.prev().hasClass('bg');   //dimmed 레이어를 감지하기 위한 boolean 변수

				   if(bg){
				      $('.layer').fadeIn();
				   }else{
				      temp.fadeIn();   //bg 클래스가 없으면 일반레이어로 실행한다.
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
				         temp.fadeOut();      //'닫기'버튼을 클릭하면 레이어가 사라진다.
				      }
				      e.preventDefault();
				   });

				   $('.layer .bg').click(function(e){
				      $('.layer').fadeOut();
				      e.preventDefault();
				   });
				   
				   $(document).ready(function(){
				        $(".tabmenu").each(function(){
				            var tab = $(this).children("ul");
				            var tabBtn = tab.children("li").children("a");
				            var content = tabBtn.nextAll();
				             
				            // 탭버튼을 클릭했을때
				            tabBtn.click(function(){
				                // 이미 on 상태면 pass
				                if( $(this).hasClass("on") ) return;
				 
				                // 모든 컨텐츠 부분을 안보이게 한뒤
				                content.hide();
				 
				                // 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
				                $(this).nextAll().show();
				                 
				                // 모든탭 버튼에 있던 on 클래스를 빼고
				                // 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
				                tabBtn.removeClass("on");
				                $(this).addClass("on");
				                 
				                // 탭버튼를 쭉 돌면서 on 클래스가 있는 버튼만 on 이미지로 바꾸고
				                // 나머지 버튼들은 off 이미지로 바꾼다.
				                tabBtn.each(function(){
				                    var src;
				                    var img = $(this).children("img");
				                    if( $(this).hasClass("on") ){
				                        src = img.attr("src").replace("_off.", "_on.");
				                    }else{
				                        src = img.attr("src").replace("_on.", "_off.");
				                    }
				                     
				                    img.attr("src", src);
				                });
				            });
				             
				            // 맨첫번째 탭버튼 클릭처리
				            tabBtn.eq(0).click();
				        });
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
		
		</div>
	</div>
	<div id="main-container">
		<div id="main-contents" style="position: fixed;left: 300px;top: 0;width: 84%;height: 100%;" >
					<script src="resource/ckeditor.js"></script> 
			
			<div class="con-header">
			<h2>
				기안문 작성
			<i class="fa"></i>
			</h2>
			
			<div id="navText" class="breadcrumb-line"></div>
			</div>
			
    <div id="formButtonDiv">
    
	   
	    <a href="#" class="btn-example" onclick="layer_open('layer1');return false;"><button id="addApprLineButton" type="button" >결재선</button></a>
                     <div id="layer1" class="pop-layer">
                     <div class="modal-header">
                           <h2 class="modal-title">결재선 지정<a href="#" class="cbtn"></a></h2>
                     </div>
                     <div class="modal-body pd">
			
                          
                           
                        <div class="pop-container">
                           <div class="pop-conts">
	                       <!--content //-->
                           <div class="btn-r">
                              <a href="#" class="cbtn">닫기</a>
                           </div>
                           <!--// content-->
                           </div>
                        </div>
                        
    </div>
     <button id="createApprDocButton" 			type="button" >결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" >기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" >임시저장</button>
	    <button id="listApprDocButton" 				type="button" >취소</button>
    <div class="content-wrap approval responsive">
    <div class="content-write">
    <form id="apprDocForm" name="apprDocForm" method="post" action="/groupware/approval/work/apprWorkDoc/createApprDoc.do?OWASP_CSRFTOKEN=ZVYQ-0QVM-UKZ0-ENWZ-M9UY-HVY9-A9F5-V5BE" novalidate="novalidate">
				<input name="msie" type="hidden" value="0">
		        <input type="hidden" name="systemId" value="GW">
		        <input type="hidden" name="formId" value="7808784">
		        <input type="hidden" name="formVersion" value="1">		    
		        <input type="hidden" name="apprDocType" value="0">
		        <textarea title="formLayoutData" name="formLayoutData" style="display:none;"></textarea>
		        <input type="hidden" name="isLinkUrl" value="0">
		        <input type="hidden" name="linkDataType" value="0">
		        <textarea title="formData" name="formData" style="display:none;"></textarea>
		        <input type="hidden" name="defLineId" value="">
		        <input type="hidden" name="defLineUse" value="0">
		        <input type="hidden" name="isDefLineUpdate" value="0">
		        <input type="hidden" name="isRequestForm" value="0">		        		        		        		            
		        <input type="hidden" name="apprId" value="">        
		        <input type="hidden" name="registerJobTitle" value="이사">
		        <textarea title="formLinkedData" name="formLinkedData" style="display:none;"></textarea>
		        <input type="hidden" name="apprLineType" value="1">
		        <input type="hidden" name="apprLine" value="[{&quot;type&quot;:&quot;joinUser&quot;,&quot;apprType&quot;:0,&quot;id&quot;:&quot;U144499&quot;,&quot;code&quot;:&quot;U144499&quot;,&quot;userName&quot;:&quot;유준상&quot;,&quot;teamName&quot;:&quot;루크&quot;,&quot;jobTitleName&quot;:&quot;부서장&quot;,&quot;approverType&quot;:0,&quot;apprOrder&quot;:0,&quot;apprStatus&quot;:1,&quot;lineModifyAuth&quot;:1,&quot;docModifyAuth&quot;:1,&quot;readModifyAuth&quot;:1,&quot;apprDate&quot;:&quot;&quot;,&quot;name&quot;:&quot;결재 유준상 부서장 루크&quot;}]">
		        <input type="hidden" name="referenceId">
		        <input type="hidden" name="readId">
		        <input type="hidden" name="apprReceiveLine">
		        <input type="hidden" name="apprDocStatus" value="1">
		        <input type="hidden" name="isApprReceive" value="0">
		        <input type="hidden" name="listType" value="listApprForm">
		        <input type="hidden" name="registerMessage">
		        <input type="hidden" name="apprRefId">
		        <input type="hidden" name="mode" value="new">
		        <input type="hidden" name="linkType" value="">
		        <input type="hidden" name="popupYn" value="false">
		        <input type="hidden" name="modalYn" value="Y">
		        <input type="hidden" name="isEmergency">   	    			        
		        <input type="hidden" name="appKey01" value="">
		        <input type="hidden" name="appKey02" value="">
		        <input type="hidden" name="appKey03" value="">
		        <input type="hidden" name="appKey04" value="">
		        <input type="hidden" name="appKey05" value=""> 
		        <input type="hidden" name="isOfficial" value="0"> 
		        <input type="hidden" name="systemType" value="0"> 
		        <textarea title="formHtmlData" name="formHtmlData" style="display:none;"></textarea>
		            
				
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
									<div id="selectReferenceId" class="input-group organization"><div id="selectReferenceId_div" class="tagsinput"><input type="text" title="사용자" id="selectReferenceId_input" placeholder="사용자" style="box-shadow:none;"></div><a href="#a" title="사용자" class="btn input-group-addon btn-color5 br"><i class="icon man-plus"></i><span class="none">사용자</span></a></div>
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
				</div>
			</form>
	</div>
		<textarea class="ckeditor" cols="1" id="editor1" name="editor1" rows="15">
			</textarea>
			</div>
			<div id="formButtonDiv">
		<button id="addApprLineButton" 				type="button" >결재선</button>
	    <button id="createApprDocButton" 			type="button" >결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" >기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" >임시저장</button>
	    <button id="listApprDocButton" 				type="button" >취소</button>
    </div>

		</div>
	</div>
</div>
</div>
</div>
</body>
</html>