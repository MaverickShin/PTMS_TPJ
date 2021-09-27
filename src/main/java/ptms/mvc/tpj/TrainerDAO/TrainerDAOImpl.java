package ptms.mvc.tpj.TrainerDAO;

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

	@Override
	public List<TrainerVO> trainerList(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerList(map);
	}
	
	@Override
	public int trainerSelectCnt(Map<String, Object> map) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerSelectCnt(map);
	}

	@Override
	public TrainerVO trainerInfo(int taCd) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainerInfo(taCd);
	}

	@Override
	public int insertTrainer(TrainerVO tVo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCnttr = dao.insertTrainer(tVo);
		return insertCnttr;
	}
	
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
	
	@Override
	public int TraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.TraineeListCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> TraineeList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.TraineeList(id);
	}

	@Override
	public int deleteReservation(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.deleteReservation(TQ_CD);
	}

	@Override
	public int updateAcceptTraining(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.updateAcceptTraining(TQ_CD);
	}
	
	// 펫 마릿수 가져오기
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

	@Override
	public int updateDenyTraining(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int updateCnt = dao.updateDenyTraining(TQ_CD);
		return updateCnt;
	}
	
	@Override
	public int acceptTraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.acceptTraineeListCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> acceptTraineeList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.acceptTraineeList(id);
	}
	
	@Override
	public int denyTraineeListCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.denyTraineeListCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> denyTraineeList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.denyTraineeList(id);
	}

	@Override
	public int custReqResultwaitCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultwaitCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> custReqResultwaitList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultwaitList(id);
	}

	@Override
	public int custReqResultacceptCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultacceptCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> custReqResultacceptList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultacceptList(id);
	}

	@Override
	public int custReqResultdenyCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.custReqResultdenyCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> custReqResultdenyList(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.custReqResultdenyList(id);
	}

	@Override
	public int trainingCompleteCnt(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.trainingCompleteCnt(id);
		return selectCnt;
	}

	@Override
	public List<TrainerRequestVO> trainingComplete(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.trainingComplete(id);
	}

	@Override
	public int insertTrainingReview(TrainerVO vo) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int insertCnt = dao.insertTrainingReview(vo);
		return insertCnt;
	}

	@Override
	public int reviewCheckCnt(int TQ_CD) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int reviewCheckCnt = dao.reviewCheckCnt(TQ_CD);
		return reviewCheckCnt;
	}

	@Override
	public List<TrainerVO> previewTrainingGrade() {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		return dao.previewTrainingGrade();
	}

	

}
