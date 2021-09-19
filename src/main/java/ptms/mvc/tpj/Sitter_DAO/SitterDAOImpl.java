package ptms.mvc.tpj.Sitter_DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.PetVO;
import ptms.mvc.tpj.CustVO.SitterVO;
import ptms.mvc.tpj.CustVO.ZipcodeVO;

@Repository
public class SitterDAOImpl implements SitterDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int profileInsert(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ZipcodeVO addressInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertService(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSitter(String cust_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int activityUp(String cust_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int activityDown(String cust_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SitterVO> activityList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SitterVO detailSitter(int sit_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SitterVO gradeSitter(int sit_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SitterVO> requestList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SitterVO> selectRequestList(int sit_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SitterVO feeSearch(int pet_cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int requestInsert(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRequestInsert(String sit_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ZipcodeVO RequesterAddressInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PetVO> petKindInfo(String cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PetVO> petServiceFee(int pk_cd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteRequest(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int requestPayState(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sitterAccept(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int requestConfirmState(int sq_cd) {
		// TODO Auto-generated method stub
		return 0;
	}

	//요금표 리스트
	@Override
	public ArrayList<PetVO> getPriceList() {
		SitterDAO dao = sqlSession.getMapper(SitterDAO.class);
		return dao.getPriceList();
	}

}
