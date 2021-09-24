package ptms.mvc.tpj.Customer_Main_Controller;



import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import ptms.mvc.tpj.Customer_Main_Service.MainServiceImpl;
import ptms.mvc.tpj.TrainerService.TrainerServiceImpl;
import ptms.mvc.tpj.emailHandler.emailSender;
import ptms.mvc.tpj.util.ImageUploaderHandler;

@MultipartConfig(location = "D:\\Dev88\\workspace\\PTMS_TPJ\\src\\main\\webapp\\resources\\upload", fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@RequestMapping("/cust")
@Controller
public class MainController {
	private static final long serialVersionUID = 1L;
    private static final String IMG_UPLOAD_DIR = "D:\\\\Dev88\\\\workspace\\\\PTMS_TPJ\\\\src\\\\main\\\\webapp\\\\resources\\\\upload";
    											//D:\\\\Dev88\\\\workspace\\\\플젝명\\\\WebContent\\\\upload
	
    private ImageUploaderHandler uploader;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainServiceImpl service;
	
	@Autowired
	TrainerServiceImpl TrainerService;
	
	@Autowired
	emailSender emailsender;
	
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
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "main/index";
	}
	
	// 반려인/펫 관리 - 내정보관리 인증화면
	@RequestMapping("MyInfoUser")
	public String MyInfoUser(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - 내정보 관리 인증화면");
		
		return "customer/mypage/MyInfoUser";
	}
	
	// 반려인/펫 관리 - 내정보관리
	@RequestMapping("MyInfo")
	public String MyInfo(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - 내정보 관리");
		service.custDetail(req, model);
		
		return "customer/mypage/MyInfo";
	}
	
	//회원수정 처리페이지
	@RequestMapping("MyInfoAction")
	public String MyInfoAction(HttpServletRequest req, Model model) {
		log.info("url ==> MyInfoAction");
		
		service.custUpdate(req, model);
		
		return "customer/mypage/MyInfoAction";
	}

/*
	// 반려인/펫 관리 - My Pet 인증화면
	@RequestMapping("MyPetUser")
	public String MyPetUser(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - 내정보 관리 인증화면");
		
		return "customer/mypage/MyPetUser";
	}
*/	
	
	// 반려인/펫 관리 - My Pet 추가
	@RequestMapping("MyPet")
	public String MyPet(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPet");
		
		return "customer/mypage/MyPet";
	}
	
	// 반려인/펫 관리 - My Pet 추가 처리페이지
	@RequestMapping("MyPetInsertAction")
	public String MyPetInsertAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetInsertAction");
		
		// 이미지 업로드 시작
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
			uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
		    uploader.imageUpload(req, model);
		}
		// 이미지 업로드 끝
		service.petInAction(req, model);
		
		
		return "customer/mypage/MyPetInsertAction";
	}
	
	//상점 목록 페이지
	@RequestMapping("MyPetList")
	public String MyPetList(HttpServletRequest req, Model model) {
		log.info("url ==> PetList");

		service.petList(req, model);
		
		return "customer/mypage/MyPetList";
	}
	
	// 반려인/펫 관리 - My Pet 수정페이지
	@RequestMapping("MyPetUpdate")
	public String MyPetUpdate(HttpServletRequest req, Model model){
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetUpdate");
		
		service.petUpdate(req, model);
		
		return "customer/mypage/MyPetUpdate";
	}
	
	// 반려인/펫 관리 - My Pet 수정 처리페이지
	@RequestMapping("MyPetUpdateAction")
	public String MyPetUpdateAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetUpdateAction");
		
		// 이미지 업로드 시작
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
			uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
		    uploader.imageUpload(req, model);
		}
		// 이미지 업로드 끝
		
		service.petUpdateAction(req, model);
		
		return "customer/mypage/MyPetUpdateAction";
	}
	
	// 반려인/펫 관리 - My Pet 삭제
	@RequestMapping("MyPetDelete")
	public String MyPetDelete(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetDelete");
		
		service.petDelete(req, model);
		
		return "customer/mypage/MyPetDelete";
	}
	
	// 반려인/펫 관리 - 펫시터 관리
	@RequestMapping("SitterProfile")
	public String SitterProfile() {
		log.info("컨트롤러 - 반려인/펫 관리 - SitterProfile");
		// 서비스에서 펫시터 정보 가져오기
		
		return "customer/mypage/SitterProfile";
	}
	
	// 일정표
   @RequestMapping("calendar")
   public String calendar(HttpServletRequest req, Model model) {
      
      log.info("컨트롤러 - 일정표 페이지");
      service.callCalendar(req, model);
      return "customer/calendar/calendar";
   }
   
   // 반려동물 건강관리 
   @RequestMapping("contact")
   public String contact(Model model) {
	   
	   return "customer/health/contact";
   }

   // 자가진단 
   @RequestMapping("selfdiagnosis")
   public String selfdiagnosis() {
	   
	   return "customer/health/selfdiagnosis";
   }
   
   // 질병정보 크롤링  - 21.09.23. 셀레니움 방식에서 Jsoup으로 변경
   @RequestMapping("symptom")
   public String symptom(HttpServletRequest req, Model model) {
	   
	   service.SymptomCrawling(req, model);
	   
	   return "customer/health/Symptom_Info_View";
   }

   // 반려동물 지식정보 크롤링 추가 - 21.09.23.
   @RequestMapping("sense")
   public String sense(HttpServletRequest req, Model model) {
	   
	   service.SenseCrawling(req, model);
	   
	   return "customer/health/Sense_Info_View";
   }

   // 반려동물 영양정보 크롤링 추가 - 21.09.24.
   @RequestMapping("nutrient")
   public String nutrient(HttpServletRequest req, Model model) {
	   
	   service.NutrientCrawling(req, model);  
	   
	   return "customer/health/Nutrient_Info_View";
   }
   
   // 구독 페이지
   @RequestMapping("subscribe")
   public String subscribe() {
      
      log.info("컨트롤러 - 구독 페이지");
      
      return "customer/subscribe/info";
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
   
   @RequestMapping("board")
	public String board(HttpServletRequest req, Model model) {
		log.info("qnaList => qnaList");
		
		
		return "customer/board/qnaList";
	}
   
   // 반려인/펫 관리 - 훈련사 수정페이지
   @RequestMapping("TrainerProfile")
   public String TrainerProfile(HttpServletRequest req, Model model) {
      log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfile");
      
      TrainerService.updateTrainer(req, model);
      
      return "customer/mypage/TrainerProfile";
   }
   
   // 반려인/펫 관리 - 훈련사 수정 처리
   @RequestMapping("TrainerProfileAction")
   public String TrainerProfileAction(HttpServletRequest req, Model model) throws ParseException {
	   log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfileAction");
	   
	// 이미지 업로드 시작
/*	String contentType = req.getContentType();
	if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
		uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
		uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
	    uploader.imageUpload(req, model);
	}
	// 이미지 업로드 끝
*/	   
	   TrainerService.updateTrainerAction(req, model);
	   
	   return "customer/mypage/TrainerProfileAction";
   }
   
   // 반려인/펫 관리 - 결제내역
   @RequestMapping("buyList")
   public String buyList() {
      log.info("컨트롤러 - 반려인/펫 관리 - buyList");
      // 서비스에서 결제내역 정보 가져오기
      
      return "customer/mypage/buyList";
   }
   
}
