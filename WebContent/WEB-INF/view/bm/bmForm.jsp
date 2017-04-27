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

<title> 업무관리</title>
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
<form method="post" action="/JackPot/bmFormPro.jp" onSubmit="return checkIt();">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="form-block">
                <table class="table">
                    <caption></caption>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="text-point-b">*</span>제목</th>
                            <td>
                                <div>
                                	<input type="text" title="제목" name="bm_title" class="form-control" value="${bm_title}" placeholder="제목을 입력하세요.">
                                </div>
                            </td>
                        </tr>
                        
						<tr>
							<th scope="row"><span class="text-point-b" >*</span>업무형태</th>
							<td>
								<div >
									
									<label ><input type="radio" id="type" name="bm_form" title="나의 할일" value="1"> 나의 할 일</label>
									<label ><input type="radio"  id="type" name="bm_form" title="업무 요청" value="2" checked="checked"> 업무 요청</label>
                              	  <label ><input type="radio"   id="type" name="bm_form" title="업무 보고" value="3"> 업무 보고</label>
                              	  <label ><input type="radio"  id="type" name="bm_form" title="업무 일지" value="4"> 업무 일지</label>
                             </div>
                       	 	</td>
                   	 	</tr>
                    
                    <tr id="Termless" style="display: none;" >
                    	<th id="isTermlessTR"  ><span class="text-point-b">*</span>업무기한</th>
							<td>
								<fmf:parseDate value="${date }" var=" date1" pattern="yyyymmdd" scope="page"/><!-- String형을 받아서 원하는 포멧으로 Date형태로 변경  -->
								<fmt:formatDate value="${date1 }" pattern="yyyy-MM-dd" var="date1"/> <!-- Date형을 받아서 원하는 포멧으로 날짜형태를 변경  -->
								<input type="text" title="시작날짜" id="bm_start" value="${date1 }" name="bm_start" readonly="readonly" onchange="test(this.value)"><!-- readonly 칸에 글자못쓰게 막기-->
                                
                                <fmf:parseDate value="${date }" var=" date2" pattern="yyyymmdd" scope="page"/>
               					<fmt:formatDate value="${date2 }" pattern="yyyy-MM-dd" var="date2"/>
								
								<input type="text" title="종료날짜" id="DateCalendar" value="${date2 }" name="bm_end" onchange="test(this.value)">
                           		<span class="label-group ml10">
								<input type="checkbox" title="기한없음" name="bm_end" value="0"><label>기한없음</label>
                             	</span>
                            </td>
                        </tr>
                 
                        <tr id="incharge" style="display: none;">
                            <th id="incharge_name" scope="row">
                            	<span class="text-point-b">*</span>담당자</th>
                            <td>
                            
								<input type="text" title="사용자" name="inchar_name"  value="${inchar_name}" placeholder="사용자" style="box-shadow:none;">
                                <button type="button" class="btn input-group-addon btn-color5 br" onclick="openInchar()"><i class="icon man-plus">
                                <span class="none">사용자</span></i></button>
     						</td>
                        </tr>
                        
                        <tr id="rec" style=" display: none;">
                        	<th id="rec_name" scope="row" ><span class="text-point-b">*</span>수신자</th>
                            <td>
                      
                                <input type="text" title="사용자" id="selectUser2_input"  value="${rec_name}" placeholder="사용자" style="box-shadow:none;">
                               	<button type="button" class="btn input-group-addon btn-color5 br" onclick="openBms_rec()">
                                <i class="icon man-plus"><span class="none">사용자</span></i></button>
                            </td>
                        </tr>
                        
                        <tr id="ref" style=" display: none;">
                            <th id="ref_name" scope="row" ><span class="text-point-b">*</span>참조자
                            </th>
                            
                            <td>
                            	<input type="text" title="사용자" id="selectUser2_input"  value="${ref_name}" placeholder="사용자" style="box-shadow:none;">
                               	<button type="button" class="btn input-group-addon btn-color5 br" onclick="openBms_rec()">
                                <i class="icon man-plus"><span class="none">사용자</span></i></button>
                            </td>
                        </tr>


                       
                    
                        
                        <tr id="alarmTR">
                            <th scope="row">등록 알림</th>
                            <td>
                            <input type="hidden" name="bm_end" >
                                <input name="reg_notice" type="checkbox" title="쪽지 발송" value="쪽지 발송"> 쪽지 발송&nbsp;&nbsp;
                                <input name="reg_notice" type="checkbox" title="푸시 발송 " value="푸시 발송"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr id="rAlarmTR">
                            <th scope="row">완료 알림</th>
                            <td>
                            <input type="hidden" name="cmp_notice" >
                                <input name="cmp_notice" type="checkbox" title="쪽지 발송" value="쪽지 발송"> 쪽지 발송&nbsp;&nbsp;
                                <input name="cmp_notice" type="checkbox" title="푸시 발송 " value="푸시 발송 "> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr >
                            <th scope="row"><label for="bns_box">업무 보관함</label></th>
                            <td>
                            	<select name="bns_box" class="w400" style="">
									<c:if test="${countBns_box == 0}">
										<option value="0">폴더 없음</option>
									</c:if>
									<c:if test="${countBns_box > 0}">
										<c:forEach var="Bns_box" items="${ListBns_box}">
											<c:if test="${Bns_box.bns_num == bmdto.getBns_box()}">
												<option value="${Bns_box.bns_num}" selected>${Bns_box.box_name}</option>
											</c:if>
											<c:if test="${Bns_box.bns_num != bmdto.getBns_box()}">
												<option value="${Bns_box.bns_num}">${Bns_box.box_name}</option>
											</c:if>									
									</c:forEach>
								</c:if>
								</select>

                            </td>
                        </tr>
                      
                        <tr id="categoryTR3">
                            <th scope="row"><label for="related_bns">관련업무</label></th>
                            <td>
                                <button type="button" class="btn btn-color8 br" value="${related_bns}"  onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
                                <div id="addTask"></div>
                            </td>
                        </tr>
              </tbody>
              </table>
		</div>           
		</div>
		</div>
							<!--ckeditor 부분 -->
					<div>
					
						<textarea class="ckeditor" cols="1" id="bm_content" name="${bm_content}" rows="15"></textarea>
						
						
					</div>
	<div class="btn-wrap" >
		<input type="submit" value="저장" class="btn btn-color5 br" />
        <button type="button" onClick="window.location='bmForm.jp'"class="btn2 btn-color7 br">취소</button>
    
    </div>
</form>
</div>
</body>
</html>