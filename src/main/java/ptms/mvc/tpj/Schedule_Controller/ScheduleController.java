package ptms.mvc.tpj.Schedule_Controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.sql.DATE;
import ptms.mvc.tpj.CustVO.CalendarVO;
import ptms.mvc.tpj.Schedule_DAO.ScheduleDAOImpl;
import ptms.mvc.tpj.Schedule_Service.ScheduleServiceImpl;

@RequestMapping("/sch")
@Controller
public class ScheduleController {

	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	ScheduleServiceImpl service;
	
	@Autowired
	ScheduleDAOImpl dao;
	
	
	// 캘린더 페이지로 이동
	@RequestMapping("calendar")
	public String calendar(HttpServletRequest req, Model model) {
		
		service.readCalendar(req, model);
		
		return "customer/calendar/calendar";
	}
	
	// 캘린더 일정 추가 팝업
	@RequestMapping("schedulePopup")
	public String schedulePopup(HttpServletRequest req, Model model) {
		log.info("컨트롤러 - 일정 추가 페이지");
		  
		String val = req.getParameter("val");
		
		model.addAttribute("val", val);
		
		return "customer/calendar/schedulePopup";
	}
	
	// 일정 삭제
	@RequestMapping("removeCalendar")
	public String removeCalendar(HttpServletRequest req, Model model) {
		
		service.deleteCalendar(req, model);
		
		return "customer/calendar/calendarClone";
		
	}

	// 일반 - 일정 추가
	@RequestMapping("createCalendar")
	public String createCalendar(HttpServletRequest req, Model model) throws ParseException {
		
		CalendarVO dto = new CalendarVO();
		
		String cust_id = (String)req.getSession().getAttribute("cust_id");
		
		String memo = req.getParameter("memo");
		String title = req.getParameter("title");
		
		if(memo == null) {
			memo = "";
		}
		
		String back = req.getParameter("back");
		String border = req.getParameter("border");
		
		if(title.equals("미용")) {
			back = "#f06292";
			border = "#f06292";
		} else if(title.equals("산책")) {
			back = "#81c784";
			border = "#81c784";
		} else if(title.equals("병원")) {
			back = "#ff7043";
			border = "#ff7043";
		} else if(title.equals("훈련")) {
			back = "#ab47bc";
			border = "#ab47bc";
		} else if(title.equals("시터에게 맡기는 날")) {
			back = "#26c6da";
			border = "#26c6da";
		}
		
		System.out.println("back : " + back);
		System.out.println("border : " + border);
		
		dto.setCUST_ID(cust_id);
		dto.setCL_KIND("일반");
		
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		dto.setStart(start);
		dto.setEnd(end);
		dto.setCL_TITLE(title);
		dto.setCL_MEMO(memo);
		dto.setCL_BACKCOL(back);
		dto.setCL_COLOR("white");
		dto.setCL_BORDER(border);
		
		dao.insertCalendar(dto);
		
		List<CalendarVO> vo = dao.calendarList(cust_id);
		
		model.addAttribute("vo", vo);
		
		
		return "customer/calendar/calendarClone";
	}
	
	@RequestMapping("updateCalendar")
	public String updateCalendar(HttpServletRequest req, Model model) {
		
		service.updateCalendar(req, model);
		
		return "customer/calendar/calendarClone";
	}
}
