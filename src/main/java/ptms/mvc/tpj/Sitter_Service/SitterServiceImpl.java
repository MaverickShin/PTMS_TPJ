package ptms.mvc.tpj.Sitter_Service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.Sitter_DAO.SitterDAOImpl;

@Service
public class SitterServiceImpl implements SitterService {

	@Autowired
	SitterDAOImpl sitterDao;

	// 시터 등록
	@Override
	public void insertSitter(HttpServletRequest req, Model model) throws ParseException {
		System.out.println("service ==> insertSitter");

		// 시터정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();

		// 정보를 넣어준다
		String SV1_NO = req.getParameter("SV1_NO");
		String SV2_NO = req.getParameter("SV2_NO");
		String SV3_NO = req.getParameter("SV3_NO");
		String SV4_NO = req.getParameter("SV4_NO");
		if (SV1_NO == null) {
			vo.setSV1_NO(0);
		} else {
			vo.setSV1_NO(1);
		}
		if (SV2_NO == null) {
			vo.setSV2_NO(0);
		} else {
			vo.setSV2_NO(2);
		}
		if (SV3_NO == null) {
			vo.setSV3_NO(0);
		} else {
			vo.setSV3_NO(3);
		}
		if (SV4_NO == null) {
			vo.setSV4_NO(0);
		} else {
			vo.setSV4_NO(4);
		}

		vo.setCUST_ID(req.getParameter("CUST_ID")); // 고객 아이디
		vo.setSV_AREA(req.getParameter("SV_AREA")); // 서비스가능지역(도로명주소)
		vo.setSR_CD(Integer.parseInt(req.getParameter("SR_CD"))); // 주거지 유형

		String WK_START = req.getParameter("WK_START"); // 활동 시작 가능일
		String WK_END = req.getParameter("WK_END"); // 활동 시작 종료일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(sdf.parse(WK_START).getTime());
		vo.setWK_START(date);
		date = new Date(sdf.parse(WK_END).getTime());
		vo.setWK_END(date);

		vo.setSIT_TITLE(req.getParameter("SIT_TITLE")); // 소개글 제목
		vo.setSIT_APPEAL(req.getParameter("SIT_APPEAL")); // 소개글 본문
		vo.setSIT_IMG(req.getParameter("SIT_IMG")); // 프로필 사진

		int insertCnt = 0;

		insertCnt = sitterDao.profileInsert(vo); // 시터 프로필 등록
		System.out.println("시터프로필 등록 : " + insertCnt);
		if (insertCnt == 1) {
			insertCnt = sitterDao.insertService(vo); // 시터 서비스 정보 등록
		}

		model.addAttribute("insertCnt", insertCnt);
	}

	// 시터 등록 탈퇴
	@Override
	public void deleteSitter(HttpServletRequest req, Model model) {
		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		System.out.println("시터 탈퇴 SIT_ID : "+req.getParameter("SIT_ID"));
		int deleteCnt = sitterDao.deleteSitter2(SIT_ID);
		if (deleteCnt != 0) {
			sitterDao.deleteSitter(SIT_ID);
		}

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 시터 정보 수정 화면
	@Override
	public void updateSitter(HttpServletRequest req, Model model) {
		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		System.out.println("CUST_ID : " + CUST_ID);

		SitterVO vo = sitterDao.SitterDetail(CUST_ID);
		
		System.out.println("vo : " + vo);
		System.out.println("수정화면 SIT_ST : " + vo.getSIT_ST());
		
		model.addAttribute("dto",vo);
	}

	// 시터 프로필 화면 수정 처리
	@Override
	public void updateSitterAction(HttpServletRequest req, Model model) throws ParseException {
		SitterVO sVo = new SitterVO();

		System.out.println("수정처리 SIT_ID : "+req.getParameter("SIT_ID"));
		
		int hiddenSIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		String id = (String) req.getSession().getAttribute("cust_id");
		System.out.println("hiddenSIT_ID : " + hiddenSIT_ID);
		System.out.println("id : " + id);

		int SV1_NO = 0;
		SV1_NO = req.getParameter("SV1_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV1_NO"));
		System.out.println("SV1_NO" + SV1_NO);

		int SV2_NO = 0;
		SV2_NO = req.getParameter("SV2_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV2_NO"));
		System.out.println("SV2_NO" + SV2_NO);

		int SV3_NO = 0;
		SV3_NO = req.getParameter("SV3_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV3_NO"));
		System.out.println("SV3_NO" + SV3_NO);

		int SV4_NO = 0;
		SV4_NO = req.getParameter("SV4_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV4_NO"));
		System.out.println("SV4_NO" + SV4_NO);

		String WK_START = req.getParameter("WK_START");
		String WK_END = req.getParameter("WK_END");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date(sdf.parse(WK_START).getTime());
		sVo.setWK_START(date);

		date = new Date(sdf.parse(WK_END).getTime());
		sVo.setWK_END(date);
		/*
		 * int SR_CD = Integer.parseInt(req.getParameter("SR_CD")); String SR_KIND = "";
		 * if(SR_CD == 1) { SR_KIND = "주택(마당x)"; }else if(SR_CD == 2) { SR_KIND =
		 * "주택(마당o)"; }else if(SR_CD == 3) { SR_KIND = "아파트"; }else if(SR_CD == 4) {
		 * SR_KIND = "빌라"; }
		 */
		sVo.setSIT_ID(hiddenSIT_ID);
		sVo.setCUST_ID(id);
		sVo.setSV1_NO(SV1_NO);
		sVo.setSV2_NO(SV2_NO);
		sVo.setSV3_NO(SV3_NO);
		sVo.setSV4_NO(SV4_NO);
		sVo.setSV_AREA(req.getParameter("SV_AREA"));
//		sVo.setSR_CD(SR_CD);
//		sVo.setSR_KIND(SR_KIND);
		sVo.setSIT_ST(Integer.parseInt(req.getParameter("SIT_ST")));

		sVo.setSIT_TITLE(req.getParameter("SIT_TITLE"));
		sVo.setSIT_APPEAL(req.getParameter("SIT_APPEAL"));
		sVo.setSIT_IMG(req.getParameter("SIT_IMG"));

		int updateCnt = sitterDao.updateSitter1(sVo);
		System.out.println("시터 1번재 update : " + updateCnt);
		if (updateCnt != 0) {
			updateCnt = sitterDao.updateSitter2(sVo);
		}
		System.out.println(updateCnt);
		model.addAttribute("updateCnt", updateCnt);
	};

	// 펫시터 찾기 - 리스트 출력
	@Override
	public void workSitterList(HttpServletRequest req, Model model) throws ParseException {
		System.out.println("service ==> workSitterList");
		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		// 정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();
		
		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		vo.setCUST_ID(CUST_ID);

		String SV_AREA = req.getParameter("SV_AREA");
		vo.setSV_AREA(SV_AREA); // 서비스 가능 지역
		
		String[] PET_NM = req.getParameterValues("PET_NM");

		String WK_START = req.getParameter("WK_START"); // 활동 시작 가능일
		String WK_END = req.getParameter("WK_END"); // 활동 시작 종료일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(sdf.parse(WK_START).getTime());
		vo.setWK_START(date);
		date = new Date(sdf.parse(WK_END).getTime());
		vo.setWK_END(date);

		String SV1_NO = req.getParameter("SV1_NO"); // 미용서비스
		String SV2_NO = req.getParameter("SV2_NO"); // 놀이서비스
		String SV3_NO = req.getParameter("SV3_NO"); // 산책서서비스

		// 요금 조회
		String[] pk_cd = req.getParameterValues("pk_cd");

		int sum = 0;

		for (int i = 0; i < pk_cd.length; i++) {
			sum += sitterDao.petServiceFee(Integer.parseInt(pk_cd[i]));
		}

		// 필수 값 이므로 강제 입력
		vo.setSV4_NO(4);

		// 선택한 서비스별 요금을 더한 값을 담을 변수
		int total = sum;

		Integer[] sv_no = new Integer[3];

		if (SV1_NO == null) {
			vo.setSV1_NO(0);
			sv_no[0] = 0;
		} else {
			vo.setSV1_NO(1);
			total += sum;
			sv_no[0] = 1;
		}
		if (SV2_NO == null) {
			vo.setSV2_NO(0);
			sv_no[1] = 0;
		} else {
			vo.setSV2_NO(2);
			total += sum;
			sv_no[1] = 1;
		}
		if (SV3_NO == null) {
			vo.setSV3_NO(0);
			sv_no[2] = 0;
		} else {
			vo.setSV3_NO(3);
			total += sum;
			sv_no[2] = 1;
		}

		vo.setSQ_FEE(total);

		System.out.println("total" + total);

		cnt = sitterDao.getSitterCnt(vo); // 조건에 맞는 시터 수 구하기
		System.out.println("조건충족 시터수 selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		List<SitterVO> list = null;
		if (cnt > 0) {
			vo.setStart(start);
			vo.setEnd(end);

			list = sitterDao.activityList(vo); // 펫시터 찾기 - 리스트 출력

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		model.addAttribute("cnt", cnt);
		model.addAttribute("dtos", list);
		model.addAttribute("SV_AREA", SV_AREA);
		model.addAttribute("total", total);
		model.addAttribute("sv_no", sv_no);
		model.addAttribute("pet", pk_cd);
		model.addAttribute("WK_START", WK_START);
		model.addAttribute("WK_END", WK_END);
		model.addAttribute("PET_NM", PET_NM);

		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

	}

	// 시터 상세 조회
	@Override
	public void detailSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> detailSitter");

		String WK_START = req.getParameter("WK_START");
		String WK_END = req.getParameter("WK_END");
		String[] PET_NM = req.getParameterValues("PET_NM");
		String[] sv_no = req.getParameterValues("sv_no");
		String total = req.getParameter("total");
		String[] pet = req.getParameterValues("pet");

		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		String SV_AREA = req.getParameter("SV_AREA");

		//상세페이지 리스트
		SitterVO vo = sitterDao.detailSitter(SIT_ID);

		//해당 고객의 반려동물 리스트 조회
		List<PetVO> list = sitterDao.MypetList(CUST_ID);
		
		//해당 시터 펫시팅일정 가져오기
		List<String> sitCalendar = new ArrayList<String>();
		sitCalendar = sitterDao.sitterSchedule(SIT_ID);

		//해당 훈련사 리뷰 갯수
		int reviewCnt = sitterDao.sitreviwCnt(SIT_ID);
		System.out.println("reviewCnt : " + reviewCnt);
		if (reviewCnt > 0) {
			//상세페이지 - 리뷰 리스트
			List<SitterVO> revInfo = sitterDao.sitreviewList(SIT_ID);
			model.addAttribute("revInfo", revInfo);
		}

		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("SIT_ID", SIT_ID);
		model.addAttribute("SV_AREA", SV_AREA);
		model.addAttribute("PET_NM", PET_NM);
		model.addAttribute("sv_no", sv_no);
		model.addAttribute("total", total);
		model.addAttribute("pet", pet);
		model.addAttribute("list", list);
		model.addAttribute("WK_START", WK_START);
		model.addAttribute("WK_END", WK_END);
		model.addAttribute("sitCalendar", sitCalendar);
	}

	/*
	 * 날짜 : 21.09.24 작성자 : 임지영 내용 : 시터 - 고객으로부터의 요청 수락대기
	 */
	@Override
	public void allRequestList(HttpServletRequest req, Model model) {
		System.out.println("service ==> allRequestList");
		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		int doubleChk = sitterDao.sitterSignChk(CUST_ID);
		System.out.println("시터중복체크doubleChk : " + doubleChk);
		cnt = sitterDao.getRequestList(CUST_ID);
		System.out.println("요청 제안 cnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		Map<String, Object> map = new HashMap<String, Object>();

		List<SitterVO> list = null;
		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);

			list = sitterDao.selectRequestList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		model.addAttribute("s", "requestForSitter2");
		model.addAttribute("doubleChk", doubleChk);
		model.addAttribute("cnt", cnt);
		model.addAttribute("st", 0);
		model.addAttribute("list", list);

		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

	}

	// 시터 - 고객의 요청 수락할시
	@Override
	public void acceptRequest(HttpServletRequest req, Model model) {
		System.out.println("service ==> acceptRequest");

		int SQ_CD = Integer.parseInt(req.getParameter("SQ_CD"));
		System.out.println("SQ_CD : " + SQ_CD);

		int updateCnt = sitterDao.sitterAccept(SQ_CD);
		System.out.println("upadateCnt : " + updateCnt);

		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("SQ_CD", SQ_CD);

	}

	// 시터 - 펫시터가 수락한 고객요청 내역을 보여주는 페이지
	@Override
	public void acceptRequestList(HttpServletRequest req, Model model) {
		System.out.println("service ==> acceptRequestList");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getsitterAcceptCount(CUST_ID);
		System.out.println("수락한 내역selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		Map<String, Object> map = new HashMap<String, Object>();
		List<SitterVO> list = null;

		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);

			list = sitterDao.sitterAcceptList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		int st = 1;
		
		model.addAttribute("s", "sitterAcceptList");
		model.addAttribute("cnt", cnt);
		model.addAttribute("st", st);
		model.addAttribute("CUST_ID", CUST_ID);
		model.addAttribute("list", list);

		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - 펫시팅 신청하기
	@Override
	public void insertRequest(HttpServletRequest req, Model model) throws ParseException {

		System.out.println("service ==> insertRequest");

		// 정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();

		vo.setCUST_ID((String) req.getSession().getAttribute("cust_id"));
		String SQ_LOC = req.getParameter("SV_AREA"); // 고객거주지역
		vo.setSQ_LOC(SQ_LOC);
		System.out.println("SQ_LOC : " + SQ_LOC);

		String PET_CD[] = req.getParameterValues("PET_CD");
		String PET_NM[] = req.getParameterValues("PET_NM");
		String PK_CD[] = req.getParameterValues("PK_CD");
		String result = "";

		System.out.println("길이 : " + PET_NM.length);

		int sum = 0;
		for (int i = 0; i < PET_NM.length; i++) {

			if (PET_NM.length == 0)
				result += PET_NM[i];
			else
				result += PET_NM[i] + "  ";
		}

		for (int i = 0; i < PK_CD.length; i++) {
			sum += sitterDao.petServiceFee(Integer.parseInt(PK_CD[i]));
		}

		System.out.println("result : " + result);

		vo.setSIT_ID(Integer.parseInt(req.getParameter("SIT_ID"))); // 시터ID
		vo.setSQ_AMT(result); // 펫 이름

		String SV1_NO = req.getParameter("SV1_NO"); // 미용서비스
		String SV2_NO = req.getParameter("SV2_NO"); // 놀이서비스
		String SV3_NO = req.getParameter("SV3_NO"); // 산책서비스
		String SV4_NO = req.getParameter("SV4_NO"); // 응급처치서비스
		System.out.println("SV1_NO : " + SV1_NO);
		System.out.println("SV2_NO : " + SV2_NO);
		System.out.println("SV3_NO : " + SV3_NO);
		System.out.println("SV4_NO : " + SV4_NO);

		String service = "";

		int total = sum;

		if (SV1_NO != null) {
			service += SV1_NO + ",";
			total += sum;
		}
		if (SV2_NO != null) {
			service += SV2_NO + ",";
			total += sum;
		}
		if (SV3_NO != null) {
			service += SV3_NO + ",";
			total += sum;
		}
		if (SV4_NO != null) {
			service += SV4_NO;
			total += sum;
		}

		System.out.println("service : " + service);
		vo.setREQ_SV(service); // 고객요청서비스
		String START_DAY = req.getParameter("START_DAY"); // 의뢰시작일
		String END_DAY = req.getParameter("END_DAY"); // 의뢰종료일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(sdf.parse(START_DAY).getTime());
		vo.setSTART_DAY(date);// 의뢰시작일
		date = new Date(sdf.parse(END_DAY).getTime());
		vo.setEND_DAY(date); // 의뢰종료일

		vo.setSQ_FEE(total);

		int insertCnt = sitterDao.selectRequestInsert(vo);
		System.out.println("펫시팅 요청 insertCnt : " + insertCnt);

		model.addAttribute("insertCnt", insertCnt);
	}

	// 시터 - 고객의 요청 거절할 시
	@Override
	public void cancleRequest(HttpServletRequest req, Model model) {
		System.out.println("service ==> cancleRequest");
		int SQ_CD = Integer.parseInt(req.getParameter("SQ_CD"));
		System.out.println("SQ_CD : " + SQ_CD);

		int updateCnt = sitterDao.sitterRefuse(SQ_CD);
		System.out.println("upadateCnt : " + updateCnt);

		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("SQ_CD", SQ_CD);
	}

	// 시터 - 고객의 요청 거절할 시 내역을 보여주는 페이지
	@Override
	public void cancleRequestList(HttpServletRequest req, Model model) {
		System.out.println("service ==> cancleRequestList");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getsitterRefuseCount(CUST_ID);
		System.out.println("거절리스트 selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		Map<String, Object> map = new HashMap<String, Object>();

		List<SitterVO> list = null;
		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);

			list = sitterDao.sitterRefuseList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		int st = 2;

		model.addAttribute("s", "sitterRefuseList");
		model.addAttribute("cnt", cnt);
		model.addAttribute("CUST_ID", CUST_ID);
		model.addAttribute("st", st);
		model.addAttribute("list", list);

		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호

	}

	// 시터 - 고객과의 서비스 매칭완료 내역을 보여주는 페이지(고객이 결제완료하면 매칭완료)
	@Override
	public void MatchingFinishList(HttpServletRequest req, Model model) {
		System.out.println("service ==> MatchingFinishList");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getSitterMTFinCount(CUST_ID);
		System.out.println("시터 - 매칭완료selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		Map<String, Object> map = new HashMap<String, Object>();

		List<SitterVO> list = null;
		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);
			list = sitterDao.sitterMatchingFinList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		model.addAttribute("s", "sitterserPayFinish");
		model.addAttribute("cnt", cnt);
		model.addAttribute("st", 3);
		model.addAttribute("list", list);

		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - (시터로부터) 요청수락 대기 중인 내역을 보여주는 페이지
	@Override
	public void WaitRequestAccept(HttpServletRequest req, Model model) {
		System.out.println("service ==> WaitRequestAccept");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getWaitReqAccept(CUST_ID);
		System.out.println("요청수락대기 selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		Map<String, Object> map = new HashMap<String, Object>();
		List<SitterVO> list = null;
		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);

			list = sitterDao.sitterWaitReqList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("s", "MysitterSerList2");
		model.addAttribute("cnt", cnt);
		model.addAttribute("list", list);

		System.out.println("pageNum : " + pageNum);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - '요청수락대기' 중인 서비스 취소
	@Override
	public void reqSitterSerCancle(HttpServletRequest req, Model model) {
		System.out.println("service ==> reqSitterSerCancle");
		int SQ_CD = Integer.parseInt(req.getParameter("SQ_CD"));
		System.out.println("SQ_CD : " + SQ_CD);

		int deleteCnt = sitterDao.sitterReqCancle(SQ_CD);
		System.out.println("요청 취소 deleteCnt : " + deleteCnt);

		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 고객 - (시터로부터) 수락된요청 내역을 보여주는 페이지
	@Override
	public void acceptFromSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> acceptFromSitter");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getAcceptList(CUST_ID);
		System.out.println("수락된요청수 selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		Map<String, Object> map = new HashMap<String, Object>();

		List<SitterVO> list = null;

		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);

			list = sitterDao.acceptReqList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		model.addAttribute("s","acceptSitterSer");
		model.addAttribute("cnt", cnt);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - (시터로부터) 거절된 요청 내역을 보여주는 페이지
	@Override
	public void refuseFromSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> refuseFromSitter");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getRefuseList(CUST_ID);
		System.out.println("거절된요청수 selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		List<SitterVO> list = null;
		Map<String, Object> map = new HashMap<String, Object>();

		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);
			list = sitterDao.refuseReqList(map);

			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}

		model.addAttribute("s", "refuseSitterSer");
		model.addAttribute("cnt", cnt);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - 결제 완료 후 매칭확정 버튼을 클릭하면 처리상태(SQ_ST) 4로 업데이트
	@Override
	public void matchingConfirm(HttpServletRequest req, Model model) {
		System.out.println("service ==> matchingConfirm");
		
		int SQ_CD = Integer.parseInt(req.getParameter("SQ_CD"));
		System.out.println("시터요청번호SQ_CD : " + SQ_CD);
		int updateCnt = sitterDao.matchingConfirm(SQ_CD);
		
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("SQ_CD", SQ_CD);
	}
	
	// 고객 - 고객이 결제 완료한 내역을 보여주는 페이지
	@Override
	public void matchingList(HttpServletRequest req, Model model) {
		System.out.println("service ==> matchingList");

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");

		cnt = sitterDao.getMatchingFin(CUST_ID);
		System.out.println("매칭완료selectCnt : " + cnt);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		List<SitterVO> list = null;
		List<Integer> rc = new ArrayList<Integer>();

		Map<String, Object> map = new HashMap<String, Object>();
		int reviewCheckCnt = 0;

		if (cnt > 0) {
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);
			list = sitterDao.MatchingFinish(map);

			for (int i = 0; i < list.size(); i++) {
				int SQ_CD = list.get(i).getSQ_CD();
				System.out.println("시터구하기요청번호SQ_CD : " + SQ_CD);
				// 후기 작성 중복체크
				reviewCheckCnt = sitterDao.sittterReviewChkCnt(SQ_CD);
				System.out.println("중복체크 reviewCheckCnt : " + reviewCheckCnt);
				rc.add(reviewCheckCnt);
			}
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}

		model.addAttribute("s", "matchingFinish");
		model.addAttribute("reviewCheckCnt", rc);
		model.addAttribute("cnt", cnt);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	// 고객 - (서비스완료-결제완료) 후 이용한 펫시터서비스에 대한 후기를 작성하는 페이지
	@Override
	public void writeSitterReview(HttpServletRequest req, Model model) {
		System.out.println("service ==> writeSitterReview");

		SitterVO vo = new SitterVO();

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		vo.setCUST_ID(CUST_ID);

		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		System.out.println("SIT_ID : " + SIT_ID);
		vo.setSIT_ID(SIT_ID);
		
		int SQ_CD = Integer.parseInt(req.getParameter("SQ_CD"));
		System.out.println("SQ_CD" + SQ_CD);
		vo.setSQ_CD(SQ_CD);

		float SG_GRADE = Float.parseFloat(req.getParameter("SG_GRADE"));
		vo.setSG_GRADE(SG_GRADE);
		vo.setSG_CON(req.getParameter("SG_CON"));
		vo.setSG_IMG(req.getParameter("SG_IMG"));

		int insertCnt = sitterDao.ReviewWrite(vo);
		System.out.println("후기테이블 insertCnt : " + insertCnt);

		model.addAttribute("insertCnt", insertCnt);
	}

	//고객 - 나의 리뷰내역 리스트
	@Override
	public void myreviewList(HttpServletRequest req, Model model) {
		System.out.println("service ==> myreviewList");	

		// 페이징
		int pageSize = 12; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 출력용 글번호
		String pageNum = "";// 페이지번호
		int currentPage = 0;// 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막 페이지
		
		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		
		List<SitterVO> list=null;
		cnt = sitterDao.getMyreviewList(CUST_ID);
		System.out.println("리뷰수selectCnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}

		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(cnt > 0) {
			
			map.put("CUST_ID", CUST_ID);
			map.put("start", start);
			map.put("end", end);
			list = sitterDao.MyreviewList(map);
			
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("list",list);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		
		
	}

	//고객 - 나의 리뷰내역 수정 페이지
	@Override
	public void myreviewModify(HttpServletRequest req, Model model) {
		System.out.println("service ==> myreviewModify");
		
		int SG_CD = Integer.parseInt(req.getParameter("SG_CD"));
		System.out.println("후기번호 SG_CD : " + SG_CD);
		
		List<SitterVO> list = sitterDao.reviewModifypg(SG_CD);
	
		model.addAttribute("list", list);
		model.addAttribute("SG_CD", SG_CD);
	}
	
	// 고객 - 나의 리뷰내역 수정 처리
	@Override
	public void myreviewModifyAction(HttpServletRequest req, Model model) {
		System.out.println("service ==> myreviewModifyAction");
		
		SitterVO vo = new SitterVO(); 
		int SG_CD = Integer.parseInt(req.getParameter("SG_CD"));
		System.out.println("SG_CD : " + SG_CD);
		vo.setSG_CD(SG_CD);
		
		float SG_GRADE = Float.valueOf(req.getParameter("SG_GRADE"));
		vo.setSG_GRADE(SG_GRADE);
		vo.setSG_CON(req.getParameter("SG_CON"));
		vo.setSG_IMG(req.getParameter("SG_IMG"));
		
		int updateCnt = sitterDao.reviewModifyAction(vo);
		System.out.println("리뷰수정처리updateCnt : " + updateCnt);
		
		model.addAttribute("updateCnt",updateCnt);
		
	}
	
	//고객 - 나의 리뷰내역 삭제
	@Override
	public void myreviewDelete(HttpServletRequest req, Model model) {
		System.out.println("service ==> myreviewDelete");	
		
		int SG_CD = Integer.parseInt(req.getParameter("SG_CD"));
		int deleteCnt = sitterDao.reviewDeleteAction(SG_CD);
		System.out.println("리뷰삭제처리 deleteCnt : " + deleteCnt);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	
	
	/*
	 * // 고객 - 시터후기 미리보기(별점 높은순)
	 * 
	 * @Override public void highSittergrade(HttpServletRequest req, Model model) {
	 * System.out.println("service ==> highSittergrade");
	 * 
	 * int selectCnt = sitterDao.getreviewCnt();
	 * System.out.println("후기테이블selectCnt : " + selectCnt); List<SitterVO>
	 * list=null;
	 * 
	 * if(selectCnt > 0) { list = sitterDao.bestStarSitter(); }
	 * 
	 * model.addAttribute("selectCnt" , selectCnt); model.addAttribute("list",
	 * list); }
	 * 
	 * // 고객 - 시터후기 미리보기(최신등록순)
	 * 
	 * @Override public void newSitterPost(HttpServletRequest req, Model model) {
	 * System.out.println("service ==> newSitterPost");
	 * 
	 * int selectCnt = sitterDao.getreviewCnt();
	 * System.out.println("후기테이블selectCnt : " + selectCnt); List<SitterVO>
	 * list=null;
	 * 
	 * if(selectCnt > 0) { list = sitterDao.newSitterReview(); }
	 * 
	 * model.addAttribute("selectCnt" , selectCnt); model.addAttribute("list",
	 * list); }
	 * 
	 * // 고객 - 시터후기 미리보기(후기 많은순)
	 * 
	 * @Override public void themostsitterReview(HttpServletRequest req, Model
	 * model) { System.out.println("service ==> themostsitterReview");
	 * 
	 * int selectCnt = sitterDao.getreviewCnt();
	 * System.out.println("후기테이블selectCnt : " + selectCnt); List<SitterVO>
	 * list=null;
	 * 
	 * if(selectCnt > 0) { list = sitterDao.bigSitterReview(); }
	 * 
	 * model.addAttribute("selectCnt" , selectCnt); model.addAttribute("list",
	 * list); }
	 */
	// 결제하기
	@Override
	public void sitterPay(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub

	}

	// 요금표 리스트
	@Override
	public void priceInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> priceInfo");

		List<PetVO> dtos = new ArrayList<PetVO>();

		dtos = sitterDao.getPriceList();

		System.out.println("길이 : " + dtos.size());

		req.setAttribute("dtos", dtos);
	}

	// 고객 - 펫시터지원 - 동일한 아이디로 시터 등록이 되어있을시 페이지접근x
	@Override
	public void sitterSignInChk(HttpServletRequest req, Model model) {
		System.out.println("service ==> sitterSignInChk");

		String CUST_ID = (String) req.getSession().getAttribute("cust_id");
		int selectCnt = sitterDao.sitterSignChk(CUST_ID);
		System.out.println("시터중복체크selectCnt : " + selectCnt);

		model.addAttribute("selectCnt", selectCnt);

	}

	/* 21-09-29 / 신도빈 / 결제완료 후 요청테이블 상태 업데이트 'SQ_ST : 1' */
	// 고객 - 카카오페이 결제 완료 후 요청 테이블 상태 업데이트
	@Override
	public int paySuccessUpdate(HttpServletRequest req, Model model) {

		int primarykey = Integer.parseInt(req.getParameter("primarykey"));

		System.out.println("서비스 pk : " + primarykey);

		int updateCnt = sitterDao.updatePay(primarykey);

		return updateCnt;
	}



}
