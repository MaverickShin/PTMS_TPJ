package ptms.mvc.tpj.Customer_Main_Service;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MainDAOImpl dao;
	// MainDAO dao;

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

		String hp = h1 + "-" + h2 + "-" + h3;

		vo.setCUST_PH(hp);

		vo.setCUST_EM(req.getParameter("cust_em"));
		vo.setCUST_AGE(Integer.parseInt(req.getParameter("cust_age")));

		String gen = req.getParameter("cust_gen");

		int gender = 0;

		if (gen.equals("남자"))
			gender = 1;

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

		if (select == 0)
			dao.insertzipcode(map);

		int insertcnt = dao.insertCust(vo);

		model.addAttribute("insert", insertcnt);
		model.addAttribute("cust_id", vo.getCUST_EM());

	}

	// 회원정보 인증 및 상세 페이지
	@Override
	public void custDetail(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("cust_id");
		String cust_pwd = req.getParameter("CUST_PWD");

		System.out.println("회원id : " + id);
		System.out.println("회원pwd : " + cust_pwd);
		
		

		// 회원수정 인증 처리
		String encoderpwd = Session.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdSearch", id);
		System.out.println("passordEncoder : " + passordEncoder.matches(cust_pwd, encoderpwd));

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		// 상세정보 조회
		CustomerVO vo = new CustomerVO();
		int selectCnt = 0;
		
		//고객 - 시터등록 안되어 있을시 시터프로필 수정 접근 금지
		int signchkCnt = dao.sitterSigninChk(CUST_ID);
		if (passordEncoder.matches(cust_pwd, encoderpwd)) {
			vo = dao.selectCustomer(id);

			vo.setCUST_PWD(cust_pwd);

			selectCnt = 1;
		}

		model.addAttribute("signchkCnt", signchkCnt);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("CustomerVO", vo);
		System.out.println("회원정보 encoderpwd : " + encoderpwd);

	}

	// 회원정보 수정 처리
	@Override
	public void custUpdate(HttpServletRequest req, Model model) {

		CustomerVO vo = new CustomerVO();

		vo.setCUST_ID((String) req.getSession().getAttribute("cust_id"));

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

		if (select != 0) {

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
		// int updateCnt = dao.updateCustomer(vo);
		System.out.println("updatecnt : " + updatecnt);

		model.addAttribute("updatecnt", updatecnt);
	}

	// 회월 탈퇴
	@Override
	public void custDelete(HttpServletRequest req, Model model) {
		int ZIP_CD = Integer.parseInt(req.getParameter("zipcode"));
		int deleteCnt = dao.deleteCustomer2(ZIP_CD);
		if (deleteCnt != 0) {
			dao.deleteCustomer(ZIP_CD);
		}

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 펫 목록
	@Override
	public void petList(HttpServletRequest req, Model model) {

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		
		// 페이징
		int pageSize = 5; 		// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;		// 한 페이지당 페이지 갯수
		
		int cnt = 0;			// 글 갯수
		int start = 0;			// 현재 페이지 시작 글 번호
		int end = 0;			// 현재 페이지 마지막 글 번호
		int number = 0;			// 출력용 글 번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		// 배송지 갯수 조회
		cnt = dao.getPetCnt(CUST_ID);
		System.out.println("cnt => " + cnt);
		int signchkCnt = dao.sitterSigninChk(CUST_ID);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫 페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		// 페이지 갯수
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지가 있으면 1페이지 추가

		// 현재페이지 시작 글번호(페이지별)
		// start = (currentPage -1) * pageSize + 1;
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage -1) * pageSize + 1;
		
		// 현재페이지 시작 글번호(페이지별)
		// end = start + pageSize - 1;
		// 5 = 1 + 5 - 1;
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		// 출력용 글 번호 
		// 30 = 30 - (1-1) * 5; // 1 페이지
		// number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		// startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println("cnt : " + cnt);

		List<PetVO> vo = new ArrayList<PetVO>();

		if (cnt > 0) {
			vo = dao.getPetList(CUST_ID);
			System.out.println("vo : " + vo.size());
		}

		req.setAttribute("pageNum", pageNum); // 페이지 번호
		req.setAttribute("number", number); // 출력용 글번호
		req.setAttribute("cnt", cnt); // 
		req.setAttribute("vo", vo);   //
		
		if(cnt > 0) {
			req.setAttribute("startPage", startPage);		// 시작 페이지
			req.setAttribute("endPage", endPage);			// 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);		// 한 블럭당 페이지 갯수
			req.setAttribute("pageCount", pageCount);		// 페이지 갯수
			req.setAttribute("currentPage", currentPage);	// 현재페이지
			req.setAttribute("s", "MyPetList");
		}
		model.addAttribute("signchkCnt", signchkCnt);

	}

	// 펫 등록
	@Override
	public void petInAction(HttpServletRequest req, Model model) {

		PetVO vo = new PetVO();

		vo.setCUST_ID((String) req.getSession().getAttribute("cust_id"));
		vo.setPK_CD(Integer.parseInt(req.getParameter("PK_CD"))); // 펫 종류 코드
		vo.setPET_NM(req.getParameter("PET_NM")); // 이름
		vo.setPET_AGE(Integer.parseInt(req.getParameter("PET_AGE")));// 나이
		vo.setPET_CON(req.getParameter("PET_CON")); // 특이사항
		String PET_IMG = "/tpj/resources/upload/" + (String) req.getAttribute("fileName"); // 이미지
		vo.setPET_IMG(PET_IMG);

		System.out.println("CUST_ID " + vo.getCUST_ID());
		System.out.println("PK_CD " + vo.getPK_CD());
		System.out.println("PET_NM " + vo.getPET_NM());
		System.out.println("PET_AGE " + vo.getPET_AGE());
		System.out.println("PET_CON " + vo.getPET_CON());
		System.out.println("PET_IMG " + PET_IMG);

		int insertcnt = dao.insertPet(vo);

		model.addAttribute("insertcnt", insertcnt);
	}

	// 펫 수정 화면
	@Override
	public void petUpdate(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int PET_CD = Integer.parseInt(req.getParameter("PET_CD"));

		PetVO vo = dao.PetDetail(PET_CD);

		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum);
	}

	// 펫 수정 처리
	@Override
	public void petUpdateAction(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		PetVO vo = new PetVO();

		// 화면값 받기
		int hiddenPET_CD = Integer.parseInt(req.getParameter("PET_CD"));

		// 이미지 수정안하면 기존 이미지를 사용
		String hiddenPET_IMG = req.getParameter("PET_IMG");
		// 이미지 수정시 값 받기
		String uploadPET_IMG = (String) req.getAttribute("fileName");

		String PET_IMG = req.getParameter("PET_IMG"); // 이미지

		String strPET_IMG = "";
		// 이미지를 수정 안했을 때
		if (PET_IMG.equals("")) {
			strPET_IMG = hiddenPET_IMG;

			// 이미지를 수정 했을 때
		} else {
			strPET_IMG = "/tpj/resources/upload/" + uploadPET_IMG;
		}

		System.out.println("이미지 : " + strPET_IMG);

		vo.setPET_CD(hiddenPET_CD);
		vo.setPET_NM(req.getParameter("PET_NM")); // 이름
		vo.setPET_AGE(Integer.parseInt(req.getParameter("PET_AGE"))); // 펫 나이
		vo.setPET_CD(Integer.parseInt(req.getParameter("PET_CD"))); // 펫 코드 시퀀스
		vo.setPET_CON(req.getParameter("PET_CON")); // 펫 특이사항
		vo.setPK_CD(Integer.parseInt(req.getParameter("PK_CD"))); // 펫 종류 코드
		vo.setPET_IMG(strPET_IMG);

		int updatecnt = dao.updatePet(vo);
		System.out.println("updatecnt : " + updatecnt);

		model.addAttribute("updatecnt", updatecnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 펫 삭제 처리
	@Override
	public void petDelete(HttpServletRequest req, Model model) {
		int PET_CD = Integer.parseInt(req.getParameter("PET_CD"));

		int deletecnt = dao.deletePet(PET_CD);

		model.addAttribute("deletecnt", deletecnt);
	}

	/*
	 * 2021-09-22 나도웅 일정 가져오기
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * @Override public void callCalendar(HttpServletRequest req, Model model) {
	 * 
	 * String id = (String) req.getSession().getAttribute("cust_id");
	 * List<Map<String,Object>> eventList = dao.getEvents(id);
	 * 
	 * JSONArray jsonArray = new JSONArray(); for(Map<String,Object> map: eventList)
	 * { jsonArray.add(convertMapToJson(map)); }
	 * 
	 * FileWriter file; try { file = new FileWriter(
	 * "http://localhost:8005/tpj/webapp/WEB-INF/views/customer/calendar/data.json",
	 * false); file.write(jsonArray.toJSONString()); file.flush(); file.close(); }
	 * catch (IOException e) { e.printStackTrace(); } }
	 * 
	 * 
	 * 2021-09-22 나도웅 일정 가져오기(부속)
	 * 
	 * @SuppressWarnings("unchecked") public JSONObject convertMapToJson(Map<String,
	 * Object> map) {
	 * 
	 * JSONObject json = new JSONObject(); for (Map.Entry<String, Object> entry :
	 * map.entrySet()) { String key = entry.getKey(); Object value =
	 * entry.getValue(); json.put(key, value); } return json; }
	 */

	// 질병정보 크롤링 - 21.09.23 창훈 추가
	@Override
	public void SymptomCrawling(HttpServletRequest req, Model model) {

		// Jsoup를 이용해서 반려동물 질병정보 크롤링
		String url = "http://petnu.com/bbs_list.php?tb=board_dog_note";
		Document doc = null;

		// for문을 돌면서 뉴스 제목들을 가져오기 위한 list
		List<String> list = new ArrayList<String>();

		try {
			// Jsoup url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. <section class="section-body">
		Elements element = doc.select("table");
		Elements element1 = element.select("b");
		

		for (Element link : element1) {
			
			
			String con = "";
			String sum = "";	
			String href = "";
			String garbage = "";
			
			
		    if(link.text().equals("") || link.text().equals("회사소개") || link.text().equals("회원이용약관") || link.text().equals("개인정보취급방침")) {
		    	garbage = link.select("a[href]").attr("abs:href");
		    }
		    else {
		    	con = link.text();
		    	href = link.select("a[href]").attr("abs:href");
		    	sum = "<div class='symptomss'> <a href = '" + href + "' target='_blank'><span>" + con + "</span><img src = '";
		    }
		    
		    if(!sum.equals("")) list.add(sum);
		}
		
		Elements element2 = element1.select("a img");

		List<String> list2 = new ArrayList<String>();
		
		for (Element link : element2) {
		
			String img = link.getElementsByAttribute("src").attr("abs:src");
		
			String sum = img + "'></a></div>";
		
			list2.add(sum);
		}
		
		List<String> list3 = new ArrayList<String>();
		
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list2.size(); j++) {
				String sum = list.get(j) + list2.get(j);
				list3.add(sum);
			}
		}
		
		model.addAttribute("list", list3);
	}

	// 반려동물 지식정보 크롤링 - 21.09.23 창훈 추가
	@Override
	public void SenseCrawling(HttpServletRequest req, Model model) {
		
	}

	// 반려동물 영양정보 크롤링 - 21.09.23 창훈 추가
	@Override
	public void NutrientCrawling(HttpServletRequest req, Model model) {
		// Jsoup를 이용해서 반려동물 영양정보 크롤링
		String url = "https://myanimals.co.kr/nutrition-feeding/";
		Document doc = null;

		// for문을 돌면서 뉴스 제목들을 가져오기 위한 list
		List<String> list = new ArrayList<String>();

		try {
			// Jsoup url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. <section class="section-body">

		// 1. 헤더 부분의 제목을 가져온다.
		// String title = element.select("span.title").text();
		Elements element = doc.select(".thumb-bg");
		
		for (Element link : element) {
			
			String img = "";
					
			if(link.getElementsByAttribute("src").attr("src") != "") img = link.getElementsByAttribute("src").attr("src");
			
			
			String sum = "<img src='" + img + "'>";
			
			list.add(sum);
		}

		Elements title = doc.select(".title a");
		
		List<String> list2 = new ArrayList<String>();
		
		for (Element link2 : title) {
			
			String urls = link2.attr("abs:href");
			
		    String con = link2.text();
			
		    String sum = "<div class = 'ntcs'> <a href = '"+ urls + "' target='_blank'><span>" + con + "</span>";
		    
		    list2.add(sum);
		}
		
		List<String> list3 = new ArrayList<String>();
		
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list2.size(); j++) {
				String sum = list2.get(j) + list.get(j) + "</a></div>";
				list3.add(sum);
			}
		}
		model.addAttribute("title", list3);

	}

	// 제휴정보 크롤링 테스트용 - 진수
	@Override
	public void AffiliateCrwaling(HttpServletRequest req, Model model) {
		// Jsoup으로 호텔 정보 크롤링
		// 크롤링할 url 지정
		String url = "https://shopping.naver.com/home/p/index.naver";

		// Document에는 페이지의 전체 소스가 저장된다.
		Document doc = null;

		// 호텔 정보를 담을 list바구니
		List<String> list = new ArrayList<String>();

		try {
			// url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택한다. <div class="search-container__csa">
		// 원하는 값들이 들어있는 '전체'덩어리를 가져온다.
		Elements element = doc.select("div.section_wrap");
		System.out.println("element : " + element);
		Elements element1 = element.select("div.section_cell");
		System.out.println("element1 : " + element1);
		Elements element2 = element1.select("div.list_type ul li");
		System.out.println("element2 : " + element2);

		// element에 들어있는 세부정보 찾기 - 호텔 이름
		Elements detailele = element2.select("a.link_a");

		System.out.println("detailele2 : " + detailele);
		// Iterator를 이용하여 하나씩 값을 가져온다.
		// 전체 덩어리에서 필요한 부분만 선택하여 가져올 수 있다.

		for (Element link : detailele) {
			System.out.println(link.text());
			list.add(link.attr("abs:href" + "\n"));
		}

		// element에 들어있는 세부정보 찾기 - 호텔 이름
		model.addAttribute("item", detailele);
		model.addAttribute("list", list);

	}
	
	// 편의정보 크롤링  - 진수 21.09.25
	@Override
	public void Convenience_Info(HttpServletRequest req, Model model) {

		// Jsoup를 이용해서 반려동물 영양정보 크롤링
		String url = "http://www.booking.com/pets/country/kr.ko.html";
		Document doc = null;

		// for문을 돌면서 뉴스 제목들을 가져오기 위한 list
		List<String> list = new ArrayList<String>();

		try {
			// Jsoup url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. <section class="section-body">

		// 1. 헤더 부분의 제목을 가져온다.
		// String title = element.select("span.title").text();
		Elements element = doc.select(".bui-spacer--largest");
		Elements element1 = element.select(".bui-carousel__item ");
		
		for (Element link : element1) {
			
			String img = link.getElementsByAttribute("src").attr("src");
			
			String con = link.select("img").attr("alt");
			
			String href = link.select("a[href]").attr("abs:href");
			
			String sum = "<div class = 'ntcs'><a href = '"+ href + "' target = '_blank'><img src='" + img + "'><span>"+con+"</span></a></div>";
			
			list.add(sum);
		}

		model.addAttribute("list", list);
		
	}
	

	/*
	 * 2021-09-22 나도웅 일정 추가
	 * 
	 * @Override public void addEvent(HttpServletRequest req, Model model) { String
	 * id = (String) req.getSession().getAttribute("cust_id");
	 * 
	 * String start_tm = req.getParameter("start"); String end_tm =
	 * req.getParameter("end");
	 * 
	 * CalendarVO cVo = new CalendarVO();
	 * cVo.setCK_CD(Integer.parseInt(req.getParameter("CK_CD")));
	 * cVo.setCL_TITLE(req.getParameter("title")); cVo.setCUST_ID(id);
	 * cVo.setCL_MEMO(req.getParameter("memo"));
	 * 
	 * }
	 */

	/*
	 * 2021-09-22 나도웅 일정 가져오기
	 * 
	 * @Override public void deleteEvent(HttpServletRequest req, Model model) {
	 * 
	 * }
	 */

	// 펫정보 인증 및 상세 페이지
	/*
	 * @Override public void PetDetail(HttpServletRequest req, Model model) { String
	 * id = (String)req.getSession().getAttribute("cust_id"); String cust_pwd =
	 * req.getParameter("CUST_PWD");
	 * 
	 * System.out.println("회원id : "+id); System.out.println("회원pwd : "+cust_pwd);
	 * 
	 * // 회원수정 인증 처리 String encoderpwd =
	 * Session.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdSearch", id);
	 * System.out.println("passordEncoder : " + passordEncoder.matches(cust_pwd,
	 * encoderpwd));
	 * 
	 * // 상세정보 조회 CustomerVO vo =new CustomerVO(); int selectCnt = 0; vo =
	 * dao.selectCustomer(id);
	 * 
	 * vo.setCUST_PWD(cust_pwd);
	 * 
	 * selectCnt = 1; model.addAttribute("selectCnt",selectCnt);
	 * model.addAttribute("CustomerVO",vo); System.out.println("회원정보 encoderpwd : "
	 * + encoderpwd);
	 * 
	 * }
	 */

	// 뉴스레이터 - 김선영
	@Override
	public void Newsletter(HttpServletRequest req, Model model) {
		// 크롤링할 url 지정
		String url = "https://www.google.com/search?q=%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiSpO2nuZzzAhXFc94KHfcPCHoQ_AUoAnoECAEQBA&biw=1482&bih=936&dpr=1";

		// Document에는 페이지의 전체 소스가 저장된다.
		Document doc = null;

		// 호텔 정보를 담을 list바구니
		List<String> list = new ArrayList<String>();

		try {
			// url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements element = doc.select("div.GyAeWb");
		Elements element1 = element.select("div.v7W49e");
		Elements element2 = element1.select("g-card.ftSUBd");

		Elements detailele = element2.select("a.WlydOe");

		for (Element link : detailele) {
			list.add(link.attr("abs:href" + "\n"));
		}


		model.addAttribute("item", detailele);
		model.addAttribute("list", list);

	}

	/*
	 * 이름: 임지영
	 * 날짜 : 21.10.03
	 * 내용 : 크롤링 - 반려동물 인기검색어
	 */
	@Override
	public void petIssue(HttpServletRequest req, Model model) {
		// 크롤링할 url 지정
		String url = "https://search.naver.com/search.naver?query=%EB%8F%84%EB%8F%84%ED%95%B4%EC%8B%9D%EA%B8%B0&ie=utf8&sm=tab_shk";

		// Document에는 페이지의 전체 소스가 저장된다.
		Document doc = null;

		// 호텔 정보를 담을 list바구니
		List<String> list = new ArrayList<String>();

		try {
			// url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements element = doc.select("div.popular_rank_wrap");
		Elements element1 = element.select("div.keyword_box");
		//Elements element2 = element1.select("g-card.ftSUBd");

		Elements detailele = element1.select("[href]");

		for (Element link : detailele) {
			String a = "<a href = '" + link.attr("abs:href") + "'>" +link.text() +"</a>";
			list.add(a);
		}

		model.addAttribute("list2", list);
		
	}
	
	// 푸터 병원 정보 - 21.10.03 도빈
	@Override
	public void HospitalInfo(HttpServletRequest req, Model model) {
		// Jsoup를 이용해서 반려동물 질병정보 크롤링
		String url = "http://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EB%8F%99%EB%AC%BC%EB%B3%91%EC%9B%90";
		Document doc = null;

		// for문을 돌면서 뉴스 제목들을 가져오기 위한 list
		List<String> list = new ArrayList<String>();

		try {
			// Jsoup url 연결
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다. <section class="section-body">
		Elements element = doc.select("ul._3smbt");
		Elements element1 = element.select(".XNxh9");

		for (Element link : element1) {
			
			String href = link.select("a[href]").attr("abs:href");
			
			String img = link.getElementsByAttribute("img").attr("src");
			
			String sum = "<div class='hospitals'> <a href = '" + href + "' target = '_blank'> <img src = '" + img + "'>"; 
			
		    list.add(sum);
		}
		
		Elements element2 = element.select("._3Apve");

		List<String> list2 = new ArrayList<String>();
		
		for (Element link : element2) {
		
			String con = link.text();
		
			String sum = "<h3>"+ con + "</h3></a></div>";
		
			list2.add(sum);
		}
		
		List<String> list3 = new ArrayList<String>();
		
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list2.size(); j++) {
				String sum = list.get(j) + list2.get(j);
				System.out.println("sum : " + sum);
				list3.add(sum);
			}
		}
		
		model.addAttribute("list", list3);
		
	}

}
