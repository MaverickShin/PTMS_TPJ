package ptms.mvc.tpj.CustVO;

import java.sql.Date;

public class SitterVO {
	
	//시터 주거지 유형 테이블
	private int SR_CD;    			//시터 주거지 코드
	private String SR_KIND;			//시터 주거지 유형
	
	//시터 프로필 테이블
	 private int SIT_ID;     		// 시터 ID
	 private String CUST_ID;   	 	// 고객 아이디
	 private String CUST_NM;        // 고객 이름
	 private String SIT_TITLE; 		// 시터 소개글 제목
	 private String SIT_APPEAL;  	// 시터 소개글 본문
	 private String SIT_IMG;        // 프로필 사진
	 private int SIT_ST;     		// 시터 활동 등록상태  --0이면 활동x, 1이면 활동o
	 private Date SIT_DT;			// 시터 등록일
	 
	 // 시터 서비스 요금 테이블
	 private int SF_CD;				// 서비스 요금 번호
	 private int PK_CD;			    // 펫 종류
	 private int SF_FEE;			// 서비스 요금
	 
	 //시터 후기 테이블
	 private int SG_CD;				// 시터 후기 코드
	 private int SG_GRADE;			// 시터 평점
	 private String SG_CON;			// 시터 이용 후기
	 private String SG_IMG;			// 시터 이용 후기 이미지
	 private Date SG_DT;			// 시터 후기 등록일
	 
	 //시터 서비스 정보 테이블
	 private int SV_CD;				// 시터 서비스 코드
	 private String SV_AREA;	    // 서비스 가능 지역
	 private int SV1_NO;			// 미용 서비스
	 private int SV2_NO;			// 놀이 서비스
	 private int SV3_NO;			// 응급처치 서비스
	 private int SV4_NO;			// 산책 서비스
	 private Date WK_START;		// 활동 시작 가능일
	 private Date WK_END;			// 활동 시작 종료일
	 
	 //시터 구하기 요청 테이블
	 private int SQ_CD;				// 시터 구하기 요청 번호
	 private String SQ_AMT;			// 펫 종류 및 마리수
	 private String SQ_LOC;			// 고객 거주 지역
	 private int SQ_ST;				// 처리상태
	 private Date START_DAY;		// 의뢰 시작일
	 private Date END_DAY;			// 의뢰 종료일
	 private int SQ_FEE;			// 서비스요금
	 private Date SQ_DT;			// 요청 등록일
	 
	 
	public int getSR_CD() {
		return SR_CD;
	}
	
	public void setSR_CD(int sR_CD) {
		SR_CD = sR_CD;
	}
	
	public String getSR_KIND() {
		return SR_KIND;
	}
	
	public void setSR_KIND(String sR_KIND) {
		SR_KIND = sR_KIND;
	}
	public int getSIT_ID() {
		return SIT_ID;
	}
	
	public void setSIT_ID(int sIT_ID) {
		SIT_ID = sIT_ID;
	}
	
	public String getCUST_ID() {
		return CUST_ID;
	}
	
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	
	public String getSIT_TITLE() {
		return SIT_TITLE;
	}
	
	public void setSIT_TITLE(String sIT_TITLE) {
		SIT_TITLE = sIT_TITLE;
	}
	
	public String getSIT_APPEAL() {
		return SIT_APPEAL;
	}
	
	public void setSIT_APPEAL(String sIT_APPEAL) {
		SIT_APPEAL = sIT_APPEAL;
	}
	
	public String getSIT_IMG() {
		return SIT_IMG;
	}
	
	public void setSIT_IMG(String sIT_IMG) {
		SIT_IMG = sIT_IMG;
	}
	
	public int getSIT_ST() {
		return SIT_ST;
	}
	
	public void setSIT_ST(int sIT_ST) {
		SIT_ST = sIT_ST;
	}
	
	public Date getSIT_DT() {
		return SIT_DT;
	}
	
	public void setSIT_DT(Date sIT_DT) {
		SIT_DT = sIT_DT;
	}
	
	public int getSF_CD() {
		return SF_CD;
	}
	
	public void setSF_CD(int sF_CD) {
		
		SF_CD = sF_CD;
	}
	public int getPK_CD() {
		return PK_CD;
	}
	
	public void setPK_CD(int pK_CD) {
		PK_CD = pK_CD;
	}
	
	public int getSF_FEE() {
		return SF_FEE;
	}
	
	public void setSF_FEE(int sF_FEE) {
		SF_FEE = sF_FEE;
	}
	public int getSG_CD() {
		return SG_CD;
	}
	
	public void setSG_CD(int sG_CD) {
		SG_CD = sG_CD;
	}
	
	public int getSG_GRADE() {
		return SG_GRADE;
	}
	
	public void setSG_GRADE(int sG_GRADE) {
		SG_GRADE = sG_GRADE;
	}
	
	public String getSG_CON() {
		return SG_CON;
	}
	
	public void setSG_CON(String sG_CON) {
		SG_CON = sG_CON;
	}
	
	public String getSG_IMG() {
		return SG_IMG;
	}
	
	public void setSG_IMG(String sG_IMG) {
		SG_IMG = sG_IMG;
	}
	
	public Date getSG_DT() {
		return SG_DT;
	}
	
	public void setSG_DT(Date sG_DT) {
		SG_DT = sG_DT;
	}
	
	public int getSV_CD() {
		return SV_CD;
	}
	
	public void setSV_CD(int sV_CD) {
		SV_CD = sV_CD;
	}
	
	public String getSV_AREA() {
		return SV_AREA;
	}
	
	public void setSV_AREA(String sV_AREA) {
		SV_AREA = sV_AREA;
	}
	
	public int getSV1_NO() {
		return SV1_NO;
	}
	
	public void setSV1_NO(int sV1_NO) {
		SV1_NO = sV1_NO;
	}
	
	public int getSV2_NO() {
		return SV2_NO;
	}
	
	public void setSV2_NO(int sV2_NO) {
		SV2_NO = sV2_NO;
	}
	
	public int getSV3_NO() {
		return SV3_NO;
	}
	
	public void setSV3_NO(int sV3_NO) {
		SV3_NO = sV3_NO;
	}
	
	public int getSV4_NO() {
		return SV4_NO;
	}
	
	public void setSV4_NO(int sV4_NO) {
		SV4_NO = sV4_NO;
	}
	
	public int getSQ_CD() {
		return SQ_CD;
	}
	
	public void setSQ_CD(int sQ_CD) {
		SQ_CD = sQ_CD;
	}
	
	public String getSQ_AMT() {
		return SQ_AMT;
	}
	
	public void setSQ_AMT(String sQ_AMT) {
		SQ_AMT = sQ_AMT;
	}
	
	public String getSQ_LOC() {
		return SQ_LOC;
	}
	
	public void setSQ_LOC(String sQ_LOC) {
		SQ_LOC = sQ_LOC;
	}
	
	public int getSQ_ST() {
		return SQ_ST;
	}
	
	public void setSQ_ST(int sQ_ST) {
		SQ_ST = sQ_ST;
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
	
	public int getSQ_FEE() {
		return SQ_FEE;
	}
	
	public void setSQ_FEE(int sQ_FEE) {
		SQ_FEE = sQ_FEE;
	}
	
	public Date getSQ_DT() {
		return SQ_DT;
	}
	
	public void setSQ_DT(Date sQ_DT) {
		SQ_DT = sQ_DT;
	}

	public Date getWK_START() {
		return WK_START;
	}

	public void setWK_START(Date wK_START) {
		WK_START = wK_START;
	}

	public Date getWK_END() {
		return WK_END;
	}

	public void setWK_END(Date wK_END) {
		WK_END = wK_END;
	}

	public String getCUST_NM() {
		return CUST_NM;
	}

	public void setCUST_NM(String cUST_NM) {
		CUST_NM = cUST_NM;
	}
	
	
}
