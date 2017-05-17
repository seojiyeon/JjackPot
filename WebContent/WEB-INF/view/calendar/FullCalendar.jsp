<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>풀캘린더</title>
<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 1400px;
    }
    
.fc-day.fc-widget-content.fc-sat.fc-other-month.fc-past{background-color: #F2F2F2;}
.fc-day.fc-widget-content.fc-sat.fc-past{background-color: #F2F2F2;}
.fc-day.fc-widget-content.fc-sat.fc-future{background-color: #F2F2F2;}
    
.fc-day.fc-widget-content.fc-sun.fc-other-month.fc-past{background-color: #F2F2F2;}
.fc-day.fc-widget-content.fc-sun.fc-past{background-color: #F2F2F2;}
.fc-day.fc-widget-content.fc-sun.fc-future{background-color: #F2F2F2;}
    
.fc-day-top.fc-sat.fc-past { color:#0000FF; }
.fc-day-top.fc-sat.fc-future { color:#0000FF; }
.fc-day-top.fc-sun.fc-past { color:#E60012; } 
.fc-day-top.fc-sun.fc-future { color:#E60012; }  

.fc-day.fc-widget-content.fc-tue.fc-today.fc-state-highlight{background-color:#FFEDF7;}
</style>

<link href="css/fullcalendar.css" rel="stylesheet"/>
<link href="css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.js"></script>
<script type="text/javascript" src="js/locale-all.js"></script>
<script type="text/javascript">

jQuery(document).ready(function() {
	
    jQuery("#calendar").fullCalendar({
          aspectRatio: 1.7
        , locale: 'ko'
        , eventLimit : true
		, header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay,listMonth'
		}
        , defaultView: 'month'
        , editable : true
		
        ,minTime: "07:00:00"
        ,maxTime: "23:00:00"
        
        , navLinks: true // can click day/week names to navigate views
		, weekNumbers: true
		, weekNumbersWithinDays: true
		, weekNumberCalculation: '0'
        ,  
        events: function(start, end, timezone, callback) {          //DB에서 이벤트 불러오기
            $.ajax({
                url: '/JackPot/getfullcalendar.jp',
                type : 'post',
                data : { startDate : start.format(), endDate : end.format() },
                dataType: 'json',
                success: function(data) {
                   var events = [];
                   $(data).each(function() {
                        events.push({
                           title: $(this).attr('title'),
                            start: $(this).attr('start'),
                            end: $(this).attr('end'),
                            color: $(this).attr('color'),
                            id: $(this).attr('id'),
                            allDay: $(this).attr('allDay')
                        });
                    });
                    callback(events);
                },
                error : function(){
                   alert("error");
                }
            });
        }
        
    	,   eventDrop: function(event, delta, revertFunc) {
	
            alert(event.title + "를 " + event.start.format() + " 로 이동합니다");

            if (!confirm("수정하시겠습니까?")) {
                revertFunc();
            } 
        }
    
        ,   eventClick: function(event, element) {
			$.ajax({
				type :"post",
				url :"http://localhost:8080/JackPot/calendarcontents.jp",
				data : {id:event.id},
				success : function(contents){
					if(contents.cl_edate == null){
						$(".contents-date").html("<ul><li>"+contents.cl_sdate+" "+contents.cl_stime+"<li><ul>");
					}else{
					$(".contents-date").html("<ul><li>"+contents.cl_sdate+" "+contents.cl_stime+" ~ "+contents.cl_edate+" "+contents.cl_etime+"<li><ul>");}
					$(".contents-subject").html("<ul><li>["+contents.cl_title+"] "+contents.cl_subject+"<li><ul>");
					$(".contents-writer").html("<li><font color="+"#f05050 !important;"+">[등록자] </font>"+contents.cl_writer+"</li><li>"+"등록일 : "+contents.cl_sdate+"</li>"+"<br/>"+"<li style=padding-right:5px;><font color="+"#f05050 !important;"+">[참여자] </font></li><li>"+contents.cl_participants+"</li>");
					$(".contents-conts").html("<ul><li>"+contents.cl_contents+"<li><ul>");
					$(".contents-bt").html(
					"<li><a href=# onclick=updatebutton_click("+event.id+");>수정</a></li>"+
					"<li><a href=/JackPot/calendardelete.jp?id="+event.id+">삭제</a></li>");
					if(contents.cl_sys != null) {
						$(".contents-file").html("<ul><li><a href=/JackPot/calendarFiledown.jp?fileName="+contents.cl_sys+">"+contents.cl_org+"</a></li></ul>");
					}
				}, 
				error : function(){
					alert("error");
				}
				});
			layer_open('layer2');
        }
        
        ,	dayClick: function(date) {
        	var date = (moment(date).format('YYYY-MM-DD'));
        	document.getElementById("sdate").value=date;
        	layer_open('layer1');
        }
    });
});
</script>


<body>
<div id="calendar">
</div>
</body>


