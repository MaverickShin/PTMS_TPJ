<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.list_tab {
		display: flex;
		align-items: center;
	}
	
	.list_tab p {
		display: block;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		width: 200px;
		height: 60px;
		line-height: 60px;
		background-color: #f5f5f5;
		border: 1px solid #eeeeee;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../main/header.jsp"%>
	
	   <div class = "list_tab">
			<p id = "left_button" style = "background-color: #1e88e5; color:white;">배송관련</p>
			<p id = "center_button" onclick = "cancles();">취소/환불관련</p>
			<p id = "right_button" onclick = "pays();">주문/결제관련</p>
		</div>
	
	<section class="ftco-appointment ftco-section ftco-no-pt ftco-no-pb img" style="background-image: url(images/bg_3.jpg);">
				<div class="overlay"></div>
	    	<div class="container">
	    		<div class="row d-md-flex justify-content-end">
	    			<div class="col-md-12 col-lg-6 half p-3 py-5 pl-lg-5 ftco-animate">
	    				<h2 class="mb-4">나에게 온 의뢰</h2>
	    				<form action="#" class="appointment">
	    					<div class="row">
	    						<div class="col-md-12">
										<div class="form-group">
				    					<div class="form-field">
		          					<div class="select-wrap">
		                      <div class="icon"><span class="fa fa-chevron-down"></span></div>
		                      <select name="" id="" class="form-control">
		                      	<option value="">Select services</option>
		                        <option value="">Cat Sitting</option>
		                        <option value="">Dog Walk</option>
		                        <option value="">Pet Spa</option>
		                        <option value="">Pet Grooming</option>
		                        <option value="">Pet Daycare</option>
		                      </select>
		                    </div>
				              </div>
				    				</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
				              <input type="text" class="form-control" placeholder="Your Name">
				            </div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
				              <input type="text" class="form-control" placeholder="Vehicle number">
				            </div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
				    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-calendar"></span></div>
				            		<input type="text" class="form-control appointment_date" placeholder="Date">
			            		</div>
				    				</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
				    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-clock-o"></span></div>
				            		<input type="text" class="form-control appointment_time" placeholder="Time">
			            		</div>
				    				</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
				              <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
				            </div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
				              <input type="submit" value="Send message" class="btn btn-primary py-3 px-4">
				            </div>
									</div>
	    					</div>
		          </form>
	    			</div>
	    		</div>
	    	</div>
	    </section>
	<%@ include file="../../main/footer.jsp"%>
</body>
</html>