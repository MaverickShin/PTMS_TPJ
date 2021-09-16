<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

	
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawChart);
  google.charts.setOnLoadCallback(drawChart2);
  google.charts.setOnLoadCallback(drawChart3);

  function drawChart() {
	
	<%  
		int pet_price = (Integer)request.getAttribute("dtos");
	%>
		
    var data1 = google.visualization.arrayToDataTable([
      ['Month', '펫시터 매칭'],
      ['21.07', 50000],
      ['21.08', <%=pet_price%>]
    ]);
    
    var options = { chart:  { title: ' ',  }  };

    var Pet_chart = new google.charts.Bar(document.getElementById('pet_material'));
	
	Pet_chart.draw(data1, google.charts.Bar.convertOptions(options));
  }
  
 function drawChart2() {
	
	<%  
		int tra_price = (Integer)request.getAttribute("dtos2");
	%>
	
    
    var data2 = google.visualization.arrayToDataTable([
        ['Month', '훈련사 매칭'],
        ['21.07', 10000],
        ['21.08', <%=tra_price%>]
      ]);
    
    
    var options = { chart:  { title: ' ',  }  };

	var Tra_chart = new google.charts.Bar(document.getElementById('tra_material'));
	
	Tra_chart.draw(data2, google.charts.Bar.convertOptions(options));
  }
 
 function drawChart3() {
	
	<%  
		int gdo_price = (Integer)request.getAttribute("dtos3");
	%>
		   
    var data3 = google.visualization.arrayToDataTable([
        ['Month', '전체 구독'],
        ['21.07', 7777],
        ['21.08', <%=gdo_price%>]
      ]);
    var options = { chart:  { title: ' ',  }  };

	var gdo_chart = new google.charts.Bar(document.getElementById('gdo_material'));
	
	gdo_chart.draw(data3, google.charts.Bar.convertOptions(options));
  }
</script>

</head>
<body>
<%@ include file = "../header.jsp" %>

	<section class="lr_nav" style = "width:800px; margin-left:auto; margin-right:auto;">
		<div class="left_nav">
			<b> 관리자 결산 페이지</b>
			<br><br>
		</div>
		
		<div class="right_nav">
			<b> 펫시터 요금 결산 </b>
			<table>
				<tr>
					<th>
						<div id="pet_material" style="width: 800px; height: 200px;"></div>
					</th>
				</tr>
			</table>
			
			<b> 훈련사 요금 결산 </b>
			<table>
				<tr>
					<th>
						<div id="tra_material" style="width: 800px; height: 200px;"></div>
					</th>
				</tr>
			</table>
			
			<b> 구독 요금 결산 </b>
			<table>
				<tr>
					<th>
						<div id="gdo_material" style="width: 350px; height: 200px;"></div>
					</th>
				</tr>
			</table>
			
		</div>
		
	</section>
	
<%@ include file = "../footer.jsp" %>	
</body>
</html>