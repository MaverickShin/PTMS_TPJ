package ptms.mvc.tpj.Payment_Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.Payment_Service.PaymentService;

@RequestMapping("/pay")
@Controller
public class PaymentController {
	
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService pService;
	
	// 1회성 결제창 로드
	@RequestMapping("")
	public String payOneTime(HttpServletRequest req, Model model){
		
		return "";
	}
	
	// 1회성 카카오 페이
	
	
	// 정기구독 결제창 로드
	@RequestMapping("subscribe")
	public String paySubscribe(HttpServletRequest req, Model model){
		
		return "";
	}
}
