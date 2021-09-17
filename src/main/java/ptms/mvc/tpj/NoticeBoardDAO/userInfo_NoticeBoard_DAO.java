package ptms.mvc.tpj.NoticeBoardDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ptms.mvc.tpj.CustVO.BoardVO;

public interface userInfo_NoticeBoard_DAO {

	// ------------------------------ 커뮤니티 영역 ------------------------------ // 
	
	// 커뮤니티  게시글 출력
	public ArrayList<BoardVO> Community_Notice_Board_ListUp(Map<String, Object> map);
	
	// 커뮤니티 게시글 갯수 구하기
	public int get_Commnuity_Notice_Board_Count();
	
	// 커뮤니티 조회수 증가
	public void add_Commnuity_Notice_Board_Count(int num);
	
	// 커뮤니티  게시글 상세 페이지
	public List<BoardVO> Community_Notice_Board_ListUp_Detail(int number);
		
	// 커뮤니티 게시글 작성 - sql insert 동작 확인
	public int Community_Notice_Board_Write_Detail(BoardVO vo);

	// 커뮤니티 게시글 작성 - sql update 동작 확인
	public int Community_Notice_Board_Update_Detail(int number);

	// 커뮤니티 게시글 작성 - sql delete 동작 확인
	public int Community_Notice_Board_Delete_Detail(int number);
	
	
	// ------------------------------ Q&A 영역 ------------------------------ //

	// Q&A 게시글 작성 - sql insert
	public int QNA_Notice_Board_Write_Detail(BoardVO vo);	
	
	// Q&A 게시글 작성 - sql update
	public int QNA_Notice_Board_Update_Detail();
	
	// Q&A 게시글 작성 - sql delete
	public int QNA_Notice_Board_Delete_Detail(int qna_cd);
			
	// Q&A 게시글 출력
	public ArrayList<BoardVO> QNA_Notice_Board_ListUp(Map<String,Object> map);

	// Q&A 조회수 증가
	public void add_QNA_Notice_Board_Count(int num);
	
	// Q&A 게시글 갯수 구하기
	public int QNA_Notice_Board_Count();
	
	// Q&A 게시글 상세 출력
	public BoardVO QNA_Notice_Board_ListUp_Detail(int qna_cd);
}
