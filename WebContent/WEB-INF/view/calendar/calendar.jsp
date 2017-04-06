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
        max-width : 900px;
        margin : 0 auto;
    }
</style>
<c:forEach var="cdto" items="${cl_list}">
	${cdto.cl_title}
</c:forEach>
<link href="css/fullcalendar.css" rel="stylesheet"/>
<link href="css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.js"></script>
<script type="text/javascript" src="js/locale-all.js"></script>
<script type="text/javascript">

jQuery(document).ready(function() {
	
    jQuery("#calendar").fullCalendar({
          defaultDate : "2017-03-23"
        , locale: 'ko'
        , eventLimit : true
		, header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		}
        , defaultView: 'agendaWeek'
        , editable : true
		
        , navLinks: true // can click day/week names to navigate views
		, weekNumbers: true
		, weekNumbersWithinDays: true
		, weekNumberCalculation: 'ISO'
  
        ,  
       		function(doc){
			var events = [];
        $(doc).find('event').each(function(){
        	events.push({
        		title: $(this).attr('점심'),
        		start: $(this).attr('2017-03-23')
        	});
        });
        callback(events);
		}
    	,   eventDrop: function(event, delta, revertFunc) {
	
            alert(event.title + "를 " + event.start.format() + " 로 이동합니다");

            if (!confirm("수정하시겠습니까?")) {
                revertFunc();
            } 
        }
    
        ,   eventClick: function(event, element) { // 이벤트 제목 클릭
			window.open("http://localhost:8080/JackPot/calendarcontents.jp",'contents','top=200px,left=500px,height=550px,width=430px')
        }
        
        ,	dayClick: function() { // 일 클릭
        	window.open("http://localhost:8080/JackPot/calendarinsert.jp",'insert','top=200px,left=500px,height=550px,width=430px ')
		}
    });
});
</script>


<body>
<div id="calendar">
</div>
</body>

