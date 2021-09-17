package ptms.mvc.tpj.NoticeBoardController;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.NoticeBoardService.userInfo_NoticeBoard_service;

@Controller
public class BoardController {
	
	@Autowired
	userInfo_NoticeBoard_service service;

	// private Logger log = Logger.getLogger(this.getClass());
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("qnaList")
	public String qnaList(HttpServletRequest req, Model model) {
		log.info("url => qnaList");
		
		service.QNA_Notice_Board_ListUp(req, model);
		
		return "customer/board/qnaList";
	}
	
	@RequestMapping("qnaWrite")
	public String qnaWrite(HttpServletRequest req, Model model) {
		log.info("url => qnaWrite");
		
		return "customer/board/qnaList";
	}
	
	@RequestMapping("qnaWriteAction")
	public String qnaWriteAction(HttpServletRequest req, Model model) {
		log.info("url => qnaWriteAction");
		
		service.QNA_Notice_Board_Write(req, model);
		
		return "customer/board/qnaWriteAction";
	}
	
	@RequestMapping("qnaDetail")
	public String qnaDetail(HttpServletRequest req, Model model) {
		log.info("url => qnaDetail");
		
		service.QNA_Notice_Board_ListUp_Detail(req, model);
		
		return "customer/board/qnaDetail";
	}
	
	@RequestMapping("qnaDeleteAction")
	public String qnaDelete(HttpServletRequest req, Model model) {
		log.info("url => qnaDeleteAction");
		
		service.QNA_Notice_Board_Delete(req, model);
		
		return "customer/board/qnaDeleteAction";
	}
	
}
