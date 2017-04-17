<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
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
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=4" type="text/css" />   
<script src="resource/ckeditor.js"></script>
<html>
<head>



   <script type="text/javascript">
		CKEDITOR.replace('editor',
			{
				width : '700px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
				height : '200px',  // 입력창의 높이
                startupFocus : false
			}
        );
   </script>
<title> 업무관리</title>
</head>    
 <body>

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
							   		<li style="text-align:center;"><a href="/JackPot/.jp">나의 할일 </a></li>
							   		<li><hr color=" lightgrey " size="1"></li>
							   	</ul>
						</li>
							  
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/.jp">내가 한 업무</a> </li>
								      <li><a href="/JackPot/.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/.jp">참조  업무 요청</a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/jp">내가 한 보고 </a> </li>
								      <li><a href="/JackPot/.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/.jp">참조  업무 보고 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li >
							<a style="display:inline-block;height:20px;">업무일지  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/.jp">내가 작성한 업무 일지  </a> </li>
								      <li><a href="/JackPot/.jp">수신  업무 일지  </a></li>
								      <li><a href="/JackPot/.jp">참조  업무 일지 </a></li>
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
			
				
<div id="main-contents">
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
								<input type="text" title="시작날짜" id="dueDateCalendar" name="bm_start" value="${date}" readonly="readonly" class="input-datepicker w100" data-date-format="yyyy.mm.dd" placeholder="yyyy.mm.dd">
                                <button type="button" id="dueDateCalendarBtn" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
                                <div class="timepicker-wrap blind">
                                <div class="input-group bootstrap-timepicker"><div class="bootstrap-timepicker-widget dropdown-menu">
                                </div></div></div>
                                
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
                        <tr id="workerTR">
                            <th id="inchar_name" scope="row">
                            	<span class="text-point-b">*</span>담당자</th>
                            <th id="rec_name" scope="row" style="display:none;">
                            	<span >*</span>수신자</th>
                            <td>
                                <div id="selectUser1" class="input-group organization">
                                <div id="selectUser1_div" class="tagsinput">
                                	<input type="text" title="사용자" id="selectUser1_input" placeholder="사용자" style="box-shadow:none;">
                                </div>
                                   	<a href="#a" title="사용자" class="btn input-group-addon btn-color5 br"><i class="icon man-plus"></i>
                                		<span class="none">사용자</span>
                                	</a>
                                </div>
                            </td>
                        </tr>
                        <tr id="worker2TR">
                            <th scope="row">참조자</th>
                            <td>
                                <div id="selectUser2" class="input-group organization"><div id="selectUser2_div" class="tagsinput"><input type="text" title="사용자" id="selectUser2_input" placeholder="사용자" style="box-shadow:none;"></div><a href="#a" title="사용자" class="btn input-group-addon btn-color5 br"><i class="icon man-plus"></i><span class="none">사용자</span></a></div>
                            </td>
                        </tr>
                        <tr id="alarmTR">
                            <th scope="row">등록 알림</th>
                            <td>
                                <input name="reg_notice" type="checkbox" title="쪽지 발송" value="2"> 쪽지 발송&nbsp;&nbsp;
                                <input name="reg_notice" type="checkbox" title="푸시 발송 " value="3"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr id="rAlarmTR">
                            <th scope="row">완료 알림</th>
                            <td>
                                <input name="cmp_notice" type="checkbox" title="쪽지 발송" value="0"> 쪽지 발송&nbsp;&nbsp;
                                <input name="cmp_notice" type="checkbox" title="푸시 발송 " value="0"> 푸시 발송 &nbsp;&nbsp;
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
                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
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
							CKEDITOR.replace('editor')
                            );
						</script>
						
					</div>
<div class="btn-wrap" style="width: 90%;">
        <button type="button" class="btn btn-color5 br" id="saveButton">저장</button>
        <button type="button" class="btn2 btn-color7 br" onclick="javascript:location.href='/groupware/todo/listTodoView.do?searchConditionString=';">취소</button>
    </div>
</div>

</body>
</html>