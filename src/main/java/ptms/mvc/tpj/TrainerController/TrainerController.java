package ptms.mvc.tpj.TrainerController;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.TrainerService.TrainerServiceImpl;
import ptms.mvc.tpj.util.ImageUploaderHandler;

@MultipartConfig(location = "C:\\Dev88\\PTMS_TPJ\\src\\main\\webapp\\resources\\upload", fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@RequestMapping("/trainer")
@Controller
public class TrainerController {
   private static final String IMG_UPLOAD_DIR = "C:\\\\Dev88\\\\PTMS_TPJ\\\\src\\\\main\\\\webapp\\\\resources\\\\upload";
												//D:\\\\Dev88\\\\workspace\\\\플젝명\\\\WebContent\\\\upload

   private ImageUploaderHandler uploader;
	
   // private Logger log = Logger.getLogger(this.getClass());
   private static final Logger log = LoggerFactory.getLogger(TrainerController.class);

   @Autowired
   TrainerServiceImpl trainerservice;
   
   @RequestMapping("main")
   public String main(HttpServletRequest req, Model model) {
      log.info("url ==> index");
      
      return "main/index";
   }
   
   //훈련사 조건 검색 페이지
   @RequestMapping("trainerSearch")
   public String TrainerList(HttpServletRequest req, Model model) {
      log.info("url ==> trainerSearch");
      
      trainerservice.sidebar(req, model);
      
      return "customer/trainer/trainerSearch";
   }
   
   //훈련사 조건 충족 목록
   @RequestMapping("trainerMatchingList")
   public String trainerMatchingList(HttpServletRequest req, Model model) {
      log.info("url ==> trainerMatchingList");
      
      trainerservice.TrainerList(req, model);
      
      return "customer/trainer/trainerMatchingList";
   }
   
   // 훈련사 지원
   @RequestMapping("applyTrainer")
   public String applyTrainer(HttpServletRequest req, Model model) {
      log.info("url ==> applyTrainer");
      
      trainerservice.trainerDupChk(req, model);
      
      return "customer/trainer/applyTrainer";
   }
   
   // 훈련사 지원 처리
   @RequestMapping("applyTrainerAction")
   public String applyTrainerAction(HttpServletRequest req, Model model) throws ParseException, ServletException, IOException {
      log.info("url ==> applyTrainerAction");
      
      String tr_kind1_fee = req.getParameter("tr_kind1_fee");
      System.out.println("tr_kind1_fee: " + tr_kind1_fee);
      
      String tr_kind2_fee = req.getParameter("tr_kind2_fee");
      System.out.println("tr_kind2_fee: " + tr_kind2_fee);
      
      String tr_kind3_fee = req.getParameter("tr_kind3_fee");
      System.out.println("tr_kind3_fee: " + tr_kind3_fee);
      
      String tr_kind4_fee = req.getParameter("tr_kind4_fee");
      System.out.println("tr_kind4_fee: " + tr_kind4_fee);
      
		// 이미지 업로드 시작
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
			uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
		    uploader.imageUpload(req, model);
		}
		// 이미지 업로드 끝
      
      trainerservice.insertTrainer(req, model);
      
      return "customer/trainer/applyTrainerAction";
   }
   
   // 훈련사 - 나에게 온 의뢰
   @RequestMapping("requestTrainer")
   public String requestTrainer(HttpServletRequest req, Model model) {
      log.info("url ==> requestTrainer");
      
      trainerservice.TraineeList(req, model);
      
      return "customer/trainer/requestTrainerList";
   }
   
   // 훈련사 - 나에게 온 의뢰 Clone
   @RequestMapping("requestTrainer2")
   public String requestTrainer2(HttpServletRequest req, Model model) {
      log.info("url ==> requestTrainer2");
      
      trainerservice.TraineeList(req, model);
      
      return "customer/trainer/requestTrainerListClone";
   }
   
   // 훈련사 찾기 후 상세페이지로 이동
   @RequestMapping("trainerDetail")
   public String trainerDetail(HttpServletRequest req, Model model) {
      log.info("url ==> trainerDetail");
      
      //상세페이지에 띄울 훈련사 정보 가져오기
      trainerservice.TrainerInfo(req, model);
      
      return "customer/trainer/trainerDetail";
   }

   // 고객이 훈련 신청하기 -> 요청테이블에 INSERT
   @RequestMapping("requestTraining")
   public String requestTraining(HttpServletRequest req, Model model) throws ParseException {
      log.info("url ==> requestTraining");

      trainerservice.reserveTrainer(req, model);
      
      return "customer/trainer/requestTrainingAction";
   }
   
   
   
   // 훈련사가 요청 거절 -> 테이블 요청상태 거절(2)로 update
   @RequestMapping("denyRequestTraining")
   public String denyRequestTraining(HttpServletRequest req, Model model) {
      log.info("url ==> denyRequestTraining");

      trainerservice.updateDenyTraining(req, model);
      return "customer/trainer/denyRequestTrainingAction";
   }
   
   // 훈련사가 요청 수락 -> 테이블 요청상태 수락(1)으로 update
   @RequestMapping("acceptRequestTraining")
   public String acceptRequestTraining(HttpServletRequest req, Model model) {
      log.info("url ==> acceptRequestTraining");

      trainerservice.updateAcceptTraining(req, model);
      return "customer/trainer/acceptRequestTrainingAction";
   }
   
   // 훈련사가 수락한 요청리스트
   @RequestMapping("acceptTrainingList")
   public String acceptTrainingList(HttpServletRequest req, Model model)  {
      log.info("url ==> acceptTrainingList");

      trainerservice.acceptTrainingList(req, model);
      
      return "customer/trainer/requestTrainerListClone";
   }
   
   // 훈련사가 거절한 요청리스트
   @RequestMapping("denyTrainingList")
   public String denyTrainingList(HttpServletRequest req, Model model) {
      log.info("url ==> denyTrainingList");

      trainerservice.denyTrainingList(req, model);
      
      return "customer/trainer/requestTrainerListClone";
   }
   
   // 훈련사가 보는 훈련 완료 리스트
   @RequestMapping("TrainingServiceComplete")
   public String TrainingServiceComplete(HttpServletRequest req, Model model) throws ParseException {
      log.info("url ==> TrainingServiceComplete");

      trainerservice.TrainingServiceComplete(req, model);
      
      return "customer/trainer/requestTrainerListClone";
   }
   
   // 고객용 훈련 요청결과 리스트 - 대기중일때
   @RequestMapping("custReqResult")
   public String custReqResult(HttpServletRequest req, Model model) {
      log.info("url ==> custReqResult");

      trainerservice.custReqResultwait(req, model);
      
      return "customer/trainer/custReqResult";
   }
   
   // 고객용 훈련 요청결과 리스트 - 대기중일때
   @RequestMapping("custReqResult2")
   public String custReqResult2(HttpServletRequest req, Model model) throws ParseException {
      log.info("url ==> custReqResult2");

      trainerservice.custReqResultwait(req, model);
      
      return "customer/trainer/custReqResultClone";
   }
   
   
   
   // 고객용 훈련 요청 취소 - delete
   @RequestMapping("cancelRequestTraining")
   public String cancelRequestTraining(HttpServletRequest req, Model model) {
      log.info("url ==> cancelRequestTraining");

      trainerservice.cancelRequestTraining(req, model);
      
      return "customer/trainer/cancelRequestTrainingAction";
   }
   
   // 고객용 훈련 요청결과 리스트 - 수락일때
   @RequestMapping("custReqResultAccept")
   public String custReqResultAccept(HttpServletRequest req, Model model) {
      log.info("url ==> custReqResultAccept");

      trainerservice.custReqResultAccept(req, model);
      
      return "customer/trainer/custReqResultClone";
   }
   
   // 고객용 훈련 요청결과 리스트 - 거절일때
   @RequestMapping("custReqResultDeny")
   public String custReqResultDeny(HttpServletRequest req, Model model) {
      log.info("url ==> custReqResultDeny");

      trainerservice.custReqResultDeny(req, model);
      
      return "customer/trainer/custReqResultClone";
   }
   
   // 훈련사 결제하기
   @RequestMapping("payTraining")
   public String payTraining(HttpServletRequest req, Model model) {
      log.info("url ==> payTraining");

      return "customer/trainer/payTrainingAction";
   }
   
   // 훈련완료 리스트 / 후기 중복체크
   @RequestMapping("trainingComplete")
   public String trainingComplete(HttpServletRequest req, Model model) {
      log.info("url ==> trainingComplete");
      
      trainerservice.trainingComplete(req, model);

      return "customer/trainer/custReqResultClone";
   }
   
   // 훈련사 후기작성 페이지
   @RequestMapping("writeTrainingReview")
   public String writeTrainingReview(HttpServletRequest req, Model model) throws ServletException, IOException {
      log.info("url ==> writeTrainingReview");
      
      int TG_ID = Integer.parseInt(req.getParameter("TG_ID"));
      model.addAttribute("TG_ID", TG_ID);
      
      int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
      model.addAttribute("TQ_CD", TQ_CD);
      
      return "customer/trainer/writeTrainingReview";
   }
   
   // 훈련사 후기작성 처리 - 리뷰테이블 insert
   @RequestMapping("writeTrainingReviewAction")
   public String writeTrainingReviewAction(HttpServletRequest req, Model model) throws ServletException, IOException {
      log.info("url ==> writeTrainingReviewAction");
      
	// 이미지 업로드 시작
	String contentType = req.getContentType();
	if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
		uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
		uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
	    uploader.imageUpload(req, model);
	}
	// 이미지 업로드 끝
      
      trainerservice.writeTrainingReview(req, model);
      
      return "customer/trainer/writeTrainingReviewAction";
   }
   /*
   // 훈련사 후기 미리보기(평점 높은순 - 인기 많은 훈련사)
   @RequestMapping("previewTraining")
   public String previewTraining(HttpServletRequest req, Model model) {
      log.info("url ==> previewTraining");
      
      trainerservice.previewTrainingGrade(req, model);
      return "customer/trainer/previewTraining";
   }
   
   // 훈련사 후기 미리보기(최신등록순 - NEW 훈련사)
   @RequestMapping("newTrainerList")
   public String newTrainerList(HttpServletRequest req, Model model) {
      log.info("url ==> newTrainerList");
      trainerservice.newTrainerList(req, model);
      
      return "customer/trainer/newTrainerList";
   }
   
   // 훈련사 후기 미리보기(후기 많은 순 - 많이 찾는 훈련사)
   @RequestMapping("lotsOfReviews")
   public String lotsOfReviews(HttpServletRequest req, Model model) {
      log.info("url ==> lotsOfReviews");
      trainerservice.lotsOfReviews(req, model);
      
      return "customer/trainer/lotsOfReviews";
   }
   */
   // 고객 - 결제완료 내역
   @RequestMapping("trainerserPayFinish")
   public String trainerserPayFinish(HttpServletRequest req, Model model) {
	   
	   trainerservice.payment(req, model);
	   
	   return "customer/trainer/custReqResultClone";
   }
   
   // 매칭확정하기 - 매칭완료로 상태코드(4) update 
   @RequestMapping("updateTrainingComplete")
   public String updateTrainingComplete(HttpServletRequest req, Model model) {
	   
	   trainerservice.updateTrainingComplete(req, model);
	   
	   return "customer/trainer/updateTrainingCompleteAction";
   }
   
   // 내후기 보기
   @RequestMapping("getReviewInfo")
   public String getReviewInfo(HttpServletRequest req, Model model) {
      log.info("url - getReviewInfo");
      
      trainerservice.getReviewInfo(req, model);
      
      return "customer/trainer/getReviewlist";
   }
   
   // 내후기 수정 페이지
   @RequestMapping("modifyTrainingReview")
   public String modifyTrainingReview(HttpServletRequest req, Model model) {
      log.info("url - modifyTrainingReview");
      
      // 후기 수정 화면
      trainerservice.modifyReview(req, model);
      
      return "customer/trainer/modifyTrainingReview";
   }
   
   // 내후기 수정 처리
   @RequestMapping("modifyTrainingReviewAction")
   public String modifyTrainingReviewAction(HttpServletRequest req, Model model) throws ServletException, IOException {
      log.info("url - modifyTrainingReviewAction");
      
  	// 이미지 업로드 시작
  	String contentType = req.getContentType();
  	if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
  		uploader = new ImageUploaderHandler(); // image uploader 핸들러 호출
  		uploader.setUploadPath(IMG_UPLOAD_DIR); // img 경로
  	    uploader.imageUpload(req, model);
  	}
  	// 이미지 업로드 끝
      
      // 후기 수정 처리
      trainerservice.modifyReviewAction(req, model);
      
      return "customer/trainer/modifyTrainingReviewAction";
   }
   
   // 내후기 삭제 처리
   @RequestMapping("deleteTrainingReview")
   public String deleteTrainingReview(HttpServletRequest req, Model model) {
      log.info("url - deleteTrainingReview");
      
      // 후기 수정 처리
      trainerservice.deleteTrainingReview(req, model);
      
      return "customer/trainer/deleteTrainingReviewAction";
   }
   
   
   @RequestMapping(value = "paySuccess", method = RequestMethod.GET)
	 @ResponseBody
	 public int paySuccess(HttpServletRequest req, Model model) {
		 
		 int updateCnt = trainerservice.paySuccessUpdate(req, model);
		 
		 return updateCnt;
	 }
 
}