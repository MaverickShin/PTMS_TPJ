package ptms.mvc.tpj.TrainerDAO;

import java.util.List;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.TrainerVO;

public interface TrainerDAO {
	
	// selectList - 훈련사 리스트
	public List<TrainerVO> trainerList();
	
	// selectOne(VO반환) - 훈련사 상세 정보
	public TrainerVO trainerInfo(int taCd);
	
	// insert or update - 훈련사 프로필 등록
	public int insertTrainer(TrainerVO tVo);
	
	// insert - 훈련사 상세정보 등록
	public int insertTrainerDetail(TrainerVO vo);
	
	// update - 훈련사 정보 수정
	public int updateTrainer(TrainerVO tVo);
	
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
