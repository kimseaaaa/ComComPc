package kr.mr.model;

import java.util.Date;

public class ClientVisitDTO {
    private int cvcode; //할당코드
    private String cvid; //아이디
    private int seatnum; //좌석번호
    private Date cvlogin; //로그인시점
    private Date cvlogout; //로그아웃시점
   
   
	public int getCvcode() {
		return cvcode;
	}
	public void setCvcode(int cvcode) {
		this.cvcode = cvcode;
	}
	public String getCvid() {
		return cvid;
	}
	public void setCvid(String cvid) {
		this.cvid = cvid;
	}
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public Date getCvlogin() {
		return cvlogin;
	}
	public void setCvlogin(Date cvlogin) {
		this.cvlogin = cvlogin;
	}
	public Date getCvlogout() {
		return cvlogout;
	}
	public void setCvlogout(Date cvlogout) {
		this.cvlogout = cvlogout;
	}
	
	@Override
	public String toString() {
		return "ClientVisitDTO [cvcode=" + cvcode + ", cvid=" + cvid + ", seatnum=" + seatnum + ", cvlogin=" + cvlogin
				+ ", cvlogout=" + cvlogout + "]";
	}
   
   
   
	
}
