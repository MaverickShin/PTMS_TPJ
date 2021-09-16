<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ptms.mvc.tpj.emailHandler.SHA256"%>
<%@page import="java.io.PrintWriter"%>

<%
	// 이메일 인증 처리 JSP


	//해당 이메일로 SHA256한 값과 code 값을 비교한다.
	String code = request.getParameter("code");
	String id = request.getParameter("cust_id");
	boolean rightCode = 
			SHA256.getEncrypt(id, "cos").equals(code) ? true : false;
	PrintWriter script = response.getWriter();
	if(rightCode == true){
		script.println("<script>");
		script.println("alert('이메일 인증에 성공하였습니다. 로그인 하십시오!')");
		
		// 이메일 인증 성공시 이메일 인증 완료 url을 요청
		// get방식으로 인증한 이메일 아이디를 컨트롤러에 전달
		script.println("window.location='emailSuccess?cust_id="+id+"'");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("window.location='main'");
		script.println("</script>");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>