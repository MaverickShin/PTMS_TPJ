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
										<td style = "text-align:center;"><i class="fab fa-quora fa-2x"></i></td>
										<td class = "q_s">
											${i.QNA_TITLE}
										</td>
										<td style = "text-align:center;"><i class="fas fa-chevron-down fa-2x"></i></td>
									</tr>
								</table>
							</summary>
							
							<details>
								<summary>
									<div class = "a">
										<table class = "a_table">
											<tr>
												<td style = "text-align:center; background-color: #eeeeee; border-right: 2px solid #e0e0e0;">문의 내용 </td>
												<td style = "text-align:center;" class = "a_s">
													${i.QNA_CONTENT}
												</td>
											</tr>
										</table>
									</div>
								</summary>
								
								<c:if test = "${i.QNA_ANSWER != null}">
									<div class = "m">
										<table class = "m_table">
											<tr>
												<td class = "m_i" style = "width: 210px !important;"><i class="fas fa-font fa-2x"></i></td>
												<td>${i.QNA_ANSWER}</td>
											</tr>
										</table>
									</div>
									
								</c:if>
								
								<c:if test = "${i.QNA_ANSWER == null}">
									<div class = "m">
										<table class = "m_table">
											<tr>
												<td class = "m_i" style = "width: 210px !important;"><i class="fas fa-font fa-2x"></i></td>
												<td>아직 답변이 등록 되지 않았습니다!</td>
											</tr>
										</table>
									</div>
									
									<div class = "b">
										<input type = "button" class = "in_buttons" id = "order_modify" value = "수정" onclick = "modify_suc(${i.QNA_CD}, '${i.QNA_TITLE}', '${i.QNA_CONTENT}', '${i.QNA_DT}', ${i.QK_CD});"> 
										<input type = "button" class = "in_buttons" value = "삭제" onclick = "del_qna(${i.QNA_CD}, ${i.QK_CD});">
									</div>
								</c:if>
							</details>
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
					<p style = "font-size:30px; padding-top: 100px;">등록된 QnA가 없습니다!</p>
				</div>
			</c:if>
					
</body>
</html>