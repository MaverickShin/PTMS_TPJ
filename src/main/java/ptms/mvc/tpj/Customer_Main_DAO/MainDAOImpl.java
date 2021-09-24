package ptms.mvc.tpj.Customer_Main_DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.sql.DATE;
import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.PetVO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSession data;
	
	// 중복확인 처리 - 아이디확인
	@Override
	public int idCheck(String strid) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.idCheck(strid);
	}
	
	// 회원정보 인증 및 상세페이지
	@Override
	public CustomerVO custInfo(String id) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.custInfo(id);
	}

	// 회원가입 처리
	@Override
	public int insertCust(CustomerVO vo) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.insertCust(vo);
	}

	// 비번확인
	@Override
	public String pwdSearch(String id) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.pwdSearch(id);
	}

	// 이메일 인증 처리
	@Override
	public int emailSuccess(String id) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.emailSuccess(id);
	}

	// 이메일 인증 여부
	@Override
	public int emailChk(String id) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.emailChk(id);
	}

	// 사용자 권한 확인
	@Override
	public String gradeCheck(String id) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.gradeCheck(id);
	}

	// 우편번호 등록
	@Override
	public int insertzipcode(Map<String, Object> map) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.insertzipcode(map);
	}

	// 우편번호 조회
	@Override
	public int zipcodeChk(int zipcode) {
		
		MainDAO dao = data.getMapper(MainDAO.class);
		
		return dao.zipcodeChk(zipcode);
	}

	// 회원 조회
	@Override
	public CustomerVO selectCustomer(String id) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.selectCustomer(id);
	}
	
	// 1.회원정보 수정처리(회원정보)
	@Override
	public int updateCustomer(CustomerVO vo) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.updateCustomer(vo);
	}

	// 2. 우편번호가 같을시 update
	@Override
	public int updateCustomer2(CustomerVO vo) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return  dao.updateCustomer2(vo);
	}

	// 펫 목록
	@Override
	public List<PetVO> getPetList(HashMap<String, Object> map) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.getPetList(map);
	}
	
	// 펫등록 처리
	@Override
	public int insertPet(PetVO vo) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.insertPet(vo);
	}

	// 펫 수정 상세 페이지
	@Override
	public PetVO PetDetail(int PET_CD) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.PetDetail(PET_CD);
	}
	
	// 펫 수정 처리
	@Override
	public int updatePet(PetVO vo) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.updatePet(vo);
	}

	// 펫 삭제
	@Override
	public int deletePet(int PET_CD) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.deletePet(PET_CD);
	}
	
	// 펫 목록 갯수
	@Override
	public int getPetCnt() {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.getPetCnt();
	}
	
	// 일정 가지고 오기(json변환을 위해 Map을 ResultType으로 받음)
	@Override
	public List<Map<String,Object>> getEvents(String id) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.getEvents(id);
	}
	
	// 일정 추가
	@Override
	public int insertEvent(CalendarVO vo) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.insertEvent(vo);		
	}
	
	// 일정 삭제
	@Override
	public int deleteEvent(String CL_CD) {
		MainDAO dao = data.getMapper(MainDAO.class);
		return dao.deleteEvent(CL_CD);				
	}
}
