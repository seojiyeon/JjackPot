<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/JackPot/js/jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=8" type="text/css" />   
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="resource/ckeditor.js"></script>
<html>
<head>



<script type="text/javascript">
	 

    	   $(document).ready(function()
    				{
    				    
    				    $('input[name=bm_form]').change(function()
    				    {
    				    	
    				    	if($(':radio[name="bm_form"]:checked').val()=='1')
    						{	    		
    							$('#Termless').show();
    				    		$('#incharge').hide();
    							$('#rec').hide();
    							$('#ref').hide();
    				    		
    						}else if($(':radio[name="bm_form"]:checked').val()=='2')
    						{
    							$('#Termless').show();
    							$('#incharge').show();
    							$('#rec').hide();
    							$('#ref').show();
    						}else if($(':radio[name="bm_form"]:checked').val()=='3')
    						{
    							$('#Termless').hide();
    							$('#incharge').hide();
    							$('#rec').show();
    							$('#ref').show();
    						}else if($(':radio[name="bm_form"]:checked').val()=='4')
    						{
    							$('#Termless').hide();
    							$('#incharge').hide();
    							$('#rec').show();
    							$('#ref').show();
    						}
    				    });
    				});
    	   
    	   
    	   $(document).ready(function(){
    		   
    		   var datePicker = {
    		   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월' ],
    		   dayNamesMin: ['일','월','화','수','목','금','토'],
    		   weekHeader: 'Wk',
    		   dateFormat: 'yymmdd',  // 날짜형식 = 20130329
    		   autoSize: false,   // 자동리사이즈 (false 이면 상위 정의에 따름)
    		   changeMonth: true,  // 월변경 가능
    		   changeYear: true,  // 연변경 가능
    		   showMonthAterYear: true, // 년 위에 월 표시
    		   showOn: 'both',   // 엘리먼트와 이미지 동시사용 (both, button)
    		   buttonImageOnly: true,  // 이미지 표시
    		   buttonText: '달력',  // 버튼 텍스트 표시
    		   buttonImage: '/images/new/icon_calendar.gif', // 이미지 주소
    		   yearRange: 'c-99:c+99', // 1990~2020년 까지
    		   maxDate: '+6Y',   // 오늘 부터 6년 후까지만.  +0d 오늘 이전 날짜만 선택
    		   minDate: '-30d'                   // 30일 이전까지만 선택 가능            
    		   }
    		    
    		    
    		   $('#bm_start').trueDate($('#bm_start'));
    		   $('#bm_end').trueDate('${bm_end}');
    		    
    		   $('img.ui-datepicker-trigger').attr('style','margin-left:5px; vertical-align:middle; cursor:pointer;');
    		   $('#ui-datepicker-div').hide();
    		    
    		   });
 
     	      

    	   
	</script>
	



<script>
function openInchar(){
	url = "/JackPot/incharPop.jp"
 	open(url, "inchar", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
   }  
   
function openBms_rec(){
	url = "/JackPot/bms_recPop.jp"
 	open(url, "bms_rec", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
   }   
   
   
function resetAll(){
	  document.frm.reset();
	 }
	 
</script>

<!-- 
<script>
   function wrapWindowByMask(){
      //화면의 높이와 너비를 구한다.
      var maskHeight = $(document).height();  
      var maskWidth = $(window).width();  

      //마스크의 높이와 너비를 화면의 높이와 너비로 설정한다.
      $('.mask').css({'width':maskWidth,'height':maskHeight});  

      //애니메이션 효과
      $('.mask').fadeTo("slow",0.5);   
      
      // 레이어 팝업을 가운데로 띄운다.
      var left = ($(window).scrollLeft() + ($(window).width() - $('.window').width())/2);
      var top = ($(window).scrollTop() + ($(window).height() - $('.window').height())/2);
      
      // css 스타일 변경
      $('.window').css({'left':left, 'top':top, 'position':'absolute'});

      // 레이어 팝업 띄운다.
      $('.window').show();
   }

   $(document).ready(function(){
      //검은 마스크 배경과 레이어 팝업 띄운다.
      $('.chMemoCate').click(function(e){
         e.preventDefault();
         wrapWindowByMask();
      });

      //닫기 버튼을 눌렀을 때
      $('.window .close').click(function (e) {  
          //링크 기본동작은 작동하지 않도록 한다.
          e.preventDefault();  
          $('.mask, .window').hide();  
      });       

      //검은 마스크을 눌렀을 때
      $('.mask').click(function () {  
          $(this).hide();  
          $('.window').hide();  
      });      
   });
</script>

 -->

<title> 내가한 업무 요청 조회 </title>
</head>    
 <body>
<!-- ========================================================사이드바======================================================================= -->		

	<div id="page-container">
		<div id="sidebar">
			</div>
			<div id="subarea">	
				<div id="leftmenu-jp">
					<div class="leftmenu-top">
						<h2><a href="/JackPot/bmList.jp">업무관리 </a></h2>
					</div>
					
					<div id="leftmenuarea">
					<ul class="menulist" style="margin:0;padding:0;list-style:none;">
						<li >
							<a href="/JackPot/bmForm.jp">업무등록 </a><br>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
			
						
					
						<li >
							<a style="display:inline-block;height:20px;">To - Do</a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
							   		<li style="text-align:center;"><a href="/JackPot/mytodoList.jp">나의 할일 </a></li>
							   		<li><hr color=" lightgrey " size="1"></li>
							   	</ul>
						</li>
							  
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmYCHList.jp">내가 한 업무 요청</a> </li>
								      <li><a href="/JackPot/SSBmYCHList.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/ChZBGBmYCHList.jp">참조  업무 요청</a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmBGList.jp">내가 한 보고 </a> </li>
								      <li><a href="/JackPot/SSBGBmList.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/ChZBGBmList.jp">참조  업무 보고 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li >
							<a style="display:inline-block;height:20px;">업무일지  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmWriteList.jp">내가 작성한 업무 일지  </a> </li>
								      <li><a href="/JackPot/SSBmList.jp">수신  업무 일지  </a></li>
								      <li><a href="/JackPot/ChZBmList.jp">참조  업무 일지 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a >업무보관함   </a>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
						
						<li>
							<a >업무보관함 관리    </a>
						</li>
					</ul>
				</div>
			</div>
			</div>
			</div>
<!-- ================================================================================================================================================= -->		


<div id="main-contents">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="form-block">
                <table class="table">
                    <caption></caption>
                    <tbody>
                        <tr>
                            <th scope="row">제목</th>
                            <td>
                                <div>
                                	${bmdto.bm_title }
                                </div>
                            </td>
                            <th scope="row">상태</th>
                            <td>
                                <div>
                                	${bmdto.bm_state }
                                </div>
                            </td>                            
                            
                        </tr>
	                   <tr>
							<th scope="row">지시자 </th>
                            <td>
                                <div>
                                	${bmdto.bm_name }
                                </div>
                   	 	</tr>
                        
						<tr>
							<th scope="row">업무기한 </th>
                            <td>
                                <div>
                                	${bmdto.bm_start } ~ ${bmdto.bm_end }
                                </div>
                   	 	</tr>
                   	 	
                   	 	<tr>
							<th scope="row">업무등록일  </th>
                            <td>
                                <div>
                                	${bmdto.enrollment }
                                </div>
                                
 							<th scope="row">수정일  </th>
                            <td>
                                <div>
                                	${bmdto.update_day }
                                </div>                               
                   	 	</tr>
                    
                 
						<tr>
							<th scope="row">담당자  </th>
                            <td>
                                <div>
                                	${bmdto.inchar_name }
                                </div>
                   	 	</tr>
                        
						<tr>
							<th scope="row">참조자   </th>
                            <td>
                                <div>
                                	${bmdto.ref_name }
                                </div>
                   	 	</tr>
                        
  						<tr>
							<th scope="row">업무보관함    </th>
                            <td>
                                <div>
                                	${bmdto.box_name }
                                </div>
                   	 	</tr>
                   	 	
  						<tr>
							<th scope="row">업무내용  </th>
                            <td>
                                <div>
                                	${bmdto.bm_content }
                                </div>
                   	 	</tr>
                   	 	
  						<tr>
							<th scope="row">첨부파일    </th>
                            <td>
                                <div>
                                	${bmdto.sys_file }
                                </div>
                   	 	</tr>

  						<tr>
							<th scope="row">업무보관함    </th>
                            <td>
                                <div>
                                	${bmdto.box_name }
                                </div>
                   	 	</tr>

  						<tr>
							<th scope="row">첨부파일    </th>
                            <td>
                                <div>
                                	${bmdto.box_name }
                                </div>
                   	 	</tr>

</tbody></table></div></div></div>
</div>
</body>
</html>