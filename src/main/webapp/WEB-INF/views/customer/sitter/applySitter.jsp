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
           <li><a href="#">펫시터 찾기</a></li>
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
                                       <div class="form-field">
                                           <div class="select-wrap">
                                              <label class="label" for="tr_kind">제공 가능한 서비스를 선택해 주세요</label>
                                                 <label><input type="checkbox" value="1" name="tr_kind1" class="form-control">미용 서비스</label>
                                                 <label><input type="checkbox" value="1" name="tr_kind2" class="form-control">놀이 서비스</label>
                                                 <label><input type="checkbox" value="1" name="tr_kind4" class="form-control">산책 서비스</label>
												 <label><input type="checkbox" value="1" name="tr_kind3" class="form-control" checked>응급처치 서비스</label>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="service_loc">시터 주거 지역</label>
                                    <input type="button" value="주소찾기" class="btn btn-primary" onclick = "addressSerch();" style = "margin-top:25px;">
                                 </div>
                              </div>
                              
                              
                              <div class="col-md-6">
                                 <div class="form-group">
                                    <label class="label" for="address1">도로명 주소</label>
                                    <input type="text" class="form-control" name="address1" id="address1" placeholder="도로명 주소" readonly>
                                 </div>
                              </div>
                              
                              <div class="col-md-6">
                                 <div class="form-group">
                                    <label class="label" for="address2">지번 주소</label>
                                    <input type="text" class="form-control" name="address2" id="address2" placeholder="지번 주소" readonly>
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="trainingDay">펫시팅 가능일</label><br>
                                    <input type="date" class="iptags" name="START_DAY" >~
                                    <input type="date" class="iptags" name="END_DAY" >
                                    조정가능<input type="checkbox" class="iptags" name="ADJUSTABLE" value="1">
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="intro_title">소개글 제목</label>
                                    <input type="text" class="form-control" name="intro_title" id="intro_title">
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="intro_content">소개글 본문</label>
                                    <input type="text" class="form-control" name="intro_content" id="intro_content">
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label class="label" for="trainerImg">프로필 사진</label>
                                    <label class="btn btn-primary" for="trainerImg">업로드</label> 
                                    <input type="file" id="trainerImg" name="trainerImg" accept="image/*" class="btn btn-primary" style="display:none">
                                 </div>
                              </div>
                              
                              <div class="col-md-12">
                                 <div class="form-group" align = "center">
                                    <input type="submit" value="지원하기" class="btn btn-primary" id = "join_sub">
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