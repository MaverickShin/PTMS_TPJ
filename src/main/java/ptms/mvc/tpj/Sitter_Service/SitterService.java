package ptms.mvc.tpj.Sitter_Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SitterService {
	
	// 시터 등록
	public void insertSitter(HttpServletRequest req, Model model);
	
	// 시터 활동 등록
	public void workingeSitter(HttpServletRequest req, Model model);
	
	// 시터 활동 취소
	public void cancleSitter(HttpServletRequest req, Model model);
	
	// 시터 등록 해제
	public void deleteSitter(HttpServletRequest req, Model model);
	
	// 시터 정보 수정
	public void updateSitter(HttpServletRequest req, Model model);
	
	// 활동 시터 목록
	public void workSitterList(HttpServletRequest req, Model model);
	
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
