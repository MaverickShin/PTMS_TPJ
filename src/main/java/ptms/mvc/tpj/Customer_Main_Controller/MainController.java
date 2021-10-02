package ptms.mvc.tpj.Customer_Main_Controller;



import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;
import ptms.mvc.tpj.Customer_Main_Service.MainServiceImpl;
import ptms.mvc.tpj.Sitter_Service.SitterServiceImpl;
import ptms.mvc.tpj.TrainerService.TrainerServiceImpl;
import ptms.mvc.tpj.emailHandler.emailSender;
import ptms.mvc.tpj.util.ImageUploaderHandler;

@MultipartConfig(location = "C:\\Dev88\\workspace\\PTMS_TPJ\\src\\main\\webapp\\resources\\upload", fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@RequestMapping("/cust")
@Controller
public class MainController {
	private static final long serialVersionUID = 1L;
    private static final String IMG_UPLOAD_DIR = "C:\\\\Dev88\\\\workspace\\\\PTMS_TPJ\\\\src\\\\main\\\\webapp\\\\resources\\\\upload";
    											//D:\\\\Dev88\\\\workspace\\\\플젝명\\\\WebContent\\\\upload
	
    private ImageUploaderHandler uploader;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainServiceImpl service;
	
	@Autowired
	TrainerServiceImpl TrainerService;
	
	@Autowired
	SitterServiceImpl SitterService;
	 
	@Autowired
	emailSender emailsender;
	
	@Autowired
	MainDAOImpl dao;
	
	// 메인페이지 이동
	@RequestMapping({"", "main", "Newsletter"})
	public String main(HttpServletRequest req, Model model) {
		
		service.Newsletter(req, model); 
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
		
		// 회원정보 인증 및 상세 페이지
		service.custDetail(req, model);
		
		return "customer/mypage/MyInfo";
	}
	
	//회원수정 처리페이지
	@RequestMapping("MyInfoAction")
	public String MyInfoAction(HttpServletRequest req, Model model) {
		log.info("url ==> MyInfoAction");
		
		// 회원정보 수정 처리
		service.custUpdate(req, model);
		
		return "customer/mypage/MyInfoAction";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping("delCustomer")
	public String delCustomer(HttpServletRequest req, Model model) {
		log.info("url ==> delCustomer");
		
		service.custDelete(req, model);
		
		return "customer/mypage/delCustomer";
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
		
		// 펫 등록
		service.petInAction(req, model);
		
		
		return "customer/mypage/MyPetInsertAction";
	}
	
	//상점 목록 페이지
	@RequestMapping("MyPetList")
	public String MyPetList(HttpServletRequest req, Model model) {
		log.info("url ==> PetList");

		// 펫 목록
		service.petList(req, model);
		
		return "customer/mypage/MyPetList";
	}
	
	// 반려인/펫 관리 - My Pet 수정페이지
	@RequestMapping("MyPetUpdate")
	public String MyPetUpdate(HttpServletRequest req, Model model){
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetUpdate");
		
		// 펫 수정 화면
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
		
		// 펫 수정 처리
		service.petUpdateAction(req, model);
		
		return "customer/mypage/MyPetUpdateAction";
	}
	
	// 반려인/펫 관리 - My Pet 삭제
	@RequestMapping("MyPetDelete")
	public String MyPetDelete(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 반려인/펫 관리 - MyPetDelete");
		
		// 펫 삭제 처리
		service.petDelete(req, model);
		
		return "customer/mypage/MyPetDelete";
	}
	
	// 일정표
	
   /*
    * 2021-09-24
    * 나도웅
    * 일정표(달력) 요청 페이지
    */
	/*
	 * @RequestMapping("calendar") public String calendar(HttpServletRequest req,
	 * Model model) { log.info("컨트롤러 - 일정표 페이지");
	 * 
	 * //service.callCalendar(req, model);
	 * 
	 * return "customer/calendar/calendar"; }
	 */
   /*
    * 2021-09-24
    * 나도웅
    * 일정 추가 페이지(ajax 로드)
    */
   @RequestMapping("addEvent")
   public String addEvent(HttpServletRequest req, Model model) {
      
      log.info("컨트롤러 - 일정표 페이지");
     // service.addEvent(req, model);
      return "redirect:calendar";
   }
   
   /*
    * 2021-09-24
    * 나도웅
    * 일정 삭제 페이지(ajax 로드)
    */
   @RequestMapping("deleteEvent")
   public String deleteEvent(HttpServletRequest req, Model model) {
      
      log.info("컨트롤러 - 일정표 페이지");
      // service.deleteEvent(req, model);
      return "redirect:calendar";
   }
   
   // 반려동물 건강관리 
   @RequestMapping("contact")
   public String contact(Model model) {
	   
	// Jsoup를 이용해서 반려동물 지식정보 크롤링
		String url = "http://www.mypetgene.com/sub/sub05_05.php?boardid=board4";
		Document doc = null;

		// for문을 돌면서 뉴스 제목들을 가져오기 위한 list
		List<String> list = new ArrayList<String>();

		try {
			// Jsoup url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. <section class="section-body">
		Elements element = doc.select("div.board-list");
		Elements element1 = element.select("td");
		//Elements element2 = element1.select("")
		// 1. 헤더 부분의 제목을 가져온다.
		// String title = element.select("img").text();
		
		Elements images = element1.select("img");
		
		Elements element2 = element1.select("div.bbs-tit");
		
		Elements title = element2.select("a[href]");
		
		System.out.println("img : " + images);
		
		for (Element link : title) {
			
			String urls = link.attr("abs:href");
			
			String con = link.text();
			
			String sum = "<a href = '" + urls + "'>" + con + "</a>";
			
			list.add(sum);
			
		}
	
		List<String> list2 = new ArrayList<String>();
		
		for (Element imgs : images) {
			
			String img = "<img src = '"+imgs.getElementsByAttribute("src").attr("abs:src")+"'>";
			
			list2.add(img);
		}
		
		List<String> list3 = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list2.size(); j++) {
				String sum = "<div class = 'contents'>"+list2.get(j)+list.get(j)+"</div>";
				
				System.out.println("sum : " + sum);
				list3.add(sum);
			}
		}

	   model.addAttribute("list", list3);
	   
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
   
// *************** 제휴정보 크롤링 테스트용 **************** - 진수 21.09.25
   @RequestMapping("CrawlingTest")
   public String CrawlingTest(HttpServletRequest req, Model model) {
	   service.AffiliateCrwaling(req, model);
	   return "customer/calendar/CrawlingTest";
   }
// *********************************************************
   
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
      
      // 훈련사 정보 수정 화면
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
	   // 훈련사 정보 수정 처리
	   TrainerService.updateTrainerAction(req, model);
	   
	   return "customer/mypage/TrainerProfileAction";
   }
   
   // 반려인/펫 관리 - 훈련사 탈퇴
   @RequestMapping("TrainerDel")
   public String TrainerDel(HttpServletRequest req, Model model) {
	   log.info("컨트롤러 - 반려인/펫 관리 - SitterProfile");
	   
	   TrainerService.deleteTrainer(req, model);
	   
	   return "customer/mypage/TrainerDel";
   }
   
   // 반려인/펫 관리 - 시터 수정페이지
   @RequestMapping("SitterProfile")
   public String SitterProfile(HttpServletRequest req, Model model) {
      log.info("컨트롤러 - 반려인/펫 관리 - SitterProfile");
      
      // 시터 정보 수정 프로필 화면
      SitterService.updateSitter(req, model);
      
      return "customer/mypage/SitterProfile";
   }
   
   // 반려인/펫 관리 - 시터 수정 처리
   @RequestMapping("SitterProfileAction")
   public String SitterProfileAction(HttpServletRequest req, Model model) throws ParseException {
	   log.info("컨트롤러 - 반려인/펫 관리 - SitterProfileAction");
	   
	   // 시터 정보 수정 처리
	   SitterService.updateSitterAction(req, model);
	   
	   return "customer/mypage/SitterProfileAction";
   }
   
   // 반려인/펫 관리 - 시터 탈퇴
   @RequestMapping("SitterDel")
   public String SitterDel(HttpServletRequest req, Model model) {
	   log.info("컨트롤러 - 반려인/펫 관리 - SitterDel");
	   
	   SitterService.deleteSitter(req, model);
	   
	   return "customer/mypage/SitterDel";
   }
   
   // 반려인/펫 관리 - 결제내역
   @RequestMapping("buyList")
   public String buyList() {
      log.info("컨트롤러 - 반려인/펫 관리 - buyList");
      // 서비스에서 결제내역 정보 가져오기
      
      return "customer/mypage/buyList";
   }
   
   @RequestMapping("test")
   public String test() {
	  return "customer/payment/test";
   }
   
}
