package ptms.mvc.tpj.Schedule_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ScheduleService {
	
	// 일정 추가
	public void insertCalendar(HttpServletRequest req, Model model);

	// 일정 변경
	public void updateCalendar(HttpServletRequest req, Model model);
	
	// 일정 삭제
	public void deleteCalendar(HttpServletRequest req, Model model);
	
	// 일정 불러오기
	public void readCalendar(HttpServletRequest req, Model model);

}
