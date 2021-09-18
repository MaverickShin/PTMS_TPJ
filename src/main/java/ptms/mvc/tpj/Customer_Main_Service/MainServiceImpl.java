package ptms.mvc.tpj.Customer_Main_Service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		vo.setSUBADDRESS(req.getParameter("subaddress"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("zipcode", vo.getZIPCODE());
		map.put("address1", address1);
		map.put("address2", address2);
		
		int select = dao.zipcodeChk(vo.getZIPCODE());
		
		if(select == 0) dao.insertzipcode(map);
		
		int insertcnt = dao.insertCust(vo);
		
		req.setAttribute("insert", insertcnt);
		req.setAttribute("cust_id", vo.getCUST_EM());
		
	}


}
