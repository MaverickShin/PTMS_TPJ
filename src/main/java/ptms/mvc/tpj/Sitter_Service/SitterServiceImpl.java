package ptms.mvc.tpj.Sitter_Service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
	public void insertSitter(HttpServletRequest req, Model model) throws ParseException {
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
			vo.setSV2_NO(2);
		}
		if(SV3_NO == null) {
			vo.setSV3_NO(0);
		}else {
			vo.setSV3_NO(3);
		}
		if(SV4_NO == null) {
			vo.setSV4_NO(0);
		}else {
			vo.setSV4_NO(4);
		}
		
		vo.setCUST_ID(req.getParameter("CUST_ID"));  //고객 아이디
		vo.setSV_AREA(req.getParameter("SV_AREA"));  //서비스가능지역(도로명주소)
		vo.setSR_CD(Integer.parseInt(req.getParameter("SR_CD")));  //주거지 유형
		
		String WK_START = req.getParameter("WK_START");    //활동 시작 가능일
	    String WK_END = req.getParameter("WK_END"); 	//활동 시작 종료일
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date(sdf.parse(WK_START).getTime());
	    vo.setWK_START(date);
	    date = new Date(sdf.parse(WK_END).getTime());
	    vo.setWK_END(date);
	    
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
/*	@Override
	public void workingeSitter(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}*/

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

	// 펫시터 찾기 - 리스트 출력
	@Override
	public void workSitterList(HttpServletRequest req, Model model) throws ParseException {
		System.out.println("service ==> workSitterList");
		
		//정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();
		
		vo.setSV_AREA(req.getParameter("SV_AREA"));	    //서비스 가능 지역
		
		String WK_START = req.getParameter("WK_START");    //활동 시작 가능일
	    String WK_END = req.getParameter("WK_END"); 	//활동 시작 종료일
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date(sdf.parse(WK_START).getTime());
	    vo.setWK_START(date);
	    date = new Date(sdf.parse(WK_END).getTime());
	    vo.setWK_END(date);
		
		String SV1_NO =req.getParameter("SV1_NO");		//미용서비스
		String SV2_NO = req.getParameter("SV2_NO");		//놀이서비스
		String SV3_NO = req.getParameter("SV3_NO");		//산책서비스
		String SV4_NO = req.getParameter("SV4_NO");		//응급처치서비스
		if(SV1_NO == null) {
			vo.setSV1_NO(0);
		}else {
			vo.setSV1_NO(1);
		}
		if(SV2_NO == null) {
			vo.setSV2_NO(0);
		}else {
			vo.setSV2_NO(2);
		}
		if(SV3_NO == null) {
			vo.setSV3_NO(0);
		}else {
			vo.setSV3_NO(3);
		}
		if(SV4_NO == null) {
			vo.setSV4_NO(0);
		}else {
			vo.setSV4_NO(4);
		}
		
		int selectCnt = sitterDao.getSitterCnt(vo);   //조건에 맞는 시터 수 구하기
		System.out.println("selectCnt : " + selectCnt);
		
		List<SitterVO> list = null;
		if(selectCnt > 0) {
			list = sitterDao.activityList(vo);  //펫시터 찾기 - 리스트 출력
		}
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("dtos", list);
		
	}

	// 시터 상세 조회
	@Override
	public void detailSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> detailSitter");		
		
		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		System.out.println("세션CUST_ID: " + CUST_ID);
		
		SitterVO vo = sitterDao.detailSitter(SIT_ID);
		int selectCnt = sitterDao.MypetCount(CUST_ID);
		System.out.println("selectCnt : " + selectCnt);
		List<PetVO> list = sitterDao.MypetList(CUST_ID);
		System.out.println("펫이름 : " );
		
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("dto", vo);
		req.setAttribute("list", list);
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

	// 고객 - 시터 의뢰 
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
