package ptms.mvc.tpj.CustVO;

import java.sql.Date;

public class PayVO {
	
	// 고객 결제 유형
	private int PAYKIND_CD;     // 결제유형코드
	private String PAY_KIND;    // 결제유형(구독, 시터, 훈련)
	
	// 결제 이력 테이블
	private int BY_CD;   		// 결제이력코드
	private String CUST_ID;     // 고객 아이디
	private int BY_SUM;			// 결제 금액
	private int BY_ST;			// 결제 상태	
	private Date BY_DT;			// 결제일
	private int BY_FEES;		//수수료
	
	
	public int getPAYKIND_CD() {
		return PAYKIND_CD;
	}
	
	public void setPAYKIND_CD(int pAYKIND_CD) {
		PAYKIND_CD = pAYKIND_CD;
	}
	
	public String getPAY_KIND() {
		return PAY_KIND;
	}
	
	public void setPAY_KIND(String pAY_KIND) {
		PAY_KIND = pAY_KIND;
	}
	
	public int getBY_CD() {
		return BY_CD;
	}
	
	public void setBY_CD(int bY_CD) {
		BY_CD = bY_CD;
	}
	
	public String getCUST_ID() {
		return CUST_ID;
	}
	
	public void setCUST_ID(String cUST_ID) {
		CUST_ID = cUST_ID;
	}
	
	public int getBY_SUM() {
		return BY_SUM;
	}
	
	public void setBY_SUM(int bY_SUM) {
		BY_SUM = bY_SUM;
	}
	
	public int getBY_ST() {
		return BY_ST;
	}
	
	public void setBY_ST(int bY_ST) {
		BY_ST = bY_ST;
	}
	
	public Date getBY_DT() {
		return BY_DT;
	}
	
	public void setBY_DT(Date bY_DT) {
		BY_DT = bY_DT;
	}

	public int getBY_FEES() {
		return BY_FEES;
	}

	public void setBY_FEES(int bY_FEES) {
		BY_FEES = bY_FEES;
	}
<<<<<<< HEAD
	
	
=======
>>>>>>> 1fbd97bc5e615201c7adae91d95f644567e0fe0b
	
	
}
