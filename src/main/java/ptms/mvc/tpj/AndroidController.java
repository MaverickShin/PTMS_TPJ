package ptms.mvc.tpj;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;  // 수정
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;
import ptms.mvc.tpj.persistence.AndroidDAO;
import ptms.mvc.tpj.vo.Member;

// localhost : gsonEx

@RequestMapping("/aws")
@Controller
public class AndroidController {
	// private Logger log = Logger.getLogger(this.getClass());
	private static final Logger log = LoggerFactory.getLogger(AndroidController.class);
	
	@Autowired
	MainDAOImpl dao;
	//MainDAO dao;
	
	@Autowired
	SqlSessionTemplate Session;
	
	@Autowired
	BCryptPasswordEncoder passordEncoder;
	
	// 21.10.04 안드로이드 - Spring 연동 Test
   @RequestMapping(value="android", method = {RequestMethod.POST, RequestMethod.GET})
   public String androidPage(HttpServletRequest req, Model model)
   {
	   System.out.println("서버에서 안드로이드 접속 요청...");
	   try
	   {
		   String androidID = req.getParameter("id");
		   String androidPW = req.getParameter("pw");
		   
		   System.out.println("안드로이드에서 받아온 ID: " + androidID);
		   System.out.println("안드로이드에서 받아온 PW: " + androidPW);
		   
		   CustomerVO vo = new CustomerVO();
		   
		   vo.setCUST_ID(androidID);
		   vo.setCUST_PWD(androidPW);
		   
		   String cust_id = vo.getCUST_ID();
		   String cust_pw = vo.getCUST_PWD();
		   		   
		   // 아이디 체크 결과 반환용
		   String user_check = "fail";
		   
		   // 아이디 확인
		   int id_check = dao.idCheck(cust_id);
		   
		   String encoderpwd = Session.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdSearch", cust_id);
		   System.out.println("passordEncoder : " + passordEncoder.matches(cust_pw, encoderpwd));
		   
		   // 아이디가 존재한다면
		   if(id_check==1)
		   {
			   // 비밀번호 조회
			   if(passordEncoder.matches(cust_pw, encoderpwd))
			   {
				   System.out.println("환영합니다.");
				   user_check = "success";
				   return "main/android";
			   }
			   else
			   {
				   System.out.println("비밀번호가 틀립니다.");
			   }
		   }
		   // 아이디가 없다면
		   else
		   {
			   System.out.println("아이디가 틀립니다.");
			   return "main/android_fail";
		   }
		   
		   //model.addAttribute("user_check", user_check);
		   
		   return "main/android_fail";
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
		   return "main/android_fail";
	   }
   }
   
   // 안드로이드 회원가입 - 아이디 중복 체크
   @RequestMapping(value="id_check", method = {RequestMethod.POST, RequestMethod.GET})
   public String id_check(HttpServletRequest req, Model model)
   {
	   String strid = req.getParameter("cust_id");
	   System.out.println("안드로이드에서 받아온 ID: " + strid);
	   
		int cnt = dao.idCheck(strid);
		
		if(cnt==1)
			// 중복된 아이디가 없다면
			return "main/android";
		else
			// 중복된 아이디가 있으면
			return "main/android_fail";

   }
   
   // 안드로이드 회원가입
   @RequestMapping(value="join_ok", method = {RequestMethod.POST, RequestMethod.GET})
   public String join_ok(HttpServletRequest req, Model model)
   {
	   CustomerVO vo = new CustomerVO();
	   
	   String cust_id = req.getParameter("cust_id");
	   String cust_pw = req.getParameter("cust_pw");
	   String cust_nm = req.getParameter("cust_nm");
	   String cust_hp_1 = req.getParameter("cust_hp_1");
	   String cust_em = req.getParameter("cust_em");
	   String zipcode = req.getParameter("zipcode");
	   String zipcode2 = req.getParameter("zipcode2");
	   String zipcode3 = req.getParameter("zipcode3");
	   String zipcode4 = req.getParameter("zipcode4");
	   
	   System.out.println("안드로이드에서 받아온 ID: " + cust_id);
	   System.out.println("안드로이드에서 받아온 PW: " + cust_pw);
	   System.out.println("안드로이드에서 받아온 NM: " + cust_nm);
	   System.out.println("안드로이드에서 받아온 hp: " + cust_hp_1);
	   System.out.println("안드로이드에서 받아온 em: " + cust_em);
	   System.out.println("안드로이드에서 받아온 ZIP: " + zipcode);
	   System.out.println("안드로이드에서 받아온 ZIP2: " + zipcode2);
	   System.out.println("안드로이드에서 받아온 ZIP3: " + zipcode3);
	   System.out.println("안드로이드에서 받아온 ZIP4: " + zipcode4);
	   
	   // 비밀번호 암호화
	   String encryptPassword = passordEncoder.encode(cust_pw);
	   
	   vo.setCUST_ID(req.getParameter("cust_id"));
	   
	   vo.setCUST_PWD(encryptPassword);
	   System.out.println(" 암호화 비번 : " + encryptPassword);
	   vo.setCUST_NM(req.getParameter("cust_nm"));  
	   
	   vo.setCUST_PH(cust_hp_1);
	   vo.setCUST_EM(cust_em);
	   
	   vo.setZIPCODE(Integer.parseInt(zipcode));
	   vo.setADDRESS1(zipcode2);
	   vo.setADDRESS2(zipcode3);
	   vo.setSUBADDRESS(zipcode4);
	   
	   Map<String, Object> map = new HashMap<String, Object>();
	   
	   map.put("zipcode", vo.getZIPCODE());
	   map.put("address1", zipcode2);
	   map.put("address2", zipcode3);
	   
	   int select = dao.zipcodeChk(vo.getZIPCODE());
	   
	   if (select == 0)
		   dao.insertzipcode(map);
	   
	   int insertcnt = dao.insertCust(vo);
	   
	   if(insertcnt==1)
		   return "main/android";
	   else
		   return "main/android_fail";

   }
}

