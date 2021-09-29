package ptms.mvc.tpj.Payment_Controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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
			url = "/tpj/cust/paySuccess";
			paykind = 3;
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
	
	// 1회성 카카오 페이(시터, 훈련사 중개)
	@RequestMapping("kpOnce")
	public String kpOnetime(HttpServletRequest req, Model model){
		log.info("cnt pay kpOnce");
		
		String paykind = req.getParameter("paykind");
		String price = req.getParameter("payPrice");
		String item_name = req.getParameter("item_name");
		String cust_id = (String)req.getSession().getAttribute("cust_id");
		CustomerVO vo = dao.custDetailInfo(cust_id);
		
		
		URL url;
		try {
			// 카카오페이 주소 연결
			url = new URL("https://kapi.kakao.com/v1/payment/ready");
			
			
			/* ------------------ 카카오페이 서버연결 -------------------- */
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// 통신 방식 무조건 post
			conn.setRequestMethod("POST");
			
			/* 프로퍼티 설정 */
			// 인증자 설정 : 카카오페이 admin key 부여 및 콘텐츠 타입 설정 - 콘텐츠 타입은 kakao에서 제안하는 공개값 (공통)
			conn.setRequestProperty("Authorization", "KakaoAK 42e4b3500327e7794b4a7d9b95409308");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// 서버에 전달할 값이 있으면 true
			conn.setDoOutput(true);
			/* ------------------ 카카오페이 서버연결 -------------------- */
			
			
			
			/* ------------------ 파라미터 설정 -------------------- */
			Map<String, String> params = new HashMap<String, String>();
			params.put("cid", "TC0ONETIME");						// 샘플 코드
			params.put("partner_order_id", "partner_order_id");		
			params.put("partner_user_id", "partner_user_id");
			params.put("item_name", item_name); //req.getParameter("item_name")
			params.put("item_code", paykind); //req.getParameter("item_code")
			params.put("quantity", "1");
			params.put("total_amount", price); //req.getParameter("total_amount")
			params.put("tex_free_amount","0");
			params.put("approval_url","https://localhost:8080/tpj/pay/approval");
			params.put("cancel_url","https://localhost:8080/tpj/pay/cancel");
			params.put("fail_url","https://localhost:8080/tpj/pay/fail");
			
			
			String strParams = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				strParams += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			
			/* -------- 데이터 output 설정  ------------ */
			// 보내는이 설정
			OutputStream os = conn.getOutputStream();
			// 데이터 보내는이 설정
			DataOutputStream dos = new DataOutputStream(os);
			// 문자열 데이터를 byte로 변환
			dos.writeBytes(strParams);
			// 자원 해제
			dos.close();
			
			// 실행 결과 코드를 담는 변수 result에 getResponseCode함수를 통해 대입
			int result = conn.getResponseCode();
			
			// 받는이 변수 선언
			InputStream in;
			
			// http 코드에서 정상적인 통신을 뜻하는 코드는 200이다.
			if(result == 200) { // 통신코드 200 (통신이 정상일 때)
				// 받는이 변수에 결과를 대입
				in = conn.getInputStream();
			} else {
				// 에러일 경우 에러상태를 대입
				in = conn.getErrorStream();
			}
			
			// 데이터를 읽어주는 reader로 형 변환
			InputStreamReader isr = new InputStreamReader(in);
			
			// 읽어들인 데이터는 byte형 이므로 문자열로 다시 형변환 (BufferedReader)
			BufferedReader bfr = new BufferedReader(isr);
		
			
			return bfr.readLine();
			/* -------- 데이터 output 설정  ------------ */
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
	
	// 결제 성공시 - 결제 정보 처리
	@RequestMapping("approval")
	public String approval(HttpServletRequest req, Model model){
		
		String imp_uid = req.getParameter("imp_uid");
		String merchant_uid = req.getParameter("merchant_uid");
		
		System.out.println("uid : " + imp_uid);
		System.out.println("merchant_uid : " + merchant_uid);
		
		return imp_uid;
	}
	
	 @RequestMapping(value = "paySuccess", method = RequestMethod.GET )
	 @ResponseBody
	 public int paySuccess(HttpServletRequest req, Model model) {
		   
		   String paykind = req.getParameter("kind");
		   int price = Integer.parseInt(req.getParameter("price"));
		   String id = req.getParameter("id");
		   float fee = (float) (price * 0.5);
		   
		   System.out.println("paykind : " + paykind);
		   System.out.println("price : " + price);
		   System.out.println("id : " + id);
		   
		   Map<String, Object> map = new HashMap<>();
		   
		   map.put("PAYKIND_CD", paykind);
		   map.put("CUST_ID", id);
		   map.put("BY_SUM", price);
		   map.put("BY_FEES", fee);
		   
		   int result = dao.insertPayhistory(map);
		   
		   return result;
	 }
}
