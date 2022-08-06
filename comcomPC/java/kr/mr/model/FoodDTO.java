package kr.mr.model;

public class FoodDTO {
	
	private int fcode;
	private String fname;
	private String fcat;
	private int fpri;
	private String fimg;
	private int fbest;
	private String keyword;//검색 키워드
	
	//기본생성자
	public FoodDTO() {}
	
	//List 조회 
	public FoodDTO(int fcode, String fname, String fcat, int fpri, String fimg) {
		super();
		this.fcode = fcode;
		this.fname = fname;
		this.fcat = fcat;
		this.fpri = fpri;
		this.fimg = fimg;
	}

	//음식 추가 생성자 
	public FoodDTO(String fname, String fcat, int fpri, String fimg) {
		super();
		this.fname = fname;
		this.fcat = fcat;
		this.fpri = fpri;
		this.fimg = fimg;
	}

	public int getFcode() {
		return fcode;
	}

	public void setFcode(int fcode) {
		this.fcode = fcode;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFcat() {
		return fcat;
	}

	public void setFcat(String fcat) {
		this.fcat = fcat;
	}

	public int getFpri() {
		return fpri;
	}

	public void setFpri(int fpri) {
		this.fpri = fpri;
	}

	public String getFimg() {
		return fimg;
	}

	public void setFimg(String fimg) {
		this.fimg = fimg;
	}
	
	public int getFbest() {
		return fbest;
	}

	public void setFbest(int fbest) {
		this.fbest = fbest;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "FoodDTO [fcode=" + fcode + ", fname=" + fname + ", fcat=" + fcat + ", fpri=" + fpri + ", fimg=" + fimg
				+ "]";
	}
}
