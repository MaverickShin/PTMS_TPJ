package ptms.mvc.tpj.CustVO;

import oracle.sql.DATE;

public class PetVO {
	
	//펫 종류
	private int PK_CD;		   //펫 종류 코드
	private String PK_KIND;    //펫 종류
	private String PK_DETAIL;  //펫 세부 분류
	
	//펫 테이블
	private int PET_CD;        //펫 코드 시퀀스
	private String CUST_ID;	   //고객 아이디
	private int PET_AGE;	   //펫 나이
	private String PET_NM;     //펫 이름
	private String PET_CON;    //펫 특이사항
	private String PET_IMG;    //펫 프로필 사진
	private DATE PET_DT;	   //펫 등록일
	
	//시터 서비스 요금 테이블
	private int SF_CD;		   //서비스 요금 번호
	private int SF_FEE;		   //서비스 요금
	
	public int getPK_CD() {
		return PK_CD;
	}
	
	public void setPK_CD(int pK_CD) {
		PK_CD = pK_CD;
	}
	
	public String getPK_DETAIL() {
		return PK_DETAIL;
	}
	
	public void setPK_DETAIL(String pK_DETAIL) {
		PK_DETAIL = pK_DETAIL;
	}
	
	public int getPET_CD() {
		return PET_CD;
	}
	
	public void setPET_CD(int pET_CD) {
		PET_CD = pET_CD;
	}
	
	public String getCUST_ID() {
		return CUST_ID;
	}
	
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	
	public int getPET_AGE() {
		return PET_AGE;
	}
	
	public void setPET_AGE(int pET_AGE) {
		PET_AGE = pET_AGE;
	}
	
	public String getPET_NM() {
		return PET_NM;
	}
	
	public void setPET_NM(String pET_NM) {
		PET_NM = pET_NM;
	}
	
	public String getPET_CON() {
		return PET_CON;
	}
	
	public void setPET_CON(String pET_CON) {
		PET_CON = pET_CON;
	}
	
	public String getPET_IMG() {
		return PET_IMG;
	}
	
	public void setPET_IMG(String pET_IMG) {
		PET_IMG = pET_IMG;
	}
	
	public DATE getPET_DT() {
		return PET_DT;
	}
	
	public void setPET_DT(DATE pET_DT) {
		PET_DT = pET_DT;
	}
	
	public int getSF_CD() {
		return SF_CD;
	}
	
	public void setSF_CD(int sF_CD) {
		SF_CD = sF_CD;
	}
	
	public int getSF_FEE() {
		return SF_FEE;
	}
	
	public void setSF_FEE(int sF_FEE) {
		SF_FEE = sF_FEE;
	}

	public String getPK_KIND() {
		return PK_KIND;
	}

	public void setPK_KIND(String pK_KIND) {
		PK_KIND = pK_KIND;
	}
	
	
	
}
