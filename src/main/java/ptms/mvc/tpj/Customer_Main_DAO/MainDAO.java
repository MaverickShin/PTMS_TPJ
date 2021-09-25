package ptms.mvc.tpj.Customer_Main_DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.PetVO;

public interface MainDAO {

	// 중복확인 처리 - 아이디확인
	public int idCheck(String strid);
	
	// 회원정보 인증 및 상세 페이지
	public CustomerVO custInfo(String id);
	
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
	public int deleteCustomer(int ZIP_CD);
	
	// 회원 탈퇴 (ZIPCODES_TB)
	public int deleteCustomer2(int ZIP_CD);
	
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
	
}
