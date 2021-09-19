package ptms.mvc.tpj.TrainerDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.TrainerVO;

@Repository
public class TrainerDAOImpl implements TrainerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TrainerVO> trainerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TrainerVO trainerInfo(int taCd) {
		// TODO Auto-generated method stub
		return null;
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
	public int insertTrainerReservation(TrainerVO tqVo) {
		// TODO Auto-generated method stub
		return 0;
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
	
	

}
