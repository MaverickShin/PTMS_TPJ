package ptms.mvc.tpj.Admin_Conroller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.AdminEnroll_Service.EnrollServiceImpl;

@RequestMapping("/admin")
@Controller
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	EnrollServiceImpl enrollService;
	
	
	@RequestMapping({"", "main", "adminlogin"})
	public String login() {
		
		return "admin/login/login";
	}
	
	@RequestMapping("adminjoin")
	public String join() {
		
		return "admin/join/join";
		
	}
	
	
	@RequestMapping("user_managerment")
	public String user_managerment() {
		
		return "admin/user/userlist";
	}
	
	@RequestMapping("user_modify")
	public String user_modify() {
		return "admin/user/usermodify";
	}
	
	@RequestMapping("community_list")
	public String community_list() {
		return "admin/community/community_list";
	}
	
	@RequestMapping("community_detail")
	public String community_detail() {
		return "admin/community/community_detail";
	}
	
	@RequestMapping("community_delete")
	public String community_delete() {
		return "admin/community/community_delete";
	}
	
	@RequestMapping("qnalist")
	public String qnalist() {
		return "admin/qna/qnalist";
	}
	
	@RequestMapping("qnamodify")
	public String qnamodify() {
		return "admin/qna/qnamodify";
	}
	
	@RequestMapping("qnadelete")
	public String qnadelete() {
		return "admin/qna/qnadelete";
	}
	
	@RequestMapping("qnainsert")
	public String qnainsert() {
		return "admin/qna/qnainsert";
	}
	
	@RequestMapping("faqlist")
	public String faqlist() {
		return "admin/faq/faqlist";
	}
	
	@RequestMapping("faqmodify")
	public String faqmodify() {
		return "admin/qna/qnamodify";
	}
	
	@RequestMapping("faqdelete")
	public String faqdelete() {
		return "admin/faq/faqdelete";
	}
	
	@RequestMapping("faqinsert")
	public String faqinsert() {
		return "admin/faq/faqinsert";
	}
	
	@RequestMapping("noticelist")
	public String noticelist() {
		return "admin/notice/noticelist";
	}
	
	@RequestMapping("noticemodify")
	public String noticemodify() {
		return "admin/notice/noticemodify";
	}
	
	@RequestMapping("noticedelete")
	public String  noticedelete() {
		return "admin/notice/noticedelete";
	}
	
	@RequestMapping("noticeinsert")
	public String noticeinsert() {
		return "admin/notice/noticeinsert";
	}
	
	@RequestMapping("sattle")
	public String sattle(HttpServletRequest req) {
		
		  int dtos = 10000;
	      int dtos2 = 20000;
	      int dtos3 = 30000;
	      
	      req.setAttribute("dtos", dtos);
	      req.setAttribute("dtos2", dtos2);
	      req.setAttribute("dtos3", dtos3);
		
		return "admin/sattle/sattle";
	}
	
	@RequestMapping("promotion")
	public String promotion() {
		return "admin/promotion/promotion";
	}
	
	@RequestMapping("total")
	public String total() {
		return "admin/total/total";
	}
	
	@RequestMapping("subscriber")
	public String subscriber() {
		return "admin/subscriber/subscriber";
	}
<<<<<<< HEAD

	@RequestMapping("enroll")
	public String enroll() {
		return "admin/sitter/enroll";
	}
	
	//펫 코드 및 요금 등록 페이지
	@RequestMapping("sitterFee")
	public String sitterFee(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFee");
		
		return "admin/sitter/sitterFee";
	}	
	
	//펫 코드 및 요금 등록
	@RequestMapping("sitterFeeAction")
	public String sitterFeeAction(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFeeAction");
		
		enrollService.petCodeFee(req, model);
		return "admin/sitter/sitterFeeAction";
	}
=======
	
>>>>>>> 0fb694a88e2685a464d7aa138a44f835642e1457
	
	//펫 코드 및 요금 목록
	@RequestMapping("sitterFeeList")
	public String sitterFeeList(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFeeList");
		
		enrollService.petCodeFeeList(req, model);
		return "admin/sitter/sitterFeeList";
	}	 
	
	//펫 코드 및 요금 수정 페이지
	@RequestMapping("sitterFeeUpdate")
	public String petCodeFeeUpdate(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFeeUpdate");
		
		enrollService.petCodeFeeUpdate(req, model);
		return "admin/sitter/sitterFeeUpdate";
	}	
	
	//펫 코드 및 요금 수정 처리
	@RequestMapping("sitterFeeUpdateAction")
	public String petCodeFeeUpdateAction(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFeeUpdateAction");
		
		enrollService.petCodeFeeUpdateAction(req, model);
		return "admin/sitter/sitterFeeUpdateAction";
	}
	
	//펫 코드 및 요금 삭제
	@RequestMapping("sitterFeeDelete")
	public String sitterFeeDelete(HttpServletRequest req, Model model) {
		log.info("url ==> sitterFeeDelete");
		
		enrollService.petCodeFeeDeleteAction(req, model);
		return "admin/sitter/sitterFeeDelete";
	}	
	
	
}
