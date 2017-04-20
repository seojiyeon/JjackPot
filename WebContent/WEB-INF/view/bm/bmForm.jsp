<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script type="text/javascript" charset="UTF-8" src="/comon/ETC/js/jquery.leanModal.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=7" type="text/css" />   
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="resource/ckeditor.js"></script>
<html>
<head>



<script type="text/javascript">
	

    	   $(function() {
        	      $( "#work_date").datepicker({
        	    	    showOn: "button", 
                        buttonImage:"/JackPot/images/calendar (1).png",
                        buttonImageOnly: true ,
                        buttonText: "Select date",
                        buttonImageSize : "vertical-align: middle; margin: 10px 10px 10px 10px",
        	    	 	dateFormat:'yy-mm-dd', 
						showButtonPanel: true,
						changeMonth: true, 
						changeYear: true,
						nextText: '다음 달',
						prevText: '이전 달',
						currentText:'오늘 날짜',
						closeText: '닫기',
						changeMonth: true, 
						dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
						monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
						maxDate : 'd',
					});
        	      
        	  
    	   });
           
    	   function test(test){
    		   $.ajax({
   	  	        type: "post",
   	  	        url : "/JackPot/workday.jp",
   	  	        data : {day : test},
   	  	        success: function(data){
   	  	        	$("#workday").html(data);
   	  	        }	
   	      	  });
    	   }
    	   
    	   
	</script>
	



<script>
     function openInchar(){
      url = "/JackPot/incharPop.jp"
      open(url, "inchar", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
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
<form method="post" ation="/JackPot/bmForm.js">
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
                                        <input type="text" title="제목" name="bm_tiltie" class="form-control" placeholder="제목을 입력하세요.">
                                    
                                </div>
                            </td>
                        </tr>
                        
				<tr>
					<td><span class="text-point-b" >*</span>업무형태</td>
						<td>
							<div >
								<input type="hidden" name="bm_form" value="">
								<label ><input type="radio" name="bm_form" title="나의 할일" value="0"> 나의 할 일</label>
								<label ><input type="radio" name="bm_form" title="업무 요청" value="1"> 업무 요청</label>
                                <label ><input type="radio" name="bm_form" title="업무 보고" value="2"> 업무 보고</label>
                                <label ><input type="radio" name="bm_form" title="업무 일지" value="3"> 업무 일지</label>
                             </div>
                        </td>
                    </tr>
                    
                    <tr id="isTermlessTR">
                    	<th ><span class="text-point-b">*</span>업무기한</th>
							<td>
								<input type="hidden" name="bm_start" value="">
								<input type="text" title="시작날짜" id="dueDateCalendar" name="bm_start" value="${date}" readonly="readonly" class="input-datepicker w100" data-date-format="yyyy.mm.dd" placeholder="yyyy.mm.dd">
                                <button type="button" id="dueDateCalendarBtn" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
                                <div class="timepicker-wrap blind">
                                <div class="input-group bootstrap-timepicker"><div class="bootstrap-timepicker-widget dropdown-menu">
                                </div></div></div>
                                
                                <input type="hidden" name="bm_end" value="">
                                <input type="text" title="종료날짜" id="dueDateCalendar" name="bm_end" value="${date}" readonly="readonly" class="input-datepicker w100" data-date-format="yyyy.mm.dd" placeholder="yyyy.mm.dd"><!-- readonly 칸에 글자못쓰게 막기-->
                                <button type="button" id="dueDateCalendarBtn" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
                                <div class="timepicker-wrap blind">
                                <div class="input-group bootstrap-timepicker"><div class="bootstrap-timepicker-widget dropdown-menu">
                                
                                <table>
                                	<tbody>
                                		<tr>
                                			<td><a href="#" data-action="incrementHour"><i class="fa fa-chevron-up"></i></a></td>
                                			<td class="separator">&nbsp;</td><td><a href="#" data-action="incrementMinute">
                                				<i class="fa fa-chevron-up"></i></a></td>
                                			</tr>
                                			<tr><td><input type="text" class="form-control bootstrap-timepicker-hour" maxlength="2"></td> 
                                			<td class="separator">:</td><td><input type="text" class="form-control bootstrap-timepicker-minute" maxlength="2"></td> </tr><tr><td><a href="#" data-action="decrementHour"><i class="fa fa-chevron-down"></i></a></td><td class="separator"></td><td><a href="#" data-action="decrementMinute"><i class="fa fa-chevron-down"></i></a></td></tr></tbody></table></div>
								<input type="text" title="시간" name="timepicker" readonly="readonly" class="input-timepicker" placeholder="h:mm">
                                <a href="javascript:void(0);" class="btn input-group-addon btn-color5 br">
                                	<i class="fa fa-clock-o"></i>
								</a>
                                </div>
                                </div>
								<span class="label-group ml10">
									<input name="chkbox" type="checkbox" onClick="checkDisable(this.form)">
                                	<input type="checkbox" title="기한없음" name="bm_end" value="0"><label>기한없음</label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th id="inchar_name" scope="row">
                            	<span class="text-point-b">*</span>담당자</th>
                            <th id="rec_name" scope="row" style="display:none;">
                            	<span >*</span>수신자
                            </th>
                            	
                            <td>
                                <div  class="input-group organization">
                                <div id="selectUser1_div" class="tagsinput">
                                	<input type="hidden" name="bm_end" value="">
									<input type="text" title="사용자" name="inchar_name" placeholder="사용자" style="box-shadow:none;">
                                 	<button type="button" class="btn input-group-addon btn-color5 br" onclick="openInchar()"><i class="icon man-plus">
                                 	<span class="none">사용자</span></i></button></div></div> 
     
                                
                            </td>
                        </tr>
                        
                        <tr id="worker2TR">
                            <th scope="row">참조자</th>
                            <td>
                                <div id="selectUser2" class="input-group organization"><div id="selectUser2_div" class="tagsinput">
                                <input type="text" title="사용자" id="selectUser2_input" placeholder="사용자" style="box-shadow:none;"></div>
                                <a href="#a" title="사용자" class="btn input-group-addon btn-color5 br">
                                <i class="icon man-plus"></i><span class="none">사용자</span></a></div>
                            </td>
                        </tr>
                        
                        <tr id="alarmTR">
                            <th scope="row">등록 알림</th>
                            <td>
                            <input type="hidden" name="bm_end" >
                                <input name="reg_notice" type="checkbox" title="쪽지 발송" value="2"> 쪽지 발송&nbsp;&nbsp;
                                <input name="reg_notice" type="checkbox" title="푸시 발송 " value="3"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr id="rAlarmTR">
                            <th scope="row">완료 알림</th>
                            <td>
                            <input type="hidden" name="cmp_notice" >
                                <input name="cmp_notice" type="checkbox" title="쪽지 발송" value="0"> 쪽지 발송&nbsp;&nbsp;
                                <input name="cmp_notice" type="checkbox" title="푸시 발송 " value="1"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr id="folderTR">
                            <th scope="row"><label for="bns_box">업무 보관함</label></th>
                            <td>
                            	<select name="folderId" id="bns_box" class="w400" style="">
                            	<c:forEach var="wdto" items="${monthsh}">
									<option value="${bmdto.getBns_box()}">${bmdto.getBns_box()}</option>               
                                </c:forEach>
                                </select>
                            </td>
                        </tr>
                      
                        <tr id="categoryTR3">
                            <th scope="row"><label for="related_bns">관련업무</label></th>
                            <td>
                                <button type="button" class="btn btn-color8 br" onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
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
					
						<textarea class="ckeditor" cols="1" id="bm_content" name="bm_content" rows="15"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('editor2')
                            
						</script>
						
					</div>
<div class="btn-wrap" ">
        <button type="submit" class="btn btn-color5 br" id="saveButton" >저장</button>
        <button type="button" class="btn2 btn-color7 br" onclick="javascript:location.href='/groupware/todo/listTodoView.do?searchConditionString=';">취소</button>
    </div>
</form>
</div>
</body>
</html>