package ptms.mvc.tpj.Customer_Main_DAO;

import java.util.List;
import java.util.Map;

import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.FAQVO;
import ptms.mvc.tpj.CustVO.PayVO;
import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.QnAVO;

public interface MainDAO {

	// 중복확인 처리 - 아이디확인
	public int idCheck(String strid);
	
	// 회원정보 인증 및 상세 
	public CustomerVO custInfo(String id);
	
	// 결제 - 회원정보 상세 (주소포함)
	public CustomerVO custDetailInfo(String id);
	
	// 회원가입 처리
	public int insertCust(CustomerVO vo);
	
	// 비번확인
	public String pwdSearch(String id);
	
	// 이메일 인증 처리
	public int emailSuccess(String id);
	
	// 이메일 인증 여부
	public int emailChk(String id);
	
	// 사용자 권한 확인
	public String gradeCheck(String id);
	
	// 우편번호 등록
	public int insertzipcode(Map<String, Object> map);
	
	// 우편번호 조회
	public int zipcodeChk(int zipcode);
	
	// 회원정보 조회(회원,우편)
	public CustomerVO selectCustomer(String id);
	
	// 1.회원정보 수정처리(회원정보)
	public int updateCustomer(CustomerVO vo);
	
	// 2.우편번호가 같을때 (update)
	public int updateCustomer2(CustomerVO vo);
	
	// 회원 탈퇴 (CUSTOMER_TB)
	public int deleteCustomer(String CUST_ID);
	
	// 펫 목록
	public List<PetVO> getPetList(String CUST_ID);
	
	// 펫 등록
	public int insertPet(PetVO vo);
	
	// 펫 수정 상세페이지
	public PetVO PetDetail(int PET_CD);
	
	// 펫 수정 처리
	public int updatePet(PetVO vo);
	
	// 펫 삭제
	public int deletePet(int PET_CD);
	
	// 등록된 펫 갯수
	public int getPetCnt(String CUST_ID);
	
	// 일정 가지고 오기(json변환을 위해 Map을 ResultType으로 받음)
	public List<Map<String,Object>> getEvents(String id);
	
	// 일정 추가 
	public int insertEvent(CalendarVO vo);

	// 일정 삭제
	public int deleteEvent(String CL_CD);
	
	// 결제 이력 처리
	public int insertPayhistory(Map<String, Object> map);
	
	// 구독 업데이트 처리
	public int updateSubscribe(Map<String, Object> map); 
	
	// qna 목록 갯수
	public int qnaCount(Map<String, Object> map);
	
	// qna 목록 조회
	public List<QnAVO> qnaSearch(Map<String, Object> map);
	
	// qna 등록
	public int qnaAdd (QnAVO vo);
	
	// qna 수정
	public int updateQna(QnAVO vo);
	
	// qna 삭제
	public int deleteQna(int QNA_CD);
	
	// faq 목록 갯수
	public int faqCount(int faq_cd);
	
	// faq 목록 조회
	public List<FAQVO> faqSearch(Map<String, Object> map);
	
	//10.03 작성자 임지영
	//고객 - 시터등록 안되어 있을시 시터프로필 수정 접근 금지
	public int sitterSigninChk(String CUST_ID);
	
	//10.05 작성자 임지영
	// 내정보 관리 - 결제내역 리스트 수
	public int getpayList(String CUST_ID);
	
	//10.05  작성자 임지영
	// 내정보 관리 - 결제내역리스트
	public List<PayVO> payList(Map<String, Object> map);
	
 
	//내정보(훈련사 프로필) - 등록이 안되어 있으면 접근 불가
	public int trainerChk(String CUST_ID);

}
