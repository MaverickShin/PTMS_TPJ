package ptms.mvc.tpj.CustVO;

import oracle.sql.DATE;
import oracle.sql.TIMESTAMP;

public class BoardVO {
	// --------------- qna -------------------
	// qna 유형 테이블
	private int QK_CD; 			//qna유형 번호 
	private String QNA_KIND; 	//qna유형
	
	// qna 테이블
	private int QNA_CD; 		// qna번호
	private String CUST_ID; 	// 고객 아이디
	private String MG_ID;		// 관리자 ID
	private String QNA_TITLE;	// qna 제목
	private String QNA_CONTENT; // qna 내용
	private String QNA_ANSWER;  // 답변
	private DATE QNA_DT;		// qna 등록일

	//----------------- 공지 -------------------
	private int NB_CD;			// 공지게시판 코드
	private String NB_TITLE;	// 공지 제목
	private String NB_CON;		// 공지 내용
	private String NB_IMG;		// 공지 이미지
	private DATE NB_DT;			// 공지 등록일
	
	// ---------------- 커뮤니티 -----------------
	
	//커뮤니티 게시판
	private int CB_CD; 			// 커뮤니티 게시판 코드
	private String CB_TITLE;	// 게시판 제목
	private String CB_CON;		// 게시판 내용
	private String READ_CNT;	// 조회수
	private TIMESTAMP CB_DT;	// 작성일
	
	// 커뮤니티 게시판 댓글
	private int CR_CD;			// 커뮤니티 댓글 코드
	private int CP_REPLY;		// 댓글 내용
	private int REF;			// 댓글 아이디
	private int REF_STEP;		// 댓글 스텝
	private DATE CP_DT;			// 댓글 등록일
	
	public BoardVO() {}

	public int getQK_CD() {
		return QK_CD;
	}

	public void setQK_CD(int qK_CD) {
		QK_CD = qK_CD;
	}

	public String getQNA_KIND() {
		return QNA_KIND;
	}

	public void setQNA_KIND(String qNA_KIND) {
		QNA_KIND = qNA_KIND;
	}

	public int getQNA_CD() {
		return QNA_CD;
	}

	public void setQNA_CD(int qNA_CD) {
		QNA_CD = qNA_CD;
	}

	public String getCUST_ID() {
		return CUST_ID;
	}

	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}

	public String getMG_ID() {
		return MG_ID;
	}

	public void setMG_ID(String mG_ID) {
		MG_ID = mG_ID;
	}

	public String getQNA_TITLE() {
		return QNA_TITLE;
	}

	public void setQNA_TITLE(String qNA_TITLE) {
		QNA_TITLE = qNA_TITLE;
	}

	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}

	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}

	public String getQNA_ANSWER() {
		return QNA_ANSWER;
	}

	public void setQNA_ANSWER(String qNA_ANSWER) {
		QNA_ANSWER = qNA_ANSWER;
	}

	public DATE getQNA_DT() {
		return QNA_DT;
	}

	public void setQNA_DT(DATE qNA_DT) {
		QNA_DT = qNA_DT;
	}

	public int getNB_CD() {
		return NB_CD;
	}

	public void setNB_CD(int nB_CD) {
		NB_CD = nB_CD;
	}

	public String getNB_TITLE() {
		return NB_TITLE;
	}

	public void setNB_TITLE(String nB_TITLE) {
		NB_TITLE = nB_TITLE;
	}

	public String getNB_CON() {
		return NB_CON;
	}

	public void setNB_CON(String nB_CON) {
		NB_CON = nB_CON;
	}

	public String getNB_IMG() {
		return NB_IMG;
	}

	public void setNB_IMG(String nB_IMG) {
		NB_IMG = nB_IMG;
	}

	public DATE getNB_DT() {
		return NB_DT;
	}

	public void setNB_DT(DATE nB_DT) {
		NB_DT = nB_DT;
	}

	public int getCB_CD() {
		return CB_CD;
	}

	public void setCB_CD(int cB_CD) {
		CB_CD = cB_CD;
	}

	public String getCB_TITLE() {
		return CB_TITLE;
	}

	public void setCB_TITLE(String cB_TITLE) {
		CB_TITLE = cB_TITLE;
	}

	public String getCB_CON() {
		return CB_CON;
	}

	public void setCB_CON(String cB_CON) {
		CB_CON = cB_CON;
	}

	public String getREAD_CNT() {
		return READ_CNT;
	}

	public void setREAD_CNT(String rEAD_CNT) {
		READ_CNT = rEAD_CNT;
	}

	public TIMESTAMP getCB_DT() {
		return CB_DT;
	}

	public void setCB_DT(TIMESTAMP cB_DT) {
		CB_DT = cB_DT;
	}

	public int getCR_CD() {
		return CR_CD;
	}

	public void setCR_CD(int cR_CD) {
		CR_CD = cR_CD;
	}

	public int getCP_REPLY() {
		return CP_REPLY;
	}

	public void setCP_REPLY(int cP_REPLY) {
		CP_REPLY = cP_REPLY;
	}

	public int getREF() {
		return REF;
	}

	public void setREF(int rEF) {
		REF = rEF;
	}

	public int getREF_STEP() {
		return REF_STEP;
	}

	public void setREF_STEP(int rEF_STEP) {
		REF_STEP = rEF_STEP;
	}

	public DATE getCP_DT() {
		return CP_DT;
	}

	public void setCP_DT(DATE cP_DT) {
		CP_DT = cP_DT;
	}
	
	
}
