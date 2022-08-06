package kr.mr.model;

import java.util.Date;

public class GameRankDTO {
	private int ranking;
	private String grstat;
	private int grgap;
	private String grname;
	private String grcomp;
	private String grshare;
	private Date grupdate;
	
	
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public String getGrstat() {
		return grstat;
	}
	public void setGrstat(String grstat) {
		this.grstat = grstat;
	}
	public int getGrgap() {
		return grgap;
	}
	public void setGrgap(int grgap) {
		this.grgap = grgap;
	}
	public String getGrname() {
		return grname;
	}
	public void setGrname(String grname) {
		this.grname = grname;
	}
	public String getGrcomp() {
		return grcomp;
	}
	public void setGrcomp(String grcomp) {
		this.grcomp = grcomp;
	}
	public String getGrshare() {
		return grshare;
	}
	public void setGrshare(String grshare) {
		this.grshare = grshare;
	}
	public Date getGrupdate() {
		return grupdate;
	}
	public void setGrupdate(Date grupdate) {
		this.grupdate = grupdate;
	}
	
	
	@Override
	public String toString() {
		return "GameRankDTO [ranking=" + ranking + ", grstat=" + grstat + ", grgap=" + grgap + ", grname=" + grname
				+ ", grcomp=" + grcomp + ", grshare=" + grshare + ", grupdate=" + grupdate + "]";
	}
	
}

 