package ptms.mvc.tpj.Schedule_DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.CalendarVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{

	@Autowired
	SqlSession data;
	
	@Override
	public int scheduleChk(String cust_id) {
		return 0;
	}

	// 고객 - 일정 조회 목록
	@Override
	public List<CalendarVO> calendarList(String cust_id) {
		ScheduleDAO dao = data.getMapper(ScheduleDAO.class);
		return dao.calendarList(cust_id);
	}

	// 일정 추가
	@Override
	public int insertCalendar(CalendarVO vo) {
		ScheduleDAO dao = data.getMapper(ScheduleDAO.class);
		return dao.insertCalendar(vo);
	}

	// 일정 삭제
	@Override
	public int deleteCalendar(int cl_cd) {
		ScheduleDAO dao = data.getMapper(ScheduleDAO.class);
		return dao.deleteCalendar(cl_cd);
	}

	// 일정 변경
	@Override
	public int updateCalendar(CalendarVO vo) {
		
		ScheduleDAO dao = data.getMapper(ScheduleDAO.class);
		
		return dao.updateCalendar(vo);
	}

}
