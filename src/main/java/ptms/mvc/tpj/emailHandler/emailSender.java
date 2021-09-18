package ptms.mvc.tpj.emailHandler;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;

@Service
public class emailSender {

	public int sender(String email, String authCodes) {
		String to = email;			
		String from = "wekosmo88@gmail.com";			
		String code = authCodes;		

		int cnt = 0;
		
		//사용자에게 보낼 메시지
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "이메일 인증코드 입니다. <br>" 
		        + "<div style = 'width:300px; height:100px; line-height: 100px; border:3px solid black; margin-top:50px; margin-left:auto; margin-right:auto; font-size:24px; font-weight: bold; text-align:center;'>" + code + "</div>";

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
			cnt = 1;
		} catch (Exception e) {
			e.printStackTrace();
			cnt = 0;
		}
		
		return cnt;
	}
	
}
