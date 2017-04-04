<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri=http://java.sun.com/jstl/fmt_rt %>
    
<link rel="stylesheet" href="resource/samples/sample.css">
<link href="/JackPot/css/basic.css?ver=3" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=3" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=3" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=3" rel="stylesheet" type="text/css">


<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a hh:mm" var="tdate" />

    <title>JackPot 전자결재_양식목록</title>
        <div id="main-container" style="margin-left:55px;">
			<script src="resource/ckeditor.js"></script> 
			<script type="text/javascript" >

			// image-upload plugin에서 사용되는 변수
			var ckeditorMaxFileSize = Number("") || 0,
				ckeditorMaxImageWidth = Number("800") || 0;
			var	ckeditorMakeThumbYn = ("" == "2" || "" == "Y") ? "Y" : "N",
				ckeditorThumbWidth= "";
			
			(function($) {
				var fullCkeditorConfig = {
					toolbar : [
						['Source','-','Preview','-','Print'],
						['Cut','Copy','Paste','PasteText','PasteFromWord'],
						['Undo','Redo','-','Find','Replace'],
						['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
						['Link','Unlink'],['Maximize','ShowBlocks'],
						'/',
						['Font'],['FontSize'],['Styles'],
						['TextColor','BGColor','-','Bold','Italic','Underline','Strike','-','Subscript','Superscript'/*,'-','RemoveFormat'*/],
						['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
						['imageUpload','Table','HorizontalRule','SpecialChar'/*,'Smiley'*/]
						      ], 
				    extraPlugins : 'imageUpload,tableresize'
				};			
				var miniCkeditorConfig = {
					height: 180,
					toolbar : [
	/* 							  ['Font'],['FontSize'],
					              ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
					              ['imageUpload','Bold','Underline','TextColor','BGColor']
	*/					['Font'],['FontSize'],
						['TextColor','BGColor','-','Bold','Italic','Underline','Strike'],
						['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
						['imageUpload','SpecialChar']
						      ], 
				    extraPlugins : 'imageUpload',
				    toolbarCanCollapse : false,
				    resize_enabled : false
				};			
				var apprMiniCkeditorConfig = {
					height: 180,
					toolbar : [
	/* 							  ['Font'],['FontSize'],
					              ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
					              ['Bold','Italic','Underline','TextColor','BGColor']
	 */					['Font'],['FontSize'],
						['TextColor','BGColor','-','Bold','Italic','Underline','Strike'],
						['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
						      ],
					toolbarCanCollapse : false,
					resize_enabled : false,
					allowedContent : false
				};
				
				function beforeUnloadConfirm(){
	   				return "작성중인 내용이 저장되지 않았습니다.";
	    		}
				
				spro.initEditorSet = function(form, unusedParam, options, container, content) {
					if($.isPlainObject(unusedParam)) {
						content = container;
						container = options;
						options = unusedParam;
					}
					
					var $form = $(form);
					var $inputIE = $('<input type="hidden" name="msie"/>').appendTo($form);
					var _options = $.extend({
						localeCode:"",
						title:"",
						mode:"full",
//	 					height:400,
						unloadConfirm : true
					}, options || {});
					
					var $container = $("#" + (container||"editorDiv")),
						$content = $("#" + (content||"contents"));
				    	
			    	var $contents = $content;			    	
		    		
		    		
		    		var appConfig = fullCkeditorConfig;	// full
		    		switch(_options.mode) {
		    			case "mini" : appConfig = miniCkeditorConfig; break;
		    			case "apprMini" : appConfig = apprMiniCkeditorConfig; break;
		    		}
		    		
		    		var config = $.extend(appConfig, {
		    			removePlugins : "elementspath",	// 하단의 상태바 삭제,
		    			height : _options.height || undefined,
			    		language : _options.localeCode == 'jp'? 'ja':_options.localeCode,
			    		popupTitle : _options.title
			    	});
		    		
		    		var fonts = "Arial/Arial, Helvetica, sans-serif;Comic Sans MS/Comic Sans MS, cursive;Courier New/Courier New, Courier, monospace;Georgia/Georgia, serif;Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;Tahoma/Tahoma, Geneva, sans-serif;Times New Roman/Times New Roman, Times, serif;Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;Verdana/Verdana, Geneva, sans-serif";
		    		if ( _options.localeCode == 'ko' ) {
		    			config.font_names = "나눔고딕/나눔고딕,Nanum Gothic,돋움;돋움/돋움,Dotum;굴림/굴림,Gulim;궁서/궁서,Gungsuh;맑은 고딕/맑은 고딕,Malgun Gothic,돋움;" + fonts;
		    		} else if ( _options.localeCode == 'jp' ) {
		    			config.font_names = "Meiryo;Meiryo UI;MS Pゴシック;MS P明朝;MS ゴシック;MS 明朝;" + fonts;
		    		}
		    		
		    		if(_options.spro) {	// 임의 설정
		    			config.spro = $.extend({
		    				webImageUpload : false
		    			}, _options.spro);
		    		}
		    		
		    		/**
		    		 * enterMode
		    		 * 	- ENTER_P : IE8에서 이미지 첨부후 이미지 뒤로 커서 이동 안되는 문제 발생
		    		 * 	- ENTER_BR : IE11에서 한글 입력시 문자 조합 안되는 문제 발생
		    		 */
	    			config.enterMode = CKEDITOR.ENTER_P;
	    			config.shiftEnterMode = CKEDITOR.ENTER_P;

		    		$contents.ckeditor(config);			    		
					$inputIE.val("0"); 
					
					var editor = $contents.ckeditor().editor;
					editor.on("instanceReady",function() {
						if(config.enterMode == CKEDITOR.ENTER_P) {
							setTimeout(function() {
								//$("iframe", $container).contents().find(".cke_editable p").css("margin", 0);
							}, 100);
						}
					});
					
					if(_options.unloadConfirm)
		    			$(window).bind("beforeunload", beforeUnloadConfirm);
				};
				
				 
				spro.beforeEditorSend = function(form, content) {
					var contentsId = content || "contents";
					var $form = $(form);
					$("input[name^=editorFileLinkList]", $form).remove();				
					var $contents = $("#" + contentsId);
					
			    	
					if ( $("#cke_14").is("*") && $("#cke_14").hasClass("cke_button_on") ) {
						$("#cke_14").click();
					}
		    	
					var editor = $contents.ckeditor().editor;
					editor.updateElement();
					
					var cnt = $("input[name^=editorFileLinkList]", $form).size();
					$("#cke_" + contentsId).find("iframe").contents().find("img[name=editorImage]").each(function(index) {
						if ( $("input[name=isMail]", $form).val() == "true" ) {
							$form.append("<input name='editorFileLinkList[" + (cnt + index) + "].fileLinkId' value='" + $(this).attr("id") + "' type='hidden'/>");
							$form.append("<input name='editorFileLinkList[" + (cnt + index) + "].fileId' value='" + $(this).attr("src") + "' type='hidden'/>");
						} else {
							$form.append("<input name='editorFileLinkList[" + (cnt + index) + "].fileId' value='" + $(this).attr("id") + "' type='hidden'/>");	
						}
			    	});
			    	
			    	$(window).unbind("beforeunload", beforeUnloadConfirm);
				};
			})(jQuery);
			</script>
			<div class="con-header">
			<h2>
				기안문 작성
			<i class="fa"></i>
			</h2>
			
			<div id="navText" class="breadcrumb-line"></div>
			</div>
			
    <div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="button" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>
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
			<div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="button" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>
</div>
