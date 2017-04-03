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


<head>

	<script type="text/javascript">
	

    	   $(function() {
        	      $( "#work_date").datepicker({
        	    	    showOn: "both", 
                        buttonImage:"/JackPot/images/calender.png",
                        buttonImageOnly: true ,
                        buttonImageSize : "vertical-align: middle; margin: 10px 235px 0px 0px",
        	    	 	dateFormat:'yy/mm/dd', 
						showButtonPanel: true,
						changeMonth: true, 
						changeYear: true,
						nextText: '다음 달',
						prevText: '이전 달',
						currentText:'오늘 날짜',
						changeMonth: true, 
						dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
						monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					});
        	      });
       
           
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
	
	

	
	<form method="post" name="work" >
  	<title>일일근태등록</title>
    <table  width="600" border="1">
    	<tr>
    		<td>*근무일자 
    			<input type="text" id="work_date" name="schdate"  style="width:100px;height:25px; margin: 10px 0px 0px 0px;" value="<fmt:formatDate value="${now}" type="both" pattern="yyyyMMdd"/>"/>
    			<!-- <img src="/images/calender.png" width="20" height="20" onclick="fnPopUpCalendar(startDate,startDate,'yyyymmdd');" style="vertical-align: middle; margin: 10px 235px 0px 0px;"> -->
    		
    		
    		</td>
    	</tr>
    </table>
   
	일일근태등록
    	
	<table width="700" border="1">
		<tr>
			<td>
				퇴근시각 입력 후에는 반드시 근태 확정 버튼을 누르시기 바랍니다.<br/>
				근무시간, 휴일, 연장, 야간, 지각, 조퇴시간이 계산되지 않는 경우 담당에게 문의하세요.
			</td>
		</tr>
	</table>
    
	접속IP : ${ip}<br/>
	
	<table width="800" align="center">
		<tr>
			<td align="right">
				<input type= "button" id="work_on" value="출근" >
				<input type= "button" id="work_off" value="퇴근">
			</td>
		</tr>		
	</table>
	
	<table width="800" align="center" >
		<tr>
			<td width="800" align="center" colspan="11">
				<hr style="border: solid 0.5px rightgray;"></td>
		</tr>
		
		<tr>
			<td width="10" align="center">사원번호</td>
			<td width="10"align="center">출근시간</td>
			<td width="10"align="center">퇴근시간</td>
			<td width="10"align="center">근무시간</td>
			<td width="10"align="center">휴일근로</td>
			<td width="10"align="center">연장근로</td>
			<td width="10"align="center">지각시간</td>
			<td width="10"align="center">조퇴시간</td>
			<td width="10"align="center">PC IP</td>
		</tr>
			
		<tr>
			<td width="800" align="center" colspan="11">
				<hr style="border: solid 0.5px rightgray;"></td>
		</tr>
	</table>
			<c:forEach var="i" items="${item}">
			<table width="800" align="center" >
				<tr>
					<td width="10" align="center">${i.emp_num}</td>
					<td width="10"align="center">${sys.format(i.work_on)}</td>
					<td width="10"align="center">${sys.format(i.work_off)}</td>
					<td width="10"align="center">
					${i.work_time}</td>
					<td width="10"align="center">${i.h_work}</td>
					<td width="10"align="center">${i.workOut}</td>
					<td width="10"align="center">${i.lateNess}</td>
					<td width="10"align="center">${i.early}</td>
					<td width="10"align="center">${i.ip}</td>
				</tr>
			
			
				<tr>
					<td width="800" align="center" colspan="11">
						<hr style="border: solid 0.5px rightgray;"></td>
				</tr>
			</table>
			</c:forEach>
</form>