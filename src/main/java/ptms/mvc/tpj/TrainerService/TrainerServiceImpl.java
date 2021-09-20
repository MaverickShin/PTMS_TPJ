package ptms.mvc.tpj.TrainerService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.TrainerVO;
import ptms.mvc.tpj.TrainerDAO.TrainerDAO;
import ptms.mvc.tpj.TrainerDAO.TrainerDAOImpl;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerDAOImpl dao;
	
	@Override
	public void insertTrainer(HttpServletRequest req, Model model) {
		TrainerVO vo = new TrainerVO();
		
		String id = (String)req.getSession().getAttribute("cust_id");
		vo.setCUST_ID(id);
		vo.setTA_TITLE(req.getParameter("TA_TITLE"));
		vo.setTA_APPEAL(req.getParameter("TA_APPEAL"));
		vo.setTA_IMG(req.getParameter("TA_IMG"));
		vo.setTS_AREA(req.getParameter("address2"));
		System.out.println(req.getParameter("address2"));
		
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
		vo.setSTART_DAY(START_DAY);
		vo.setEND_DAY(req.getParameter("END_DAY"));
		
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void TrainerInfo(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reserveTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
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
