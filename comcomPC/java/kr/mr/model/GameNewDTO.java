package kr.mr.model;

import java.util.Date;

public class GameNewDTO {

	private String gnrelease;
	private String gnname;
	private String gnshare;
	private Date gnupdate;
	
	
	public String getGnrelease() {
		return gnrelease;
	}
	public void setGnrelease(String gnrelease) {
		this.gnrelease = gnrelease;
	}
	public String getGnname() {
		return gnname;
	}
	public void setGnname(String gnname) {
		this.gnname = gnname;
	}
	public String getGnshare() {
		return gnshare;
	}
	public void setGnshare(String gnshare) {
		this.gnshare = gnshare;
	}
	public Date getGnupdate() {
		return gnupdate;
	}
	public void setGnupdate(Date gnupdate) {
		this.gnupdate = gnupdate;
	}
	
	@Override
	public String toString() {
		return "GameNewDTO [gnrelease=" + gnrelease + ", gnname=" + gnname + ", gnshare=" + gnshare + ", gnupdate="
				+ gnupdate + "]";
	}
	
	
	
}

 