package ptms.mvc.tpj.CustVO;

import java.sql.Date;

public class CalendarVO {

	private int CL_CD;
	private String CUST_ID;
	private String CL_KIND;
	private Date START_TM;
	private Date END_TM;
	private String CL_TITLE;
	private String CL_MEMO;
	private String CL_BACKCOL;
	private String CL_COLOR;
	private String CL_BORDER;
	private String start;
	private String end;
	
	
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
	public String getCL_KIND() {
		return CL_KIND;
	}
	public void setCL_KIND(String cL_KIND) {
		CL_KIND = cL_KIND;
	}
	public Date getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(Date sTART_TM) {
		START_TM = sTART_TM;
	}
	public Date getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(Date eND_TM) {
		END_TM = eND_TM;
	}
	public String getCL_TITLE() {
		return CL_TITLE;
	}
	public void setCL_TITLE(String cL_TITLE) {
		CL_TITLE = cL_TITLE;
	}
	public String getCL_MEMO() {
		return CL_MEMO;
	}
	public void setCL_MEMO(String cL_MEMO) {
		CL_MEMO = cL_MEMO;
	}
	public String getCL_BACKCOL() {
		return CL_BACKCOL;
	}
	public void setCL_BACKCOL(String cL_BACKCOL) {
		CL_BACKCOL = cL_BACKCOL;
	}
	public String getCL_COLOR() {
		return CL_COLOR;
	}
	public void setCL_COLOR(String cL_COLOR) {
		CL_COLOR = cL_COLOR;
	}
	public String getCL_BORDER() {
		return CL_BORDER;
	}
	public void setCL_BORDER(String cL_BORDER) {
		CL_BORDER = cL_BORDER;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
}
