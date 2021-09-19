package ptms.mvc.tpj.AdminEnroll_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface EnrollService {

	//펫 코드 및 요금 등록
	public void petCodeFee(HttpServletRequest req, Model model);
	
	//펫 코드 및 요금 목록
	public void petCodeFeeList(HttpServletRequest req, Model model);
	
	//펫 코드 및 요금 수정 페이지
	public void petCodeFeeUpdate(HttpServletRequest req, Model model);
	
	//펫 코드 및 요금 수정
	public void petCodeFeeUpdateAction(HttpServletRequest req, Model model);
	
	//펫 코드 및 요금 삭제
	public void petCodeFeeDeleteAction(HttpServletRequest req, Model model);
	
}
