package ptms.mvc.tpj.TrainerService;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.TrainerRequestVO;
import ptms.mvc.tpj.CustVO.TrainerVO;
import ptms.mvc.tpj.Sitter_DAO.SitterDAOImpl;
import ptms.mvc.tpj.TrainerDAO.TrainerDAO;
import ptms.mvc.tpj.TrainerDAO.TrainerDAOImpl;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerDAOImpl dao;
	
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
		int pageSize = 5;	//한 페이지당 출력할 글 갯수
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
		
		int TQ_AMT = Integer.parseInt(req.getParameter("TQ_AMT"));
		System.out.println("tq_amt : " + TQ_AMT);
		map.put("TQ_AMT", TQ_AMT);
		
		String SQ_LOC = req.getParameter("SQ_LOC");
		System.out.println("SQ_LOC- : " + SQ_LOC);
		map.put("SQ_LOC", SQ_LOC);
		
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
		
		int selectCnt = dao.trainerSelectCnt(map);
		System.out.println("selectCnt : " + selectCnt);
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
		
		List<TrainerVO> dtos = null;
		
		if(selectCnt > 0) {
			map.put("start", start);
			map.put("end", end);
			
			dtos = dao.trainerList(map);
			
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dtos", dtos);
		model.addAttribute("SQ_LOC", SQ_LOC);
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		model.addAttribute("number", number); // 출력용 글번호
	}

	@Override
	public void TrainerInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		String TQ_LOC = req.getParameter("SQ_LOC");
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		System.out.println("TA_CD : " + TA_CD);
		
		int selectCnt = dao.getPetCount(id);
		System.out.println("selectCnt  :" + selectCnt);
		
		if(selectCnt > 0) {
			List<TrainerVO> petInfo = dao.getPetInfo(id);
			model.addAttribute("petInfo", petInfo);
		}
		

		TrainerVO vo = dao.trainerInfo(TA_CD);
		System.out.println(vo.getTS1_NO());
		model.addAttribute("dto", vo);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("TQ_LOC", TQ_LOC);
	}

	// 훈련사 정보 수정 화면
	@Override
	public void updateTrainer(HttpServletRequest req, Model model) {
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
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

	@Override
	public void TraineeList(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.TraineeListCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.TraineeList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
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

	@Override
	public void acceptTrainingList(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.acceptTraineeListCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.acceptTraineeList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
	}

	@Override
	public void denyTrainingList(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.denyTraineeListCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.denyTraineeList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
	}

	@Override
	public void custReqResultwait(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.custReqResultwaitCnt(id);
		System.out.println("수락요청대기selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.custReqResultwaitList(id);
			
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("st", 0);
		
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
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.custReqResultacceptCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.custReqResultacceptList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("st", 1);
		
	}

	@Override
	public void custReqResultDeny(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.custReqResultdenyCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.custReqResultdenyList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("st", 2);
		
	}

	@Override
	public void trainingComplete(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("아이디 : " + id);
		
		int selectCnt = dao.trainingCompleteCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		
		int reviewCheckCnt = 0;
		
		if(selectCnt > 0) {
			//훈련 완료 정보를 가져옴
			vo = dao.trainingComplete(id);
			System.out.println(vo.get(0).getTQ_CD());
			
			for(int i = 0; i < vo.size(); i++) {
				int TQ_CD = vo.get(i).getTQ_CD();
				//후기 작성 중복체크
				reviewCheckCnt = dao.reviewCheckCnt(TQ_CD);
			}
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("reviewCheckCnt", reviewCheckCnt);
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
		
		float TG_GRADE = Float.valueOf(req.getParameter("TG_GRADE"));
		vo.setTG_GRADE(TG_GRADE);
		
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

	@Override
	public void TrainingServiceComplete(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("id : " + id);
		
		int selectCnt = dao.TrainingServiceCompleteCnt(id);
		System.out.println("selectCnt : " + selectCnt);
		
		List<TrainerRequestVO> vo = null;
		if(selectCnt > 0) {
			vo = dao.TrainingServiceCompleteList(id);
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		
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
}
