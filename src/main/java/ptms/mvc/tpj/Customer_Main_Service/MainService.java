package ptms.mvc.tpj.Customer_Main_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {

	// 중복확인 처리 - 아이디 확인
	public int confirmId(HttpServletRequest req, Model model);
		
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
		
<<<<<<< HEAD
=======
	// 회원정보 상세조회
	public void custDetail(HttpServletRequest req, Model model);

	// 회원정보 수정 처리
	public void custUpdate(HttpServletRequest req, Model model);
>>>>>>> cebc6258f82bd0b588445a5f32642136355bc625
}
