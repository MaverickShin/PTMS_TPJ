package ptms.mvc.tpj.Payment_Controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;
import ptms.mvc.tpj.Payment_Service.PaymentService;

@RequestMapping("/pay")
@Controller
public class PaymentController {
	
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService service;

	@Autowired
	MainDAOImpl dao;
	
	// 결제 요청창 로드
	@RequestMapping("request")
	public String payOneTime(HttpServletRequest req, Model model){
		
		log.info("payment cnt request");
		
		String primarykey = req.getParameter("primarykey");
		String price = req.getParameter("price");
		String item_name = req.getParameter("item_name");
		String cust_id = (String)req.getSession().getAttribute("cust_id");
		CustomerVO vo = dao.custDetailInfo(cust_id);
		
		System.out.println("pk :" + primarykey);
		
		String url = "";
		String page = "";
		int paykind = 0;
		
		if(item_name.equals("펫 시터 결제")) {
			url = "/tpj/sitter/paySuccess";
			page = "/tpj/sitter/sitter";
			paykind = 1;
		} else if(item_name.equals("펫 훈련 결제")) {
			url = "/tpj/trainer/paySuccess";
			page = "/tpj/trainer/trainerSearch";
			paykind = 2;
		} else if(item_name.equals("프리미엄 결제")) {
			url = "/tpj/pay/subscribe";
			paykind = 3;
			primarykey = cust_id;
			page = "/tpj/cust/main";
		} else if(item_name.equals("비지니스 결제")) {
			url = "/tpj/pay/subscribe";
			paykind = 4;
			primarykey = cust_id;
			page = "/tpj/cust/main";
		}
		
		model.addAttribute("item_name", item_name);
		model.addAttribute("primarykey", primarykey);
		model.addAttribute("price", price);
		model.addAttribute("url", url);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		model.addAttribute("paykind", paykind);
		model.addAttribute("id", cust_id);
		
		return "customer/payment/request";
	}
	
	// 결제 - 구독 결제인 경우 고객 테이블 업데이트
	@RequestMapping("subscribe")
	@ResponseBody
	public int premiumPay(HttpServletRequest req, Model model) {
		
		// 테이블에 update 할 PK 및 프리미엄/비지니스 item_name
		String primarykey = req.getParameter("primarykey");
		String item_name = req.getParameter("item_name");
		
		// 구독 유효기간 설정
		Date date = new Date();
		
		// Date format
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		// 오늘 날짜로 변환
		String today = sdf.format(date);
		        
		Calendar cal = Calendar.getInstance();
		
		// 현재날짜로 부터 한달뒤를 계산
		cal.add(Calendar.MONTH, +1);
		Date currentTime=cal.getTime();
		
		String release = sdf.format(currentTime);
		
		// 정보를 map에 담는다.
		Map<String, Object> map = new HashMap<>();
		
		map.put("cust_id", primarykey);
		map.put("today", today);
		map.put("release", release);
		
		// item_name 구분
		if(item_name.equals("프리미엄 결제")) map.put("AUTHOR", "ROLE_PREMIUM");
		else if (item_name.equals("비지니스 결제")) map.put("AUTHOR", "ROLE_BUSINESS");
		
		// 업데이트 완료 여부 반환
		return dao.updateSubscribe(map);
	}
	
	
	// 결제 성공시 - 결제 이력 테이블 insert
	@RequestMapping(value = "paySuccess", method = RequestMethod.GET )
	@ResponseBody
	public int paySuccess(HttpServletRequest req, Model model) {
		   
		   // 결제 유형, 금액, 고객 id 정보 받기
		   String paykind = req.getParameter("kind");
		   int price = Integer.parseInt(req.getParameter("price"));
		   String id = req.getParameter("id");
		   
		   // 수수료 계싼
		   float fee = (float) (price * 5) / 100;
		   
		   // 결제 정보를 map에 담기
		   Map<String, Object> map = new HashMap<>();
		   
		   map.put("PAYKIND_CD", paykind);
		   map.put("CUST_ID", id);
		   map.put("BY_SUM", price);
		   map.put("BY_FEES", fee);
		   
		   // 결제이력 생성 완료 여부를 반환
		   return dao.insertPayhistory(map);
	}
}
