package ptms.mvc.tpj.Admin_Conroller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.AdminVO.AdminVO;
import ptms.mvc.tpj.Admin_DAO.AdminDAOImpl;
import ptms.mvc.tpj.Admin_Service.AdminServiceImpl;

@RequestMapping("/admin")
@Controller
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminServiceImpl enrollService;
	
	@Autowired
	AdminDAOImpl dao;
	
	@Autowired
	BCryptPasswordEncoder passordEncoder;
	
	// 관리자 로그인
	@RequestMapping("adminlogin")
	public String login() {
		return "admin/login/login";
	}
	
	// 관리자 로그인 성공시 이동 페이지
	@RequestMapping("loginsuccess")
	public String success() {
		return "admin/login/loginsuccess";
	}
	
	// 관리자 등록 화면
	@RequestMapping("adminjoin")
	public String join() {
		return "admin/join/join";
	}
	
	// 관리자 등록 처리
	@RequestMapping("adminjoinAction")
	public String joinAction(HttpServletRequest req, Model model) {
		
		String id = req.getParameter("mg_id");
		String pwd = req.getParameter("mg_pwd");
		String kind = req.getParameter("mg_kind");
		
		String enc = passordEncoder.encode(pwd);
		
		AdminVO vo = new AdminVO();
		
		vo.setMg_id(id);
		vo.setMg_pwd(enc);
		vo.setMg_kind(kind);
		
		int insertCnt = dao.insertAdmin(vo);
		
		model.addAttribute("insert", insertCnt);
		
		return "admin/join/joinAction";
	}
	
	// 관리자 아이디 중복확인
	@RequestMapping("adminidchk")
	@ResponseBody
	public int adminidchk(HttpServletRequest req, Model model) {
		
		String mg_id = req.getParameter("mg_id");
		
		return dao.idChk(mg_id);
	}
	
}
