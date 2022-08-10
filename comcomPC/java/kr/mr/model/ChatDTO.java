package kr.mr.model;

import java.util.Date;

public class ChatDTO {
	private String cfrom;
	private String cto;
	private String ccontent;
	private Date cdate;
	private int seatnum;
	private int cok;
	private int clientseat;
	
	public String getCfrom() {
		return cfrom;
	}
	public void setCfrom(String cfrom) {
		this.cfrom = cfrom;
	}
	public String getCto() {
		return cto;
	}
	public void setCto(String cto) {
		this.cto = cto;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	
	public int getCok() {
		return cok;
	}
	public void setCok(int cok) {
		this.cok = cok;
	}
	
	@Override
	public String toString() {
		return "ChatDTO [cfrom=" + cfrom + ", cto=" + cto + ", ccontent=" + ccontent + ", cdate=" + cdate + ", seatnum="
				+ seatnum + ", cok=" + cok + "]";
	}
	
	
	
}
