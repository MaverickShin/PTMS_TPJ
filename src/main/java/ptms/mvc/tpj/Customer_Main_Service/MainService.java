package ptms.mvc.tpj.Customer_Main_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {

	// 중복확인 처리 - 아이디 확인
	public void confirmId(HttpServletRequest req, Model model);
		
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
		
	// 이메일 인증 성공 처리
	public void emailSuccess(HttpServletRequest req, Model model);
	
}
