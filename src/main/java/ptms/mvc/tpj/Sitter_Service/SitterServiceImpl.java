package ptms.mvc.tpj.Sitter_Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.Sitter_DAO.SitterDAOImpl;

@Service
public class SitterServiceImpl implements SitterService{
	
	@Autowired
	SitterDAOImpl sitterDao;

	@Override
	public void insertSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void workingeSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancleSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void workSitterList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detailSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void allRequestList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectRequestList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertRequest(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancleRequest(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sitterPay(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void payUpdate(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	//요금표 리스트
	@Override
	public void priceInfo(HttpServletRequest req, Model model) {
		System.out.println("service ==> priceInfo");
		
		ArrayList<PetVO> dtos = null;
		dtos = sitterDao.getPriceList();
		
		req.setAttribute("dtos", dtos);
	};
	

}
