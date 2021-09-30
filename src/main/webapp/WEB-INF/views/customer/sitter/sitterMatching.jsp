<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.blog-entry:hover {
	width: 110%;
	height: 95%;
	border:box shadow;
	box-shadow: 3px 3px 5px 5px #e0e0e0;
}
</style>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#detail_submit").click(function(){
			$("#detail_form").submit();
		});
		
	});

</script>

</head>
	<%@ include file="../../main/header.jsp"%>

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Trainer<i
								class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">펫시터 매칭 결과</h1>
				</div>
			</div>
		</div>
	</section>

		<div style="display: flex; flex:1; justify-content:center;">
		
			<%@ include file = "sidebar.jsp" %>

			<div class="container" style="margin-top: 50px;">
				<div class="row"
					style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 15px;">
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}" varStatus = "i">
							<form action = "sitterDetail" method = "post" id = "detail_form">
								<div class="col-md-12" id = "detail_submit">
									<input type = "hidden" name = "SIT_ID" value = "${dto.SIT_ID}">
									<input type = "hidden" name = "SV_AREA" value = "${SV_AREA}">
									<input type = "hidden" name = "total"value = "${total}">
									<input type = "hidden" name = "WK_END" value = "${WK_END}">
									<input type = "hidden" name = "WK_START" value = "${WK_START}">
									<c:forEach var = "i" items = "${pet}">
										<input type = "hidden" name = "pet" value = "${i}">
									</c:forEach>
									<c:forEach var = "j" items = "${sv_no}">
										<input type = "hidden" name = "sv_no" value = "${j}">
									</c:forEach>
									<div class="blog-entry align-self-stretch" style = "border:1px solid #eeeeee;">
										<a class="block-20 rounded"
											style="background-image: url('${imgPath}daon.jpg');"> </a>
										<div class="text p-4">
											<div class="meta mb-2">
												<div>
													<a href="#">April 07, 2020</a>
												</div>
												<div>
													<a href="#">${dto.CUST_NM}</a>
												</div>
												<div>
													<a href="#" class="meta-chat"><span
														class="fa fa-comment"></span>3</a>
												</div>
											</div>
											<h3 class="heading">
												${dto.SIT_TITLE}
											</h3>
											
											<div class="form-group" align= center>
												<input type="submit" value="자세히 보기" class="btn btn-primary" style = "text-align:center; width:150px; font-size: 14px !important;">
											</div>
										</div>
									</div>
								</div>
							</form>
						</c:forEach>
					</c:if>
					
					<c:if test="${cnt == 0}">
						<div>
							매칭결과가 없습니다. 다시 조건을 입력해 주세요.
						</div>
					</c:if>
				</div>
				<div class = "page_control">
               <table>
                  <tr>
                     <th align = "center">
                        <!-- 게시글이 있으면 -->
                        <!-- 처음[◀◀]    / 이전블록[◀]  / -->
                        <c:if test = "${startPage > pageBlock}">
                           <a href = "sitterMatching"> [◀◀] </a>
                           <a href = "sitterMatching?pageNum=${startPage - pageBlock}"> [◀] </a>
                        </c:if>
                        
                        <!-- 블록내의 페이지 번호 -->
                        <c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
                           <c:if test = "${i == currentPage}">
                              <span style = "cursor: pointer;"><b>[${i}]</b></span>
                           </c:if>
                           
                           <c:if test = "${i != currentPage}">
                              <a href = "sitterMatching?pageNum=${i}">[${i}]</a>
                           </c:if>
                        </c:forEach>
                        
                        <!-- 다음[▶]   /  마지막[▶▶]  / -->
                        <c:if test = "${pageCount > endPage}">
                           <a href = "sitterMatching?pageNum=${startPage + pageBlock}">[▶]</a>
                           <a href = "sitterMatching?pageNum=${pageCount}">[▶▶]</a>
                        </c:if>
                     </th>
                  </tr>
               </table>
            </div>
		</div>
	</div>

	<%@ include file="../../main/footer.jsp"%>
</body>
</html>