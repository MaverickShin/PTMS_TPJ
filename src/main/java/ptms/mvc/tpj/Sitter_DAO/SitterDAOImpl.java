package ptms.mvc.tpj.Sitter_DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.CustVO.ZipcodeVO;

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

	// 시터 활동 등록
	@Override
	public int activityUp(String cust_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 시터 활동 등록 취소
	@Override
	public int activityDown(String cust_id) {
		// TODO Auto-generated method stub
		return 0;
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

	// 시터 의뢰 요청 목록 (전체) 
	@Override
	public List<SitterVO> requestList() {
		// TODO Auto-generated method stub
		return null;
	}

	// 지정 시터 의뢰 목록 (나에게온 의뢰)
	@Override
	public List<SitterVO> selectRequestList(int sit_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 의뢰자 서비스 요금 조회
	@Override
	public SitterVO feeSearch(int pet_cd) {
		// TODO Auto-generated method stub
		return null;
	}

	// 시터 의뢰 등록 (시터를 지정하지 않았을 때)
	/*
	@Override
	public int requestInsert(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}*/

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
	public List<PetVO> petServiceFee(int pk_cd) {
		// TODO Auto-generated method stub
		return null;
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

	// 시터 의뢰 수락
	@Override
	public int sitterAccept(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 의뢰수락 - 의뢰 상태(의뢰 확정으로)업데이트
	@Override
	public int requestConfirmState(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
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
