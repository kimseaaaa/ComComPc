package kr.mr.model;

public class SeatDTO {
	private int seatnum;//좌석번호
	private int sfix;//고장여부
	private String sid;//점유아이디
	
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public int getSfix() {
		return sfix;
	}
	public void setSfix(int sfix) {
		this.sfix = sfix;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	
}
