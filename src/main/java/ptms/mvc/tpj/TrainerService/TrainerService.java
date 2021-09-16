package ptms.mvc.tpj.TrainerService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface TrainerService {

	// 훈련사 등록
	public void insertTrainer(HttpServletRequest req, Model model);
	
	// 훈련사 리스트
	public void TrainerList(HttpServletRequest req, Model model);
	
	// 훈련사 정보
	public void TrainerInfo(HttpServletRequest req, Model model);
	
	// 훈련사 정보 수정
	public void updateTrainer(HttpServletRequest req, Model model);
	
	// 훈련사 등록 철회
	public void deleteTrainer(HttpServletRequest req, Model model);
	
	// 훈련 예약
	public void reserveTrainer(HttpServletRequest req, Model model);
		
	// 결제하기
	public void payToTrainer(HttpServletRequest req, Model model);

	// 예약된 훈련 반려동물 목록
	public void TraineeList(HttpServletRequest req, Model model);
	
	// 훈련 예약 취소(훈련사)
	public void withrawTrainer(HttpServletRequest req, Model model);
	
	// 훈련 예약 취소(반려인)
	public void withrawTrainee(HttpServletRequest req, Model model);
	
	// 훈련 예약 변경
	public void updateTraiee(HttpServletRequest req, Model model);
	
}
