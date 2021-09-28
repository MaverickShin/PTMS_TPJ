package ptms.mvc.tpj.TrainerController;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.TrainerService.TrainerServiceImpl;

@RequestMapping("/trainer")
@Controller
public class TrainerController {
   
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
      
      //trainerservice.TrainerList(req, model);
      
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
      
      return "customer/trainer/applyTrainer";
   }
   
   // 훈련사 지원 처리
   @RequestMapping("applyTrainerAction")
   public String applyTrainerAction(HttpServletRequest req, Model model) throws ParseException {
      log.info("url ==> applyTrainerAction");
      
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
      log.info("url ==> custReqResult");

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

      return "customer/trainer/trainingComplete";
   }
   
   // 훈련사 후기작성 페이지
   @RequestMapping("writeTrainingReview")
   public String writeTrainingReview(HttpServletRequest req, Model model) {
      log.info("url ==> writeTrainingReview");
      
      int TG_ID = Integer.parseInt(req.getParameter("TG_ID"));
      model.addAttribute("TG_ID", TG_ID);
      
      return "customer/trainer/writeTrainingReview";
   }
   
   // 훈련사 후기작성 처리 - 리뷰테이블 insert
   @RequestMapping("writeTrainingReviewAction")
   public String writeTrainingReviewAction(HttpServletRequest req, Model model) {
      log.info("url ==> writeTrainingReviewAction");
      
      trainerservice.writeTrainingReview(req, model);
      
      return "customer/trainer/writeTrainingReviewAction";
   }
   
   // 훈련사 후기 미리보기(평점 높은순)
   @RequestMapping("previewTraining")
   public String previewTraining(HttpServletRequest req, Model model) {
      log.info("url ==> previewTraining");
      
      trainerservice.previewTrainingGrade(req, model);
      return "customer/trainer/previewTraining";
   }
   
   // 고객 - 결제완료 내역
   @RequestMapping("trainerserPayFinish")
   public String trainerserPayFinish(HttpServletRequest req, Model model) {
	   
	   trainerservice.payment(req, model);
	   
	   return "customer/trainer/custReqResultClone";
   }
 
}