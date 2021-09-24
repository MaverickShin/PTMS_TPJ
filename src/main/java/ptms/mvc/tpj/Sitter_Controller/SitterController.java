package ptms.mvc.tpj.Sitter_Controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.Sitter_Service.SitterServiceImpl;

@RequestMapping("/sitter")
@Controller
public class SitterController {
	
	 private static final Logger log = LoggerFactory.getLogger(SitterController.class);

	 @Autowired
	 SitterServiceImpl sitterSer;
	 
	 //(찾기 버튼 누르기 전 조건 입력)시터 찾기 페이지
	 @RequestMapping("sitter")
	   public String sitter(HttpServletRequest req, Model model) {
	      log.info("url ==> sitter");
	      
	      return "customer/sitter/sitter";
	   }   
	   
	// (찾기 버튼 누른 후)시터 목록 페이지
	 @RequestMapping("sitterMatching")
	 public String sitterMatching(HttpServletRequest req, Model model) throws ParseException {
		 log.info("url ==> sitterMatching");
      
		 sitterSer.workSitterList(req, model);
		 return "customer/sitter/sitterMatching";
	 }  
	 
	 // 시터 상세 페이지
	 @RequestMapping("sitterDetail")
	 public String sitterDetail(HttpServletRequest req, Model model){
		 log.info("url ==> sitterDetail");
		 
		 sitterSer.detailSitter(req, model);
		 return "customer/sitter/sitterDetail";
	 }
	 
	 /*
	  * 날짜 : 21.09.23
	  * 작성자 : 임지영
	  * 내용 :  고객 - 펫시팅  신청하기
	  */
	 @RequestMapping("requestSitting")
	 public String requestSitting(HttpServletRequest req, Model model) throws ParseException{
		 log.info("url ==> requestSitting");
		 
		 //시터구하기 요청테이블에 INSERT를 위한 서비스
		 sitterSer.insertRequest(req, model);
		 return "customer/sitter/requestSitting";
	 }	 
	 
	 //요금 안내
	 @RequestMapping("feeInfo")
	 public String feeInfo(HttpServletRequest req, Model model) {
		 log.info("url ==> feeInfo");
      
		 sitterSer.priceInfo(req, model);
		 return "customer/sitter/feeInfo";
	 } 	 
	 
	 //펫시터 지원 페이지
	 @RequestMapping("applySitter")
	 public String applySitter(HttpServletRequest req, Model model) {
		 log.info("url ==> applySitter");
      
		 return "customer/sitter/applySitter";
	 } 		
	 
	 //펫시터 등록 처리
	 @RequestMapping("applySitteAction")
	 public String applySitteAction(HttpServletRequest req, Model model) throws ParseException {
		 log.info("url ==> applySitter");
		 
		 sitterSer.insertSitter(req, model);
		 return "customer/sitter/applySitteAction";
	 }
	 
	 /*
	  * 날짜 : 21.09.24
	  * 작성자 : 임지영
	  * 내용 : 나에게 온 의뢰
	  */
	 @RequestMapping("requestForMe")
	 public String requestForMe(HttpServletRequest req, Model model) {
		 log.info("url ==> requestForMe");
		 
		 //
		 sitterSer.allRequestList(req, model);
		 return "customer/sitter/requestForMe";
	 }	 
	 
	 //활동 등록
	 
	 
	 //나에게 온 의뢰
	 
	 
}
