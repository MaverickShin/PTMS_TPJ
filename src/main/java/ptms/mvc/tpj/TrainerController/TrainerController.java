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
      
      return "customer/matching/matchingMain";
   }
 
}