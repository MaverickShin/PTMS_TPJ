package ptms.mvc.tpj.Customer_Main_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {

	// 중복확인 처리 - 아이디 확인
	public int confirmId(HttpServletRequest req, Model model);
		
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, Model model);
		
	// 회원정보 상세조회
	public void custDetail(HttpServletRequest req, Model model);

	// 회원정보 수정 처리
	public void custUpdate(HttpServletRequest req, Model model);
	
	// 회월 탈퇴
	public void custDelete(HttpServletRequest req, Model model);
	
	// 펫 목록
	public void petList(HttpServletRequest req, Model model);
	
	// 펫 등록 처리
	public void petInAction(HttpServletRequest req, Model model);
	
	// 펫 수정 화면
	public void petUpdate(HttpServletRequest req, Model model);
	
	// 펫 삭제 처리
	public void petDelete(HttpServletRequest req, Model model);
	
	// 펫 수정 처리
	public void petUpdateAction(HttpServletRequest req, Model model);
	
	// 일정 가지고 오기(json변환을 위해 Map을 ResultType으로 받음)
	public void callCalendar(HttpServletRequest req, Model model);
	
	// 질병정보 크롤링 - 21.09.23 창훈 추가
	public void SymptomCrawling(HttpServletRequest req, Model model);
	
	// 반려동물 지식정보 크롤링 - 21.09.23 창훈 추가
	public void SenseCrawling(HttpServletRequest req, Model model);
	
	// 영양정보 크롤링 - 21.09.24 창훈 추가
	public void NutrientCrawling(HttpServletRequest req, Model model);	
	
	// 제휴정보 크롤링 테스트용 - 진수 21.09.25
	public void AffiliateCrwaling(HttpServletRequest req, Model model);
	
	// 일정 추가
	public void addEvent(HttpServletRequest req, Model model);
	
	// 일정 삭제
	public void deleteEvent(HttpServletRequest req, Model model);

	
	
}
