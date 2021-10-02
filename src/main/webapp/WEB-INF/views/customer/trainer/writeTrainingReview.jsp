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


   <div class="row no-gutters">
      <div class="col-md-7">
         <div class="contact-wrap w-100 p-md-5 p-4">
            <h3 class="mb-4">후기작성</h3>
            <p>따뜻한 말 한마디가 훈련사에게 힘이 됩니다!</p>
            <form action="writeTrainingReviewAction" method="POST" id="contactForm" name="contactForm"
               class="contactForm">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               <input type="hidden" name="TG_ID" value="${TG_ID}">
               <input type="hidden" name="TQ_CD" value="${TQ_CD}">
               <div class="row">
                  <div class="col-md-6">
                     <div class="form-group">
                        <label class="label" for="TG_GRADE">평점</label> 
                        <input type="number" class="form-control" name="TG_GRADE" id="TG_GRADE" step ="0.5" max="5">
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="form-group">
                        <label class="label" for="TG_CON">후기글</label> <input
                           type="text" class="form-control" name="TG_CON" id="TG_CON">
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="form-group">
                        <label class="label" for="TG_IMG">사진 첨부</label> <input
                           type="file" class="form-control" name="TG_IMG" id="TG_IMG">
                     </div>
                  </div>
                    
                  <div class="col-md-12">
                     <div class="form-group">
                        <input type="submit" value="작성하기"
                           class="btn btn-primary">
                        <div class="submitting"></div>
                     </div>
                  </div>
                  
               </div>
            </form>
         </div>
      </div>
      <div class="col-md-5 d-flex align-items-stretch">
         <div class="info-wrap w-100 p-5 img"
            style="background-image: url(images/img.jpg);"></div>
      </div>
   </div>
   <%@ include file="../../main/footer.jsp"%>
</body>
</html>