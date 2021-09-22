package ptms.mvc.tpj.TrainerDAO;

import java.util.List;
import java.util.Map;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.TrainerVO;

public interface TrainerDAO {
	
	// selectList - (매칭 조건 걸린) 훈련사 리스트
	public List<TrainerVO> trainerList(Map<String, Object> map);
	
	// selectCnt
	public int trainerSelectCnt(Map<String, Object> map);
	
	// selectOne(VO반환) - 훈련사 상세 정보
	public TrainerVO trainerInfo(int taCd);
	
	// insert or update - 훈련사 프로필 등록
	public int insertTrainer(TrainerVO tVo);
	
	// insert - 훈련사 상세정보 등록
	public int insertTrainerDetail(TrainerVO vo);
	
	// 훈련사 정보 상세페이지
	public TrainerVO TrainerDetail(String CUST_ID);
	
	// update - 훈련사 정보 수정 처리 (TRAINER_TB)
	public int updateTrainer1(TrainerVO tVo);
	
	// update - 훈련사 정보 수정 처리 (TRAINER_SERVICE_TB)
	public int updateTrainer2(TrainerVO tVo);
	
	// delete or update - 훈련사 등록 철회
	public int deleteTrainer(int taCd);
	
	// insert - 훈련 예약
	public int insertTrainerReservation(TrainerVO tqVo);
	
	// insert - 훈련비 결제
	public int insertTrainerFee(TrainerVO tfVo);
	
	// selectList - 훈련 반려동물 목록
	public List<PetVO> TraineeList(int pet_cd, int pet_con);
	
	// delete - 훈련 예약 취소
	public int deleteReservation(int tq_cd);
	
	// delete - 훈련 예약 변경
	public int updateReservation(int tq_cd);
	
}
