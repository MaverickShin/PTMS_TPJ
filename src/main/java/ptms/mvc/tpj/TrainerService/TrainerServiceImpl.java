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
import ptms.mvc.tpj.TrainerDAO.TrainerDAO;
import ptms.mvc.tpj.TrainerDAO.TrainerDAOImpl;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerDAOImpl dao;
	
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
		Map<String, Object> map = new HashMap<String, Object>();
		
		int TQ_AMT = Integer.parseInt(req.getParameter("TQ_AMT"));
		System.out.println("tq_amt : " + TQ_AMT);
		map.put("TQ_AMT", TQ_AMT);
		
		String SQ_LOC = req.getParameter("SQ_LOC");
		System.out.println("SQ_LOC : " + SQ_LOC);
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
		
		List<TrainerVO> dtos = null;
		
		if(selectCnt > 0) {
			dtos = dao.trainerList(map);
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dtos", dtos);
		
	}

	@Override
	public void TrainerInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("cust_id");
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		System.out.println("TA_CD : " + TA_CD);
		
		int selectCnt = dao.getPetCount(id);
		
		if(selectCnt > 0) {
			List<TrainerVO> petInfo = dao.getPetInfo(id);
			model.addAttribute("petInfo", petInfo);
		}
		

		TrainerVO vo = dao.trainerInfo(TA_CD);

		model.addAttribute("dto", vo);
		model.addAttribute("selectCnt", selectCnt);
	}

	@Override
	public void updateTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 훈련사 요청테이블에 insert
	@Override
	public void reserveTrainer(HttpServletRequest req, Model model) throws ParseException {
		TrainerRequestVO vo = new TrainerRequestVO();
		
		String CUST_ID = (String)req.getSession().getAttribute("cust_id"); //의뢰인 아이디
		vo.setCUST_ID(CUST_ID);
		
		int TA_CD = Integer.parseInt(req.getParameter("TA_CD"));
		vo.setTA_CD(TA_CD);
		
		String TQ_AMT = req.getParameter("TQ_AMT");
		vo.setTQ_AMT(TQ_AMT);
		
		String PET_NM[] = req.getParameterValues("PET_NM");
		
		String result = "";
		
		for(int i = 0; i < PET_NM.length; i++) {
			
			if(PET_NM.length == 0) {
				result += PET_NM[i];
			} else {
				result += ", " + PET_NM[i];
			}
		}
		
		vo.setPET_NM(result);
		
		String TQ_LOC = req.getParameter("TQ_LOC");
		vo.setTQ_LOC(TQ_LOC);
		
		String START_DAY = req.getParameter("START_DAY");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      
	    Date date = new Date(sdf.parse(START_DAY).getTime());
	    
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
		// TODO Auto-generated method stub
		
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
	public void updateTraiee(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

}
