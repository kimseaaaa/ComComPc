package kr.mr.model;

import java.util.Date;

public class FoodOrderDTO {
	private int fodcode; //주문번호
	private String fodid; //아이디
	private int fodpri; //금액
	private Date foddate; //날짜,시간 (오늘)
	private int fcode; //음식코드
	private int fodqty; //수량
	private int fodok; //전달여부 (처리 = 1, 처리전 = 0)
	private int seatnum; //좌석번호
	private String fname; //음식명
	
	public int getFodcode() {
		return fodcode;
	}
	public void setFodcode(int fodcode) {
		this.fodcode = fodcode;
	}
	public String getFodid() {
		return fodid;
	}
	public void setFodid(String fodid) {
		this.fodid = fodid;
	}
	public int getFodpri() {
		return fodpri;
	}
	public void setFodpri(int fodpri) {
		this.fodpri = fodpri;
	}
	public Date getFoddate() {
		return foddate;
	}
	public void setFoddate(Date foddate) {
		this.foddate = foddate;
	}
	public int getFcode() {
		return fcode;
	}
	public void setFcode(int fcode) {
		this.fcode = fcode;
	}
	public int getFodqty() {
		return fodqty;
	}
	public void setFodqty(int fodqty) {
		this.fodqty = fodqty;
	}
	public int getFodok() {
		return fodok;
	}
	public void setFodok(int fodok) {
		this.fodok = fodok;
	}
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
	@Override
	public String toString() {
		return "FoodOrderDTO [fodcode=" + fodcode + ", fodid=" + fodid + ", fodpri=" + fodpri + ", foddate=" + foddate
				+ ", fcode=" + fcode + ", fodqty=" + fodqty + ", fodok=" + fodok + ", seatnum=" + seatnum + ", fname="
				+ fname + "]";
	}
	
}

