<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.blog-entry:hover {
		width: 105%;
		height: 90%;
		box-shadow: 5px 5px 5px 5px gray;
	}
</style>
</head>
<body>
	<%@ include file="../../main/header.jsp" %>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${imgPath}bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Trainer<i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">훈련사 매칭 결과</h1>
          </div>
        </div>
      </div>
    </section>
	
	<div style="display: flex; flex:1; justify-content:center;">
	
		<%@ include file = "sidebar.jsp" %>
	
		<div class="container" style = "margin-top:50px; ">
			<div class="row" style = "display: grid; grid-template-columns:1fr 1fr 1fr 1fr;">
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<div class="col-md-12" onclick = "window.location = 'trainerDetail?TA_CD=${dto.TA_CD}&TQ_LOC=${TQ_LOC}'">
				            <div class="blog-entry align-self-stretch">
				              <a  class="block-20 rounded" style="background-image: url('${imgPath}image_1.jpg');">
				              </a>
				              <div class="text p-4">
				              	<div class="meta mb-2">
				                  <div><a href="#">${dto.START_DAY} ~ ${dto.END_DAY}</a></div>
				                  <div><a href="#">${dto.CUST_NM}</a></div>
				                  <div><a href="#" class="meta-chat"><span class="fa fa-comment"></span>3</a></div><!-- 이곳에 좋아요 갯수 또는 평점을 넣으면 좋지 않을까? -->
				                </div>
				                <h3 class="heading"><a href="trainerDetail?TA_CD=${dto.TA_CD}&TQ_LOC=${TQ_LOC}">${dto.TA_TITLE}</a></h3>
				              </div>
				            </div>
				        </div>
			    	</c:forEach>
				</c:if>
		    	<c:if test="${cnt == 0}">
		    		<div class="col-md-12">
		    			매칭된 훈련사가 없습니다. 조건을 바꿔 다시 검색해보세요!
		    		</div>
		    	</c:if>
		    </div>
		    
		    <c:if test="${cnt > 0}">
		    	<div class="row">	
					<div class="col-md-12">
				    	<div class = "page_control" align="center">
							<table>
								<tr>
									<th align = "center">
										<!-- 게시글이 있으면 -->
										<!-- 처음[◀◀]	 / 이전블록[◀]  / -->
										<c:if test = "${startPage > pageBlock}">
											<a href = "trainerMatchingList"> [◀◀] </a>
											<a href = "trainerMatchingList?pageNum=${startPage - pageBlock}"> [◀] </a>
										</c:if>
										
										<!-- 블록내의 페이지 번호 -->
										<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
											<c:if test = "${i == currentPage}">
												<span style = "cursor: pointer;"><b>[${i}]</b></span>
											</c:if>
											
											<c:if test = "${i != currentPage}">
												<a href = "trainerMatchingList?pageNum=${i}">[${i}]</a>
											</c:if>
										</c:forEach>
										
										<!-- 다음[▶]	/  마지막[▶▶]  / -->
										<c:if test = "${pageCount > endPage}">
											<a href = "trainerMatchingList?pageNum=${startPage + pageBlock}">[▶]</a>
											<a href = "trainerMatchingList?pageNum=${pageCount}">[▶▶]</a>
										</c:if>
									</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</c:if>
	    </div>	 
	</div>
	
	<%@ include file="../../main/footer.jsp" %>
</body>
</html>