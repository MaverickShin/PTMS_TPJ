package ptms.mvc.tpj.emailHandler;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class emailHandle extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication("wekosmo88@gmail.com", "kosmo@88");
	}
	
}
