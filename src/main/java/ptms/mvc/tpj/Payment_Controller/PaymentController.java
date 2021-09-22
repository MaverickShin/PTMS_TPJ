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

import ptms.mvc.tpj.Payment_Service.PaymentService;

@RequestMapping("/pay")
@Controller
public class PaymentController {
	
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService service;
	
	// 결제 요청창 로드
	@RequestMapping("request")
	public String payOneTime(HttpServletRequest req, Model model){
		log.info("payment cnt request");
		return "customer/payment/request";
	}
	
	// 1회성 카카오 페이(시터, 훈련사 중개)
	@RequestMapping("kpOnce")
	public String kpOnetime(HttpServletRequest req, Model model){
		log.info("cnt pay kpOnce");
		URL url;
		try {
			url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 65102fb923c8a1bcfa0394a9a2be3c59");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			
			Map<String, String> params = new HashMap<String, String>();
			params.put("cid", "TC0ONETIME");
			params.put("partner_order_id", "partner_order_id");
			params.put("partner_user_id", "partner_user_id");
			params.put("item_name","1회구독"); //req.getParameter("item_name")
			params.put("item_code","1"); //req.getParameter("item_code")
			params.put("quantity", "1");
			params.put("total_amount","29900"); //req.getParameter("total_amount")
			params.put("tex_free_amount","0");
			params.put("approval_url","https://localhost:8080/tpj/customer/payment/approval");
			params.put("cancel_url","https://localhost:8080/tpj/customer/payment/cancel");
			params.put("fail_url","https://localhost:8080/tpj/customer/payment/fail");
			
			String strParams = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				strParams += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			
			OutputStream os = conn.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(strParams);
			dos.close();
			
			int result = conn.getResponseCode();
			
			InputStream in;
			if(result == 200) {
				in = conn.getInputStream();
			} else {
				in = conn.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader bfr = new BufferedReader(isr);
			
			bfr.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
	
	// 정기구독 결제창 로드
	@RequestMapping("subscribe")
	public String paySubscribe(HttpServletRequest req, Model model){
		log.info("");
		return "";
	}
	
	// 정기구독 카카오 페이
}
