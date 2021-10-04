<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${trainerChkCnt != 1}">
       	<script type="text/javascript">
          alert("훈련사로 등록 후 이용 가능합니다.");
          window.history.back();
    	</script>
    </c:if>
	<%@ include file="../../main/header.jsp" %>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${path}images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">고객님의 후기를 확인하세요!</h1>
          </div>
        </div>
      </div>
    </section>
    
    <div style="display: flex; flex:1; justify-content:center;">
    
    <%@ include file = "sidebar.jsp" %>
    
    <section style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 30px; font-size: 20px;" class = "sections">
    
    <c:if test="${cnt == 0}">
    	<div class="about-author d-flex p-4 bg-light">
	      <div class="desc">
	        <h3></h3>
	        <p>아직 작성한 후기가 없습니다.</p>
	      </div>
	    </div>
    </c:if>
    
    <c:if test="${cnt > 0}">
		<div class="row" id="divs" style="display: grid; grid-template-columns: 1fr 1fr 1fr; grid-gap: 30px; width: 700px; margin-left: auto; margin-right: auto; margin-top: 10px;">
			<c:forEach var="dtos" items="${dto}">
				<div class="about-author d-flex p-4 bg-light" style="place-content:center;">
			      <div class="desc" style="background-color:#dfe3eb; padding:20px;">
			      	<p>${dtos.TG_IMG}
			        <h6>훈련받은 펫 : ${dtos.PET_NM}</h6>
			        <p>훈련일 : ${dtos.START_DAY}<br>훈련종류 : ${dtos.TQ_AMT}<br>${dtos.TQ_FEE}</p>
			        <p>별점 : ${dtos.TG_GRADE}<br>${dtos.TG_CON}
			        <input type="button" value="수정" class="btn btn-primary" onclick="window.open('modifyTrainingReview?TG_CD=${dtos.TG_CD}', '_blank', 'menubar=no, width=555, height=500, resizable = no, scrollbars = no, titlebar = no, location = no');">
			      	<input type="button" value="삭제" class="btn btn-primary" onclick="window.location='deleteTrainingReview?TG_CD=${dtos.TG_CD}'">
			      </div>
			    </div>
		    </c:forEach>
	    </div>
	    <div class = "page_control">
			<table>
				<tr>
					<th align = "center">
						<!-- 게시글이 있으면 -->
						<!-- 처음[◀◀]	 / 이전블록[◀]  / -->
						<c:if test = "${startPage > pageBlock}">
							<a href = "${t}"> [◀◀] </a>
							<a href = "${t}?pageNum=${startPage - pageBlock}"> [◀] </a>
						</c:if>
						
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
							<c:if test = "${i == currentPage}">
								<span style = "cursor: pointer;"><b>[${i}]</b></span>
							</c:if>
							
							<c:if test = "${i != currentPage}">
								<a href = "${t}?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶]	/  마지막[▶▶]  / -->
						<c:if test = "${pageCount > endPage}">
							<a href = "${t}?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href = "${t}?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</c:if>
	</section>
	</div>
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>