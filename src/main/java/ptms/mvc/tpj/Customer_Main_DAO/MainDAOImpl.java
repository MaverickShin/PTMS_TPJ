package ptms.mvc.tpj.Customer_Main_DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ptms.mvc.tpj.CustVO.CustomerVO;

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

	
	

}
