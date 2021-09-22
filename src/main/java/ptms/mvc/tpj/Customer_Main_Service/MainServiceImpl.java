package ptms.mvc.tpj.Customer_Main_Service;

import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.python.antlr.PythonParser.return_stmt_return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.PetVO;
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
		String id = (String)req.getSession().getAttribute("cust_id");
		String cust_pwd = req.getParameter("CUST_PWD");
		
		System.out.println("회원id : "+id);
		System.out.println("회원pwd : "+cust_pwd);
		
		// 회원수정 인증 처리
		String encoderpwd = Session.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdSearch", id);
		System.out.println("passordEncoder : " + passordEncoder.matches(cust_pwd, encoderpwd));
		
		// 상세정보 조회
		CustomerVO vo =new CustomerVO();
		int selectCnt = 0;
		if(passordEncoder.matches(cust_pwd, encoderpwd)) {
			vo = dao.selectCustomer(id);
			
			vo.setCUST_PWD(cust_pwd);
			
			selectCnt = 1;
		}
		
		model.addAttribute("selectCnt",selectCnt);
		model.addAttribute("CustomerVO",vo);
		System.out.println("회원정보 encoderpwd : " + encoderpwd);
		
	}

	// 회원정보 수정 처리
	@Override
	public void custUpdate(HttpServletRequest req, Model model) {
		
		CustomerVO vo =new CustomerVO();
		
		vo.setCUST_ID((String)req.getSession().getAttribute("cust_id"));
		
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
	
	// 펫 목록
	@Override
	public void petList(HttpServletRequest req, Model model) {
		int pageSize = 3; 	 // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; 	 // 한 블럭당 페이지 갯수
		
		int cnt = 0;		 // 글 갯수
		int start = 0;		 // 현재 페이지 시작 글 번호
		int end = 0;		 // 현재 페이지 마지막 글 번호
		int number = 0;		 // 출력용 글번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지
		
		int pageCount = 0;	 // 페이지 갯수
		int startPage = 0;	 // 시작 페이지
		int endPage = 0;	 // 마지막 페이지
		
		cnt = dao.getPetCnt();
		System.out.println("cnt : "+cnt);
		
		// 등록된 펫 갯수 조회
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";// 첫 페이지를 1로 설정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println(" 현제 페이지 currentPage : " + currentPage);
		
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가
		
		// 현재페이지 시작 글번호(페이지별) 
		start = (currentPage -1) * pageSize + 1;
		
		// 현재페이지 마지막 글번호(페이지별) 
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		// 출력용 글번호
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		// 시작 페이지
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		
		// 마지막 페이지
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("endPage : " + endPage);
		
		List<PetVO> dtos = null;
		
		if(cnt > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getPetList(map);
			System.out.println("dtos : "+dtos);
		}
		
		model.addAttribute("dtos", dtos); // 상품 게시글 목록
		model.addAttribute("cnt", cnt);   // 상품 게시글 갯수
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		
		if(cnt > 0 ) {
			req.setAttribute("startPage", startPage);	// 시작페이지
			req.setAttribute("endPage", endPage);		// 마지막페이지
			req.setAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount);	// 페이지 갯수
			req.setAttribute("currentPage", currentPage);	// 현재페이지
		}
	}
	
	// 펫 등록 
	@Override
	public void petInAction(HttpServletRequest req, Model model) {
		
		PetVO vo = new PetVO();
		
		vo.setCUST_ID((String)req.getSession().getAttribute("cust_id"));
		vo.setPK_CD(Integer.parseInt(req.getParameter("PK_CD"))); // 펫 종류 코드
		vo.setPET_NM(req.getParameter("PET_NM")); // 이름
		vo.setPET_AGE(Integer.parseInt(req.getParameter("PET_AGE")));// 나이
		vo.setPET_CON(req.getParameter("PET_CON")); // 특이사항
		String PET_IMG = "/tpj/resources/upload/" + (String) req.getAttribute("fileName"); //이미지
		vo.setPET_IMG(PET_IMG);
		
		System.out.println("CUST_ID "+vo.getCUST_ID());
		System.out.println("PK_CD "+vo.getPK_CD());
		System.out.println("PET_NM "+vo.getPET_NM());
		System.out.println("PET_AGE "+vo.getPET_AGE());
		System.out.println("PET_CON "+vo.getPET_CON());
		System.out.println("PET_IMG "+PET_IMG);
		
		int insertcnt = dao.insertPet(vo);
		
		model.addAttribute("insertcnt", insertcnt);
	}

	// 펫 수정 화면
	@Override
	public void petUpdate(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int PET_CD = Integer.parseInt(req.getParameter("PET_CD"));
		
		PetVO vo = dao.PetDetail(PET_CD);
		
		model.addAttribute("dto",vo);
		model.addAttribute("pageNum", pageNum);
	}

	// 펫 수정 처리
	@Override
	public void petUpdateAction(HttpServletRequest req, Model model) {
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		PetVO vo = new PetVO();
		
		//화면값 받기
		int hiddenPET_CD = Integer.parseInt(req.getParameter("PET_CD"));
		
		// 이미지 수정안하면 기존 이미지를 사용
		String hiddenPET_IMG = req.getParameter("PET_IMG");
		// 이미지 수정시 값 받기
		String uploadPET_IMG = (String) req.getAttribute("fileName");
		
		String PET_IMG = req.getParameter("PET_IMG"); // 이미지
		
		String strPET_IMG = "";
		// 이미지를 수정 안했을 때
		if(PET_IMG.equals("")) {
			strPET_IMG = hiddenPET_IMG;
		
		// 이미지를 수정 했을 때
		}else {
			strPET_IMG = "/tpj/resources/upload/" + uploadPET_IMG;
		}
		
		System.out.println("이미지 : "+ strPET_IMG);
		
		vo.setPET_CD(hiddenPET_CD);
		vo.setPET_NM(req.getParameter("PET_NM")); // 이름
		vo.setPET_AGE(Integer.parseInt(req.getParameter("PET_AGE"))); // 펫 나이
		vo.setPET_CD(Integer.parseInt(req.getParameter("PET_CD"))); //펫 코드 시퀀스
		vo.setPET_CON(req.getParameter("PET_CON")); // 펫 특이사항
		vo.setPK_CD(Integer.parseInt(req.getParameter("PK_CD"))); // 펫 종류 코드
		vo.setPET_IMG(strPET_IMG);
		
		int updatecnt = dao.updatePet(vo);
		System.out.println("updatecnt : "+updatecnt);
		
		model.addAttribute("updatecnt",updatecnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 펫 삭제 처리
	@Override
	public void petDelete(HttpServletRequest req, Model model) {
		int PET_CD = Integer.parseInt(req.getParameter("PET_CD"));
		
		int deletecnt = dao.deletePet(PET_CD);
		
		model.addAttribute("deletecnt",deletecnt);
	}

	// 일정 호출
	@SuppressWarnings("unchecked")
	@Override
	public void callCalendar(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("세션아이디");
		List<Map<String,Object>> eventList = dao.getEvents(id);
		
		JSONArray jsonArray = new JSONArray();
		for(Map<String,Object> map: eventList) {	
			jsonArray.add(convertMapToJson(map));
		}
			
		FileWriter file;
		try {
			file = new FileWriter("D:\\Dev88\\workspace\\PTMS_TPJ\\src\\main\\webapp\\WEB-INF\\views\\customer\\calendar\\data.json",false);
			file.write(jsonArray.toJSONString());
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// JSON Map처리를 위한 보조 Method
	@SuppressWarnings("unchecked")
	public JSONObject convertMapToJson(Map<String, Object> map) {
		JSONObject json = new JSONObject();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}
		return json;
	}
	
	
	// 펫정보 인증 및 상세 페이지
/*	@Override
	public void PetDetail(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
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
*/
}
