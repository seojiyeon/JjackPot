<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="jquery-3.1.1.min.js"></script> 
	<script type="text/javascript" src="/js/calendar.js"></script>
    <!--  jQuery UI CSS파일 --> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- // jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- // jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
	<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
<head>


	<form method="post" name="workA" >
	
	
  	<title>나의 근태관리</title>

    
 	<div class="subtitle">
		<h3>나의 근태관리</h3>
    </div>
    <ul class="nav nav-tabs6 push" data-toggle="tabs">
       	<li class="active"><a href="#tabs-1"> 사원개인 </a></li>
    </ul>

	<div class="ins-box">
		<i class="fa fa-exclamation-circle"></i>&nbsp;퇴근시각 입력 후에는 반드시 근태확정 버튼을 누르시기 바랍니다.<br>
		<i class="fa fa-exclamation-circle"></i>&nbsp;근무시간,휴일,연장,야간,지각,조퇴시간이 계산되지 않는 경우 담당에게 문의하세요.<br>
	</div>



	
	<div class="tab-content">
		<div id="tabs-1" class="tab-pane active">
			<div class="content-write mb10">
				<table class="table border-top separate">
					<colgroup>
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="80">
						<col width="80">
		 				<col width="80">
						<col width="80">
						<col width="110">
					</colgroup>
					
				<tbody>
					<tr>
						<th style="text-align:center;"><label>사원번호</label></th>
						<th style="text-align:center;"><label for="onedayGolvwkMngPersForm_onedayGolvwkMngPersForm_work_on">
						<span class="text-point-b" title="필수입력항목">*</span>출근시각</label>
						</th>
						<th style="text-align:center;"><label for="onedayGolvwkMngPersForm_work_off">퇴근시각</label>
						</th>
						<th style="text-align:center;"><label>근무시간</label></th>
						<th style="text-align:center;"><label>휴일근로</label></th>
						<th style="text-align:center;"><label>연장근로</label></th>
						<th style="text-align:center;"><label>지각시간</label></th>
						<th style="text-align:center;"><label>조퇴시간</label></th>
						<th style="text-align:center;width: 100px;">
						<label for="onedayGolvwkMngPersForm_clientIP">PC IP</label></th>
					</tr>
					
					<tr >										
						<td name="emplMgntNo" style="text-align:center;">${wdto.emp_num}</td>
						<td style="text-align:center;height: 30px;"><label id="onedayGolvwkMngPersForm_work_on" id="work_on">${sys.format(wdto.work_on)}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_work_off" id="work_off">${sys.format(wdto.work_off)}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_work_time" id="work_time">${wdto.work_time}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_h_work" id="h_work">${wdto.h_work}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_workOut" id="workOut">${wdto.workOut}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_lateNess" id="lateNess">${wdto.lateNess}</label></td>
						<td style="text-align:center;"><label id="onedayGolvwkMngPersForm_early" id="early">${wdto.early}</label></td>
						<td id="onedayGolvwkMngPersForm_ip" style="text-align:center;"><label id="ip">${wdto.ip}</label></td>
					</tr>
			
				
				</tbody>
			</table>
			
		</div>
	</div>
</div>
</form>