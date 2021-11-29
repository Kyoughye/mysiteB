package com.javaex.vo;

public class QuestionVo {
	private int qno;
	private int prono;
	private int memno;
	private String qdate;
	private String qcontent;
	private int qAvail;
	private String memId;
	
	public QuestionVo() {
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getProno() {
		return prono;
	}
	public void setProno(int prono) {
		this.prono = prono;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getqAvail() {
		return qAvail;
	}
	public void setqAvail(int qAvail) {
		this.qAvail = qAvail;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "QuestionVo [qno=" + qno + ", prono=" + prono + ", memno=" + memno + ", qdate=" + qdate + ", qcontent="
				+ qcontent + ", qAvail=" + qAvail + ", memId=" + memId + "]";
	}
	
	
}
