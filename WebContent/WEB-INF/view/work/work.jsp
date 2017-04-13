<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$(document).ready(function(){
			$("#work_on").click(function(){
				var result = confirm('출근처리하시겠습니까');
				window.location="/JackPot/work_on.jp";
			});
		});
		</script>
		
		<script>	
			$(document).ready(function(){
				$("#work_off").click(function(){
					var result = confirm('퇴근처리하시겠습니까');
					window.location="/JackPot/work_off.jp";
				});
			});

	</script>
	
  	<title>일일근태등록</title>
	
	<form method="post" name="work" >
	
    <table  width="600" border="1">
    	<tr>
    		<td>
				<input type="text" id="work_date" value=${date } onchange="test(this.value)">
    		</td>
    	</tr>
    </table>
    
 	<div class="subtitle">
		<h3>일일근태등록</h3>
    </div>
    <ul class="nav nav-tabs6 push" data-toggle="tabs">
       	<li class="active"><a href="#tabs-1"> 사원개인 </a></li>
    </ul>

	<div class="ins-box">
		<i class="fa fa-exclamation-circle"></i>&nbsp;퇴근시각 입력 후에는 반드시 근태확정 버튼을 누르시기 바랍니다.<br>
		<i class="fa fa-exclamation-circle"></i>&nbsp;근무시간,휴일,연장,야간,지각,조퇴시간이 계산되지 않는 경우 담당에게 문의하세요.<br>
	</div>
    <div class="date fleft mb5">
		<i class="fa fa-clock-o"></i><span id="clock"></span>
			<span>&nbsp;&nbsp;&nbsp;&nbsp; 접속IP : ${ip}</span>
	</div>

	<div class="btn-wrap">
   		<button type="button" id="work_on" class="btn btn-color7 br" style="display: inline-block;"> 출근 </button>
		<button type="button" id="work_off" class="btn btn-color7 br"> 퇴근 </button>
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
					
					
					
			<tr id="workday">		
				<c:if test="${wdto.work_on == null}">
							<th style="text-align:center;"><label>출근기록이 없습니다</label></th>
				</c:if>
			
				<c:if test="${wdto.work_on != null}">		
						<td name="emplMgntNo" style="text-align:center;">${wdto.emp_num}</td>
						<td style="text-align:center;height: 30px;"><label>${sys.format(wdto.work_on)}</label></td>
						<td style="text-align:center;">
						<c:if test="${wdto.work_off == null }"><label >00:00</label></c:if>
						<c:if test="${wdto.work_off != null }"><label >${sys.format(wdto.work_off)}</label></c:if></td>
						<td style="text-align:center;"><label >${wdto.work_time}</label></td>
						<td style="text-align:center;"><label >${wdto.h_work}</label></td>
						<td style="text-align:center;"><label >${wdto.workOut}</label></td>
						<td style="text-align:center;"><label>${wdto.lateNess}</label></td>
						<td style="text-align:center;"><label>${wdto.early}</label></td>
						<td id="onedayGolvwkMngPersForm_ip" style="text-align:center;"><label>${wdto.ip}</label></td>
					</c:if>
				</tr>

				</tbody>
			</table>
			
		</div>
	</div>
</div>
</form>