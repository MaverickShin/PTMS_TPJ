<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "_csrf_header" content="${_csrf.headerName}">
<meta name = "_csrf" content = "${_csrf.token}">
<title>Insert title here</title>
</head>
<body>

			<c:if test = "${cnt > 0}">
				<c:forEach var = "i" items = "${vo}">
					<div class = "q">
						<details>
							<summary>
								<table class = "q_table">
									<tr>
										<td style = "text-align:center;"><i class="fab fa-quora  fa-2x"></i></td>
										<td class = "q_s">
											${i.FAQ_TITLE}
										</td>
										<td style = "text-align:center;"><i class="fas fa-chevron-down fa-2x"></i></td>
									</tr>
								</table>
							</summary>
							
							<div class = "a">
								<table class = "a_table">
									<tr>
										<td style = "text-align:center; background-color: #eeeeee; border-right: 2px solid #e0e0e0;">문의 내용 </td>
										<td style = "text-align:center;" class = "a_s">
											${i.FAQ_CONTENT}
										</td>
									</tr>
								</table>
							</div>
						</details>
					</div>
				</c:forEach>
				
				<div style="padding-top: 150px;"></div>
				
				<!-- 페이지 컨트롤 -->
				<div class = "row numberings">
                     <div class="col-md-12" align="center">
                        <div class="block-27">
                             <ul>
                               <li><a class ="pageMoves" onclick="pageMove('');" >&lt;&lt;</a>
                               <li><a class ="pageMoves" onclick="pageMove(${startPage - pageBlock});">&lt;</a></li>
                               
                               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                              <c:if test="${i == currentPage}">
                                 <li class="active"><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                              </c:if>
      
                              <c:if test="${i != currentPage}">
                                 <li><span><a class ="pageMoves" onclick = "pageNumbers(${i});">${i}</a></span></li>
                              </c:if>
                              
                           </c:forEach> 
                               
                               <li><a class ="pageMoves" onclick = "pageMove(${startPage + pageBlock});">&gt;</a></li>
                               <li><a class ="pageMoves" onclick = "pageMove(${pageCount});">&gt;&gt;</a></li>
                             </ul>
                        </div>
                     </div>
                  </div>
			</c:if>
			
			<c:if test = "${cnt == 0}">
				<div class = "q" style = "text-align:center;">
					<p style = "font-size:30px; padding-top: 100px;">등록된 FAQ가 없습니다!</p>
				</div>
			</c:if>
</body>
</html>