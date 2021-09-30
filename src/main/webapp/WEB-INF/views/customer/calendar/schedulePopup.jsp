<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	var name = '<c:out value = "${val}"/>';
	
	if(name === "미용") {
		$("#subject").val("미용").prop("selected", true);
	} else if(name === "산책") {
		$("#subject").val("산책").prop("selected", true);
	} else if(name === "병원") {
		$("#subject").val("병원").prop("selected", true);
	} else if(name === "훈련") {
		$("#subject").val("훈련").prop("selected", true);
	} else if(name === "시터에게 맡기는 날") {
		$("#subject").val("시터에게 맡기는 날").prop("selected", true);
	}
	
});

$(function() {
	$.datepicker.setDefaults({
		dateFormat : 'yy/mm/dd',
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

function click_ok(){

	var val = $("#subject option:selected").val();
	var start = $("#startDate").val();
	var end = $("#endDate").val();
	var memo = $("#memo").val();
	
	var back = "";
	var border = "";
	
	if(val === "미용") {
		back = "#f06292";
		border = "#f06292";
	} else if(val === "산책") {
		back = "#81c784";
		border = "#81c784";
	} else if(val === "병원") {
		back = "#ff7043";
		border = "#ff7043";
	} else if(val === "훈련") {
		back = "#ab47bc";
		border = "#ab47bc";
	} else if(val === "시터에게 맡기는 날") {
		back = "#26c6da";
		border = "#26c6da";
	}
	
	var url = "/tpj/sch/createCalendar?title="+val+"&start="+start+"&end="+end+"&memo="+memo+"&back="+back+"&border="+border;
	
	console.log(url);
	
	window.location = url;
	opener.parent.location.reload();
	window.close();
};
</script>
<style>
	#popupGroup {
		width: 400px;
		margin-left:auto;
		margin-right:auto;
		margin-top:20px;
		padding: 20px;
		border-collapse: collapse;
  		border-radius: 20px;
  		border-style: hidden;
  		box-shadow: 0 0 0 3px #2C3E50;
  		font-family: 'Do Hyeon', sans-serif;
	}
	
	.btn-primary {
		font-size: 20px;
	}
</style>
</head>
<body>
<div class = "group row" id = "popupGroup">	
	<div class = "group-head" style = "padding-left: 15px; padding-right:15px;">
		<h1 class = "zTree-h1" style = "color:#00bd56"> 일정 추가 </h1>
	</div>
	<div class = "group-body col-md-12">
		<div class = "top form-group">
			<select class = "subject form-control" id = "subject"  name = "subject">
				<option value = "미용">미용
				<option value = "산책">산책
				<option value = "병원">병원
				<option value = "훈련">훈련
				<option value = "시터에게 맡기는 날">시터에게 맡기는 날
			</select>
		</div>
		<div class = "domain form-group">
			<h3 class = "zTree-h3" style = "color:#00bd56"> 시작 </h3>
		</div>
		<div class = "domain form-group">
			<input class = "date form-control" id = "startDate" type = "text" name = "startDate" id = "startDate" readonly>
		</div>
		<div class = "domain form-group">
			<h3 class = "zTree-h3" style = "color:#00bd56"> 종료 </h3>
		</div>
		<div class = "domain form-group">
			<input class = "date form-control" id = "endDate" type = "text" name = "endDate" id = "endDate" readonly>
		</div>
		<div class = "domain form-group">
			<h3 class = "zTree-h3" style = "color:#00bd56"> 메모 </h3>
		</div>
		<div class = "domain form-group">
			<textarea class = "memo form-control" id = "memo" name = "memo" rows = "5" cols = "20" placeholder="100글자까지 입력 가능합니다"></textarea> 
		</div>
		
		<div style = "text-align:center">
			<button class = "ok-button btn btn-primary" type= "button" onclick="click_ok();" style = "margin-right: 20px;">확인</button>
			<button class = "cancle-button btn btn-primary" type= "button" onclick="window.close();">닫기</button>
		</div>
	</div>	
</div>
</body>
</html>