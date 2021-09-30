package ptms.mvc.tpj.Schedule_Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.Schedule_DAO.ScheduleDAOImpl;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDAOImpl dao;
	
	@Override
	public void insertCalendar(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	// 일정 수정
	@Override
	public void updateCalendar(HttpServletRequest req, Model model) {

		int cl_cd = Integer.parseInt(req.getParameter("cl_cd"));
		
		CalendarVO dto = new CalendarVO();
		
		dto.setCL_CD(cl_cd);
		
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		dto.setStart(start);
		dto.setEnd(end);
		dto.setCL_TITLE(req.getParameter("title"));
		dto.setCL_MEMO("");
		dto.setCL_BACKCOL(req.getParameter("back"));
		dto.setCL_COLOR(req.getParameter("text"));
		dto.setCL_BORDER(req.getParameter("border"));
		
		int update = dao.updateCalendar(dto);
		
		if(update != 0) {
			String cust_id =  (String)req.getSession().getAttribute("cust_id");
			
			List<CalendarVO> vo = dao.calendarList(cust_id);
			
			model.addAttribute("vo", vo);
		}
		
	}

	@Override
	public void deleteCalendar(HttpServletRequest req, Model model) {

		int cl_cd = Integer.parseInt(req.getParameter("cl_cd"));
	
		String cust_id =  (String)req.getSession().getAttribute("cust_id");
		
		dao.deleteCalendar(cl_cd);
		
		List<CalendarVO> vo = dao.calendarList(cust_id);
		
		model.addAttribute("vo", vo);
		
	}

	// 일정 목록 조회
	@Override
	public void readCalendar(HttpServletRequest req, Model model) {
		
		String cust_id =  (String)req.getSession().getAttribute("cust_id");
		
		System.out.println("CUST_ID :" + cust_id);
		
		List<CalendarVO> vo = dao.calendarList(cust_id);
		
		model.addAttribute("vo", vo);
		
	}

}
