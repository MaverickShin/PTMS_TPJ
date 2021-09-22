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
   

   @RequestMapping("trainerSearch")
   public String TrainerList(HttpServletRequest req, Model model) {
      log.info("url ==> trainerSearch");
      
      //trainerservice.TrainerList(req, model);
      
      return "customer/trainer/trainerSearch";
   }
   
   @RequestMapping("trainerMatchingList")
   public String trainerMatchingList(HttpServletRequest req, Model model) {
      log.info("url ==> trainerMatchingList");
      
      trainerservice.TrainerList(req, model);
      
      return "customer/trainer/trainerMatchingList";
   }
   
   @RequestMapping("applyTrainer")
   public String applyTrainer(HttpServletRequest req, Model model) {
      log.info("url ==> applyTrainer");
      
      return "customer/trainer/applyTrainer";
   }
   
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
      
      return "customer/trainer/requestTrainer";
   }
   
   @RequestMapping("trainerDetail")
   public String trainerDetail(HttpServletRequest req, Model model) {
      log.info("url ==> trainerDetail");
      
      trainerservice.TrainerInfo(req, model);
      
      return "customer/trainer/trainerDetail";
   }

   @RequestMapping("requestTraining")
   public String requestTraining(HttpServletRequest req, Model model) throws ParseException {
      log.info("url ==> requestTraining");

      trainerservice.reserveTrainer(req, model);
      
      return "customer/trainer/requestTrainingAction";
   }
   
   
}