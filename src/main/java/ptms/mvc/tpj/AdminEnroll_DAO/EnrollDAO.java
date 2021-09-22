package ptms.mvc.tpj.AdminEnroll_DAO;

import java.util.ArrayList;
import java.util.Map;

import ptms.mvc.tpj.CustVO.PetVO;

public interface EnrollDAO {
	
	//펫 코드 및 요금 등록
	public int petCodeFee(PetVO vo);
	
	//펫 코드 및 요금 수 구하기
	//public int petCodeCount();
	
	//펫 코드 및 요금 목록
	public ArrayList<PetVO> getpetCodeFee();
	
	//수정 펫 코드 및 요금 목록 조회
	public PetVO UpdatePetCodeFeeList(int PK_CD);
	
	//펫 코드 수정처리
	public int UpdatePetCode(PetVO vo);
	
	//요금표 수정처리
	public int UpdateServiceFee(PetVO vo);
	
	//펫 코드 및 요금 목록 삭제처리
	public int DeletePetCodeFee(int PK_CD);
}
