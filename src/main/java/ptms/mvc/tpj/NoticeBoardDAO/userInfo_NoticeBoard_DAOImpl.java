package ptms.mvc.tpj.NoticeBoardDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.CustVO.BoardVO;

@Repository
public class userInfo_NoticeBoard_DAOImpl implements userInfo_NoticeBoard_DAO {

	@Autowired
	SqlSession sqlSession;
	
	// ------------------------------ 커뮤니티 영역 ------------------------------ // 
	
	// 커뮤니티  게시글 출력
	@Override
	public ArrayList<BoardVO> Community_Notice_Board_ListUp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	// 커뮤니티 게시글 갯수 구하기
	@Override
	public int get_Commnuity_Notice_Board_Count() {
		// TODO Auto-generated method stub
		return 0;
	}

	// 커뮤니티 조회수 증가
	@Override
	public void add_Commnuity_Notice_Board_Count(int num) {
		// TODO Auto-generated method stub
		
	}

	// 커뮤니티  게시글 상세 페이지
	@Override
	public List<BoardVO> Community_Notice_Board_ListUp_Detail(int number) {
		// TODO Auto-generated method stub
		return null;
	}

	// 커뮤니티 게시글 작성 - sql insert 동작 확인
	@Override
	public int Community_Notice_Board_Write_Detail(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 커뮤니티 게시글 작성 - sql update 동작 확인
	@Override
	public int Community_Notice_Board_Update_Detail(int number) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 커뮤니티 게시글 작성 - sql delete 동작 확인
	@Override
	public int Community_Notice_Board_Delete_Detail(int number) {
		// TODO Auto-generated method stub
		return 0;
	}

	// ------------------------------ Q&A 영역 ------------------------------ //

	// Q&A 게시글 작성 - sql insert
	@Override
	public int QNA_Notice_Board_Write_Detail(BoardVO vo) {
		int insertCnt = 0;
		
		userInfo_NoticeBoard_DAO dao = sqlSession.getMapper(userInfo_NoticeBoard_DAO.class);
		insertCnt = dao.QNA_Notice_Board_Write_Detail(vo);
		return insertCnt;
	}
	// Q&A 게시글 작성 - sql update
	@Override
	public int QNA_Notice_Board_Update_Detail() {
		// TODO Auto-generated method stub
		return 0;
	}
	// Q&A 게시글 작성 - sql delete
	@Override
	public int QNA_Notice_Board_Delete_Detail(int qna_cd) {
		userInfo_NoticeBoard_DAO dao = sqlSession.getMapper(userInfo_NoticeBoard_DAO.class);
		return dao.QNA_Notice_Board_Delete_Detail(qna_cd);
	}
	// Q&A 게시글 출력
	@Override
	public ArrayList<BoardVO> QNA_Notice_Board_ListUp(Map<String, Object> map) {
		userInfo_NoticeBoard_DAO dao = sqlSession.getMapper(userInfo_NoticeBoard_DAO.class);
		return dao.QNA_Notice_Board_ListUp(map);
	}
	// Q&A 조회수 증가
	@Override
	public void add_QNA_Notice_Board_Count(int num) {
		// TODO Auto-generated method stub
		
	}
	// Q&A 게시글 갯수 구하기
	@Override
	public int QNA_Notice_Board_Count() {
		userInfo_NoticeBoard_DAO dao = sqlSession.getMapper(userInfo_NoticeBoard_DAO.class);
		return dao.QNA_Notice_Board_Count();
	}
	// Q&A 게시글 상세 출력
	@Override
	public BoardVO QNA_Notice_Board_ListUp_Detail(int qna_cd) {
		userInfo_NoticeBoard_DAO dao = sqlSession.getMapper(userInfo_NoticeBoard_DAO.class);
		BoardVO vo = dao.QNA_Notice_Board_ListUp_Detail(qna_cd);
		return vo;
	}
}
