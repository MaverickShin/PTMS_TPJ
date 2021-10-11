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
	
	function applyChks(){
		
		if (!document.applyform.SV_AREA.value) {
			alert("서비스 가능지역 입력은 필수 입니다.");
			return false;
		}else if (!document.applyform.WK_START.value) {
			alert("서비스 시작일 입력은 필수 입니다.");
			document.applyform.WK_START.focus();
			return false;
		}else if (!document.applyform.WK_END.value) {
			alert("서비스 종료일 입력은 필수 입니다.");
			document.applyform.WK_END.focus();
			return false;
		}else if (!document.applyform.SIT_TITLE.value) {
			alert("소개글을 입력해 주세요.");
			document.applyform.SIT_TITLE.focus();
			return false;
		}else if (!document.applyform.SIT_APPEAL.value) {
			alert("소개글을 입력해 주세요.");
			document.applyform.SIT_APPEAL.focus();
			return false;
		}else if (!document.applyform.SIT_IMG.value) {
			alert("프로필 사진 등록은 필수입니다.");
			document.applyform.SIT_IMG.focus();
			return false;
		}
		
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
 
   <c:if test="${selectCnt != 0}">
   		<script type="text/javascript">
   			alert("이미 펫시터로 활동중인 아이디 입니다. 내정보관리를 확인해 주세요");
   			window.location='${st}sitter';
		</script>
   	</c:if>

  <c:if test="${selectCnt == 0}">
   <%@ include file="../../main/header.jsp" %>
   
   <div style="display: flex; flex:1; justify-content:center;">
   
   		<%@ include file = "sidebar.jsp" %>
      
      <section style = "width:900px; margin-left:auto; margin-right:auto; margin-top:30px;" class = "sections">
         <form name="applyform" action="applySitteAction" method="post" onsubmit="return applyChks();" enctype="multipart/form-data">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               <s:csrfInput/>
               <div class="row no-gutters" >
                  <div class="col-md-7" style ="max-width: 100% !important; flex:0 0 100% !important">
                     <div class="contact-wrap w-100 p-md-5 p-4">
                        <h2 class="mb-4" style = "padding-bottom:20px; border-bottom:1px solid #00bd56">펫시터 등록</h2>
                           <div class="row">
                           
                            <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="service_loc" style = "font-size: 20px !important;">고객 아이디</label>
                                    <input type="text" class="form-control" name="CUST_ID" id="CUST_ID" value="${sessionScope.cust_id}" readonly style = "outline:none; border:none; font-size: 18px">
                                 </div>
                              </div>
                              
                              
                              <div class="col-md-12" style = "margin-bottom: 30px; border-bottom: 1px solid #00bd56; border-bottom:1px solid #00bd56">
                                 <div class="form-group">
	                                 <div class="select-wrap" style = "margin-bottom: 30px;">
	                                 	<label class="label" style = "font-size: 20px !important;">원하는 서비스를 선택해 주세요</label>
	                                 </div>
                                           
                                     <div class="select-wrap">
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV1_NO"><span class = "list_label_span1">미용 서비스</span><input type="checkbox" value="1" name="SV1_NO" class="sel_chk1" id = "SV1_NO"><span class = "checkbox_icon"></span></label></p>
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV2_NO"><span class = "list_label_span1">놀이 서비스</span><input type="checkbox" value="2" name="SV2_NO" id = "SV2_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
	                                     <p class = "chk_p1"><label class = "chk_label1" for = "SV3_NO"><span class = "list_label_span1">산책 서비스</span><input type="checkbox" value="3" name="SV3_NO" id = "SV3_NO" class="sel_chk1"><span class = "checkbox_icon"></span></label></p>
						 				 <p class = "chk_p1"><label class = "chk_label1" for = "SV4_NO"><span style = "margin-right: 79px;">응급처치 서비스 (필수)</span><input type="checkbox" value="4" name="SV4_NO" class="sel_chk1" id = "SV4_NO"checked onclick="return false;"><span class = "checkbox_icon"></span></label></p>
                                     </div>
                                     
                                    </div>
                              </div>
                              
                              <div class="col-md-12" style = "margin-bottom:30px;">
                                 <div class="form-group">
                                    <label class="label" for="service_loc" style = "font-size: 20px !important; ">시터 서비스 가능 지역</label>
                                    <input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:5px; margin-left:30px;">
                                 </div>
                              </div>
                              
                              <div class="col-md-6">
                                 <div class="form-group" style="display:none">
                                    <label class="label" for="postcode" style = "font-size: 20px !important;">우편번호</label>
                                    <input type="text" class="form-control" name="address1" id="postcode" placeholder="우편번호" readonly>
                                 </div>
                              </div>
                              
                              
                              <div class="col-md-12" style = "border-bottom:1px solid #00bd56; margin-bottom: 30px">
                                 <div class="form-group">
                                    <label class="label" for="address1" style = "font-size: 20px !important;">도로명 주소</label>
                                    <input type="text" class="form-control" name="SV_AREA" id="address1" placeholder="도로명 주소" readonly style = "margin-bottom: 30px;">
                                 </div>
                              </div>
                              
                              <div class="col-md-12" style="display:none">
                                 <div class="form-group">
                                    <label class="label" for="address2" style = "font-size: 20px !important;">지번 주소</label>
                                    <input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
                                 </div>
                              </div>
                              
                              <div class="col-md-4">
                                 <div class="form-group">
                                    <label class="label" for="hometype" style = "font-size: 20px !important;">주거지 유형</label>
                                   	   <select size="1" id="iptags" name="SR_CD" style = "font-size: 16px; height: 30px; width: 150px;">
								 			<option value="1">주택(마당x)</option>
								 			<option value="2">주택(마당o)</option>
								 			<option value="3">아파트</option>
								 			<option value="4">빌라 </option>
							 		   </select><br>
                                 </div>
                              </div>
                              
		                     <div class="col-md-8">
		                        <div class="form-group" >
		                           <label class="label" for="trainingDay" style = "font-size: 20px !important;">서비스 가능일</label> <br>
		                           <input type="date" class="iptags" name="WK_START" style = "font-size: 18px">
		                           <span style = "font-weight: bold; color: black"> ~ </span> 
		                           <input type="date" class="iptags" name="WK_END" style = "font-size: 18px"><br>
		                        </div> 
		                     </div>
                              
                              <div class="col-md-12" style="text-align:center; font-size: 16px; border-top: 1px solid #00bd56; border-bottom:1px solid #00bd56; margin-top: 30px; padding-top:30px; padding-bottom: 30px;">
                                    <label class="label" for="SIT_TITLE" style = "font-size: 20px !important;">소개글</label>
                                    <input type="text" class="form-control" name="SIT_TITLE" id="SIT_TITLE" placeholder="소개글 제목">
                                    <textarea rows="5px" cols="105%" name="SIT_APPEAL" id="SIT_APPEAL" placeholder=" 소개글 본문" style = "outline:none; border:1px solid gray"
                                    minlength="10" maxlength="50"></textarea>
                                 </div>
                                 
                              <div class="col-md-12" style = "margin-top: 30px; border-bottom:1px solid #00bd56; margin-bottom: 30px;">
                                 <div class="form-group">
                                    <label class="label" for="SIT_IMG" style = "font-size: 20px !important;">프로필 사진</label>
                                    
                                    <div class="form-group">
 	                                   <label class="btn btn-primary" for="SIT_IMG" style = "font-size: 16px !important; height:50px; font-weight:normal !important">사진등록</label> 
    	                                <input type="file" id="SIT_IMG" name="SIT_IMG" accept="${imgPath}/*" class="btn btn-primary" style="display:none">
                                	</div>
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group" align = "center">
                                    <input type="submit" value="지원하기" class="btn btn-primary" id = "join_sub" style = "font-size:20px">
                                    <input type="reset" value="지원취소" class="btn btn-primary" id = "join_sub" onclick="window.history.back()" style = "font-size:20px">
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
 </c:if>  
</body>
</html>