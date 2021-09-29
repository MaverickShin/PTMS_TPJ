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
	
	// 회월 탈퇴
	@Override
	public void custDelete(HttpServletRequest req, Model model) {
		int ZIP_CD = Integer.parseInt(req.getParameter("zipcode"));
		int deleteCnt = dao.deleteCustomer2(ZIP_CD);
		if(deleteCnt != 0) {
			dao.deleteCustomer(ZIP_CD);
		}
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// 펫 목록
	@Override
	public void petList(HttpServletRequest req, Model model) {
		int cnt = 0;		 // 글 갯수
		
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		cnt = dao.getPetCnt(CUST_ID);
		System.out.println("cnt : "+cnt);
		
		List<PetVO> dtos = new ArrayList<PetVO>();
		
		if(cnt > 0) {
			dtos = dao.getPetList(CUST_ID);
			System.out.println("dtos : "+dtos);
		}
		
		model.addAttribute("dtos", dtos); // 상품 게시글 목록
		model.addAttribute("cnt", cnt);   // 상품 게시글 갯수
		
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

	/*
	 * 2021-09-22
	 * 나도웅
	 * 일정 가져오기
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void callCalendar(HttpServletRequest req, Model model) {
		
		String id = (String) req.getSession().getAttribute("cust_id");
		List<Map<String,Object>> eventList = dao.getEvents(id);
		
		JSONArray jsonArray = new JSONArray();
		for(Map<String,Object> map: eventList) {	
			jsonArray.add(convertMapToJson(map));
		}
			
		FileWriter file;
		try {
			file = new FileWriter("http://localhost:8005/tpj/webapp/WEB-INF/views/customer/calendar/data.json",false);
			file.write(jsonArray.toJSONString());
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 2021-09-22
	 * 나도웅
	 * 일정 가져오기(부속)
	 */
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

	// 질병정보 크롤링 - 21.09.23 창훈 추가
	@Override
	public void SymptomCrawling(HttpServletRequest req, Model model) {
		
		// Jsoup를 이용해서 반려동물 질병정보 크롤링
		String url = "http://www.pethealth.kr/news/articleList.html?sc_sub_section_code=S2N27&view_type=sm";
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
		Elements element = doc.select("section.section-body");
		
		// 1. 헤더 부분의 제목을 가져온다.
		//String title = element.select("h3.titles").text();
		Elements title = doc.select("a[href]");
		
		System.out.println(title);
		
//		for(Element el : element.select("h4")) { // 하위 뉴스 기사들을 for문을 돌면서 출력
//			
//			list.add(el.text());  
//		}
		
		for(Element link : title) {
			list.add(link.attr("abs:href"));
		}		
	
		model.addAttribute("title", title);
		model.addAttribute("list", list);
			
	}

	// 반려동물 지식정보 크롤링 - 21.09.23 창훈 추가
	@Override
	public void SenseCrawling(HttpServletRequest req, Model model) {
		// Jsoup를 이용해서 반려동물 지식정보 크롤링
		String url = "https://myanimals.co.kr/breeds/";
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
		Elements element = doc.select("div.more-posts__list mt--x-big jsx-2532604687");
		
		// 1. 헤더 부분의 제목을 가져온다.
		// String title = element.select("img").text();
		Elements title = doc.select("[href]");
		
		System.out.println("==================");
		System.out.println(title);
		System.out.println("==================");
		
//		for(Element el : element.select("div.view-cont")) { // 하위 뉴스 기사들을 for문을 돌면서 출력
//			System.out.println(el.text());
//			
//			list.add(el.text());
//		}
		
		for(Element link : title) {
			list.add(link.attr("abs:href"));
		}		
	
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		System.out.println("==================");
		
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
		Elements element = doc.select("div.caption");
		
		
		// 1. 헤더 부분의 제목을 가져온다.
		//String title = element.select("span.title").text();
		Elements title = doc.select("[href]");
		
		System.out.println("==================");
		System.out.println(title);
		//System.out.println(links);
		System.out.println("==================");
		
//		for(Element el : element.select("p")) { // 하위 뉴스 기사들을 for문을 돌면서 출력
//			System.out.println(el.text());
//			
//			list.add(el.text());
//		}
		
		for(Element link : title) {
			list.add(link.attr("abs:href"));
		}
	
		model.addAttribute("title", title);
		//model.addAttribute(links);
		model.addAttribute("list", list);
		
		System.out.println("==================");
		
	}

////////////////////////////////////////////////////////////////
	// 제휴정보 크롤링 테스트용 - 진수
	@Override
	public void AffiliateCrwaling(HttpServletRequest req, Model model) {
		//Jsoup으로 호텔 정보 크롤링
		//크롤링할 url 지정
		String url="https://shopping.naver.com/home/p/index.naver";
//		String url="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=1&acr=1&acq=%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC&qdt=0&ie=utf8&query=%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC%EB%B3%B4%ED%98%B8%EC%84%BC%ED%84%B0";
		
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
		// 				원하는 값들이 들어있는 '전체'덩어리를 가져온다.
//		Elements element = doc.select("div#BODYCON");
		Elements element = doc.select("div.section_wrap");
		System.out.println("element : "+element);
		Elements element1 = element.select("div.section_cell");
		System.out.println("element1 : "+element1);
		Elements element2 = element1.select("div.list_type ul li");
		System.out.println("element2 : "+element2);

		// element에 들어있는 세부정보 찾기 - 호텔 이름
		Elements detailele = element2.select("a.link_a");
		
		
		System.out.println("detailele2 : "+detailele);
//		Elements txt = detailele.select("span.txt");
		// element에 들어있는 세부정보 찾기 - 이미지
//		Elements detailele2 = element.select("a.sr_item_photo_link");
//		Elements detailele2 = element.select("a.[href]");
//		System.out.println("detailele2 : "+detailele2);
		
		System.out.println("=========================================");
		//Iterator를 이용하여 하나씩 값을 가져온다.
		//전체 덩어리에서 필요한 부분만 선택하여 가져올 수 있다.
//		Elements item = detailele.select("a[href]");
//		Elements item = detailele.select("span.sr-hotel__name");
//		Elements href = detailele.select("a[href]");
//		Iterator<Element> img = detailele2.select("img").iterator();

		for(Element link : detailele) {
			System.out.println(link.text());
			list.add(link.attr("abs:href"+"\n"));
		}
		
//		for(Element t : txt) {
//			System.out.println(t.text());
//		}

		
//		Elements element = doc.select("div.api_cs_wrap");
//		System.out.println("element : "+element);
//		Elements element1 = element.select("div.animal_lst div");
//		System.out.println("element1 : "+element1);
//		Elements element2 = element1.select("ul.first_list");
//		System.out.println("element2 : "+element2);
//		Elements element3 = element2.select("string.info_tit");
//		System.out.println("element3 : "+element3);
////		Elements element4 = element2.select("dl.info_add");
////		System.out.println("element4 : "+element4);
//		
//		// element에 들어있는 세부정보 찾기 - 호텔 이름
//		Elements detailele = element3.select("");
//		Elements detailele1 = element2.select("dl.info_add");
//		System.out.println("detailele : "+detailele);
//		System.out.println("detailele1 : "+detailele1);
//		System.out.println("=========================================");
//		
//		for(Element link : detailele) {
//			System.out.println(link.text());
//			list.add(link.attr("abs:href"+"\n"));
//		}
		
		model.addAttribute("item",detailele);
//		model.addAttribute("item1",detailele1);
//		model.addAttribute("href",txt);
		model.addAttribute("list",list);
		
	}
	
	
/////////////////////////////////////////////////////////////////	
	/*
	 * 2021-09-22
	 * 나도웅
	 * 일정 추가
	 */ 
	@Override
	public void addEvent(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("cust_id");
		
		String start_tm = req.getParameter("start");
		String end_tm = req.getParameter("end");
		
		
		
		CalendarVO cVo = new CalendarVO();
		cVo.setCK_CD(Integer.parseInt(req.getParameter("CK_CD")));
		cVo.setCL_TITLE(req.getParameter("title"));
		cVo.setCUST_ID(id);
		cVo.setCL_MEMO(req.getParameter("memo"));
		

		
	}	
	
	/*
	 * 2021-09-22
	 * 나도웅
	 * 일정 가져오기
	 */
	@Override
	public void deleteEvent(HttpServletRequest req, Model model) {
		
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
	
	@Override
	   public void Newsletter(HttpServletRequest req, Model model) {
	      //Jsoup으로 호텔 정보 크롤링
	      //크롤링할 url 지정
	      String url="https://www.google.com/search?q=%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiSpO2nuZzzAhXFc94KHfcPCHoQ_AUoAnoECAEQBA&biw=1482&bih=936&dpr=1";
//	      String url="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=1&acr=1&acq=%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC&qdt=0&ie=utf8&query=%EC%9C%A0%EA%B8%B0%EB%8F%99%EB%AC%BC%EB%B3%B4%ED%98%B8%EC%84%BC%ED%84%B0";
	      
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
	      //             원하는 값들이 들어있는 '전체'덩어리를 가져온다.
//	      Elements element = doc.select("div#BODYCON");
	      Elements element = doc.select("div.GyAeWb");
	      Elements element1 = element.select("div.v7W49e");
	      Elements element2 = element1.select("g-card.ftSUBd");

	      // element에 들어있는 세부정보 찾기 - 호텔 이름
	      Elements detailele = element2.select("a.WlydOe");
	      
	      
//	      Elements txt = detailele.select("span.txt");
	      // element에 들어있는 세부정보 찾기 - 이미지
//	      Elements detailele2 = element.select("a.sr_item_photo_link");
//	      Elements detailele2 = element.select("a.[href]");
//	      System.out.println("detailele2 : "+detailele2);
	      
	      //Iterator를 이용하여 하나씩 값을 가져온다.
	      //전체 덩어리에서 필요한 부분만 선택하여 가져올 수 있다.
//	      Elements item = detailele.select("a[href]");
//	      Elements item = detailele.select("span.sr-hotel__name");
//	      Elements href = detailele.select("a[href]");
//	      Iterator<Element> img = detailele2.select("img").iterator();

	      for(Element link : detailele) {
	         list.add(link.attr("abs:href"+"\n"));
	      }
	      
//	      for(Element t : txt) {
//	         System.out.println(t.text());
//	      }

	      
//	      Elements element = doc.select("div.api_cs_wrap");
//	      System.out.println("element : "+element);
//	      Elements element1 = element.select("div.animal_lst div");
//	      System.out.println("element1 : "+element1);
//	      Elements element2 = element1.select("ul.first_list");
//	      System.out.println("element2 : "+element2);
//	      Elements element3 = element2.select("string.info_tit");
//	      System.out.println("element3 : "+element3);
////	      Elements element4 = element2.select("dl.info_add");
////	      System.out.println("element4 : "+element4);
//	      
//	      // element에 들어있는 세부정보 찾기 - 호텔 이름
//	      Elements detailele = element3.select("");
//	      Elements detailele1 = element2.select("dl.info_add");
//	      System.out.println("detailele : "+detailele);
//	      System.out.println("detailele1 : "+detailele1);
//	      System.out.println("=========================================");
//	      
//	      for(Element link : detailele) {
//	         System.out.println(link.text());
//	         list.add(link.attr("abs:href"+"\n"));
//	      }
	      
	      model.addAttribute("item",detailele);
//	      model.addAttribute("item1",detailele1);
//	      model.addAttribute("href",txt);
	      model.addAttribute("list",list);
	      
	   }
	 
}
