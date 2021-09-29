package ptms.mvc.tpj.Sitter_Service;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SitterService {
	
	// 시터 등록 <완료>
	public void insertSitter(HttpServletRequest req, Model model) throws ParseException;

	// 시터 등록 해제 / 탈퇴 <완료>
	public void deleteSitter(HttpServletRequest req, Model model);
	
	// 시터 정보 프로필 화면 <완료>
	public void updateSitter(HttpServletRequest req, Model model);
	
	//--------------- 추가 -----------------
	// 시터 프로필 화면 수정 처리 <완료>
	public void updateSitterAction(HttpServletRequest req, Model model) throws ParseException;
	//--------------- 추가 끝 -----------------
	// 펫시터 찾기 - 리스트 출력 <완료>
	public void workSitterList(HttpServletRequest req, Model model) throws ParseException;
	
	// 시터 상세 조회 <완료>
	public void detailSitter(HttpServletRequest req, Model model);
	
	// 시터 의뢰 목록 (전체) <완료>
	public void allRequestList(HttpServletRequest req, Model model);
	
	// 고객 - 시터 의뢰 등록 <완료>
	public void insertRequest(HttpServletRequest req, Model model)throws ParseException;
	
	// 시터 - 고객의 요청 수락할시 <완료>
	public void acceptRequest(HttpServletRequest req, Model model);	
	
	//시터 - 고객의 요청 수락할 시 내역을 보여주는 페이지 <완료>
	public void acceptRequestList(HttpServletRequest req, Model model);
	
	// 시터 - 고객의 요청 거절할 시 <완료>
	public void cancleRequest(HttpServletRequest req, Model model);
	
	// 시터 - 고객의 요청 거절할 시 내역을 보여주는 페이지 <완료>	
	public void cancleRequestList(HttpServletRequest req, Model model);
	
	// 시터 - 고객과의 서비스 매칭완료 내역을 보여주는 페이지(고객이 결제완료하면 매칭완료)
	public void MatchingFinishList(HttpServletRequest req, Model model);
	
	// 고객 - (시터로부터) 요청수락 대기 중인 내역을 보여주는 페이지 <완료>
	public void WaitRequestAccept(HttpServletRequest req, Model model);
	
	//고객 - '요청수락대기' 중인 서비스 취소 <완료>
	public void reqSitterSerCancle(HttpServletRequest req, Model model);
	
	// 고객 - (시터로부터) 수락된 요청 내역을 보여주는 페이지 <완료>
	public void acceptFromSitter(HttpServletRequest req, Model model);
	
	// 고객 - (시터로부터) 거절된 요청 내역을 보여주는 페이지 <완료>
	public void refuseFromSitter(HttpServletRequest req, Model model);
	
	
	
	/* 21-09-29 / 신도빈  / 결제완료 후 요청테이블 상태 업데이트 'SQ_ST : 1' */
	// 고객 - 카카오페이 결제 완료 후 요청 테이블 상태 업데이트
	public int paySuccessUpdate(HttpServletRequest req, Model model);
	
	
	// 고객 - 고객이 결제 완료한 내역을 보여주는 페이지
	public void matchingList(HttpServletRequest req, Model model);
	
	// 고객 - (서비스완료-결제완료) 후 이용한 펫시터서비스에 대한 후기를 작성하는 페이지
	public void writeSitterReview(HttpServletRequest req, Model model);
	
	// 고객 - 시터후기 미리보기(별점 높은순)
	public void highSittergrade(HttpServletRequest req, Model model);
	
	// 고객 - 시터후기 미리보기(최신등록순)
	public void newSitterPost(HttpServletRequest req, Model model);
	
	// 고객 - 시터후기 미리보기(후기 많은순)
	public void themostsitterReview(HttpServletRequest req, Model model);
	
	// 결제하기
	public void sitterPay(HttpServletRequest req, Model model);
	
	//요금표 리스트 <완료>
	public void priceInfo(HttpServletRequest req, Model model);
	
	// 고객 - 동일한 아이디로 시터 등록이 되어있을시 페이지접근x
	public void sitterSignInChk(HttpServletRequest req, Model model);
	
}
