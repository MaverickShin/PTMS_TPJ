package ptms.mvc.tpj.CustVO;

import java.sql.Date;

public class QnAVO {
	
	private int QK_CD;
	private String QNA_KIND;
	private int QNA_CD;
	private String CUST_ID;
	private String MG_ID;
	private String QNA_TITLE;
	private String QNA_CONTENT;
	private String QNA_ANSWER;
	private Date QNA_DT;
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
	public Date getQNA_DT() {
		return QNA_DT;
	}
	public void setQNA_DT(Date qNA_DT) {
		QNA_DT = qNA_DT;
	}
	
}
