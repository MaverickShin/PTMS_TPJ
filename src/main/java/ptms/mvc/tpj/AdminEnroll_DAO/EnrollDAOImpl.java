package ptms.mvc.tpj.AdminEnroll_DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;

@Repository
public class EnrollDAOImpl implements EnrollDAO{
	
	@Autowired
	SqlSession sqlSession;

	//펫 코드 및 요금 등록
	@Override
	public int petCodeFee(PetVO vo) {
		System.out.println("DAO ==> petCodeFee");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.petCodeFee(vo);
	}

	/*
	//펫 코드 및 요금 수 구하기
	@Override
	public int petCodeCount() {
		System.out.println("DAO ==> petCodeCount");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.petCodeCount();
	}
	 */
	
	//펫 코드 및 요금 목록
	@Override
	public ArrayList<PetVO> getpetCodeFee() {
		System.out.println("DAO ==> getpetCodeFee");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.getpetCodeFee();
	}

	//수정 펫 코드 및 요금 목록 조회
	@Override
	public PetVO UpdatePetCodeFeeList(int PK_CD) {
		System.out.println("DAO ==> UpdatePetCodeFeeList");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.UpdatePetCodeFeeList(PK_CD);
	}

	//펫 코드 및 요금 목록 수정처리
	@Override
	public int UpdatePetCode(PetVO vo) {
		System.out.println("DAO ==> UpdatePetCodeFee");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.UpdatePetCode(vo);
	}
	
	//요금표 수정처리
	@Override
	public int UpdateServiceFee(PetVO vo) {
		System.out.println("DAO ==> UpdateServiceFee");
		
		EnrollDAO dao = sqlSession.getMapper(EnrollDAO.class);
		return dao.UpdateServiceFee(vo);
	}

	//펫 코드 및 요금 목록 삭제처리
	@Override
	public int DeletePetCodeFee(int PK_CD) {
		// TODO Auto-generated method stub
		return 0;
	}


}
