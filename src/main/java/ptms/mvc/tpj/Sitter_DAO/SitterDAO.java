package ptms.mvc.tpj.Sitter_DAO;

import java.util.ArrayList;
import java.util.List;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.CustVO.ZipcodeVO;

public interface SitterDAO {

	// 시터 프로필 등록
	public int profileInsert(SitterVO vo);
	
	// 시터 주소 조회
	public ZipcodeVO addressInfo(String cust_id);
	
	// 시터 서비스 정보 등록
	public int insertService(SitterVO vo);
	
	// 시터 정보 수정
	public int updateSitter(SitterVO vo);
	
	// 시터 정보 삭제
	public int deleteSitter(String cust_id);
	
	// 시터 활동 등록
	public int activityUp(String cust_id);
	
	// 시터 활동 등록 취소
	public int activityDown(String cust_id);
	
	// 펫시터 찾기 -(조건에 맞는) 시터 수 구하기
	public int getSitterCnt(SitterVO vo);
	
	//펫시터 찾기 - 리스트 출력
	public List<SitterVO> activityList(SitterVO vo);
	
	// 시터 상세 조회 페이지
	public SitterVO detailSitter(int sit_id);
	
	// 지정 시터 후기 조회
	public SitterVO gradeSitter(int sit_id);
	
	// 시터 의뢰 요청 목록 (전체) 
	public List<SitterVO> requestList();
	
	// 지정 시터 의뢰 목록 (나에게온 의뢰)
	public List<SitterVO> selectRequestList(int sit_id);
	
	// 의뢰자 서비스 요금 조회
	public SitterVO feeSearch(int pet_cd);
	
	// 시터 의뢰 등록 (시터를 지정하지 않았을 때)
	//public int requestInsert(SitterVO vo);
	
	// 시터 의뢰 
	public int selectRequestInsert(String sit_id);
	
	// 의뢰자 거주지역 조회
	public ZipcodeVO RequesterAddressInfo(String cust_id);
	
	// 의뢰자 펫 정보 조희  : 화면에서 의뢰할 펫 선액용
	public List<PetVO> petKindInfo(String cust_id);
	
	// 의뢰시 - 펫 별 서비스 요금 조회 : 위 의뢰자 펫 정보 조회에서 pk_cd(펫 종류 코드)를 활용
	public List<PetVO> petServiceFee(int pk_cd) ;
	
	// 의뢰 취소
	public int deleteRequest(int sq_cd);
	
	// 결제하기 - 구현대기 : 구현자 나도웅
	
	// 결제하기 - 의뢰 상태 업데이트
	public int requestPayState(int sq_cd);
	
	// 시터 의뢰 수락
	public int sitterAccept(int sq_cd);
	
	// 의뢰수락 - 의뢰 상태(의뢰 확정으로)업데이트
	public int requestConfirmState(int sq_cd);
	
	//요금표 리스트
	public ArrayList<PetVO> getPriceList();
	
	//고객 펫 수
	public int MypetCount(String CUST_ID);
	
	//고객 펫 조회
	public List<PetVO> MypetList(String CUST_ID);	
}
