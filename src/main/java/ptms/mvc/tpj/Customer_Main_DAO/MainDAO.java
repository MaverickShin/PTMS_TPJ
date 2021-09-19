package ptms.mvc.tpj.Customer_Main_DAO;

import java.util.Map;

import ptms.mvc.tpj.CustVO.CustomerVO;

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
	
}
