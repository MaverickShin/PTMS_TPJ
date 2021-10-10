package ptms.mvc.tpj.TrainerService;

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

import ptms.mvc.tpj.CustVO.TrainerRequestVO;
import ptms.mvc.tpj.CustVO.TrainerVO;
import ptms.mvc.tpj.Customer_Main_DAO.MainDAOImpl;
import ptms.mvc.tpj.TrainerDAO.TrainerDAOImpl;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerDAOImpl dao;
	
	@Autowired
	MainDAOImpl maindao;
	
	//훈련사 등록
	@Override
	public void insertTrainer(HttpServletRequest req, Model model) throws ParseException {
		TrainerVO vo = new TrainerVO();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		vo.setCUST_ID(id);
		vo.setTA_TITLE(req.getParameter("TA_TITLE"));
		vo.setTA_APPEAL(req.getParameter("TA_APPEAL"));
		vo.setTA_IMG(req.getParameter("TA_IMG"));
		vo.setTS_AREA(req.getParameter("address1"));
		System.out.println(req.getParameter("address1"));
		
		int TS1_NO = 0;
		TS1_NO = req.getParameter("TS1_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS1_NO"));
		vo.setTS1_NO(TS1_NO);
		int tr_kind1_fee = 0;
		tr_kind1_fee = req.getParameter("tr_kind1_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind1_fee"));
		vo.setTS1_FEE(tr_kind1_fee);
		System.out.println("TS1_NO : " + TS1_NO);
		System.out.println("tr_kind1_fee : " + tr_kind1_fee);
		
		int TS2_NO = 0;
		TS2_NO = req.getParameter("TS2_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS2_NO"));
		vo.setTS2_NO(TS2_NO);
		int tr_kind2_fee = 0;
		tr_kind2_fee = req.getParameter("tr_kind2_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind2_fee"));
		vo.setTS2_FEE(tr_kind2_fee);
		
		int TS3_NO = 0;
		TS3_NO = req.getParameter("TS3_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS3_NO"));
		vo.setTS3_NO(TS3_NO);
		int tr_kind3_fee = 0;
		tr_kind3_fee = req.getParameter("tr_kind3_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind3_fee"));
		vo.setTS3_FEE(tr_kind3_fee);
		
		int TS4_NO = 0;
		TS4_NO = req.getParameter("TS4_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS4_NO"));
		vo.setTS4_NO(TS4_NO);
		System.out.println();
		int tr_kind4_fee = 0;
		tr_kind4_fee = req.getParameter("tr_kind4_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind4_fee"));
		vo.setTS4_FEE(tr_kind4_fee);
		System.out.println("tr_kind4_fee : " + tr_kind4_fee);
		
		String START_DAY = req.getParameter("START_DAY");
	    String END_DAY = req.getParameter("END_DAY");
	      
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      
	    Date date = new Date(sdf.parse(START_DAY).getTime());
	      
	    vo.setSTART_DAY(date);
	      
	    date = new Date(sdf.parse(END_DAY).getTime());
	      
	    vo.setEND_DAY(date);
		
		int ADJUSTABLE = 0;
		ADJUSTABLE = req.getParameter("ADJUSTABLE") == null ? 0 : Integer.parseInt(req.getParameter("ADJUSTABLE"));
		vo.setADJUSTABLE(ADJUSTABLE);
		System.out.println("ADJUSTABLE : " + ADJUSTABLE);
		
		int insertCnttr = dao.insertTrainer(vo);
		System.out.println("insertCnttr : " + insertCnttr);
		if(insertCnttr == 1) {
			int insertCntdt = dao.insertTrainerDetail(vo);
			System.out.println("insertCntdt : " + insertCntdt);
			model.addAttribute("insertCntdt", insertCntdt);
		}
	}

	@Override
	public void TrainerList(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("id : " + id);
		
		map.put("id", id);
		
		int TQ_AMT = Integer.parseInt(req.getParameter("TQ_AMT"));
		System.out.println("tq_amt : " + TQ_AMT);
		map.put("TQ_AMT", TQ_AMT);
		
		String TQ_LOC = req.getParameter("TQ_LOC");
		System.out.println("TQ_LOC- : " + TQ_LOC);
		map.put("TQ_LOC", TQ_LOC);
		
		String START_DAY = req.getParameter("START_DAY");
		System.out.println("START_DAY : " + START_DAY);
		map.put("START_DAY", START_DAY);
		
		String END_DAY = req.getParameter("END_DAY");
		System.out.println("END_DAY : " + END_DAY);
		map.put("END_DAY", END_DAY);
		
		int ADJUSTABLE = 0;
		ADJUSTABLE = req.getParameter("ADJUSTABLE") == null ? 0 : Integer.parseInt(req.getParameter("ADJUSTABLE"));
		System.out.println("ADJUSTABLE : " + ADJUSTABLE);
		map.put("ADJUSTABLE", ADJUSTABLE);
		
		cnt = dao.trainerSelectCnt(map);
		System.out.println("트레이너 목록 cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerVO> dtos = null;
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			dtos = dao.trainerList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dtos", dtos);
		model.addAttribute("TQ_LOC", TQ_LOC);
		
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	@Override
	public void TrainerInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		String TQ_LOC = req.getParameter("TQ_LOC");
		System.out.println("tq_loc : " + TQ_LOC);
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		System.out.println("TA_CD : " + TA_CD);
		
		// 회원의 마이펫 마릿수 가져오기
		int selectCnt = dao.getPetCount(id);
		System.out.println("마이펫있는지 체크selectCnt : " + selectCnt);
		
		// 회원의 마이펫이 있으면 펫의 정보 가져오기
		if(selectCnt > 0) {
			List<TrainerVO> petInfo = dao.getPetInfo(id);
			model.addAttribute("petInfo", petInfo);
		}

		// 훈련사 정보 가져오기
		TrainerVO vo = dao.trainerInfo(TA_CD);
		
		// 훈련사의 일정 가져오기
		List<String> calendar = new ArrayList<String>();
		calendar = dao.getTrainerCalendar(TA_CD);
		for(int i = 0; i <= calendar.size() - 1; i++) {
			System.out.println("calendar : " + calendar.get(i));
		}
		
		// 훈련사의 후기 갯수 가져오기
		int reviewCnt = dao.reviewCnt(TA_CD);
		System.out.println("reviewCnt : " + reviewCnt);
		
		// 훈련사의 후기가 있으면 후기 정보 가져오기
		if(reviewCnt > 0) {
			List<TrainerVO> reviewInfo = dao.getReviewInfo(TA_CD);
			model.addAttribute("reviewInfo", reviewInfo);
		}
		
		model.addAttribute("reviewCnt", reviewCnt);
		System.out.println(vo.getTS1_NO());
		model.addAttribute("dto", vo);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("TQ_LOC", TQ_LOC);
		model.addAttribute("TA_CD", TA_CD);
		model.addAttribute("calendar", calendar);
	}

	// 훈련사 정보 수정 화면
	@Override
	public void updateTrainer(HttpServletRequest req, Model model) {
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		
		int trainerChkCnt = dao.trainerChkCnt(CUST_ID);
		System.out.println("trainerChkCnt : " + trainerChkCnt);
		model.addAttribute("trainerChkCnt", trainerChkCnt);
		
		
		TrainerVO vo = dao.TrainerDetail(CUST_ID);
		
		System.out.println("TA_ST : "+ vo.getTA_ST());
		
		model.addAttribute("dto",vo);
		
	}

	// 훈련사 정보 수정 처리	
	@Override
	public void updateTrainerAction(HttpServletRequest req, Model model) throws ParseException {
		
		TrainerVO tVo = new TrainerVO();
		
		int hiddenTA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		String id = (String)req.getSession().getAttribute("cust_id");
		
		int TS1_NO = 0;
		TS1_NO = req.getParameter("TS1_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS1_NO"));
		
		int tr_kind1_fee = 0;
		tr_kind1_fee = req.getParameter("tr_kind1_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind1_fee"));
		
		System.out.println("TS1_NO : " + TS1_NO);
		System.out.println("tr_kind1_fee : " + tr_kind1_fee);
		
		int TS2_NO = 0;
		TS2_NO = req.getParameter("TS2_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS2_NO"));
		
		int tr_kind2_fee = 0;
		tr_kind2_fee = req.getParameter("tr_kind2_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind2_fee"));
		
		int TS3_NO = 0;
		TS3_NO = req.getParameter("TS3_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS3_NO"));
		
		int tr_kind3_fee = 0;
		tr_kind3_fee = req.getParameter("tr_kind3_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind3_fee"));
		
		int TS4_NO = 0;
		TS4_NO = req.getParameter("TS4_NO") == null ? 0 : Integer.parseInt(req.getParameter("TS4_NO"));
		
		System.out.println();
		int tr_kind4_fee = 0;
		tr_kind4_fee = req.getParameter("tr_kind4_fee") == "" ? 0 : Integer.parseInt(req.getParameter("tr_kind4_fee"));
		
		System.out.println("tr_kind4_fee : " + tr_kind4_fee);
		
		String START_DAY = req.getParameter("START_DAY");
		String END_DAY = req.getParameter("END_DAY");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date(sdf.parse(START_DAY).getTime());
		tVo.setSTART_DAY(date);
		
		date = new Date(sdf.parse(END_DAY).getTime());
		tVo.setEND_DAY(date);
		
		tVo.setTA_CD(hiddenTA_CD);
		tVo.setCUST_ID(id);
		tVo.setTS1_NO(TS1_NO);
		tVo.setTS1_FEE(tr_kind1_fee);
		tVo.setTS2_NO(TS2_NO);
		tVo.setTS2_FEE(tr_kind2_fee);
		tVo.setTS3_NO(TS3_NO);
		tVo.setTS3_FEE(tr_kind3_fee);
		tVo.setTS4_NO(TS4_NO);
		tVo.setTS4_FEE(tr_kind4_fee);
		tVo.setTA_ST(Integer.parseInt(req.getParameter("TA_ST")));
		tVo.setTS_AREA(req.getParameter("address2"));
		tVo.setTA_TITLE(req.getParameter("TA_TITLE"));
		tVo.setTA_APPEAL(req.getParameter("TA_APPEAL"));
		tVo.setTA_IMG(req.getParameter("TA_IMG"));
		
		int ADJUSTABLE = 0;
		ADJUSTABLE = req.getParameter("ADJUSTABLE") == null ? 0 : Integer.parseInt(req.getParameter("ADJUSTABLE"));
		tVo.setADJUSTABLE(ADJUSTABLE);
		System.out.println("ADJUSTABLE : " + ADJUSTABLE);
		
		int updateCnt = dao.updateTrainer1(tVo);
		
		System.out.println("1번째 update : " + updateCnt);
		
		if(updateCnt != 0) {
			updateCnt = dao.updateTrainer2(tVo);
		}
		
		System.out.println(updateCnt);
		model.addAttribute("updateCnt",updateCnt);
	}
	
	// 훈련사 등록 탈퇴
	@Override
	public void deleteTrainer(HttpServletRequest req, Model model) {
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		int deleteCnt = dao.deleteTrainer2(TA_CD);
		if(deleteCnt != 0) {
			dao.deleteTrainer(TA_CD);
		}
		
		model.addAttribute("deleteCnt",deleteCnt);
	}

	// 훈련사 요청테이블에 insert
	@Override
	public void reserveTrainer(HttpServletRequest req, Model model) throws ParseException {
		TrainerRequestVO vo = new TrainerRequestVO();
		
		String CUST_ID = (String)req.getSession().getAttribute("cust_id"); //의뢰인 아이디
		System.out.println("CUST_ID : " + CUST_ID);
		vo.setCUST_ID(CUST_ID);
		
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		System.out.println("TA_CD : " + TA_CD);
		vo.setTA_CD(TA_CD);
		
		int TQ_AMT = Integer.parseInt(req.getParameter("TQ_AMT"));
		System.out.println("TQ_AMT : " + TQ_AMT);
		if(TQ_AMT == 1) {
			vo.setTQ_AMT("배변해결");
		} else if(TQ_AMT == 2) {
			vo.setTQ_AMT("분리불안");
		} else if(TQ_AMT == 3) {
			vo.setTQ_AMT("기본훈련");
		} else {
			vo.setTQ_AMT("짖음해결");
		}
		
		int TQ_FEE = Integer.parseInt(req.getParameter("TQ_FEE"));
		System.out.println("TQ_FEE : " + TQ_FEE);
		
		String PET_NM[] = req.getParameterValues("PET_NM");
		
		String result = "";
		
		for(int i = 0; i < PET_NM.length; i++) {
			
			if(PET_NM.length == 0) {
				result += PET_NM[i];
			} else {
				result += PET_NM[i] + " ";
			}
		}
		vo.setTQ_FEE(TQ_FEE * PET_NM.length);
		System.out.println("result : " + result);
		vo.setPET_NM(result);
		
		String TQ_LOC = req.getParameter("TQ_LOC");
		System.out.println("TQ_LOC : " + TQ_LOC);
		vo.setTQ_LOC(TQ_LOC);
		
		String START_DAY = req.getParameter("START_DAY");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      
	    Date date = new Date(sdf.parse(START_DAY).getTime());
	    System.out.println("date : " + date);
	    vo.setSTART_DAY(date);
	    
	    int insertCnt = dao.insertTrainerReservation(vo);
		model.addAttribute("insertCnt", insertCnt);
		
	}

	@Override
	public void payToTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 나에게 온 의뢰 - 요청대기
	@Override
	public void TraineeList(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		// 훈련사로 등록되어있는지 체크
		int trainerChkCnt = dao.trainerChkCnt(id);
		model.addAttribute("trainerChkCnt", trainerChkCnt);
		
		cnt = dao.TraineeListCnt(id);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("cnt : " + cnt);
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.TraineeList(map);
			System.out.println(vo);
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "requestTrainer2");
	}

	@Override
	public void withrawTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void withrawTrainee(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAcceptTraining(HttpServletRequest req, Model model) {
		int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
		System.out.println("TQ_CD : " + TQ_CD);
		
		int updateCnt = dao.updateAcceptTraining(TQ_CD);
		System.out.println("updateCnt-accept : " +updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	@Override
	public void updateDenyTraining(HttpServletRequest req, Model model) {
		int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
		System.out.println("TQ_CD : " + TQ_CD);
		
		int updateCnt = dao.updateDenyTraining(TQ_CD);
		System.out.println("updateCnt-deny : " + updateCnt);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 훈련사용 요청 수락 리스트
	@Override
	public void acceptTrainingList(HttpServletRequest req, Model model) {
		
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		cnt = dao.acceptTraineeListCnt(id);
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.acceptTraineeList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "acceptTrainingList");
	}

	// 훈련사용 요청 거절 리스트
	@Override
	public void denyTrainingList(HttpServletRequest req, Model model) {
		
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		cnt = dao.denyTraineeListCnt(id);
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.denyTraineeList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "denyTrainingList");
	}

	@Override
	public void custReqResultwait(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		// 훈련사로 등록되어있는지 체크
		int trainerChkCnt = dao.trainerChkCnt(id);
		System.out.println("trainerChkCnt : " + trainerChkCnt);
		model.addAttribute("trainerChkCnt", trainerChkCnt);
		
		cnt = dao.custReqResultwaitCnt(id);
		System.out.println("수락요청대기selectCnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.custReqResultwaitList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
			
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		
		model.addAttribute("st", 0);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "custReqResult2");
	}

	@Override
	public void cancelRequestTraining(HttpServletRequest req, Model model) {
		int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
		System.out.println("TQ_CD : " + TQ_CD);
		
		int deleteCnt = dao.deleteReservation(TQ_CD);
		System.out.println("deleteCnt : " + deleteCnt);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void custReqResultAccept(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		cnt = dao.custReqResultacceptCnt(id);
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.custReqResultacceptList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("st", 1);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "custReqResultAccept");
	}

	@Override
	public void custReqResultDeny(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		cnt = dao.custReqResultdenyCnt(id);
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.custReqResultdenyList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("st", 2);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "custReqResultDeny");
	}

	@Override
	public void trainingComplete(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		cnt = dao.trainingCompleteCnt(id);
		System.out.println("cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		
		List<Integer> rc = new ArrayList<Integer>();
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			//훈련 완료 정보를 가져옴
			vo = dao.trainingComplete(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
			
			for(int i = 0; i < vo.size(); i++) {
				int TQ_CD = vo.get(i).getTQ_CD();
				//후기 작성 중복체크
				
				System.out.println("tq_cd : " + TQ_CD);
				
				int result = dao.reviewCheckCnt(TQ_CD);
				
				System.out.println("후기result : " + result);
				
				rc.add(result);
				System.out.println("rc : " + rc.get(i));
			}
		
			
		}
		
		System.out.println("rc : " + rc.size());
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("reviewCheckCnt", rc);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", "trainingComplete");
	}

	@Override
	public void writeTrainingReview(HttpServletRequest req, Model model) {
		TrainerVO vo = new TrainerVO();
		
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + CUST_ID);
		vo.setCUST_ID(CUST_ID);
		
		int TG_ID = Integer.parseInt(req.getParameter("TG_ID"));
		System.out.println("TG_ID : " + TG_ID);
		vo.setTG_ID(TG_ID);
		
		int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
		System.out.println("TQ_CD : " + TQ_CD);
		vo.setTQ_CD(TQ_CD);
		
		String TG_GRADE = req.getParameter("TG_GRADE");
		
		float tg = Float.parseFloat(TG_GRADE);
		vo.setTG_GRADE(tg);
		
		String TG_CON = req.getParameter("TG_CON");
		vo.setTG_CON(TG_CON);
		
		String TG_IMG = req.getParameter("TG_IMG");
		vo.setTG_IMG(TG_IMG);
		
		int insertCnt = dao.insertTrainingReview(vo);
		model.addAttribute("insertCnt", insertCnt);
	}
/*
	@Override
	public void previewTrainingGrade(HttpServletRequest req, Model model) {
		
		int selectCnt = dao.trainingGradeCnt();
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.previewTrainingGrade();
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
	}
*/
	// 고객 - 결제완료 내역
	@Override
	public void payment(HttpServletRequest req, Model model) {
		
		int selectCnt = 0;
		
		List<TrainerRequestVO> vo = null;
		
		model.addAttribute("st", 3);
		model.addAttribute("list", vo);
		model.addAttribute("selectCnt", selectCnt);
	}
	
	/* 21-09-29 / 신도빈  / 결제완료 후 요청테이블 상태 업데이트 'TQ_ST : 1' */
	// 고객 - 카카오페이 결제 완료 후 요청 테이블 상태 업데이트
	@Override
	public int paySuccessUpdate(HttpServletRequest req, Model model) {
		
		int primarykey = Integer.parseInt(req.getParameter("primarykey"));
		
		System.out.println("서비스 pk : " + primarykey);
		
		int updateCnt = dao.updatePay(primarykey);
		System.out.println("updateCnt : "+ updateCnt);
		return updateCnt; 
	}

	@Override
	public void TrainingServiceComplete(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("id : " + id);
		
		cnt = dao.TrainingServiceCompleteCnt(id);
		System.out.println("훈련완료cnt : " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerRequestVO> vo = null;
		
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.TrainingServiceCompleteList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("t", 4);
	}
	/*
	@Override
	public void newTrainerList(HttpServletRequest req, Model model) {
		
		int selectCnt = dao.newTrainerCnt();
		
		List<TrainerVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.newTrainerList();
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
	}

	@Override
	public void lotsOfReviews(HttpServletRequest req, Model model) {
		
		int selectCnt = dao.lotsOfReviewsCnt();
		
		List<TrainerVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.lotsOfReviews();
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
	}
	*/

	@Override
	public void trainerDupChk(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		int selectCnt = dao.trainerDupChk(id);
		System.out.println("훈련사중복체크selectCnt : " + selectCnt);
		  
		model.addAttribute("selectCnt", selectCnt);
		
	}

	@Override
	public void updateTrainingComplete(HttpServletRequest req, Model model) {
		int TQ_CD = Integer.parseInt(req.getParameter("TQ_CD"));
		System.out.println("TQ_CD : " + TQ_CD);
		
		int updateCnt = dao.updateTrainingComplete(TQ_CD);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	@Override
	public void getReviewInfo(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 12;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		
		// 훈련사로 등록되어있는지 체크
		int trainerChkCnt = dao.trainerChkCnt(id);
		model.addAttribute("trainerChkCnt", trainerChkCnt);
		
		// 아이디별 후기 갯수
		cnt = dao.getIDreviewCnt(id);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		number = cnt - (currentPage - 1) * pageSize;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("result : " + pageCount);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<TrainerVO> vo = null;
		if(cnt > 0) {
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			vo = dao.getIDreviewInfo(map);
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	@Override
	public void modifyReview(HttpServletRequest req, Model model) {
		int TG_CD = Integer.parseInt(req.getParameter("TG_CD"));
		System.out.println("TG_CD : " + TG_CD);
		
		TrainerVO vo = dao.ModifyInfo(TG_CD);
		
		model.addAttribute("dto", vo);
	}

	@Override
	public void modifyReviewAction(HttpServletRequest req, Model model) {
		int TG_CD = Integer.parseInt(req.getParameter("TG_CD"));
		System.out.println("TG_CD : " + TG_CD);
		
		TrainerVO vo = new TrainerVO();
		String TG_GRADE = req.getParameter("TG_GRADE");
		
		float tg = Float.parseFloat(TG_GRADE);
		
		System.out.println("tg : " + tg);
		
		vo.setTG_GRADE(tg);
		vo.setTG_CON(req.getParameter("TG_CON"));
		vo.setTG_IMG(req.getParameter("TG_IMG"));
		vo.setTG_CD(TG_CD);
		
		int updateCnt = dao.modifyReviewAction(vo);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void deleteTrainingReview(HttpServletRequest req, Model model) {
		int TG_CD = Integer.parseInt(req.getParameter("TG_CD"));
		System.out.println("TG_CD : " + TG_CD);
		
		int deleteReviewCnt = dao.deleteReviewCnt(TG_CD);
		System.out.println("deleteReviewCnt : " + deleteReviewCnt);
		
		model.addAttribute("deleteReviewCnt", deleteReviewCnt);
		
	}
}
