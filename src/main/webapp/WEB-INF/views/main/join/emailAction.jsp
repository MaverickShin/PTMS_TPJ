<%@page import="javax.mail.Authenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ptms.mvc.tpj.emailHandler.emailHandle"%>
<%@page import="ptms.mvc.tpj.emailHandler.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>

<%
		String host = "http://localhost/tpj/cust/";	// http://localhost/본인 플젝명
		String to = request.getParameter("cust_id");			// 회원가입 처리 후 서비스에서 setAttribute로 보낸 id
		String from = "wekosmo88@gmail.com";			// 보내는이 이메일 아이디 - 자기꺼 쓸거 아니면 변경 x
		String code = SHA256.getEncrypt(to, "cos");		

		//사용자에게 보낼 메시지
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. " 
		        + "<a href='"+ host +"mailChkAction?code=" + code + "&cust_id=" + to
				+ "'>이메일 인증하기</a>";
				// mailChkAction.mc는 mailChkAction.jsp로 이동하기 위한 url
				// 인증하기 버튼클릭 시 실행된다.

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.sockerFactory.fallback", "false");

		try {
			Authenticator auth = new emailHandle();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html; charset=UTF8");
			Transport.send(msg);
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일 인증 오류')");
			script.println("history.back();");
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
<script type="text/javascript">
	// 회원가입 처리 후 인증메일 전송메시지 - 바꿔도 됨
	alert("이메일 인증 메일이 전송되었습니다. 이메일 인증을 완료 해주세요!");
	window.location = "/tpj/cust/main"; // 메시지 출력 후 돌아갈 url (본인 맘대루)
</script>
</body>
</html>