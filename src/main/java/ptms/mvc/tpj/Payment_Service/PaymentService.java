package ptms.mvc.tpj.Payment_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PaymentService {
	
	// 카카오페이 api 호출
	void kakaoPay(HttpServletRequest req, Model model);

	//  
	
	// 
}
