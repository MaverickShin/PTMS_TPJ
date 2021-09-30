package ptms.mvc.tpj.TrainerDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.TrainerRequestVO;
import ptms.mvc.tpj.CustVO.TrainerVO;

public interface TrainerDAO {
	
	// selectList - 조건을 충족한 훈련사 리스트
	public List<TrainerVO> trainerList(Map<String, Object> map);
	
	// 조건을 충족한 훈련사 리스트 건수
	public int trainerSelectCnt(Map<String, Object> map);
	
	// 훈련사 상세 정보
	public TrainerVO trainerInfo(int taCd);
	
	// 훈련사 프로필 테이블 등록
	public int insertTrainer(TrainerVO tVo);
	
	// 훈련사 상세정보 테이블 등록
	public int insertTrainerDetail(TrainerVO vo);
	
	// 훈련사 정보 상세페이지
	public TrainerVO TrainerDetail(String CUST_ID);
	
	// update - 1.훈련사 정보 수정 처리 (TRAINER_TB 테이블)
	public int updateTrainer1(TrainerVO tVo);
	
	// update - 2.훈련사 정보 수정 처리 (TRAINER_SERVICE_TB 테이블)
	public int updateTrainer2(TrainerVO tVo);
	
	// delete - 훈련사 등록 탈퇴 (TRAINER_TB)
	public int deleteTrainer(int TA_CD);
	
	// delete - 훈련사 등록 탈퇴 (TRAINER_SERVICE_TB)
	public int deleteTrainer2(int TA_CD);
	
	// 훈련 예약 - 훈련요청테이블에 등록
	public int insertTrainerReservation(TrainerRequestVO vo);
	
	// insert - 훈련비 결제
	public int insertTrainerFee(TrainerVO tfVo);
	
	// 훈련사에게 온 훈련대기중인 리스트 건수
	public int TraineeListCnt(String id);
	
	// 훈련 대기중인 리스트
	public List<TrainerRequestVO> TraineeList(Map<String, Object> map);
	
	// 훈련 예약 취소
	public int deleteReservation(int TQ_CD);
	
	// 훈련사가 훈련 수락 -> update
	public int updateAcceptTraining(int TQ_CD);
	
	// 훈련사가 훈련 거절 -> update
	public int updateDenyTraining(int TQ_CD);
	
	// 의뢰인의 펫 마릿수 가져오기
	public int getPetCount(String id);
	
	// 펫 정보 가져오기(이름, 펫코드)
	public List<TrainerVO> getPetInfo(String id);
	
	// 훈련사에게 온 훈련 수락 리스트 건수
	public int acceptTraineeListCnt(String id);
	
	// 훈련사에게 온 훈련 수락 리스트
	public List<TrainerRequestVO> acceptTraineeList(Map<String, Object> map);
	
	// 훈련사에게 온 훈련거절 리스트 건수
	public int denyTraineeListCnt(String id);
	
	// 훈련사에게 온 훈련 거절 리스트
	public List<TrainerRequestVO> denyTraineeList(Map<String, Object> map);
	
	// 훈련사 매칭 완료 리스트 건수
	public int TrainingServiceCompleteCnt(String id);
	
	// 훈련사 매칭완료 리스트
	public List<TrainerRequestVO> TrainingServiceCompleteList(Map<String, Object> map);
	
	// 고객용 훈련요청 결과 리스트 건수(대기중일때)
	public int custReqResultwaitCnt(String id);
	
	// 고객용 훈련요청 결과 리스트(대기중일때)
	public List<TrainerRequestVO> custReqResultwaitList(Map<String, Object> map);
	
	// 고객용 훈련요청결과 리스트 건수(수락일때)
	public int custReqResultacceptCnt(String id);
	
	// 고객용 훈련요청 결과 리스트(수락일때)
	public List<TrainerRequestVO> custReqResultacceptList(Map<String, Object> map);
	
	// 고객용 훈련요청결과 리스트 건수(거절일때)
	public int custReqResultdenyCnt(String id);
		
	// 고객용 훈련요청 결과 리스트(거절일때)
	public List<TrainerRequestVO> custReqResultdenyList(Map<String, Object> map);

	// 고객용 훈련완료 리스트 건수
	public int trainingCompleteCnt(String id);
	
	// 고객용 훈련완료 리스트
	public List<TrainerRequestVO> trainingComplete(Map<String, Object> map);
	
	// 훈련사 후기 작성
	public int insertTrainingReview(TrainerVO vo);
	
	// 훈련사 후기 작성 중복체크
	public int reviewCheckCnt(int TQ_CD);
	
	// 훈련사 후기 갯수
	public int reviewCnt(int TA_CD);
	
	// 훈련사 후기 정보
	public List<TrainerVO> getReviewInfo(int TA_CD);
	
	// 훈련사 지원 중복체크
	public int trainerDupChk(String id);
	
	// 훈련 매칭확정 처리
	public int updateTrainingComplete(int TQ_CD);
	
	// 후기 미리보기 평점순 훈련사 정렬
	//public List<TrainerVO> previewTrainingGrade();
	
	/* 21-09-29 / 신도빈  / 결제완료 후 요청테이블 상태 업데이트 'TQ_ST : 1' */
	// 고객 - 카카오페이 결제 완료 후 요청 테이블 상태 업데이트
	public int updatePay(int TQ_CD);
	
	/*
	 * // 후기 미리보기 평점순 훈련사 정렬 건수 public int trainingGradeCnt();
	 * 
	 * 
	 * // 후기 미리보기 최신등록순 훈련사 정렬 건수 public int newTrainerCnt();
	 * 
	 * // 후기 미리보기 최신등록순 훈련사 정렬 public List<TrainerVO> newTrainerList();
	 * 
	 * // 후기 미리보기 후기 많은 순 훈련사 정렬 건수 public int lotsOfReviewsCnt();
	 * 
	 * // 후기 미리보기 후기 많은 순 훈련사 정렬 public List<TrainerVO> lotsOfReviews();
	 */
}
