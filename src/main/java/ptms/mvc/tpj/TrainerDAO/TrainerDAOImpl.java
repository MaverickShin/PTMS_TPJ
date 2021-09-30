package ptms.mvc.tpj.TrainerDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.TrainerRequestVO;
import ptms.mvc.tpj.CustVO.TrainerVO;

@Repository
public class TrainerDAOImpl implements TrainerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 조건을 충족한 훈련사 리스트
	@Override
	public List<TrainerVO> trainerList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerList(map);
	}
	
	// 조건을 충족한 훈련사 리스트 건수
	@Override
	public int trainerSelectCnt(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerSelectCnt(map);
	}

	// 훈련사 상세 정보 
	@Override
	public TrainerVO trainerInfo(int taCd) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerInfo(taCd);
	}

	// 훈련사 프로필 테이블 등록
	@Override
	public int insertTrainer(TrainerVO tVo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCnttr = dao.insertTrainer(tVo);
		return insertCnttr;
	}
	
	// 훈련사 상세정보 테이블 등록
	@Override
	public int insertTrainerDetail(TrainerVO vo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCntdt = dao.insertTrainerDetail(vo);
		return insertCntdt;
	}

	// 훈련사 정보 상세페이지
	@Override
	public TrainerVO TrainerDetail(String CUST_ID) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.TrainerDetail(CUST_ID);
	}
	
	// 훈련사 수정 처리1 (TRAINER_TB)
	@Override
	public int updateTrainer1(TrainerVO tVo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.updateTrainer1(tVo);
	}
	
	// 훈련사 수정 처리2 (TRAINER_SERVICE_TB)
	@Override
	public int updateTrainer2(TrainerVO tVo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.updateTrainer2(tVo);
	}

	// delete - 1.훈련사 등록 탈퇴 (TRAINER_TB)
	@Override
	public int deleteTrainer(int TA_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.deleteTrainer(TA_CD);
	}
	
	// delete - 2.훈련사 등록 탈퇴 (TRAINER_SERVICE_TB)
	@Override
	public int deleteTrainer2(int TA_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.deleteTrainer2(TA_CD);
	}

	// 훈련 예약 - 훈련요청테이블에 등록
	@Override
	public int insertTrainerReservation(TrainerRequestVO vo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCnt = dao.insertTrainerReservation(vo);
		return insertCnt;
	}

	@Override
	public int insertTrainerFee(TrainerVO tfVo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 훈련사에게 온 훈련대기중인 리스트 건수
	@Override
	public int TraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.TraineeListCnt(id);
		return selectCnt;
	}

	// 훈련 대기중인 리스트
	@Override
	public List<TrainerRequestVO> TraineeList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.TraineeList(map);
	}

	// 훈련 예약 취소
	@Override
	public int deleteReservation(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.deleteReservation(TQ_CD);
	}

	// 훈련 수락 처리
	@Override
	public int updateAcceptTraining(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.updateAcceptTraining(TQ_CD);
	}
	
	// 의뢰인의 펫 마릿수 가져오기
	@Override
	public int getPetCount(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.getPetCount(id);
		return selectCnt;
	}
	
	//펫 정보 가져오기(이름, 펫코드)
	@Override
	public List<TrainerVO> getPetInfo(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		List<TrainerVO> petName = dao.getPetInfo(id);
		return petName;
	}

	// 훈련 거절 처리
	@Override
	public int updateDenyTraining(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int updateCnt = dao.updateDenyTraining(TQ_CD);
		return updateCnt;
	}
	
	// 훈련사에게 온 훈련 수락 리스트 건수
	@Override
	public int acceptTraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.acceptTraineeListCnt(id);
		return selectCnt;
	}

	// 훈련사에게 온 훈련 수락 리스트
	@Override
	public List<TrainerRequestVO> acceptTraineeList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.acceptTraineeList(map);
	}
	
	// 훈련사에게 온 훈련거절 리스트 건수
	@Override
	public int denyTraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.denyTraineeListCnt(id);
		return selectCnt;
	}

	// 훈련사에게 온 훈련 거절 리스트
	@Override
	public List<TrainerRequestVO> denyTraineeList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.denyTraineeList(map);
	}

	// 훈련사 매칭 완료 리스트 건수
	@Override
	public int TrainingServiceCompleteCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.trainingCompleteCnt(id);
		return selectCnt;
	}
	
	// 훈련사 매칭완료 리스트 
	@Override
	public List<TrainerRequestVO> TrainingServiceCompleteList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.TrainingServiceCompleteList(map);
	}

	// 고객용 훈련요청 결과 리스트 건수(대기중일때)
	@Override
	public int custReqResultwaitCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultwaitCnt(id);
		return selectCnt;
	}

	// 고객용 훈련요청 결과 리스트(대기중일때)
	@Override
	public List<TrainerRequestVO> custReqResultwaitList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultwaitList(map);
	}

	// 고객용 훈련요청결과 리스트 건수(수락일때)
	@Override
	public int custReqResultacceptCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultacceptCnt(id);
		return selectCnt;
	}

	// 고객용 훈련요청 결과 리스트(수락일때)
	@Override
	public List<TrainerRequestVO> custReqResultacceptList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultacceptList(map);
	}

	// 고객용 훈련요청결과 리스트 건수(거절일때)
	@Override
	public int custReqResultdenyCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultdenyCnt(id);
		return selectCnt;
	}

	// 고객용 훈련요청 결과 리스트(거절일때)
	@Override
	public List<TrainerRequestVO> custReqResultdenyList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultdenyList(map);
	}

	// 고객용 훈련완료 리스트 건수
	@Override
	public int trainingCompleteCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.trainingCompleteCnt(id);
		return selectCnt;
	}

	// 고객용 훈련완료 리스트
	@Override
	public List<TrainerRequestVO> trainingComplete(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainingComplete(map);
	}

	// 훈련사 후기 작성
	@Override
	public int insertTrainingReview(TrainerVO vo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCnt = dao.insertTrainingReview(vo);
		return insertCnt;
	}

	// 훈련사 후기 작성 중복체크
	@Override
	public int reviewCheckCnt(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.reviewCheckCnt(TQ_CD);
	}

	@Override
	public int reviewCnt(int TA_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int reviewCnt = dao.reviewCnt(TA_CD);
		return reviewCnt;
	}

	@Override
	public List<TrainerVO> getReviewInfo(int TA_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.getReviewInfo(TA_CD);
	}

	@Override
	public int trainerDupChk(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.trainerDupChk(id);
		return selectCnt;
	}

	@Override
	public int updateTrainingComplete(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int updateCnt = dao.updateTrainingComplete(TQ_CD);
		return updateCnt;
	}

	@Override
	public List<TrainerVO> previewTrainingGrade() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePay(int TQ_CD) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/*
	// 평점순 훈련사 정렬 건수
	@Override
	public int trainingGradeCnt() {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.trainingGradeCnt();
		return selectCnt;
	}

	// 평점순 훈련사 정렬
	@Override
	public List<TrainerVO> previewTrainingGrade() {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.previewTrainingGrade();
	}
	
	// 최신등록순 훈련사 정렬 건수
	@Override
	public int newTrainerCnt() {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.newTrainerCnt();
		return selectCnt;
	}

	@Override
	public int updatePay(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.updatePay(TQ_CD);
	}

	// 후기 미리보기 후기 많은 순 훈련사 정렬
	@Override
	public List<TrainerVO> lotsOfReviews() {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.lotsOfReviews();
	}
	*/
}
