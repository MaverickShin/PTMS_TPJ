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
		 model.addAttribute("insertCnt", insertCnt);
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

	// 시터 등록 탈퇴
	@Override
	public void deleteSitter(HttpServletRequest req, Model model) {
		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		int deleteCnt = sitterDao.deleteSitter2(SIT_ID);
		if(deleteCnt != 0) {
			sitterDao.deleteSitter(SIT_ID);
		}
		
		model.addAttribute("deleteCnt",deleteCnt);
	}

	// 시터 정보 수정 화면
	@Override
	public void updateSitter(HttpServletRequest req, Model model) {
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		System.out.println("CUST_ID : "+CUST_ID);
		
		SitterVO vo = sitterDao.SitterDetail(CUST_ID);
		
		System.out.println("vo : "+vo);
		System.out.println("SIT_ST : "+ vo.getSIT_ST());
		model.addAttribute("dto",vo);
	}

	// 시터 프로필 화면 수정 처리
	@Override
	public void updateSitterAction(HttpServletRequest req, Model model) throws ParseException {
		SitterVO sVo = new SitterVO();
		
		int hiddenSIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		String id = (String)req.getSession().getAttribute("cust_id");
		System.out.println("hiddenSIT_ID : "+hiddenSIT_ID);
		System.out.println("id : "+id);
		
		int SV1_NO = 0;
		SV1_NO = req.getParameter("SV1_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV1_NO"));
		System.out.println("SV1_NO"+SV1_NO);
		
		int SV2_NO = 0;
		SV2_NO = req.getParameter("SV2_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV2_NO"));
		System.out.println("SV2_NO"+SV2_NO);
		
		int SV3_NO = 0;
		SV3_NO = req.getParameter("SV3_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV3_NO"));
		System.out.println("SV3_NO"+SV3_NO);
		
		int SV4_NO = 0;
		SV4_NO = req.getParameter("SV4_NO") == null ? 0 : Integer.parseInt(req.getParameter("SV4_NO"));
		System.out.println("SV4_NO"+SV4_NO);
		
		String WK_START = req.getParameter("WK_START");
		String WK_END = req.getParameter("WK_END");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date(sdf.parse(WK_START).getTime());
		sVo.setWK_START(date);
		
		date = new Date(sdf.parse(WK_END).getTime());
		sVo.setWK_END(date);
/*	
		int SR_CD = Integer.parseInt(req.getParameter("SR_CD"));
		String SR_KIND = "";
		if(SR_CD == 1) {
			SR_KIND = "주택(마당x)";
		}else if(SR_CD == 2) {
			SR_KIND = "주택(마당o)";
		}else if(SR_CD == 3) {
			SR_KIND = "아파트";
		}else if(SR_CD == 4) {
			SR_KIND = "빌라";
		}
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
		System.out.println("시터 1번재 update : "+updateCnt);
		if(updateCnt != 0) {
			updateCnt = sitterDao.updateSitter2(sVo);
		}
		System.out.println(updateCnt);
		model.addAttribute("updateCnt",updateCnt);
	};
	
	
	
	// 펫시터 찾기 - 리스트 출력
	@Override
	public void workSitterList(HttpServletRequest req, Model model) throws ParseException {
		System.out.println("service ==> workSitterList");
		
		//정보를 담을 sitterVO생성
		SitterVO vo = new SitterVO();
		
		String SV_AREA = req.getParameter("SV_AREA");
		vo.setSV_AREA(SV_AREA);	    //서비스 가능 지역
		
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

		System.out.println("SV1_NO : " + SV1_NO);
		System.out.println("SV2_NO : " + SV2_NO);
		System.out.println("SV3_NO : " + SV3_NO);
		System.out.println("SV4_NO : " + SV4_NO);
		
		int selectCnt = sitterDao.getSitterCnt(vo);   //조건에 맞는 시터 수 구하기
		System.out.println("조건충족 시터수 selectCnt : " + selectCnt);
		
		List<SitterVO> list = null;
		if(selectCnt > 0) {
			list = sitterDao.activityList(vo);  //펫시터 찾기 - 리스트 출력
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dtos", list);
		model.addAttribute("SV_AREA", SV_AREA);
	}

	// 시터 상세 조회
	@Override
	public void detailSitter(HttpServletRequest req, Model model) {
		System.out.println("service ==> detailSitter");		
		
		int SIT_ID = Integer.parseInt(req.getParameter("SIT_ID"));
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		String SV_AREA = req.getParameter("SV_AREA");
		System.out.println("세션CUST_ID: " + CUST_ID);
		
		SitterVO vo = sitterDao.detailSitter(SIT_ID);
		int selectCnt = sitterDao.MypetCount(CUST_ID);
		System.out.println("마이펫 수 selectCnt : " + selectCnt);
		List<PetVO> list = sitterDao.MypetList(CUST_ID);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", vo);
		model.addAttribute("list", list);
		model.addAttribute("SIT_ID" , SIT_ID);
		model.addAttribute("SV_AREA", SV_AREA);
	}

	/*
	 * 날짜 : 21.09.24
	 * 작성자 : 임지영
	 * 내용 : 나에게 온 의뢰 목록
	 */
	@Override
	public void allRequestList(HttpServletRequest req, Model model) {
		System.out.println("service ==> allRequestList");
		
		String CUST_ID = (String)req.getSession().getAttribute("cust_id");
		
		List<SitterVO> list = sitterDao.selectRequestList(CUST_ID);
		
		model.addAttribute("list", list);
	}

	// 지정 시터 의뢰 목록 (고객이 본인을 지정하여 요청한 경우)
	/*
	@Override
	public void selectRequestList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	*/
	
	// 고객 - 펫시팅 신청하기
	@Override
	public void insertRequest(HttpServletRequest req, Model model) throws ParseException {
		System.out.println("service ==> insertRequest");
		
		//정보를 담을 sitterVO생성
		  SitterVO vo = new SitterVO();		
		  
		  vo.setCUST_ID((String)req.getSession().getAttribute("cust_id"));
	      String SQ_LOC = req.getParameter("SV_AREA");  //고객거주지역
	      vo.setSQ_LOC(SQ_LOC);
	      System.out.println("SQ_LOC : " + SQ_LOC);
	      
		  String PET_NM[] = req.getParameterValues("PET_NM");
	      String result = "";
	      for(int i = 0; i < PET_NM.length; i++) {
	         if(PET_NM.length == 0) {
	            result += PET_NM[i];
	         } else {
	            result += PET_NM[i] + "  ";
	         }
	      }
	      System.out.println("result : " + result);
	      
	      vo.setSIT_ID(Integer.parseInt(req.getParameter("SIT_ID")));  //시터ID
	      vo.setSQ_AMT(result);  //펫 이름

	      
	      String SV1_NO = req.getParameter("SV1_NO");	//미용서비스
	      String SV2_NO = req.getParameter("SV2_NO");	//놀이서비스
	      String SV3_NO = req.getParameter("SV3_NO");	//산책서비스
	      String SV4_NO = req.getParameter("SV4_NO");	//응급처치서비스
	      System.out.println("SV1_NO : " + SV1_NO);
	      System.out.println("SV2_NO : " + SV2_NO);
	      System.out.println("SV3_NO : " + SV3_NO);
	      System.out.println("SV4_NO : " + SV4_NO);
		 
	      String service = "";
	      if(SV1_NO != null) {
	    	  service +=SV1_NO + ",";
	      }if(SV2_NO != null) {
	    	  service +=SV2_NO + ",";
	      }if(SV3_NO != null) {
			service +=SV3_NO + ",";
		  }if(SV4_NO != null) {
			 service +=SV4_NO;
		 }
	     System.out.println("service : " + service);
	     vo.setREQ_SV(service);  //고객요청서비스
	     
	     String START_DAY = req.getParameter("START_DAY"); //의뢰시작일
	  	 String END_DAY = req.getParameter("END_DAY"); 	   //의뢰종료일
	  	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	  	 Date date = new Date(sdf.parse(START_DAY).getTime());
	  	 vo.setSTART_DAY(date);//의뢰시작일
	  	 date = new Date(sdf.parse(END_DAY).getTime());
	  	 vo.setEND_DAY(date); //의뢰종료일
	   
	  	 int insertCnt = sitterDao.selectRequestInsert(vo);
	  	 System.out.println("펫시팅 요청 insertCnt : " + insertCnt);
	  	 
	  	 model.addAttribute("insertCnt" , insertCnt);
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
	}

}
