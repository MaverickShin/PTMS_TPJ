package ptms.mvc.tpj.Customer_Main_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {

	// 중복확인 처리 - 아이디 확인
	public int confirmId(HttpServletRequest req, Model model);
		
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
		
	// 회원정보 상세조회
	public void custDetail(HttpServletRequest req, Model model);

	// 회원정보 수정 처리
	public void custUpdate(HttpServletRequest req, Model model);
	
	// 펫 목록
	public void petList(HttpServletRequest req, Model model);
	
	// 펫 등록 처리
	public void petInAction(HttpServletRequest req, Model model);
	
	// 펫 수정 화면
	public void petUpdate(HttpServletRequest req, Model model);
	
	// 펫 삭제 처리
	public void petDelete(HttpServletRequest req, Model model);
	
	// 펫 수정 처리
	public void petUpdateAction(HttpServletRequest req, Model model);
	
}
