package ptms.mvc.tpj.Customer_Main_Service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAOImpl dao;
	//MainDAO dao;
	
	@Autowired
	SqlSessionTemplate Session;
	
	@Autowired
	BCryptPasswordEncoder passordEncoder;
	
	// 중복확인 처리 - 아이디확인
	@Override
	public int confirmId(HttpServletRequest req, Model model) {
		
		String strid = req.getParameter("cust_id");
		
		int cnt = dao.idCheck(strid);
		
		model.addAttribute("select", cnt);
		model.addAttribute("id", strid);
		
		return cnt;
		
	}

	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		
		CustomerVO vo = new CustomerVO();
		
		String pwd = req.getParameter("cust_pwd");
		
		String encryptPassword = passordEncoder.encode(pwd);
		
		vo.setCUST_ID(req.getParameter("cust_id"));
		vo.setCUST_PWD(encryptPassword);
		System.out.println(" 암호화 비번 : " + encryptPassword);
		vo.setCUST_NM(req.getParameter("cust_nm"));
		
		String h1 = req.getParameter("hp1");
		String h2 = req.getParameter("hp2");
		String h3 = req.getParameter("hp3");
		
		String hp = h1+"-"+h2+"-"+h3;
		
		vo.setCUST_PH(hp);
		
		vo.setCUST_EM(req.getParameter("cust_em"));
		vo.setCUST_AGE(Integer.parseInt(req.getParameter("cust_age")));
		
		String gen = req.getParameter("cust_gen");
		
		int gender = 0;
		
		if(gen.equals("남자")) gender = 1;
		
		vo.setCUST_GEN(gender);
		
		vo.setJUMIN1(Integer.parseInt(req.getParameter("jumin1")));
		vo.setJUMIN2(Integer.parseInt(req.getParameter("jumin2")));
		
		vo.setZIPCODE(Integer.parseInt(req.getParameter("zipcode")));
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		vo.setADDRESS1(address1);
		vo.setADDRESS2(address2);
		vo.setSUBADDRESS(req.getParameter("subaddress"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("zipcode", vo.getZIPCODE());
		map.put("address1", address1);
		map.put("address2", address2);
		
		int select = dao.zipcodeChk(vo.getZIPCODE());
		
		if(select == 0) dao.insertzipcode(map);
		
		int insertcnt = dao.insertCust(vo);
		
		model.addAttribute("insert", insertcnt);
		model.addAttribute("cust_id", vo.getCUST_EM());
		
	}

	// 회원정보 인증 및 상세 페이지
	@Override
	public void custDetail(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("custid");
		String cust_pwd = req.getParameter("CUST_PWD");
		
		System.out.println("회원id : "+id);
		System.out.println("회원pwd : "+cust_pwd);
		
		// 회원수정 인증 처리
		String encoderpwd = Session.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdSearch", id);
		System.out.println("passordEncoder : " + passordEncoder.matches(cust_pwd, encoderpwd));
		
		// 상세정보 조회
		CustomerVO vo =new CustomerVO();
		int selectCnt = 0;
		vo = dao.selectCustomer(id);
		
		vo.setCUST_PWD(cust_pwd);
		
		selectCnt = 1;
		model.addAttribute("selectCnt",selectCnt);
		model.addAttribute("CustomerVO",vo);
		System.out.println("회원정보 encoderpwd : " + encoderpwd);
		
	}

	// 회원정보 수정 처리
	@Override
	public void custUpdate(HttpServletRequest req, Model model) {
		
		CustomerVO vo =new CustomerVO();
		
		vo.setCUST_ID((String)req.getSession().getAttribute("custid"));
		
		String CUST_PWD = req.getParameter("CUST_PWD");
		
		String encoderpwd = passordEncoder.encode(CUST_PWD);
	
		vo.setCUST_PWD(encoderpwd);
		vo.setCUST_EM(req.getParameter("CUST_EM"));
		vo.setCUST_PH(req.getParameter("CUST_PH"));
		vo.setZIPCODE(Integer.parseInt(req.getParameter("zipcode")));
		vo.setSUBADDRESS(req.getParameter("subaddress"));
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		vo.setADDRESS1(address1);
		vo.setADDRESS2(address2);
		
		System.out.println("우편번호 : " + vo.getZIPCODE());
		
		// 추가 부분	
		int select = dao.zipcodeChk(vo.getZIPCODE());
		
		System.out.println("select : " + select);
		
		if(select != 0) {
			
			System.out.println("어드 1: " + vo.getADDRESS1());
			System.out.println("어드2 :" + vo.getADDRESS2());
			int cnt = dao.updateCustomer2(vo);
			
			System.out.println("결과 : " + cnt);
		} else {
			
			System.out.println("요기");
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("zipcode", vo.getZIPCODE());
			map.put("address1", address1);
			map.put("address2", address2);
			
			dao.insertzipcode(map);
		}
		
		int updatecnt = dao.updateCustomer(vo);
		
		// 추가 끝	
		//int updateCnt = dao.updateCustomer(vo);
		System.out.println("updatecnt : " + updatecnt);
		
		model.addAttribute("updatecnt", updatecnt);
	}
	
}
