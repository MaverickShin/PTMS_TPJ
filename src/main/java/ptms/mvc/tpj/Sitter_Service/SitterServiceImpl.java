package ptms.mvc.tpj.Sitter_Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.Sitter_DAO.SitterDAOImpl;

@Service
public class SitterServiceImpl implements SitterService{
	
	@Autowired
	SitterDAOImpl sitterDao;

	// 시터 등록
	@Override
	public void insertSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> insertSitter");
		
		//시터정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();
		
		//정보를 넣어준다
		String SV1_NO =req.getParameter("SV1_NO");
		String SV2_NO = req.getParameter("SV2_NO");
		String SV3_NO = req.getParameter("SV3_NO");
		String SV4_NO = req.getParameter("SV4_NO");
		if(SV1_NO == null) {
			vo.setSV1_NO(0);
		}else {
			vo.setSV1_NO(1);
		}
		if(SV2_NO == null) {
			vo.setSV2_NO(0);
		}else {
			vo.setSV2_NO(1);
		}
		if(SV3_NO == null) {
			vo.setSV3_NO(0);
		}else {
			vo.setSV3_NO(1);
		}
		if(SV4_NO == null) {
			vo.setSV4_NO(0);
		}else {
			vo.setSV4_NO(1);
		}
		
		vo.setCUST_ID(req.getParameter("CUST_ID"));  //고객 아이디
		vo.setSV_AREA(req.getParameter("SV_AREA"));  //서비스가능지역(도로명주소)
		vo.setSR_CD(Integer.parseInt(req.getParameter("SR_CD")));  //주거지 유형
		vo.setRESERVATION(req.getParameter("RESERVATION"));  //예약가능일
		vo.setSIT_TITLE(req.getParameter("SIT_TITLE"));    //소개글 제목
		vo.setSIT_APPEAL(req.getParameter("SIT_APPEAL"));  //소개글 본문
		vo.setSIT_IMG(req.getParameter("SIT_IMG"));   //프로필 사진
		
		int insertCnt = 0;
		
		insertCnt = sitterDao.profileInsert(vo);   //시터 프로필 등록
		System.out.println("시터프로필 등록 : " + insertCnt);
		if(insertCnt == 1) {
			 insertCnt = sitterDao.insertService(vo); //시터 서비스 정보 등록
			 System.out.println("시터 서비스 정보 등록  : " + insertCnt);
			/*
			 * if(insertCnt == 2) insertCnt =1; else insertCnt = 0;
			 */
		}
		
		req.setAttribute("insertCnt", insertCnt);
		
	}

	// 시터 활동 등록
	@Override
	public void workingeSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 시터 활동 취소
	@Override
	public void cancleSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 시터 등록 해제
	@Override
	public void deleteSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 시터 정보 수정
	@Override
	public void updateSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 활동 시터 목록
	@Override
	public void workSitterList(HttpServletRequest req, Model model) {
		System.out.println("service ==> workSitterList");
		
		
	}

	// 시터 상세 조회
	@Override
	public void detailSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 시터 의뢰 목록 (전체)
	@Override
	public void allRequestList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 지정 시터 의뢰 목록 (고객이 본인을 지정하여 요청한 경우)
	@Override
	public void selectRequestList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 고객 - 시터 의뢰 등록
	@Override
	public void insertRequest(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 고객 - 시터 의뢰 취소
	@Override
	public void cancleRequest(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 결제하기
	@Override
	public void sitterPay(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 시터 의뢰 수락 - 의뢰 확정
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
