package ptms.mvc.tpj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;  // 수정
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.persistence.AndroidDAO;
import ptms.mvc.tpj.vo.Member;

// localhost : gsonEx
@Controller
public class AndroidController {
	// private Logger log = Logger.getLogger(this.getClass());
	private static final Logger log = LoggerFactory.getLogger(AndroidController.class);
	
	@Autowired
	AndroidDAO mainDao;
	
	// 앱 로그인 
	@ResponseBody  // 웹(스프링)에서 안드로이드로 값(json)을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		log.info("androidSignIn()");
		
		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("member_id", id);
		in.put("member_pwd", pwd);
		//로그인
		String step = mainDao.confirmIdPwd(in);

		// 웹에서 안드로이드로 전달할 값
		Map<String, String> out = new HashMap<String, String>();
		if(step != null) {
			log.info("로그인 성공: " + step);
			out.put("member_id", id);
		} else {
			log.info("로그인 실패");
			out.put("member_id", null);
		}
		
		return out;
	}
		
	
	// 앱 마이페이지 
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.info("androidMyPageMain()");
			
		// 안드로이드에서 전달한 id값
		String id = req.getParameter("id");
		
		System.out.println("id : " + id);

		// 회원정보 조회
		Member m = mainDao.getMemberInfo(id);
		
		System.out.println("m : " + m);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", m.getMember_name());
		map.put("data2", 0);
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("member", m);
	
		return map;
	}
	

}

