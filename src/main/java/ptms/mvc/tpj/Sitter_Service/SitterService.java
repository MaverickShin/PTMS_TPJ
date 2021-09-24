package ptms.mvc.tpj.Sitter_Service;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SitterService {
	
	// 시터 등록
	public void insertSitter(HttpServletRequest req, Model model) throws ParseException;
	
	// 시터 활동 등록
	//public void workingeSitter(HttpServletRequest req, Model model);
	
	// 시터 활동 취소
	public void cancleSitter(HttpServletRequest req, Model model);
	
	// 시터 등록 해제 / 탈퇴
	public void deleteSitter(HttpServletRequest req, Model model);
	
	// 시터 정보 프로필 화면
	public void updateSitter(HttpServletRequest req, Model model);
	
	//--------------- 추가 -----------------
	// 시터 프로필 화면 수정 처리
	public void updateSitterAction(HttpServletRequest req, Model model) throws ParseException;
	//--------------- 추가 끝 -----------------
	// 펫시터 찾기 - 리스트 출력
	public void workSitterList(HttpServletRequest req, Model model) throws ParseException;
	
	// 시터 상세 조회
	public void detailSitter(HttpServletRequest req, Model model);
	
	// 시터 의뢰 목록 (전체)
	public void allRequestList(HttpServletRequest req, Model model);
	
	// 지정 시터 의뢰 목록 (고객이 본인을 지정하여 요청한 경우)
	public void selectRequestList(HttpServletRequest req, Model model);
	
	// 고객 - 시터 의뢰 등록
	public void insertRequest(HttpServletRequest req, Model model);
	
	// 고객 - 시터 의뢰 취소
	public void cancleRequest(HttpServletRequest req, Model model);
	
	// 결제하기
	public void sitterPay(HttpServletRequest req, Model model);
	
	// 시터 의뢰 수락 - 의뢰 확정
	public void payUpdate(HttpServletRequest req, Model model);
	
	//요금표 리스트
	public void priceInfo(HttpServletRequest req, Model model);
	
}
