package ptms.mvc.tpj.CustVO;

import java.util.Date;

import org.apache.tomcat.jni.User;

public class CustomerVO extends User{
	
   // 회원정보
   private String CUST_ID;      // 고객 ID
   private String CUST_PWD;    // 고객 비밀번호
   private String CUST_NM;    // 고객 이름
   private String CUST_EM;    // 고객 이메일
   private String CUST_PH;    // 고객 연락처
   private Date START_DT;       // 구독 시작일
   private Date END_DT;       // 구독 종료일
   private int ZIPCODE;      // 고객 우편번호
   private String ADDRESS1;	// 지번 주소
   private String ADDRESS2;	// 도로명 주소
   private int ENABLE_NO;      // 이메일 인증 여부
   private String AUTHOR;       // 기본 사용자 권한
   private Date CUST_DT;       // 고객 가입일
   private String SUBADDRESS;	// 상세주소
   
	public String getCUST_ID() {
		return CUST_ID;
	}
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	public String getCUST_PWD() {
		return CUST_PWD;
	}
	public void setCUST_PWD(String cUST_PWD) {
		CUST_PWD = cUST_PWD;
	}
	public String getCUST_NM() {
		return CUST_NM;
	}
	public void setCUST_NM(String cUST_NM) {
		CUST_NM = cUST_NM;
	}
	public String getCUST_EM() {
		return CUST_EM;
	}
	public void setCUST_EM(String cUST_EM) {
		CUST_EM = cUST_EM;
	}
	public String getCUST_PH() {
		return CUST_PH;
	}
	public void setCUST_PH(String cUST_PH) {
		CUST_PH = cUST_PH;
	}
	public Date getSTART_DT() {
		return START_DT;
	}
	public void setSTART_DT(Date sTART_DT) {
		START_DT = sTART_DT;
	}
	public Date getEND_DT() {
		return END_DT;
	}
	public void setEND_DT(Date eND_DT) {
		END_DT = eND_DT;
	}
	public int getZIPCODE() {
		return ZIPCODE;
	}
	public void setZIPCODE(int zIPCODE) {
		ZIPCODE = zIPCODE;
	}
	public int getENABLE_NO() {
		return ENABLE_NO;
	}
	public void setENABLE_NO(int eNABLE_NO) {
		ENABLE_NO = eNABLE_NO;
	}
	public String getAUTHOR() {
		return AUTHOR;
	}
	public void setAUTHOR(String aUTHOR) {
		AUTHOR = aUTHOR;
	}
	public Date getCUST_DT() {
		return CUST_DT;
	}
	public void setCUST_DT(Date cUST_DT) {
		CUST_DT = cUST_DT;
	}
	public String getSUBADDRESS() {
		return SUBADDRESS;
	}
	public void setSUBADDRESS(String sUBADDRESS) {
		SUBADDRESS = sUBADDRESS;
	}
	
	public String getADDRESS1() {
		return ADDRESS1;
	}
	public void setADDRESS1(String aDDRESS1) {
		ADDRESS1 = aDDRESS1;
	}
	public String getADDRESS2() {
		return ADDRESS2;
	}
	public void setADDRESS2(String aDDRESS2) {
		ADDRESS2 = aDDRESS2;
	}
}
