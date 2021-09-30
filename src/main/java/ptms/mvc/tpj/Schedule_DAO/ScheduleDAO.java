package ptms.mvc.tpj.Schedule_DAO;

import java.util.List;

import ptms.mvc.tpj.CustVO.CalendarVO;

public interface ScheduleDAO {
	
	// 일정 존재 여부
	public int scheduleChk(String cust_id);
	
	// 일정 리스트
	public List<CalendarVO> calendarList(String cust_id);
	
	// 일정 추가
	public int insertCalendar(CalendarVO vo);
	
	// 일정 삭제
	public int deleteCalendar(int cl_cd);
	
	// 일정 변경
	public int updateCalendar(CalendarVO vo);

}
