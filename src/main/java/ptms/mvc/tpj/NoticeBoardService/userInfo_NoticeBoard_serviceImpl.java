package ptms.mvc.tpj.NoticeBoardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ptms.mvc.tpj.CustVO.BoardVO;
import ptms.mvc.tpj.NoticeBoardDAO.userInfo_NoticeBoard_DAO;

@Service
public class userInfo_NoticeBoard_serviceImpl implements userInfo_NoticeBoard_service {

	@Autowired
	private userInfo_NoticeBoard_DAO dao;
	
	// ------------------------------ 커뮤니티 영역 ------------------------------ //
	
	// 커뮤니티  게시글 출력
	@Override
	public void Community_Notice_Board_ListUp(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	// 커뮤니티  게시글 상세 페이지
	@Override
	public void Community_Notice_Board_ListUp_Detail(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	// 커뮤니티 게시글 작성
	@Override
	public void Community_Notice_Board_Write(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	// 커뮤니티 게시글 수정
	@Override
	public void Community_Notice_Board_Update(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	
	// 커뮤니티 게시글 수정 페이지
	@Override
	public void Community_Notice_Board_Update_Page(HttpServletRequest req, Model model)
	{
		// TODO Auto-generated method stub
	}
	
	// 커뮤니티 게시글 삭제
	@Override
	public void Community_Notice_Board_Delete(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	
	// ------------------------------ Q&A 영역 ------------------------------ //
	
	// Q&A 게시글 이용- 작성,수정,삭제 시, 로그인 인증 확인
	@Override
	public void QNA_Notice_Board_Write_Password_Check(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	// Q&A 게시글 작성
	@Override
	public void QNA_Notice_Board_Write(HttpServletRequest req, Model model) {
		BoardVO vo = new BoardVO();
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String id = (String)req.getSession().getAttribute("custid");
		vo.setCUST_ID(id);
		
		int qk_cd = Integer.parseInt(req.getParameter("QK_CD"));
		vo.setQK_CD(qk_cd);
		vo.setQNA_TITLE("QNA_TITLE");
		vo.setQNA_CONTENT("QNA_CONTENT");
		
		int insertCnt = dao.QNA_Notice_Board_Write_Detail(vo);
		System.out.println("insertCnt : " + insertCnt);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
		
	}
	// Q&A 게시글 수정
	@Override
	public void QNA_Notice_Board_Update(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	
	// Q&A 게시글 삭제
	@Override
	public void QNA_Notice_Board_Delete(HttpServletRequest req, Model model) {
		int qna_cd = Integer.parseInt(req.getParameter("QNA_CD"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		int deleteCnt = dao.QNA_Notice_Board_Delete_Detail(qna_cd);
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum", pageNum);
	}
	
	// Q&A 게시글 출력
	@Override
	public void QNA_Notice_Board_ListUp(HttpServletRequest req, Model model) {
		//페이징
		int pageSize = 10;	//한 페이지당 출력할 글 갯수
		int pageBlock = 3;  //한 블럭당 페이지 갯수
		
		int cnt = 0;		//글갯수
		int start = 0;		//현재 페이지 시작 글번호
		int end = 0;		//현재 페이지 마지막 글번호
		int number = 0;		//출력용 글번호
		String pageNum = "";//페이지번호
		int currentPage = 0;//현재 페이지
		
		int pageCount = 0;  //페이지 갯수
		int startPage = 0;	//시작페이지
		int endPage = 0;	//마지막 페이지
		
		//5-1단계. 게시글 갯수 조회
		cnt = dao.QNA_Notice_Board_Count();
		System.out.println("cnt => " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 지정
		}
		
		//글 30건 기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		
		//페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); //페이지갯수 + 나머지있으면 1페이지
		
		//현재페이지 시작 글번호(페이지별)
		//start = (currentPage - 1) * pageSize + 1;
		//1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;
		
		//현재페이지 시작 글번호(페이지별)
		//end = start + pageSize - 1;
		//5 = 1 + 5 - 1
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end :" + end);
		
		//출력용 글번호
		//30 = 30 - (1 - 1) * 5; //1페이지
		//number = cnt - (currentPage - 1) * pageSize;
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		//시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		//startPage = (currentPage / pageBlock) * pageBlock + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		System.out.println("startPage : " + startPage);
		
		//마지막 페이지
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		
		System.out.println("==============================");
		
		List<BoardVO> dtos = null;
		
		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			System.out.println("start" + start);
			System.out.println("end" + end);
			
			dtos = dao.QNA_Notice_Board_ListUp(map);
		}
		model.addAttribute("dtos", dtos);
		System.out.println(dtos.get(0).getQNA_DT());
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
	}
	// Q&A 게시글 상세 출력
	@Override
	public void QNA_Notice_Board_ListUp_Detail(HttpServletRequest req, Model model) {
		int qna_cd = Integer.parseInt(req.getParameter("num"));
		System.out.println(qna_cd);
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		BoardVO vo = dao.QNA_Notice_Board_ListUp_Detail(qna_cd);
		
		model.addAttribute("dto", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
	}
}
