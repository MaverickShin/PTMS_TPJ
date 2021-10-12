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

import ptms.mvc.tpj.CustVO.PayVO;
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
		
		//service.petIssue(req, model);
		
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
		
		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		int signchkCnt = dao.sitterSigninChk(CUST_ID);
		model.addAttribute("signchkCnt", signchkCnt);
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
	   
	    // Jsoup를 이용해서 반려동물 정보 크롤링
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

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. 
		Elements element = doc.select("div.board-list");
		Elements element1 = element.select("td");
		Elements images = element1.select("img");
		Elements element2 = element1.select("div.bbs-tit");
		Elements title = element2.select("a[href]");
		
		// 엘리먼트에 최종 select 변수 대입
		for (Element link : title) {
			
			// a 태그의 url 절대경로를 구하여 클릭시 해당 페이지로 이동할 수 있도록 한다.  
			String urls = link.attr("abs:href");
			
			// 해당 컨텐츠의 타이틀을 가져온다.
			String con = link.text();
			
			// 문자열로 합성하여 태그 생성
			String sum = "<a href = '" + urls + "' target='_blank'><span>" + con + "</span>";
			
			list.add(sum);
			
		}
	
		// 이미지 경로를 담을 list 생성
		List<String> list2 = new ArrayList<String>();
		
		for (Element imgs : images) {
			
			// 이미지 절대 경로를 구한다.
			String img = "<img src = '"+imgs.getElementsByAttribute("src").attr("abs:src")+"'>";
			
			list2.add(img);
		}
		
		// 두 태그를 문자열을 합성 
		List<String> list3 = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list2.size(); j++) {
				String sum = "<div class = 'contents'>"+list.get(j)+list2.get(j)+"</a></div>";
				
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
	   
	   return "news/Symptom_Info";
   }

   // 반려동물 지식정보 크롤링 추가 - 21.09.23.
   @RequestMapping("sense")
   public String sense(HttpServletRequest req, Model model) {
	   
	   service.SenseCrawling(req, model);
	   
	   return "customer/health/Sense_Info_View";
   }

   // 반려동물 영양정보 크롤링 추가 - 21.09.24.
   @RequestMapping(value = "nutrient", method = RequestMethod.GET)
   public String nutrient(HttpServletRequest req, Model model) {
	   
	   service.NutrientCrawling(req, model);  
	   
	   return "news/Nutrient_Info";
   }
   
   // *************** 진수 크롤링  **************** 
   
   @RequestMapping("CrawlingTest")
   public String CrawlingTest(HttpServletRequest req, Model model) {
	   service.AffiliateCrwaling(req, model);
	   return "customer/calendar/CrawlingTest";
   }
   
   // 편의 정보- 진수 21.09.25
   @RequestMapping("convenience")
   public String convenience(HttpServletRequest req, Model model) {
	   
	   
	   return "news/Convenience_Info";
   }
   
   // *************** 진수 크롤링 - 끝 -  **************** 
   
   // 구독 페이지
   @RequestMapping("subscribe")
   public String subscribe() {
      
      log.info("컨트롤러 - 구독 페이지");
      
      return "customer/subscribe/info";
   }   
   
   // 위치안내
   @RequestMapping("location")
   public String location(HttpServletRequest req, Model model) {
	   
	   service.Convenience_Info(req, model);
	   
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
   
   // qna 목록
   @RequestMapping("qnalist")
	public String board(HttpServletRequest req, Model model) {
		log.info("qnaList => qnaList");
		
		service.qnaList(req, model);
		
		return "customer/board/qnaList";
	}
   
   // qna 목록 2
   @RequestMapping("qnalist2")
   public String board2(HttpServletRequest req, Model model) {
		log.info("qnaList => qnaList");
		
		service.qnaList(req, model);
		
		return "customer/board/qnaListClone";
	}
   
   // qna 등록
   @RequestMapping("qnaadd")
   public String qnaadd(HttpServletRequest req, Model model) {
		log.info("qnaadd => qnaadd");
		
		service.qnaAdd(req, model);
		
		service.qnaList(req, model);
		
		return "customer/board/qnaListClone";
	}
   
   // qna 수정
   @RequestMapping("qnaupdate")
   public String qnaupdate(HttpServletRequest req, Model model) {
		log.info("qnaupdate => qnaupdate");
		
		service.qnaUpdate(req, model);
		
		service.qnaList(req, model);
		
		return "customer/board/qnaListClone";
	}
   
   // qna 삭제
   @RequestMapping("qnadelete")
   public String qnadelete(HttpServletRequest req, Model model) {
		log.info("qnadelete => qnadelete");
		
		service.qnaDelete(req, model);
		
		service.qnaList(req, model);
		
		return "customer/board/qnaListClone";
	}
   
   // faq 목록
   @RequestMapping("faqlist")
   public String faqlist(HttpServletRequest req, Model model) {
		log.info("faqlist => faqlist");
		
		service.faqList(req, model);
		
		return "customer/board/faqList";
	}
   
   // faq 목록2
   @RequestMapping("faqlist2")
   public String faqlist2(HttpServletRequest req, Model model) {
		log.info("fqalist => fqalist");
		
		service.faqList(req, model);
		
		return "customer/board/faqListClone";
	}
   
   
   
   // 반려인/펫 관리 - 훈련사 수정페이지
   @RequestMapping("TrainerProfile")
   public String TrainerProfile(HttpServletRequest req, Model model) throws ServletException, IOException {
      log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfile");
      
      // 훈련사 정보 수정 화면
      TrainerService.updateTrainer(req, model);
      
      return "customer/mypage/TrainerProfile";
   }
   
   // 반려인/펫 관리 - 훈련사 수정페이지
   @RequestMapping("TrainerProfile2")
   public String TrainerProfile2(HttpServletRequest req, Model model) throws ServletException, IOException {
      log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfile");
      
      // 훈련사 정보 수정 화면
      TrainerService.updateTrainer(req, model);
      
      return "customer/mypage/TrainerProfile2";
   }
   
   // 반려인/펫 관리 - 훈련사 수정 처리
   @RequestMapping("TrainerProfileAction")
   public String TrainerProfileAction(HttpServletRequest req, Model model) throws ParseException, ServletException, IOException {
	   log.info("컨트롤러 - 반려인/펫 관리 - TrainerProfileAction");
	   
		// 이미지 업로드 시작
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
			uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
		    uploader.imageUpload(req, model);
		}
		// 이미지 업로드 끝
	   
	   // 훈련사 정보 수정 처리
	   TrainerService.updateTrainerAction(req, model);
	   
	   return "customer/mypage/TrainerProfileAction";
   }
   
   // 반려인/펫 관리 - 훈련사 탈퇴
   @RequestMapping("TrainerDel")
   public String TrainerDel(HttpServletRequest req, Model model) {
	   log.info("컨트롤러 - 반려인/펫 관리 - TrainerDel");
	   
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
   public String SitterProfileAction(HttpServletRequest req, Model model) throws ParseException, ServletException, IOException {
	   log.info("컨트롤러 - 반려인/펫 관리 - SitterProfileAction");
	   
		// 이미지 업로드 시작
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
			uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
		    uploader.imageUpload(req, model);
		}
		// 이미지 업로드 끝
	   
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
   public String buyList(HttpServletRequest req, Model model) {
      log.info("컨트롤러 - 반려인/펫 관리 - buyList");
      
      	// 결제내역 정보 가져오기
      	service.payList(req, model);
      
        return "customer/mypage/buyList";
   }
   
   
   // 푸터 하단 병원정보 - 21.10.03 도빈
   @RequestMapping("hospitalInfo")
   public String hospitalInfo(HttpServletRequest req, Model model) {
	   
	   service.HospitalInfo(req, model);
	   
	   return "news/Convenience_Info";
   }
   
   // 로그아웃 요청
   @RequestMapping("logoutrequest")
   public String logout() {
	   return "main/login/logoutrequest";
   }
   
   // 소변 이미지
   @RequestMapping(value = "urineimg", method = RequestMethod.POST, consumes ={"multipart/form-data"})
   @ResponseBody
   public String urineimg(HttpServletRequest req, Model model) throws ServletException, IOException {
	   
	   String img = "/tpj/resources/upload/" + (String) req.getParameter("urine_img"); // 이미지
	   
	   img = new String(img.getBytes("8859_1"), "utf-8");
	   
	   System.out.println("img : " + img);
	   
	   return img;
   }
   
   @RequestMapping("urinetest")
   public String urinetest() {
	   return "customer/urine/urine";
   }
}
