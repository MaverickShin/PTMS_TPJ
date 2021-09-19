package ptms.mvc.tpj.NoticeBoardService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface userInfo_NoticeBoard_service {

	// ------------------------------ 커뮤니티 영역 ------------------------------ // 
	
	// 커뮤니티  게시글 목록
	public void Community_Notice_Board_ListUp(HttpServletRequest req, Model model);
	
	// 커뮤니티  게시글 상세 페이지
	public void Community_Notice_Board_ListUp_Detail(HttpServletRequest req, Model model);
	
	// 커뮤니티 게시글/댓글 작성
	public void Community_Notice_Board_Write(HttpServletRequest req, Model model);
		
	// 커뮤니티 게시글 수정
	public void Community_Notice_Board_Update(HttpServletRequest req, Model model);

	// 커뮤니티 게시글 수정 페이지
	public void Community_Notice_Board_Update_Page(HttpServletRequest req, Model model);

	// 커뮤니티 게시글 삭제
	public void Community_Notice_Board_Delete(HttpServletRequest req, Model model);
	
	// ------------------------------ Q&A 영역 ------------------------------ //
	
	// Q&A 게시글 이용- 작성,수정,삭제 시, 로그인 인증 확인
	public void QNA_Notice_Board_Write_Password_Check(HttpServletRequest req, Model model);
	
	// Q&A 게시글 작성
	public void QNA_Notice_Board_Write(HttpServletRequest req, Model model);

	// Q&A 게시글 수정
	public void QNA_Notice_Board_Update(HttpServletRequest req, Model model);
	
	// Q&A 게시글 삭제
	public void QNA_Notice_Board_Delete(HttpServletRequest req, Model model);
	
	// Q&A 게시글 출력
	public void QNA_Notice_Board_ListUp(HttpServletRequest req, Model model);

	// Q&A 게시글 상세 출력
	public void QNA_Notice_Board_ListUp_Detail(HttpServletRequest req, Model model);
}
