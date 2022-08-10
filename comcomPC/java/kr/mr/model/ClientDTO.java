package kr.mr.model;



public class ClientDTO {
   private String id; //아이디
   private String pw; //비밀번호
   private String tel; //전화번호
   private String birth; //생년월일
   private String memo; //메모
   private int totpri; //총결제금액
   private int totfood; //음식금액
   private int mytime; //남은시간
   private int seatnum; //좌석번호
   private String keyword; //검색
   private String newpw;
   private String confpw;
   
   public ClientDTO() {}
   
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getTotpri() {
		return totpri;
	}
	public void setTotpri(int totpri) {
		this.totpri = totpri;
	}
	public int getTotfood() {
		return totfood;
	}
	public void setTotfood(int totfood) {
		this.totfood = totfood;
	}
	public int getMytime() {
		return mytime;
	}
	public void setMytime(int mytime) {
		this.mytime = mytime;
	}
	public int getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNewpw() {
		return newpw;
	}

	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}

	public String getConfpw() {
		return confpw;
	}

	public void setConfpw(String confpw) {
		this.confpw = confpw;
	}

	@Override
	public String toString() {
		return "ClientDTO [id=" + id + ", pw=" + pw + ", tel=" + tel + ", birth=" + birth + ", memo=" + memo
				+ ", totpri=" + totpri + ", totfood=" + totfood + ", mytime=" + mytime + ", seatnum=" + seatnum + "]";
	}
   
	
   
}