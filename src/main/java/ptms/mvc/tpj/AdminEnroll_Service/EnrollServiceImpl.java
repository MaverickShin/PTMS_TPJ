package ptms.mvc.tpj.AdminEnroll_Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.AdminEnroll_DAO.EnrollDAOImpl;
import ptms.mvc.tpj.CustVO.PetVO;

@Service
public class EnrollServiceImpl implements EnrollService{
	
	@Autowired
	EnrollDAOImpl enrollDao;

	//펫 코드 및 요금 등록
	@Override
	public void petCodeFee(HttpServletRequest req, Model model) {
		System.out.println("service ==> petCodeFee");
		
		String PK_KIND = req.getParameter("PK_KIND");     //펫종류
		String PK_DETAIL = req.getParameter("PK_DETAIL"); //펫 세부분류
		int SF_FEE = Integer.parseInt(req.getParameter("SF_FEE"));	      //서비스요금
		System.out.println(PK_KIND);
		System.out.println(PK_DETAIL);
		System.out.println(SF_FEE);
		
		//PetVO바구니 생성
		PetVO vo = new PetVO();
		
		vo.setPK_KIND(PK_KIND);
		vo.setPK_DETAIL(PK_DETAIL);
		vo.setSF_FEE(SF_FEE);
		
		int insertCnt = enrollDao.petCodeFee(vo);
		
		System.out.println("펫 코드 및 요금 등록 : " + insertCnt);
		
		req.setAttribute("insertCnt", insertCnt);
		
	}

	//펫 코드 및 요금 목록
	@Override
	public void petCodeFeeList(HttpServletRequest req, Model model) {
		System.out.println("service ==> petCodeFeeList()");
	    ArrayList<PetVO> dtos = null;
	    	
	    dtos = enrollDao.getpetCodeFee();
	    req.setAttribute("dtos", dtos); //게시글 목록   
	}

	//펫 코드 및 요금 수정 페이지	
	@Override
	public void petCodeFeeUpdate(HttpServletRequest req, Model model) {
		System.out.println("service ==> petCodeFeeUpdate()");
		
		int PK_CD = Integer.parseInt(req.getParameter("PK_CD"));
		System.out.println("펫 종류코드" + PK_CD);
		
		PetVO vo = enrollDao.UpdatePetCodeFeeList(PK_CD);
		
		req.setAttribute("dtos", vo);
	}
	
	//펫 코드 및 요금 수정
	@Override
	public void petCodeFeeUpdateAction(HttpServletRequest req, Model model) {
		System.out.println("service ==> petCodeFeeUpdateAction()");
		
		int PK_CD = Integer.parseInt(req.getParameter("hiddenPK_CD"));
		String PK_KIND = req.getParameter("PK_KIND");
		String PK_DETAIL = req.getParameter("PK_DETAIL");
		int SF_FEE = Integer.parseInt(req.getParameter("SF_FEE"));
		
		PetVO vo = new PetVO();
		vo.setPK_KIND(PK_KIND);
		vo.setSF_FEE(SF_FEE);
		vo.setPK_DETAIL(PK_DETAIL);
		
		int updateCnt = enrollDao.UpdatePetCodeFee(vo);
		System.out.println("updateCnt : " + updateCnt);
		
		req.setAttribute("PK_CD", PK_CD);
		req.setAttribute("updateCnt" , updateCnt);
	}

	//펫 코드 및 요금 삭제
	@Override
	public void petCodeFeeDeleteAction(HttpServletRequest req, Model model) {
		System.out.println("service ==> petCodeFeeDeleteAction()");
		
	}

}
