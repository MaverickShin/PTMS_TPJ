package ptms.mvc.tpj.Sitter_DAO;

import java.util.ArrayList;
import java.util.List;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.CustVO.ZipcodeVO;

public interface SitterDAO {

	// 시터 프로필 등록 <완료>
	public int profileInsert(SitterVO vo);
	
	// 시터 주소 조회
	public ZipcodeVO addressInfo(String cust_id);
	
	// 시터 서비스 정보 등록  <완료>
	public int insertService(SitterVO vo);
	
	// delete 시터 정보 삭제 (SITTERS_TB)  <완료>
	public int deleteSitter(int SIT_ID);
	
	// delete 시터 정보 삭제 (SITTER_SERVICE_TB)  <완료>
	public int deleteSitter2(int SIT_ID);
	
	// 펫시터 찾기 -(조건에 맞는) 시터 수 구하기  <완료>
	public int getSitterCnt(SitterVO vo);
	
	// 펫시터 찾기 - 리스트 출력  <완료>
	public List<SitterVO> activityList(SitterVO vo);
	
	// 시터 상세 조회 페이지  <완료>
	public SitterVO detailSitter(int sit_id);
	
	// 지정 시터 후기 조회
	public SitterVO gradeSitter(int sit_id);
	
	// 시터 의뢰 목록 수 구하기 (나에게온 의뢰)  <완료>
	public int getRequestList(String cust_id);
	
	// 시터 의뢰 목록 (나에게온 의뢰)  <완료>
	public List<SitterVO> selectRequestList(String cust_id);
	
	// 펫시팅 신청하기 - 요청테이블에 insert <완료>
	public int selectRequestInsert(SitterVO vo);
	
	// 의뢰자 거주지역 조회
	public ZipcodeVO RequesterAddressInfo(String cust_id);
	
	// 의뢰자 펫 정보 조희  : 화면에서 의뢰할 펫 선액용
	public List<PetVO> petKindInfo(String cust_id);
	
	// 의뢰시 - 펫 별 서비스 요금 조회 : 위 의뢰자 펫 정보 조회에서 pk_cd(펫 종류 코드)를 활용
	public int petServiceFee(int pk_cd) ;
	
	// 의뢰 취소
	public int deleteRequest(int sq_cd);
	
	// 결제하기 - 구현대기 : 구현자 나도웅
	
	// 결제하기 - 의뢰 상태 업데이트
	public int requestPayState(int sq_cd);
	
	// 시터 - 고객 의뢰 수락 수 구하기
	public int getsitterAcceptCount(String cust_id);
	
	// 시터 - 고객 의뢰 수락 처리상태(SQ_ST)업데이트
	public int sitterAccept(int sq_cd);
	
	// 시터 - 고객 의뢰 수락 리스트 
	public List<SitterVO> sitterAcceptList(String CUST_ID);	
	
	// 시터 - 고객 의뢰 거절 수 구하기
	public int getsitterRefuseCount(String cust_id);
	
	// 시터 - 고객 의뢰 거절 처리상태(SQ_ST)업데이트 <완료>
	public int sitterRefuse(int SQ_CD);
	
	// 시터 - 고객 의뢰 거절 리스트 <완료>
	public List<SitterVO> sitterRefuseList(String CUST_ID);	
	
	// 시터 - 고객 의뢰 매칭완료 수 구하기
	public int getSitterMTFinCount(String CUST_ID);
	
	// 시터 - 고객 의뢰 매칭완료 리스트
	public List<SitterVO> sitterMatchingFinList(String CUST_ID);	
	
	// 고객 - 요청수락대기 리스트 수 구하기
	public int getWaitReqAccept(String CUST_ID);
	
	// 고객 - 요청수락대기 상태에서 취소할 시 요청테이블(SITTER_REQUEST_TB)에서 delete
	public int sitterReqCancle(int SQ_CD);
	
	// 고객 - 요청수락대기 리스트 
	public List<SitterVO> sitterWaitReqList(String CUST_ID);
	
	// 고객 - 수락된 요청 리스트 수 구하기
	public int getAcceptList(String CUST_ID);
	
	// 고객 - 수락된 요청 리스트
	public List<SitterVO> acceptReqList(String CUST_ID);
	
	// 고객 - 거절된 요청 리스트 수 구하기
	public int getRefuseList(String CUST_ID);
	
	// 고객 - 거절된 요청 리스트
	public List<SitterVO> refuseReqList(String CUST_ID);
	
	// 고객 - 매칭완료된 서비스 리스트 수 구하기
	public int getMatchingFin(String CUST_ID);
	
	// 고객 - 매칭완료된 서비스 리스트 
	public List<SitterVO> MatchingFinish(String CUST_ID);
	
	// 고객 - 매칭 완료 후 후기 작성 중복체크
	public int sittterReviewChkCnt(int SQ_CD);
	
	// 고객 - 후기작성 (시터 후기 테이블에 INSERT)
	public int ReviewWrite(SitterVO vo);
	
	// 고객 - 시터후기테이블 갯수
	public int getreviewCnt();
	
	// 고객 - 시터후기 미리보기 (별점순) 리스트
	public List<SitterVO> bestStarSitter();
	
	// 고객 - 시터후기 미리보기 (최신작성순) 리스트
	public List<SitterVO> newSitterReview();
	
	// 고객 - 시터후기 미리보기 (후기많은순) 리스트
	public List<SitterVO> bigSitterReview();
	
	//요금표 리스트 <완료>
	public ArrayList<PetVO> getPriceList();
	
	//고객 펫 수 <완료>
	public int MypetCount(String CUST_ID);
	
	//고객 펫 조회 <완료>
	public List<PetVO> MypetList(String CUST_ID);	
	
	//고객 - 동일한 아이디로 시터가입여부 중복체크
	public int sitterSignChk(String CUST_ID);
	
	//--------------------------------------
	// select 고객 - 시터 수정 상세 페이지  <완료>
	public SitterVO SitterDetail(String CUST_ID);
	
	// 기존에 있던 updateSitter는 삭제함, 이후 밑에 2개 추가  <완료>
	// update 고객 - 시터 수정 처리 (SITTERS_TB)
	public int updateSitter1(SitterVO sVo);
	
	// update 고객 - 시터 수정 처리 (SITTER_SERVICE_TB)  <완료>
	public int updateSitter2(SitterVO sVo);
	
	
	/* 21-09-29 / 신도빈  / 결제완료 후 요청테이블 상태 업데이트 'SQ_ST : 1' */
	// 고객 - 카카오페이 결제 완료 후 요청 테이블 상태 업데이트
	public int updatePay(int SQ_CD);
	
}
