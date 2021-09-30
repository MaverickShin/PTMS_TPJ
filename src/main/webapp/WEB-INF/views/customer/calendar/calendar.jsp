<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "ptms.mvc.tpj.CustVO.CalendarVO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%
	List<CalendarVO> list = (ArrayList<CalendarVO>)request.getAttribute("vo");
%>

<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js"></script>
<script src = "https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function(){
	
	// calendar element 취득
	var calendarEl = $('#calendar')[0];
	// full-calendar 생성하기
	var calendar = new FullCalendar.Calendar(calendarEl, {
	height: '700px', // calendar 높이 설정
	expandRows: true, // 화면에 맞게 높이 재설정
	timeZone: 'local',
	// 해더에 표시할 툴바
	headerToolbar: {
	left: 'prev,next today',
	center: 'title',
	right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	},
	locale : 'ko',
	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	editable: true, // 수정 가능?
	selectable: true, // 달력 일자 드래그 설정가능
	nowIndicator: true, // 현재 시간 마크
	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	console.log(obj);
	},
	eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	console.log(obj);
	},
	eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	console.log(obj);
	},
	select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	var title = prompt('일정 이름 :');
	if (title) {
		
		var startYear = arg.start.getFullYear();
		var startMonth = arg.start.getMonth()+1;
		var startDate = arg.start.getDate();
		var endYear = arg.end.getFullYear();
		var endMonth = arg.end.getMonth()+1;
		var endDate = arg.end.getDate();
		
		var startSum = startYear+"/"+startMonth+"/"+startDate;
		var endSum = endYear+"/"+endMonth+"/"+endDate;

		console.log(startSum);
		console.log(endSum);
		
		$.ajax({
			type:"get",
	       	url:"/tpj/sch/createCalendar",
	       	data: {"title" : title, "start" : startSum, "end" : endSum, "back" : "#007bff", "border" : "#007bff"},
	       	success: function(result) {
	       		$("#calendar").html(result);
	       	},
	       	error : function(request, status, error) {
	       		console.log("실패!");
	       		alert(error);
	       	}
		});
		
	}
	calendar.unselect()
	},
	eventDrop: function(arg) {
		if(confirm('일정을 수정 하시겠습니까?')) {
			
			var id = arg.event.id;
			var title = arg.event.title;
			var startYear = arg.event.start.getFullYear();
			var startMonth = arg.event.start.getMonth()+1;
			var startDate = arg.event.start.getDate();
			var endYear = arg.event.end.getFullYear();
			var endMonth = arg.event.end.getMonth()+1;
			var endDate = arg.event.end.getDate();
			
			var startSum = startYear+"/"+startMonth+"/"+startDate;
			var endSum = endYear+"/"+endMonth+"/"+endDate;
			
			var back = arg.event.backgroundColor;
			var text = arg.event.textColor;
			var border = arg.event.borderColor;
			
			console.log(startSum);
			console.log(endSum);
			console.log(back);
			console.log(text);
			console.log(border);
			
			$.ajax({
				type:"get",
		       	url:"/tpj/sch/updateCalendar",
		       	data: {"cl_cd" : id, "title": title,"start" : startSum, "end" : endSum, "back" : back, "text" : text, "border" : border},
		       	success: function(result) {
		       		$("#calendar").html(result);
		       	},
		       	error : function(request, status, error) {
		       		console.log("실패!");
		       		alert(error);
		       	}
			}); 
			
		} else {
			arg.revert();
		}
	},
	eventResize: function(arg) {
		if(confirm('일정을 수정 하시겠습니까?')) {
			
			var id = arg.event.id;
			var title = arg.event.title;
			var startYear = arg.event.start.getFullYear();
			var startMonth = arg.event.start.getMonth()+1;
			var startDate = arg.event.start.getDate();
			var endYear = arg.event.end.getFullYear();
			var endMonth = arg.event.end.getMonth()+1;
			var endDate = arg.event.end.getDate();
			
			var startSum = startYear+"/"+startMonth+"/"+startDate;
			var endSum = endYear+"/"+endMonth+"/"+endDate;
			
			var back = arg.event.backgroundColor;
			var text = arg.event.textColor;
			var border = arg.event.borderColor;
			
			console.log(startSum);
			console.log(endSum);
			console.log(back);
			console.log(text);
			console.log(border);
			
			$.ajax({
				type:"get",
		       	url:"/tpj/sch/updateCalendar",
		       	data: {"cl_cd" : id, "title" : title, "start" : startSum, "end" : endSum, "back" : back, "text" : text, "border" : border},
		       	success: function(result) {
		       		$("#calendar").html(result);
		       	},
		       	error : function(request, status, error) {
		       		console.log("실패!");
		       		alert(error);
		       	}
			}); 
			
		}
	},
	eventClick: function(arg) {
        if (confirm('일정을 삭제 하시겠습니까?')) {
          
          var id = arg.event.id;
        	
       	  $.ajax({
	       	  type:"get",
	       	  url:"/tpj/sch/removeCalendar",
	       	  data: {"cl_cd" : id},
	       	  success: function(result) {
	       			$("#calendar").html(result);
	       	  },
	       	  error : function(request, status, error) {
	       		  alert(error);
	       	  }
          });
        }
    },
	// 이벤트
	events: [
<% 
	  	  for (int i = 0; i < list.size(); i++) {
	  		CalendarVO dto = (CalendarVO)list.get(i);
%>	
	  	  {
	  		id : '<%= dto.getCL_CD()%>',
	  	   	title : '<%= dto.getCL_TITLE() %>',
	  	   	start : '<%= dto.getSTART_TM() %>',
	  	   	end : '<%= dto.getEND_TM() %>',
	  	   	backgroundColor : '<%= dto.getCL_BACKCOL() %>',
	  	   	textColor : '<%= dto.getCL_COLOR() %>',
	  	   	borderColor : '<%= dto.getCL_BORDER() %>'
	  	   },
<%
	}
%>
	]
	});
	// 캘린더 랜더링
	calendar.render();
	});


</script>

<script>
function click_add(e) {
	var name = "schedulePopup";
	var val = e;
	var option = "width = 600, height = 700 left = 100, top=50,location=no";
	var url = "/tpj/sch/schedulePopup?val="+val;
	window.open(url,name,option);
	
};
</script>

<script>
	$(function(){ // document ready
	   if ($('#external-events').length) { // make sure ".list_div1" element exists
	      var el = $('#external-events');
	      var stickyTop = $('#external-events').offset().top; // returns number
	      var stickyHeight = $('#external-events').height();

	      $(window).scroll(function(){ // scroll event
	          var limit = $('footer').offset().top - stickyHeight - 90;

	          var windowTop = $(window).scrollTop(); // returns number

	          if (stickyTop < windowTop){
	             el.css({ position: 'fixed', top: 80 });
	          }
	          else {
	             el.css('position','absolute');
	             el.css("top", "50px");
	          }

	          if (limit < windowTop) {
	          	var diff = limit - windowTop;
	          	el.css({top: diff});
	          }
	        });
	   }
	});
</script>

<style>
/* 드래그 박스의 스타일 */
.list_nav2 {
	position:relative;
}

#external-events {
	position: absolute;
	left: 40px; /* //화면 왼쪽에 위치한다. right로 변경가능 */
	top: 50px;
	width: 150px;
	padding: 0 10px;
	border-collapse: collapse;
  	border-radius: 20px;
  	border-style: hidden;
  	box-shadow: 0 0 0 3px #2C3E50;
	background: #2C3E50;
	text-align: left;
	font-family: 'Do Hyeon', sans-serif;
}
#external-events h2 {
	font-size: 20px;
	margin-top: 0;
	padding-top: 1em;
	color:white;
}
#external-events .fc-event {
	margin: 3px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}
#external-events p input {
	margin: 0;
	vertical-align: middle;
}
#calendar1 {
	max-width: 1100px;
	margin: 0 auto;
}

.fc-event-main {
	text-align:center;
	font-size: 16px;
	font-family: 'Do Hyeon', sans-serif;
}

.fc-col-header-cell {
	width: 150px;
}

#external-events-list {
	margin-bottom: 15px;
}
</style>
<body>
<%@ include file = "../../main/header.jsp" %>

<section class="hero-wrap hero-wrap-2"
		data-stellar-background-ratio="0.5" style = "height: 200px !important; font-family: 'Do Hyeon', sans-serif;">
		<div class="overlay"></div>
		<div class="container">
			<div class="col-md-9 ftco-animate pb-5" style = "line-height: 200px;">
				<h1 class="mb-0 bread" style = "color: white; line-height: 200px;">내 일정 관리</h1>
			</div>
		</div>
	</section>

<div style="display: flex; flex:1;">
		
		<div class = "list_nav2" style="width: 200px; padding: 100px; min-height:700px">
			<!-- 드래그 박스 -->
			<div id='external-events'>
				<h2>일정을 골라주세요</h2>
				<div id='external-events-list'>
					<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' id = "hair" style = "border:none; background-color:#2C3E50;" onclick = "click_add('미용');">
						<div class='fc-event-main' style = "background-color:#f06292; border-radius: 20px; border-style: hidden; box-shadow: 0 0 0 3px #2C3E50;">미용
						</div>
					</div>
				</div>
				<div id='external-events-list'>
					<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' id = "walk" style = "border:none; background-color:#2C3E50;" onclick = "click_add('산책');">
						<div class='fc-event-main' style = "background-color:#81c784; border-radius: 20px; border-style: hidden; box-shadow: 0 0 0 3px #2C3E50;">산책</div>
					</div>
				</div>
				<div id='external-events-list'>
					<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' id = "hospital" style = "border:none; background-color:#2C3E50;" onclick = "click_add('병원');">
						<div class='fc-event-main' style = "background-color:#ff7043;border-radius: 20px; border-style: hidden; box-shadow: 0 0 0 3px #2C3E50;">병원</div>
					</div>
				</div>
				<div id='external-events-list'>
					<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' id = "training" style = "border:none; background-color:#2C3E50;"  onclick = "click_add('훈련');">
						<div class='fc-event-main' style = "background-color:#ab47bc; border-radius: 20px; border-style: hidden; box-shadow: 0 0 0 3px #2C3E50;">훈련</div>
					</div>
				</div>
				<div id='external-events-list'>
					<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' id = "sitter"  style = "border:none; background-color:#2C3E50;" onclick = "click_add('시터에게 맡기는 날');">
						<div class='fc-event-main'style = "background-color:#26c6da; border-radius: 20px; border-style: hidden; box-shadow: 0 0 0 3px #2C3E50;">시터에게 맡기는 날</div>
					</div>
				</div>
			</div>
		</div>
		
		<section style="width: 100%; margin-right: auto; margin-top: 30px; flex:1; margin-bottom: 100px;" class = "sections2">
		
			<!-- calendar 태그 -->
			<div id='calendar-wrap' style = "margin-left: 50px !important; margin-right: 100px !important;" ">
				<div id='calendar-container'>
					<div id='calendar'></div>
				</div>
			</div>
			
			
		</section>
</div>

<%@ include file = "../../main/footer.jsp" %>
</body>
</html>
