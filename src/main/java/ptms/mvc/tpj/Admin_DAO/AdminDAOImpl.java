package ptms.mvc.tpj.Admin_DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.AdminVO.AdminVO;
import ptms.mvc.tpj.CustVO.PetVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	SqlSession sqlSession;

	//펫 코드 및 요금 등록
	@Override
	public int petCodeFee(PetVO vo) {
		System.out.println("DAO ==> petCodeFee");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.petCodeFee(vo);
	}
	
	//펫 코드 및 요금 목록
	@Override
	public ArrayList<PetVO> getpetCodeFee() {
		System.out.println("DAO ==> getpetCodeFee");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.getpetCodeFee();
	}

	//수정 펫 코드 및 요금 목록 조회
	@Override
	public PetVO UpdatePetCodeFeeList(int PK_CD) {
		System.out.println("DAO ==> UpdatePetCodeFeeList");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.UpdatePetCodeFeeList(PK_CD);
	}

	//펫 코드 및 요금 목록 수정처리
	@Override
	public int UpdatePetCode(PetVO vo) {
		System.out.println("DAO ==> UpdatePetCodeFee");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.UpdatePetCode(vo);
	}
	
	//요금표 수정처리
	@Override
	public int UpdateServiceFee(PetVO vo) {
		System.out.println("DAO ==> UpdateServiceFee");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.UpdateServiceFee(vo);
	}

	//펫 코드 및 요금 목록 삭제처리
	@Override
	public int DeletePetCodeFee(int PK_CD) {
		System.out.println("DAO ==> DeletePetCodeFee");
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.DeletePetCodeFee(PK_CD);
	}

	// 관리자 등록
	@Override
	public int insertAdmin(AdminVO vo) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.insertAdmin(vo);
	}

	// 관리자 아이디 중복확인
	@Override
	public int idChk(String mg_id) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.idChk(mg_id);
	}

	// 관리자 비번 확인
	@Override
	public String pwdCheck(String mg_id) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.pwdCheck(mg_id);
	}

	// 관리자 정보 확인
	@Override
	public AdminVO adminInfo(String mg_id) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		return dao.adminInfo(mg_id);
	}
	


}
