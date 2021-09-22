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

	@Override
	public int updateTrainer(TrainerVO tVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTrainer(int taCd) {
		// TODO Auto-generated method stub
		return 0;
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
	public List<PetVO> TraineeList(int pet_cd, int pet_con) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReservation(int tq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReservation(int tq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getPetCount(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		int selectCnt = dao.getPetCount(id);
		return selectCnt;
	}
	
	@Override
	public List<TrainerVO> getPetInfo(String id) {
		TrainerDAO dao = sqlSession.getMapper(TrainerDAO.class);
		List<TrainerVO> petName = dao.getPetInfo(id);
		return petName;
	}

	
	

}
