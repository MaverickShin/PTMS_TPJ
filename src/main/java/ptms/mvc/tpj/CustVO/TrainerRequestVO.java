package ptms.mvc.tpj.CustVO;

import oracle.sql.DATE;
import oracle.sql.TIMESTAMP;

public class TrainerRequestVO {
	
	// 훈련 서비스 요청 테이블
	private int TQ_CD; 			// 훈련사 구하기 요청 번호
	private String CUST_ID;		// 의뢰인 아이디
	private int TA_CD;			// 훈련사 ID(고객 아이디)
	private String TQ_AMT;		// 훈련 종류
	private String TQ_LOC;		// 고객 거주 지역
	private int TQ_ST;			// 처리 상태
	private TIMESTAMP START_TM; // 의뢰 시작 시간
	private TIMESTAMP END_TM;	// 의뢰 종료 시간
	private DATE START_DAY;		// 의뢰 시작일
	private DATE END_DAY;		// 의뢰 종료일
	private String DAY_SEL;		// 특정 요일
	private int TQ_FEE;			// 훈련 요금
	private DATE TQ_DT;			// 요청 등록일
	
	
	// 훈련 요금 테이블
	private int TF_CD;
	private String TF_KIND;
	private int TF_FEE;
	
	
	public TrainerRequestVO() {}

	public int getTQ_CD() {
		return TQ_CD;
	}

	public void setTQ_CD(int tQ_CD) {
		TQ_CD = tQ_CD;
	}

	public String getCUST_ID() {
		return CUST_ID;
	}

	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}

	public int getTA_CD() {
		return TA_CD;
	}

	public void setTA_CD(int tA_CD) {
		TA_CD = tA_CD;
	}

	public String getTQ_AMT() {
		return TQ_AMT;
	}

	public void setTQ_AMT(String tQ_AMT) {
		TQ_AMT = tQ_AMT;
	}

	public String getTQ_LOC() {
		return TQ_LOC;
	}

	public void setTQ_LOC(String tQ_LOC) {
		TQ_LOC = tQ_LOC;
	}

	public int getTQ_ST() {
		return TQ_ST;
	}

	public void setTQ_ST(int tQ_ST) {
		TQ_ST = tQ_ST;
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

	public DATE getSTART_DAY() {
		return START_DAY;
	}

	public void setSTART_DAY(DATE sTART_DAY) {
		START_DAY = sTART_DAY;
	}

	public DATE getEND_DAY() {
		return END_DAY;
	}

	public void setEND_DAY(DATE eND_DAY) {
		END_DAY = eND_DAY;
	}

	public String getDAY_SEL() {
		return DAY_SEL;
	}

	public void setDAY_SEL(String dAY_SEL) {
		DAY_SEL = dAY_SEL;
	}

	public int getTQ_FEE() {
		return TQ_FEE;
	}

	public void setTQ_FEE(int tQ_FEE) {
		TQ_FEE = tQ_FEE;
	}

	public DATE getTQ_DT() {
		return TQ_DT;
	}

	public void setTQ_DT(DATE tQ_DT) {
		TQ_DT = tQ_DT;
	}

	public int getTF_CD() {
		return TF_CD;
	}

	public void setTF_CD(int tF_CD) {
		TF_CD = tF_CD;
	}

	public String getTF_KIND() {
		return TF_KIND;
	}

	public void setTF_KIND(String tF_KIND) {
		TF_KIND = tF_KIND;
	}

	public int getTF_FEE() {
		return TF_FEE;
	}

	public void setTF_FEE(int tF_FEE) {
		TF_FEE = tF_FEE;
	}

	
	

}
