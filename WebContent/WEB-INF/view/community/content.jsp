<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/JackPot/css/community.css?ver=12" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>내용</title>

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
    $(".boardmenu>a").click(function(){
        var boardmenu = $(this).next("ul");
        if( boardmenu.is(":visible") ){
            boardmenu.slideUp();
        }else{
            boardmenu.slideDown();
        }
    });
    
    $(".name>a").click(function(){
        var boardmenu = $(this).next("ul");
        if( boardmenu.is(":visible") ){
            boardmenu.slideUp();
        }else{
            boardmenu.slideDown();
        }
    });
});

/* function recommend(){
	var re = $('#viewReply');
	if( re.is(":visible")){
		re.slideUp();
	}else{
		re.slideDown();
	}
} */


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

	
	
		function test(form){
			form.submit();
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
								    <div class="pop-top">
									<font>게시판</font><a href="#" class="cbtn"><img src="/JackPot/mainsave/logout.jpg"/></a>
									</div>
									<div class="pop-info">
									등록할 게시판을 선택해주세요.
									</div>
								<div class="pop-container">
									<div class="pop-conts">
										<a href="#" class="btn-example2" onclick="layer_open('layer2');return false;">게시판</a>
											<div id="layer2" class="pop-layer2">
										<div class="contents">	
								  			<div class="pop-top2">
											게시판 <a href="#" class="cbtn2"><img src="/JackPot/mainsave/logout.jpg" style="float:right"/></a>
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
															<li style="width:20%;background-color:#f5f5f5;">게시판 명</li><li style="width:80%;">자유게시판<input type="hidden" name="btype"></li>
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
														
														 <input type="submit" value="제출">
														</form>
													</div>
													<div class="pop2boardfileuplord">
														<ul>
															<li>
															<form action="/JackPot/boardinsert.jp"
     															  class="dropzone"
     															  id="my-dropzone"
     															  style="width:762px;border: 1px solid rgba(0, 0, 0, 0.3);"></form>
															</li>
														</ul>
														<ul>
														<li><button id="submit-all">업로드</button></li>
														</ul>
													</div>
												</div>
											</div>
										<div class="btn-r2">
											<a href="#" class="cbtn2">닫기</a>
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
</div>
</body>

<div id="main-contents">
	
	<div class="con-header bdr-b">
	<h3>
		자유게시판
	</h3>
	<div id="navText" class="breadcrumb-line"></div>
	</div>
	

      <div class="content-wrap">
      
      
 <div class="board-header">
	<h3>	
						<i class="icon nonimp">	</i>
				
				 ${dto.title }


				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">추천하기 </font>
				<a id="recommend" href="/JackPot/like.jp?com_num=${dto.com_num}"> 	
							
				<img src="/JackPot/save/like (2).png" width="30" height="30">						   
					
				</a>
			</h3>
			

<ul class="writer-info mt15">
			
				
				<li style="display:-webkit-inline-box;">
					
						<span class="ellipsis"> ${dto.writer }</span>
						<span class="txt_bar"></span>
					
				</li>
				<li style="display:-webkit-inline-box;">
					<span class="num"> ${dto.reg_date}</span>
					<span class="txt_bar"></span>
				</li>
				<li style="display:-webkit-inline-box;">
					
						<span class="ellipsis"> 추천수 : ${dto.recommend }</span>
						<span class="txt_bar"></span>
						</li>
				<li style="display:-webkit-inline-box;">
					
						<span class="ellipsis"> 조회수 : ${dto.readcount }</span>
			   </li>		
			</ul>		
	
		</div>

<div class="panel-body message-body"  style="margin: 0 0 0 20;">
		 
	    <div id="boardItemContent" class="contentsBody">
          
			
		&nbsp;&nbsp;&nbsp;&nbsp; <font size="4">${dto.content}</font>

			 
           
        </div>
        <br/>
         <br/>
          <br/>
           <br/>
            <br/>
             <br/>
              <br/>
               <br/>
                <br/>
            
        
	</div>
	
    
</div>


<table width="700" border="3" align="center" bordercolor="gray" cellpadding="0" cellspacing="0" align="center">
      <form method="post"  action="comment.jp">
      
    <tr height="20" >
        <td bgcolor="gray" align="center">
        <font color="white">Comment</font></td></tr>
        
      <input type="hidden" name="com_num" value="${dto.com_num}"/>
      <input type="hidden" name="emp_num" value="${dto.emp_num}"/>
    
         
<div class="comment-wrap op">
	<div class="reply-wrap"><span><i class="icon reply"></i></span> ${check} </div>
		<div class="input-group">
			
				<input name="itemId" type="hidden" value="8501850">
				<textarea title="textarea" id="8501850_contents" name="content" rows="2" class="form-control original" placeholder="댓글을 입력하세요."></textarea>
 
 <span class="input-group-btn">
 							
				<!-- <img src="/JackPot/save/chatting.png" width="40" height="40" onclick="test(this.form);">	 -->					   
				<input  TYPE="IMAGE" src="/JackPot/save/chatting.png"  width="45" height="45" name="Submit" value="Submit" align="absmiddle">					 
		</span>          
     </Td>    
      </tr>   
</form>   

     
     <tr >
     <td>
     
      <c:forEach var="article" items="${articleList}" varStatus="status">

    
     <li class="last">
		        <ul>		        	
		        	<li class="name">
					<font color="gray" size="2"	style="margin: 3px;">${article.emp_name}(${article.re_num})&nbsp;&nbsp;&nbsp;&nbsp;${article.re_date} </font>
             
             <input type="hidden" name="rep_num" value="${article.rep_num}">
             <input type="hidden" name="com_num" value="${article.ref}"/>
             
             <a href="/JackPot/CommentDEL.jp?ref=${article.ref}&rep_num=${article.rep_num}"> 	
				<img src="/JackPot/save/garbage2.png" width="18" height="18" >			   
			</a>
				
		      <a class="recommend" onclick="recommend()" href="#<%-- /JackPot/reply.jp?ref=${article.ref}&rep_num=${article.rep_num} --%>" style="margin:0 10 0 20;"> 	
				[답글쓰기]   
			</a>
		<ul style="display:none;width:500px;height:20px;background:gray;">
		<form>
		
		</form>
		</ul>
				
				
		             <li class="content" style="margin: 5px;">${article.content}
		             
		      
							
		            </li> 
	                           
		        </ul>
	
		    </li>
		 </div>
     
     
     
      
      </c:forEach>
     </td>
     </tr>
     
  </div>
      </form>    


</div>
    </table>
</div>
</html>



 














   