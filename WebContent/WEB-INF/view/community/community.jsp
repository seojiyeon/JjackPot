<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/JackPot/css/community.css?ver=20" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>


<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>게시판</title>

			<script src="resource/ckeditor.js"></script> 
			<script type="text/javascript" >

			// image-upload plugin에서 사용되는 변수
			var ckeditorMaxFileSize = Number
			("") || 0,
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

<script type="text/javascript">
$(document).ready(function(){
    $("#menuTreeTitle>a").click(function(){
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

function layer_open2(e2){

	var temp2 = $('#' + e2);		//레이어의 id를 temp변수에 저장
	var bg2 = temp2.prev().hasClass('bg2');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg2){
		$('.layer').fadeIn();
	}else{
		temp2.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp2.outerHeight() < $(document).height() ) temp2.css('margin-top', '-'+temp2.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp2.outerWidth() < $(document).width() ) temp2.css('margin-left', '-'+temp2.outerWidth()/2+'px');
	else temp2.css('left', '0px');

	temp2.find('a.cbtn2').click(function(e){
		if(bg2){
			$('.layer').fadeOut();
		}else{
			temp2.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
		}
		e2.preventDefault();
	});

	$('.layer .bg2').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});

}

Dropzone.options.myDropzone = {

		  // Prevents Dropzone from uploading dropped files immediately
		  autoProcessQueue: false,
		  addRemoveLinks: true,
		  maxFilesize:100.0,
		  maxFiles: 10,
		  uploadMultiple:true,
		  parallelUploads:10,
		  paramName: "files", 
		  method: 'post',
		  
		  init: function() {
		    var submitButton = document.querySelector("#submit-all")
		        myDropzone = this; // closure

		    submitButton.addEventListener("click", function() {
		      myDropzone.processQueue(); // Tell Dropzone to process all queued files.
		    });

		    // You might want to show the submit button only when 
		    // files are dropped here:
		    this.on("addedfile", function() {
		      // Show submit button here and/or inform user to click it.
		    });
		        
		    this.on("maxfilesexceeded", function (data) {
                alert('최대 업로드 파일 수는 10개 입니다.');
            });
/* 			this.on('sendingmultiple',function(data, xhr, formData){
			$("form").find("input").each(function(){
				formData.append($(this.attr("name"),$(this).val()));
			});	
			}); */
		  }
		};

</script>

<body>
<div id="page-container"  class="sub sidebar-mini sidebar-subarea">
	<div id="sidebar" style="background:white;">
  <jsp:include page="/sidebar.jp"></jsp:include>
</div>
<div class="sidebar-content"> 
 <h1>
		 <a href="main.jp"  class="sidebar-brand otherMenu menuTooltip" >
		   <img src="/JackPot/save/home.png" width=50px, height=50px style="margin:5;">
   <span id="brand" class="brand none">  
	</span>	 
   </a>
 </h1>
</div>

	<div id="subarea">	
		<div class="leftmenu">
		<h1 class="blind">Left Menu</h1>
			<div class="leftmenu-top">
				<h2 style="margin:20;" >게시판</h2>
</div>
			
	<div class="leftmenu-inner-scroll mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" 
style="height: 100%; position: relative; overflow: visible;"><div id="mCSB_1" 
class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" 
style="max-height: none;" tabindex="0"><div id="mCSB_1_container" 
class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" 
style="position:relative; top:0; left:0;" dir="ltr">
				<ul class="menulist" >
				<li>
		<div class="btn-wrap-leftMenu row">
					
					<button type="button" class="btn btn-color7 br w100p" onclick="layer_open('layer1');return false;">게시물 등록</button>
						
					
					</div>		
					</li>
					
		<li data-submenu="listAllBoardItem" class="current">
					<a href="community.jp" class="sidebar-nav-menu" style="color:#d3292c">최근게시글</a>
					
				</li>
				
				<li id="menuTreeTitle">
		
					<a style="display:inline-block;height:40px;">게시판 목록 <img src="/JackPot/save/arrow.png" width="20" height="20" style="margin: 0 40;">	</a>		
			<ul style="display: block;">
						
					 <ul style="margin: 0 40; font-size: 17; text-decoration:none;">
					 
					
					 <i class="jstree-icon jstree-ocl" role="presentation"></i>
					 
								     <a class="jstree-anchor" href="gongji.jp" tabindex="-1" id="7860780_anchor">
								     <i class="jstree-icon jstree-themeicon" role="presentation">
								     </i> <img src="/JackPot/save/folder.png" width="15" height="15"> &nbsp;공지사항</a>  <br/>
								     
								     <a class="jstree-anchor" href="free.jp" tabindex="-1" id="7860780_anchor">
								     <i class="jstree-icon jstree-themeicon" role="presentation">
								     </i><img src="/JackPot/save/folder.png" width="15" height="15"> &nbsp;자유게시판</a> <br/>
								     
								     <a class="jstree-anchor" href="etc.jp" tabindex="-1" id="7860780_anchor">
								     <i class="jstree-icon jstree-themeicon" role="presentation">
								     </i><img src="/JackPot/save/folder.png" width="15" height="15"> &nbsp;기타</a>
								     
								   
								   </ul>
					</li>				
				
			
							
				</ul>
			</div>
		</div>
	</div>
</div>

	<div id="main-container" style="position: fixed;top: 0;left: 500; width:1000px;">


<form id="searchBoardItemForm" method="post" action="commInsert.jp">

<input name="sortColumn" type="hidden" value="">
 		

<input name="sortType" type="hidden" value="">
 

<input name="boardId" type="hidden" value="">
  

<input name="layoutType" type="hidden" value="layoutNormal">
   

<input name="actionType" type="hidden" value="">
      

<input name="popupYn" type="hidden" value="false">


<input name="boardRootId" type="hidden" value="0">

	<div class="con-header">
	<h2>
		최근게시글
	</h2>
	
	<div id="navText" class="breadcrumb-line"></div>
</div>

<div class="ins-box">
	<ul >
	  <li style="display: inline-block">
	  </li>
	   <li style="display: inline-block">
	  </li>
	 </ul> 
	
</div>
<caption></caption>
		
	<div class="content-list">			
		<table class="table table-striped" style="margin: 20;">   
		<caption></caption> 
		<colgroup>
		<col style="width: 50px;">
		<col style="width: 280px;">
		<col style="width: 150px;">
		<col style="min-width:200px;">
		<col style="width: 200px;">
		<col style="width: 90px;">
		<col style="width: 75px;">
		<col style="width: 75px;">
		</colgroup>
	
	
	<thead>
	
			<tr>
				<th scope="col">
					번호
				</th>
				
				<th scope="col">
			      제목						
				</th>
				
				<th scope="col">
					등록자
				</th>
				<th scope="col">
					등록일
				</th>
			<th scope="col">
					조회
				</th>
			<th scope="col">
				    추천
				</th>
				
			</tr>
			
			</thead>
		
		<tbody>				

	
	<tr class="boardItemLine" style="background: rgb(249, 249, 249);">
	<c:forEach var="article" items="${list}" varStatus="status">
	
						
						<td align="center">
					        ${article.com_num }  
						</td>
						
						<td>
							<a style="text-decoration-line: initial;" title="${article.title}" class="boardItem" href="/JackPot/content.jp?com_num=${article.com_num}">${article.title }</a>
						</td>
						
						
						<td align="center"> 
					<div class="ellipsis">${article.writer} </div>
							</td>	 
							
						</td>
						<td align="center">
						<div class="ellipsis">${article.reg_date}</div></td>
						
						<td align="center">
								   ${article.readcount}
														
						</td>
						<td align="center"><div class="ellipsis">
									${article.recommend}
								</div>							
						</td>
						
					</tr>
					
				
	</c:forEach>
	</tbody>
	
		</tr>
		</table>
		</div>
		<div id="layer1" class="pop-layer">
								    <div class="pop-top">
									<font>게시판</font><a href="#" class="cbtn"><img src="/JackPot/mainsave/logout.jpg"/></a>
									</div>
									<div class="pop-info">
									등록할 게시판을 선택해주세요.
									</div>
								<div class="pop-container">
									<div class="pop-conts">
										<a href="#" class="btn-example2" onclick="layer_open('layer2');return false;">게시판</a>
											<div id="layer2" class="pop-layer2" style="display: block; margin-top: -301px; margin-left: -250px;">
										<div class="contents">	
								  			<div class="pop-top2">
											게시판 <a href="#" class="cbtn"><img src="/JackPot/mainsave/logout.jpg" style="float:right"/></a>
											</div>
											<div class="pop-board">
												<div class="pop-info2">
												<font size="2">등록 시 제목의 체크박스에 체크하면 목록의 상단에 위치하며 업무포탈 상단의 NOTICE에 노출됩니다.</font>
												</div>
												<div class="pop-container2">
												<div class="pop-conts2">
													<div>
														<form action="commInsert.jp" name="insert" method="post">
														<ul>
															<li style="width:20%;background-color:#f5f5f5;">게시판 명</li>
															
															<select name="btype" style="width:130px; height: 27px;">
   														 <option value="1">공지사항</option>
   														 <option value="2">자유게시판</option>
 													     <option value="3">기타</option>
															</select>
															
															<li style="width:80%;">
															
														</ul>
														<ul>
															<li style="width:20%;background-color:#f5f5f5;">*제목</li><li style="width:80%;"><input type="text" name="title" ></li>
														</ul>
														<ul>
															<li style="width:20%;background-color:#f5f5f5;">작성자</li><li style="width:80%;"><input type="text" name=writer></li>
														</ul>
														<ul>
															<li><textarea class="ckeditor" cols="1" id="editor1" name="content" rows="15"></textarea></li>
														</ul>
														
														 <input type="submit" value="제출" style="width:833px;">
														</form>
													</div>
													
												</div>
											</div>
										<div class="btn-r2">
											<a href="#" class="cbtn">닫기</a>
										</div>
									</div>
									</div>
								</div>
							</div>
						<div class="btn-r">
						<a href="#" class="cbtn">닫기</a>
						</div>
					</div>
				</div>
	</form>	
	
	</div>
	</div>
</div>
</body>
</html>