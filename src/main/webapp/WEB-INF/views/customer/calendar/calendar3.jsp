<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2019-06-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2019-06-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2019-06-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2019-06-18',
          end: '2019-06-20'
        },
        {
          title: 'Party',
          start: '2019-06-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2019-06-11T10:00:00',
          end: '2019-06-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2019-06-13T10:00:00',
          end: '2019-06-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2019-06-24',
          end: '2019-06-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2019-06-06',
          end: '2019-06-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ],
    });

    calendar.render();
  });

</script>

<script>
	function click_add() {
	var url = "schedulePopup";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)
};

$(function() {
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		showMonthAfterYear : true,
		changeYear : true,
		changeMonth : true,          
       yearSuffix: "년",
      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']	
	});
	$("#startDate").datepicker();
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate', 'today');
	$("#endDate").datepicker('setDate', 'today');
});
</script>

<style>
.add-button {
    background: #2C3E50;
    border: 0;
    color: white;
    height: 35px;
    border-radius: 3px;
    width: 157px;
}
</style>
<body>
<div>
		<button class = "add-button" type = "button" 
        	onclick="click_add();">일정 추가</button>
</div>

<div id='calendar' style="position : relative; margin-top: 50px;">
</div>

</body>
</html>
