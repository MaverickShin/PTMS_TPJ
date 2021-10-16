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
	
	// 질병정보 크롤링 - 21.09.23 창훈 추가
	public void SymptomCrawling(HttpServletRequest req, Model model);
	
	// 반려동물 지식정보 크롤링 - 21.09.23 창훈 추가
	public void SenseCrawling(HttpServletRequest req, Model model);
	
	// 영양정보 크롤링 - 21.09.24 창훈 추가
	public void NutrientCrawling(HttpServletRequest req, Model model);	
	
	// 제휴정보 크롤링 테스트용 - 진수 21.09.25
	public void AffiliateCrwaling(HttpServletRequest req, Model model);
	
	// 편의정보 크롤링 - 진수21.09.25
	public void Convenience_Info(HttpServletRequest req, Model model);
	
	// 뉴스레이터 크롤링 - 21.09.26 선영
	public void Newsletter(HttpServletRequest req, Model model);
	
	// 반려동물 인기검색어 크롤링 - 21.10.03 임지영
	public void petIssue(HttpServletRequest req, Model model);
	// 메인 하단 병원 정보 - 21.10.03 도빈
	public void HospitalInfo(HttpServletRequest req, Model model);
	
	// qna 문의 목록
	public void qnaList(HttpServletRequest req, Model mdoel);
	
	// qna 문의 등록
	public void qnaAdd(HttpServletRequest req, Model model);
	
	// qna 문의 삭제
	public void qnaDelete(HttpServletRequest req, Model model);
	
	// qna 문의 수정 처리
	public void qnaUpdate(HttpServletRequest req, Model model);
	
	// FAQ  목록
	public void faqList(HttpServletRequest req, Model model);
	
	// 푸터 하단 미용샵 정보
	public void shopInfo(HttpServletRequest req, Model model);
	
	// 21.10.05 임지영
	// 내 정보 수정 - 결제내역
	public void payList(HttpServletRequest req, Model model);
}
