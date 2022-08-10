package kr.mr.model;



public class TimeOrderDTO {
   private int todcode; //아이디
   private String todid; //비밀번호
   private int todpri; //전화번호
   private String toddate; //생년월일
   
   
   public TimeOrderDTO() {}


	public int getTodcode() {
		return todcode;
	}
	
	
	public void setTodcode(int todcode) {
		this.todcode = todcode;
	}
	
	
	public String getTodid() {
		return todid;
	}
	
	
	public void setTodid(String todid) {
		this.todid = todid;
	}
	
	
	public int getTodpri() {
		return todpri;
	}
	
	
	public void setTodpri(int todpri) {
		this.todpri = todpri;
	}
	
	
	public String getToddate() {
		return toddate;
	}
	
	
	public void setToddate(String toddate) {
		this.toddate = toddate;
	}


	@Override
	public String toString() {
		return "TimeOrderDTO [todcode=" + todcode + ", todid=" + todid + ", todpri=" + todpri + ", toddate=" + toddate
				+ "]";
	}
   
    
   
}