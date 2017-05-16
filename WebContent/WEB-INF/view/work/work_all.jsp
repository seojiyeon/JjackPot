<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  jQuery UI CSS파일 --> 
    <link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
	<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
	
<!-- // jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<head>


<script type="text/javascript">

	$(document).ready(function () {
    	$.datepicker.regional['ko'] = {
        	closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
    	    currentText: '오늘',
        	monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
    	    monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
    	    dayNames: ['일','월','화','수','목','금','토'],
        	dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
    	    weekHeader: 'Wk',
        	dateFormat: 'yy-mm-dd',
	        firstDay: 0,
    	    isRTL: false,
        	showMonthAfterYear: true,
	        yearSuffix: '',
    	    showOn: 'both',
        	buttonText: "달력",
	        changeMonth: true,
    	    changeYear: true,
        	showButtonPanel: true,
        	yearRange: 'c-99:c+99',
    	};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
 
 	   var datepicker_default = {
    	    showOn: 'both',
        	buttonText: "달력",
	        currentText: "이번달",
    	    changeMonth: true,
        	changeYear: true,
	        showButtonPanel: true,
    	    yearRange: 'c-99:c+99',
        	showOtherMonths: true,
	        selectOtherMonths: true
	    }
 
    datepicker_default.closeText = "선택";
    datepicker_default.dateFormat = "yy-mm";
    datepicker_default.onClose = function (dateText, inst) {
        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
        $(this).datepicker('setDate', new Date(year, month, 1));
        
        var test = year+"-0"+(parseInt(month)+1)+"-01";
        $.ajax({
	  	        type: "post",
	  	        url : "/JackPot/workMonth.jp",
	  	        data : {day : test},
	  	        success: function(data){
	  	        	$("#workMonth").html(data);
	  	        }	
	   });
    }
 
    datepicker_default.beforeShow = function () {
        var selectDate = $("#work_date").val().split("-");
        var year = Number(selectDate[0]);
        var month = Number(selectDate[1]) - 1;
        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
        
    }

    $("#work_date").datepicker(datepicker_default);

}); 
	
</script>



<style type="text/css">
table.ui-datepicker-calendar { display:none; }
</style>

	<form method="post" name="workAll" >
	
	
  	<title>나의 근태관리</title>

    
 	<div class="subtitle">
		<h3>나의 근태관리</h3>
    </div>

		<table  width="600" border="0"> 
    	<tr>
    		<td>
				<input type="text" id="work_date" value=${date} onchange="ttt()" />
   		</td>
    	</tr>
    </table>

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
						<th style="text-align:center;"><label>날짜</label></th>
						<th style="text-align:center;"><label>사원번호</label></th>
						<th  style="text-align:center;"><label>
						<span class="text-point-b" title="필수입력항목">*</span>출근시각</label>
						</th>
						<th style="text-align:center;"><label >퇴근시각</label>
						</th>
						<th  style="text-align:center;"><label>근무시간</label></th>
						<th style="text-align:center;"><label>휴일근로</label></th>
						<th style="text-align:center;"><label>연장근로</label></th>
						<th  style="text-align:center;"><label>지각시간</label></th>
						<th  style="text-align:center;"><label>조퇴시간</label></th>
						<th  style="text-align:center;width: 100px;">
						<label for="onedayGolvwkMngPersForm_clientIP">PC IP</label></th>
					</tr>

						<tr id="workMonth" >
							<c:if test="${count == 0 }">
								<th style="text-align:center;"><label>출근기록이 없습니다</label></th>
							</c:if>
					
						<tr id="workMonth" >
							<c:if test="${count > 0 }">			
							<c:forEach var="wdto" items="${monthsh}" >	
								
								<td style="text-align:center;height: 30px;"><label >${month.format(wdto.work_on)}</label></td>								
								<td  style="text-align:center;">${wdto.emp_num}</td>
								<td  style="text-align:center;height: 30px;"><label>${sys.format(wdto.work_on)}</label></td>
								<td  style="text-align:center;"><label>${sys.format(wdto.work_off)}</label></td>
								<td style="text-align:center;"><label >${wdto.work_time}</label></td>
								<td style="text-align:center;"><label >${wdto.h_work}</label></td>
								<td style="text-align:center;"><label >${wdto.workOut}</label></td>
								<td style="text-align:center;"><label >${wdto.lateNess}</label></td>
								<td style="text-align:center;"><label >${wdto.early}</label></td>
								<td style="text-align:center;"><label >${wdto.ip}</label></td>
					
						</c:forEach>
						</c:if>
					</tr>
					

				</tbody>
			</table>
			
		</div>
	</div>
</div>
</form>