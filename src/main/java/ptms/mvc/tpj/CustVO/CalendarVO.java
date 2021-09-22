package ptms.mvc.tpj.CustVO;

import oracle.sql.TIMESTAMP;

public class CalendarVO {
	
	private int CL_CD;		// 달력 PK
	private String CUST_ID;	// 해당 달력(일정)의 소유자 ID
	private int CK_CD;		// 이벤트 종류 (0: 기타, 1: 시터, 2: 훈련사)
	private TIMESTAMP START_TM; // 이벤트 시작 시각(DATE타입은 TIMESTAMP로 형변환) NOT NULL
	private TIMESTAMP END_TM; // 이벤트 종료 시각
	private String CL_TITLE; // 이벤트 종류가 0일때 일정 이름 입력
	private String CL_MOMO; // 해당 일정을 클릭했을 때 표시되는 메모
	
	public int getCL_CD() {
		return CL_CD;
	}
	public void setCL_CD(int cL_CD) {
		CL_CD = cL_CD;
	}
	public String getCUST_ID() {
		return CUST_ID;
	}
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	public int getCK_CD() {
		return CK_CD;
	}
	public void setCK_CD(int cK_CD) {
		CK_CD = cK_CD;
	}
	public TIMESTAMP getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(TIMESTAMP sTART_TM) {
		START_TM = sTART_TM;
	}
	public TIMESTAMP getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(TIMESTAMP eND_TM) {
		END_TM = eND_TM;
	}
	public String getCL_TITLE() {
		return CL_TITLE;
	}
	public void setCL_TITLE(String cL_TITLE) {
		CL_TITLE = cL_TITLE;
	}
	public String getCL_MOMO() {
		return CL_MOMO;
	}
	public void setCL_MOMO(String cL_MOMO) {
		CL_MOMO = cL_MOMO;
	}
	
	
}
