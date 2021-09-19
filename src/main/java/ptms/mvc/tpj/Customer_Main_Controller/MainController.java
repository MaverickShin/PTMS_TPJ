package ptms.mvc.tpj.Customer_Main_Controller;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.Customer_Main_Service.MainServiceImpl;
<<<<<<< HEAD
import ptms.mvc.tpj.NoticeBoardService.userInfo_NoticeBoard_service;
=======
import ptms.mvc.tpj.emailHandler.emailSender;
>>>>>>> 23d2693f68fb0d65f2c011b20f1e643cbf4e429e

@RequestMapping("/cust")
@Controller
public class MainController {
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainServiceImpl service;
	
	@Autowired
<<<<<<< HEAD
	userInfo_NoticeBoard_service qnaservice;
=======
	emailSender emailsender;
>>>>>>> 23d2693f68fb0d65f2c011b20f1e643cbf4e429e
	
	// 메인페이지 이동
	@RequestMapping({"", "main"})
	public String main() {
		return "main/index";
	}
	
	@RequestMapping(value = "confirmid", method = RequestMethod.GET)
	@ResponseBody
	public int confirmid(HttpServletRequest req, Model model) {
		
		int cnt = service.confirmId(req, model);
		
		return cnt;
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("join")
	public String join() {
		return "main/join/join";
	}
	
	// 회원가입 처리
	@RequestMapping("joinaction")
	public String joinaction(HttpServletRequest req, Model model) {
		
		service.signInAction(req, model);
		
		return "main/join/joinaction";
	}
	
	// 이메일 인증 전송
	@RequestMapping(value = "mailAction", method = RequestMethod.GET)
	@ResponseBody
	public int mainAction(HttpServletRequest req) {
		
		log.info("컨트롤러 - 이메일 인증 전송");
		
		String userEmail = req.getParameter("cust_em");
		int authCode = 0;
		String authCodes = "";
		int cnt = 0;
		int result = 0;
		
		if(userEmail != null && !userEmail.isEmpty()) {
			for (int i = 0; i < 6; i++) {
				authCode = (int) (Math.random()*9+1);
				authCodes += Integer.toString(authCode);
			}
		}
		try {
			cnt = emailsender.sender(userEmail, authCodes);
			
			if(cnt == 1) {
				result = Integer.parseInt(authCodes);
			} else {
				result = 0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 로그인 페이지 이동
	@RequestMapping("login")
	public String login() {
		
		log.info("컨트롤러 - 로그인 페이지");
		
		return "main/login/login";
	}
	
	// 반려인/펫 관리 - 내정보관리
	@RequestMapping("MyInfo")
	public String MyInfo() {
		log.info("컨트롤러 - 반려인/펫 관리 - 내정보 관리");
		// 서비스에서 로그인한 정보 가져오기
		
		return "customer/mypage/MyInfo";
	}
	
	// 반려인/펫 관리 - 내정보관리
	@RequestMapping("MyPet")
	public String MyPet() {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPet");
		// 서비스에서 펫 정보 가져오기
		
		return "customer/mypage/MyPet";
	}
	
	// 반려인/펫 관리 - 내정보관리
	@RequestMapping("SitterProfile")
	public String SitterProfile() {
		log.info("컨트롤러 - 반려인/펫 관리 - SitterProfile");
		// 서비스에서 펫시터 정보 가져오기
		
		return "customer/mypage/SitterProfile";
	}
	
	// 일정표
   @RequestMapping("calendar")
   public String calendar() {
      
      log.info("컨트롤러 - 일정표 페이지");
      
      return "customer/calendar/calendar";
   }
	   
   @RequestMapping("contact")
   public String contact() {
	   
	   return "customer/health/contact";
   }
   
   @RequestMapping("nutrient")
   public String nutrient() {
	   
	   return "customer/health/NUTRIENT_INFO";
   }
   
   // 구독 페이지
   @RequestMapping("subscribe")
   public String subscribe() {
      
      log.info("컨트롤러 - 구독 페이지");
      
      return "customer/subscribe/subscribe";
   }   
   
   // 위치안내
   @RequestMapping("location")
   public String location() {
	   
	   return "customer/location/location";
   }
   
   @RequestMapping("gps")
   public String gps() {
	   
	   return "customer/gps/gps";
   }

   @RequestMapping("matchingMain")
   public String matchingMain(HttpServletRequest req, Model model) {
      log.info("url ==> matchingMain");
      
      return "customer/matching/matchingMain";
   }  
   
   @RequestMapping("qnaList")
	public String board(HttpServletRequest req, Model model) {
		log.info("qnaList => qnaList");
		
		qnaservice.QNA_Notice_Board_ListUp(req, model);
		
		return "customer/board/qnaList";
	}
   
   @RequestMapping("TrainerProfile")
   public String TrainerProfile() {
      log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfile");
      // 서비스에서 훈련사 정보 가져오기
      
      return "customer/mypage/TrainerProfile";
   }
   
   // 반려인/펫 관리 - 내정보관리
   @RequestMapping("buyList")
   public String buyList() {
      log.info("컨트롤러 - 반려인/펫 관리 - buyList");
      // 서비스에서 결제내역 정보 가져오기
      
      return "customer/mypage/buyList";
   }
   
}

