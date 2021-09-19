package ptms.mvc.tpj.TrainerService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.TrainerDAO.TrainerDAOImpl;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	TrainerDAOImpl dao;
	
	@Override
	public void insertTrainer(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
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
