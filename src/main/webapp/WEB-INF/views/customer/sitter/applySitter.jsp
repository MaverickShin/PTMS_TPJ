<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function check(){
	   var chk1 = document.applyform.tr_kind1.checked;
	   var chk2 = document.applyform.tr_kind2.checked;
	   var chk3 = document.applyform.tr_kind3.checked;
	   var chk4 = document.applyform.tr_kind4.checked;
	   
	   var result1 = document.getElementById("tr_kind1_fee");
	   
	   if(chk1) {
	      result1.style.display = "block";
	   }
	   if(chk2) {
	      result.style.display = "block"
	   }
	}
</script>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="../../main/header.jsp" %>
   
   <div style="display:flex">
      <nav id="listdiv_id1" style="width:400px; padding:100px;">
         <ul>
           <li>-고객-</li>
           <li><a href="sitter">펫시터 찾기</a></li>
           <li><a href="">이용후기</a></li>
           <li><a href="feeInfo">요금안내</a></li>
           <li>-펫시터-</li>
           <li><a href="applySitter">펫시터 지원</a></li>
           <li><a href="">활동 등록</a></li>
           <li><a href="">나에게 온 의뢰</a></li>
        </ul>
      </nav>
      
      <section style = "width:700px; margin-left:auto; margin-right:auto; margin-top:30px;">
         <form name="applyform" action="applySitteAction" method="post">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               <div class="row no-gutters" >
                  <div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
                     <div class="contact-wrap w-100 p-md-5 p-4">
                        <h3 class="mb-4">펫시터 등록</h3>
                           <div class="row">
                           
                            <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="service_loc">고객 아이디</label>
                                    <input type="text" class="form-control" name="CUST_ID" id="CUST_ID" value="${sessionScope.cust_id}" readonly>
                                 </div>
                              </div>
                              
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                       <div class="form-field">
                                           <div class="select-wrap">
                                              	 <label class="label" for="tr_kind">제공 가능한 서비스를 선택해 주세요</label>
                                                 <label><input type="checkbox" value="1" name="SV1_NO" class="form-group">미용 서비스</label>
                                                 <label><input type="checkbox" value="2" name="SV2_NO" class="form-group">놀이 서비스</label>
                                                 <label><input type="checkbox" value="3" name="SV3_NO" class="form-group">산책 서비스</label>
												 <label><input type="checkbox" value="4" name="SV4_NO" class="form-group" checked>응급처치 서비스<필수체크></label>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="service_loc">시터 서비스 가능 지역</label>
                                    <input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
                                 </div>
                              </div>
                              
                              <div class="col-md-6">
                                 <div class="form-group" style="display:none">
                                    <label class="label" for="postcode">우편번호</label>
                                    <input type="text" class="form-control" name="address1" id="postcode" placeholder="우편번호" readonly>
                                 </div>
                              </div>
                              
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="address1">도로명 주소</label>
                                    <input type="text" class="form-control" name="SV_AREA" id="address1" placeholder="도로명 주소" readonly>
                                 </div>
                              </div>
                              
                              <div class="col-md-12" style="display:none">
                                 <div class="form-group">
                                    <label class="label" for="address2">지번 주소</label>
                                    <input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
                                 </div>
                              </div>
                              
                             <!--  <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="trainingDay">펫시팅 가능일</label><br>
                                    <input type="date" class="iptags" name="START_DAY" >~
                                    <input type="date" class="iptags" name="END_DAY" >
                            	       조정가능<input type="checkbox" class="iptags" name="ADJUSTABLE" value="1">
                                 </div>
                              </div> -->
                              
                              <div class="col-md-6">
                                 <div class="form-group">
                                    <label class="label" for="hometype">주거지 유형</label>
                                   	   <select size="1" id="iptags" name="SR_CD">
								 			<option value="1">주택(마당x)</option>
								 			<option value="2)">주택(마당o)</option>
								 			<option value="3">아파트</option>
								 			<option value="4">빌라 </option>
							 		   </select><br>
                                 </div>
                              </div>
                              
<!--                               <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="RESERVATION">서비스 가능일 </label>
				                        <select size="1" id="iptags" name="RESERVATION">
								 			<option value="평일">평일</option>
								 			<option value="주말">주말</option>
								 			<option value="모두가능">모두가능 </option>
							 		   </select><br>
                                 </div>
                              </div> -->
                              
		                     <div class="col-md-6">
		                        <div class="form-group">
		                           <label class="label" for="trainingDay">서비스 가능일</label> <br>
		                           <input type="date" class="iptags" name="WK_START"> ~ 
		                           <input type="date" class="iptags" name="WK_END"><br>
		                        </div> 
		                     </div>
                              
                              <div class="col-md-12" style="text-align:center;">
                                    <label class="label" for="SIT_TITLE">소개글</label>
                                    <input type="text" class="form-control" name="SIT_TITLE" id="SIT_TITLE" placeholder="소개글 제목">
                                    <textarea rows="5px" cols="75%" name="SIT_APPEAL" id="SIT_APPEAL" placeholder="소개글 본문"></textarea>
                                 </div>
                                 
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="trainerImg">프로필 사진</label>
                                    <label class="btn btn-primary" for="trainerImg">업로드</label> 
                                    <input type="file" id="SIT_IMG" name="SIT_IMG" accept="image/*" class="btn btn-primary" style="display:none">
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group" align = "center">
                                    <input type="submit" value="지원하기" class="btn btn-primary" id = "join_sub">
                                    <input type="reset" value="지원취소" class="btn btn-primary" id = "join_sub" onclick="window.history.back()">
                                 <div class="submitting"></div>
                                 </div>
                              </div>
                           </div>
                     </div>
                  </div>
               </div>
         </form>
      </section>
   </div>
   
   <%@ include file="../../main/footer.jsp" %>
</body>
</html>