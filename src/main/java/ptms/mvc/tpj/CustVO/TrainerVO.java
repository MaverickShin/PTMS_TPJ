package ptms.mvc.tpj.CustVO;

import java.sql.Date;

import oracle.sql.TIMESTAMP;

public class TrainerVO {
	
	// 훈련사 프로필 테이블
	private int TA_CD;			// 훈련사 번호
	private String CUST_ID;		// 고객 아이디
	private String TA_TITLE;	// 훈련사 소개글 제목
	private String TA_APPEAL;	// 훈련사 소개글 본문
	private String TA_IMG;		// 프로필 사진
	private int TA_ST;			// 훈련사 활동 등록상태 0:비활성, 1:활동중
	private TIMESTAMP TA_DT;	// 훈련사 등록일
	
	// 훈련사 서비스 정보 테이블
	private int TS_CD;			// 훈련사 서비스 코드
	private String TS_AREA;		// 서비스 가능 지역
	private int TS1_NO;			// 배변해결
	private int TS1_FEE;		// 배변해결 요금
	private int TS2_NO;			// 분리불안해결
	private int TS2_FEE;		// 분리불안해결 요금
	private int TS3_NO;			// 기본훈련해결
	private int TS3_FEE;		// 기본훈련해결 요금
	private int TS4_NO;			// 짖음해결
	private int TS4_FEE;		// 짖음해결 요금
	private Date START_DAY;// 훈련가능 시작일 
	private Date END_DAY;	// 훈련가능 마지막일
	private int ADJUSTABLE;		// 일정조정 여부 0:일정조정불가, 1:일정조정가능
	//private String RESERVATION;	// 예약 가능일 (평일, 주말 등)
	
	// join으로 가지고온 회원 이름
	private String CUST_NM;
	
	private String PET_NM;
	
	// 훈련사 후기 테이블
	private int TG_CD;
	private int TG_ID;
	private float TG_GRADE;
	private String TG_CON;
	private String TG_IMG;
	
	public int getTA_CD() {
		return TA_CD;
	}
	
	public void setTA_CD(int tA_CD) {
		TA_CD = tA_CD;
	}
	
	public String getCUST_ID() {
		return CUST_ID;
	}
	
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	
	public String getTA_TITLE() {
		return TA_TITLE;
	}
	
	public void setTA_TITLE(String tA_TITLE) {
		TA_TITLE = tA_TITLE;
	}
	
	public String getTA_APPEAL() {
		return TA_APPEAL;
	}
	
	public void setTA_APPEAL(String tA_APPEAL) {
		TA_APPEAL = tA_APPEAL;
	}
	
	public String getTA_IMG() {
		return TA_IMG;
	}
	
	public void setTA_IMG(String tA_IMG) {
		TA_IMG = tA_IMG;
	}
	
	public int getTA_ST() {
		return TA_ST;
	}
	
	public void setTA_ST(int tA_ST) {
		TA_ST = tA_ST;
	}
	
	public TIMESTAMP getTA_DT() {
		return TA_DT;
	}
	
	public void setTA_DT(TIMESTAMP tA_DT) {
		TA_DT = tA_DT;
	}
	
	public int getTS_CD() {
		return TS_CD;
	}
	
	public void setTS_CD(int tS_CD) {
		TS_CD = tS_CD;
	}
	
	public String getTS_AREA() {
		return TS_AREA;
	}
	
	public void setTS_AREA(String tS_AREA) {
		TS_AREA = tS_AREA;
	}
	
	public int getTS1_NO() {
		return TS1_NO;
	}
	
	public void setTS1_NO(int tS1_NO) {
		TS1_NO = tS1_NO;
	}
	public int getTS1_FEE() {
		return TS1_FEE;
	}
	public void setTS1_FEE(int tS1_FEE) {
		TS1_FEE = tS1_FEE;
	}
	public int getTS2_NO() {
		return TS2_NO;
	}
	public void setTS2_NO(int tS2_NO) {
		TS2_NO = tS2_NO;
	}
	public int getTS2_FEE() {
		return TS2_FEE;
	}
	public void setTS2_FEE(int tS2_FEE) {
		TS2_FEE = tS2_FEE;
	}
	public int getTS3_NO() {
		return TS3_NO;
	}
	public void setTS3_NO(int tS3_NO) {
		TS3_NO = tS3_NO;
	}
	public int getTS3_FEE() {
		return TS3_FEE;
	}
	public void setTS3_FEE(int tS3_FEE) {
		TS3_FEE = tS3_FEE;
	}
	public int getTS4_NO() {
		return TS4_NO;
	}
	public void setTS4_NO(int tS4_NO) {
		TS4_NO = tS4_NO;
	}
	public int getTS4_FEE() {
		return TS4_FEE;
	}
	public void setTS4_FEE(int tS4_FEE) {
		TS4_FEE = tS4_FEE;
	}
	
	public int getADJUSTABLE() { 
		return ADJUSTABLE; 
	} 
	
	public Date getSTART_DAY() {
		return START_DAY;
	}

	public void setSTART_DAY(Date sTART_DAY) {
		START_DAY = sTART_DAY;
	}

	public Date getEND_DAY() {
		return END_DAY;
	}

	public void setEND_DAY(Date eND_DAY) {
		END_DAY = eND_DAY;
	}

	public void setADJUSTABLE(int aDJUSTABLE) { 
		ADJUSTABLE = aDJUSTABLE; 
	}

	public String getCUST_NM() {
		return CUST_NM;
	}

	public void setCUST_NM(String cUST_NM) {
		CUST_NM = cUST_NM;
	}

	public String getPET_NM() {
		return PET_NM;
	}

	public void setPET_NM(String pET_NM) {
		PET_NM = pET_NM;
	}

	public int getTG_CD() {
		return TG_CD;
	}

	public void setTG_CD(int tG_CD) {
		TG_CD = tG_CD;
	}

	public int getTG_ID() {
		return TG_ID;
	}

	public void setTG_ID(int tG_ID) {
		TG_ID = tG_ID;
	}

	public float getTG_GRADE() {
		return TG_GRADE;
	}

	public void setTG_GRADE(float tG_GRADE) {
		TG_GRADE = tG_GRADE;
	}

	public String getTG_CON() {
		return TG_CON;
	}

	public void setTG_CON(String tG_CON) {
		TG_CON = tG_CON;
	}

	public String getTG_IMG() {
		return TG_IMG;
	}

	public void setTG_IMG(String tG_IMG) {
		TG_IMG = tG_IMG;
	}
	

}
