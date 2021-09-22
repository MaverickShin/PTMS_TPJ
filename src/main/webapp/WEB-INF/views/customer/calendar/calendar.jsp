<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${cssPath}calendar.css' rel='stylesheet' />
<script src='${jsPath}calendar.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale : 'ko',
      themeSystem : 'cerulean',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정 제목:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function (start, end, timezone, callback) {
   	    $.ajax({
   	      type: "get",
   	      url: "http://localhost:8080/tpj/webapp/WEB-INF/views/customer/calendar/data.json",
   	      data: {
   	        // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
   	        //startDate : moment(start).format('YYYY-MM-DD'),
   	        //endDate   : moment(end).format('YYYY-MM-DD')
   	      },
   	      success: function (response) {
   	        var fixedDate = response.map(function (array) {
   	          if (array.allDay && array.start !== array.end) {
   	            array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
   	          }
   	          return array;
   	        });
   	        callback(fixedDate);
   	      }
   	    });
   	  },
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 60%;
    margin: 1% auto;
  }

</style>
</head>
<body>

<%@ include file="../../main/header.jsp" %>
   	<div style="width:100%;height:150">
   		<table border="1" align="center" style = "margin-top:75px" width="800px">
   			<tr>
   				<td align="center" height="50px">핫 이슈 정보</td>
   			</tr>
   		</table>	
   	</div>
   	
	<div id='calendar' style = "margin-bottom:50px;"></div>
<%@ include file="../../main/footer.jsp" %>   
</body>
</html>
