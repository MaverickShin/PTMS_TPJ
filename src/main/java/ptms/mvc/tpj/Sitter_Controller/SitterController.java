package ptms.mvc.tpj.Sitter_Controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.Sitter_DAO.SitterDAOImpl;
import ptms.mvc.tpj.Sitter_Service.SitterServiceImpl;

@RequestMapping("/sitter")
@Controller
public class SitterController {
	
	 private static final Logger log = LoggerFactory.getLogger(SitterController.class);

	 @Autowired
	 SitterServiceImpl sitterSer;
	 
	 @Autowired
	 SitterDAOImpl dao;
	 
	 //(찾기 버튼 누르기 전 조건 입력)시터 찾기 페이지
	 @RequestMapping("sitter")
	   public String sitter(HttpServletRequest req, Model model) {
	      log.info("url ==> sitter");
	      
	      String CUST_ID = (String)req.getSession().getAttribute("cust_id");
	      
	      int selectCnt = dao.MypetCount(CUST_ID);
		  System.out.println("마이펫 수 selectCnt : " + selectCnt);
		  List<PetVO> list = dao.MypetList(CUST_ID);
		  
		  model.addAttribute("selectCnt", selectCnt);
		  model.addAttribute("list", list);
		  
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
	  * 내용 : 나에게 온 의뢰 목록
	  */
	 @RequestMapping("requestForSitter")
	 public String requestForMe(HttpServletRequest req, Model model) {
		 log.info("url ==> requestForSitter");
		 
		 sitterSer.allRequestList(req, model);
		 return "customer/sitter/requestForSitter";
	 }	 
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 :펫시터가 고객 요청 수락할때 SQ_ST(처리상태) 1로 업데이트
	  */
	 @RequestMapping("sitterAccept")
	 public String sitterAccept(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterAccept");
		 
		 sitterSer.acceptRequest(req, model);
		 return "customer/sitter/sitterAccept";
	 }	 
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 펫시터가 수락한 고객요청 내역을 보여주는 페이지
	  */
	 @RequestMapping("sitterAcceptList")
	 public String sitterAcceptList(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterRefuse");
		 
		 sitterSer.acceptRequestList(req, model);
		 return "customer/sitter/sitterAcceptList";
	 }
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 펫시터가 고객 요청 거절할때 SQ_ST(처리상태) 2로 업데이트
	  */
	 @RequestMapping("sitterRefuse")
	 public String sitterRefuse(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterRefuse");
		 
		 sitterSer.cancleRequest(req, model);
		 return "customer/sitter/sitterRefuse";
	 }	 
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 펫시터가 거절한 고객요청 내역을 보여주는 페이지
	  */
	 @RequestMapping("sitterRefuseList")
	 public String sitterRefuseList(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterRefuseList");
		 
		 sitterSer.cancleRequestList(req, model);
		 return "customer/sitter/sitterRefuseList";
	 }		 
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 고객이 펫시팅 결제를 완료한 리스트를 보여주는 페이지 
	  */
	 @RequestMapping("sitterserPayFinish")
	 public String sitterserPayFinish(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterserPayFinish");
		 
		 return "customer/sitter/sitterserPayFinish";
	 }		 

	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 고객이 이용한 펫시터서비스 내역을 보여주는 페이지 (첫 페이지는 '요청수락대기')
	  */
	 @RequestMapping("MysitterSerList")
	 public String MysitterSerList(HttpServletRequest req, Model model) {
		 log.info("url ==> MysitterSerList");
		 
		 return "customer/sitter/MysitterSerList";
	 }		 
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 고객 - 수락된 요청 리스트
	  */
	 @RequestMapping("acceptSitterSer")
	 public String acceptSitterSer(HttpServletRequest req, Model model) {
		 log.info("url ==> acceptSitterSer");
		 
		 return "customer/sitter/acceptSitterSer";
	 }	
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 고객 - 거절된 요청 리스트
	  */
	 @RequestMapping("refuseSitterSer")
	 public String refuseSitterSer(HttpServletRequest req, Model model) {
		 log.info("url ==> refuseSitterSer");
		 
		 return "customer/sitter/refuseSitterSer";
	 }		
	 
	 /*
	  * 날짜 : 21.09.25
	  * 작성자 : 임지영
	  * 내용 : 고객 - 결제완료된 리스트
	  */
	 @RequestMapping("PayDoneSitterSer")
	 public String PayDoneSitterSer(HttpServletRequest req, Model model) {
		 log.info("url ==> PayDoneSitterSer");
		 
		 return "customer/sitter/PayDoneSitterSer";
	 }		 

	 
	 //활동 등록
	 
	 
	 
}
