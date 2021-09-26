package ptms.mvc.tpj.Sitter_DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.CustVO.ZipcodeVO;
import ptms.mvc.tpj.TrainerDAO.TrainerDAO;

@Repository
public class SitterDAOImpl implements SitterDAO{
	
	@Autowired
	SqlSession sqlSession;

	// 시터 프로필 등록
	@Override
	public int profileInsert(SitterVO vo) {
		System.out.println("dao ==> profileInsert");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.profileInsert(vo);
	}

	// 시터 주소 조회
	@Override
	public ZipcodeVO addressInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 시터 서비스 정보 등록
	@Override
	public int insertService(SitterVO vo) {
		System.out.println("dao ==> insertService");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.insertService(vo);
	}

	// delete - 시터 탈퇴 (SITTERS_TB)
	@Override
	public int deleteSitter(int SIT_ID) {
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.deleteSitter(SIT_ID);
	}
	
	// delete - 시터 탈퇴 (SITTER_SERVICE_TB)
	@Override
	public int deleteSitter2(int SIT_ID) {
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.deleteSitter2(SIT_ID);
	}

	// 펫시터 찾기 -(조건에 맞는) 시터 수 구하기
	@Override
	public int getSitterCnt(SitterVO vo) {
		System.out.println("dao ==> getSitterCnt");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getSitterCnt(vo);
	}
	
	//펫시터 찾기 - 리스트 출력
	@Override
	public List<SitterVO> activityList(SitterVO vo) {
		System.out.println("dao ==> activityList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.activityList(vo);
	}

	// 시터 상세 조회 페이지
	@Override
	public SitterVO detailSitter(int sit_id) {
		System.out.println("dao ==> activityList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.detailSitter(sit_id);
	}

	// 지정 시터 후기 조회
	@Override
	public SitterVO gradeSitter(int sit_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 시터 의뢰 목록 수 구하기 (나에게온 의뢰)
	@Override
	public int getRequestList(String cust_id) {
		System.out.println("dao ==> getRequestList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getRequestList(cust_id);
	}
	
	// 시터 의뢰 목록 (나에게온 의뢰)
	@Override
	public List<SitterVO> selectRequestList(String cust_id) {
		System.out.println("dao ==> selectRequestList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.selectRequestList(cust_id);
	}

	// 펫시팅 신청하기 - 요청테이블에 insert
	@Override
	public int selectRequestInsert(SitterVO vo) {
		System.out.println("dao ==> selectRequestInsert");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.selectRequestInsert(vo);
	}

	// 의뢰자 거주지역 조회
	@Override
	public ZipcodeVO RequesterAddressInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 의뢰자 펫 정보 조희  : 화면에서 의뢰할 펫 선액용
	@Override
	public List<PetVO> petKindInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 의뢰시 - 펫 별 서비스 요금 조회 : 위 의뢰자 펫 정보 조회에서 pk_cd(펫 종류 코드)를 활용
	@Override
	public int petServiceFee(int pk_cd) {
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		
		return dao.petServiceFee(pk_cd);
	}

	// 의뢰 취소
	@Override
	public int deleteRequest(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 결제하기 - 의뢰 상태 업데이트
	@Override
	public int requestPayState(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	//시터 - 고객 의뢰 수락 수 구하기
	@Override
	public int getsitterAcceptCount(String cust_id) {
		System.out.println("dao ==> getsitterAcceptCount");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getsitterAcceptCount(cust_id);
	}
	
	// 시터 - 고객 의뢰 수락 처리상태(SQ_ST)업데이트
	@Override
	public int sitterAccept(int sq_cd) {
		System.out.println("dao ==> sitterAccept");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterAccept(sq_cd);
	}
	
	//시터 - 고객 의뢰 수락 리스트 
	@Override
	public List<SitterVO> sitterAcceptList(String CUST_ID) {
		System.out.println("dao ==> sitterAcceptList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterAcceptList(CUST_ID);
	}

	//시터 - 고객 의뢰 거절 수 구하기
	@Override
	public int getsitterRefuseCount(String cust_id) {
		System.out.println("dao ==> getsitterRefuseCount");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getsitterRefuseCount(cust_id);
	}
	
	// 시터 - 고객 의뢰 거절 처리상태(SQ_ST)업데이트
	@Override
	public int sitterRefuse(int SQ_CD) {
		System.out.println("dao ==> sitterRefuse");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterRefuse(SQ_CD);
	}
	
	// 시터 - 고객 의뢰 거절 리스트	
	@Override
	public List<SitterVO> sitterRefuseList(String CUST_ID) {
		System.out.println("dao ==> sitterRefuseList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterRefuseList(CUST_ID);
	}	
	
	// 고객 - 요청수락대기 리스트 수 구하기
	@Override
	public int getWaitReqAccept(String CUST_ID) {
		System.out.println("dao ==> getWaitReqAccept");
	
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getWaitReqAccept(CUST_ID);
	}

	// 고객 - 요청수락대기 상태에서 취소할 시 요청테이블(SITTER_REQUEST_TB)에서 delete
	@Override
	public int sitterReqCancle(String CUST_ID) {
		System.out.println("dao ==> sitterReqCancle");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterReqCancle(CUST_ID);
	}

	// 고객 - 요청수락대기 리스트 
	@Override
	public List<SitterVO> sitterWaitReqList(String CUST_ID) {
		System.out.println("dao ==> sitterWaitReqList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.sitterWaitReqList(CUST_ID);
	}
	
	//요금표 리스트
	@Override
	public ArrayList<PetVO> getPriceList() {
		System.out.println("dao ==> ArrayList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getPriceList();
	}
	
	//고객 펫 수
	@Override
	public int MypetCount(String CUST_ID) {
		System.out.println("dao ==> MypetCount");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.MypetCount(CUST_ID);
	}

	//고객 펫 조회
	@Override
	public List<PetVO> MypetList(String CUST_ID) {
		System.out.println("dao ==> MypetList");
		
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.MypetList(CUST_ID);
	}

	//--------------------------------------
	// 고객 - 시터 수정 상세 페이지
	@Override
	public SitterVO SitterDetail(String CUST_ID) {
		System.out.println("CUST_ID : "+CUST_ID);
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.SitterDetail(CUST_ID);
	}

	// 고객 - 시터 수정 처리 (SITTERS_TB)
	@Override
	public int updateSitter1(SitterVO sVo) {
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.updateSitter1(sVo);
	}
	
	// 고객 - 시터 수정 처리 (SITTER_SERVICE_TB)
	@Override
	public int updateSitter2(SitterVO sVo) {
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.updateSitter2(sVo);
	}


}
