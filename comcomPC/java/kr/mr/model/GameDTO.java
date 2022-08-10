package kr.mr.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GameDTO {
   private int gcode; //게임코드
   private String gname; //게임명
   private String gcat; //카테고리
   private String gcomp; //유통사
   private String gimg; //이미지
   private MultipartFile filegimg; //이미지
   private String gfee; //유료 무료
   private Date gupdate; //업데이트일
   
   //////////////////////////// 
   public MultipartFile getFilegimg() {
      return filegimg;
   }

   public void setFilegimg(MultipartFile filegimg) {
      this.filegimg = filegimg;
   }
   //////////////////////////////
   
   public GameDTO() {}
   
   public int getGcode() {
      return gcode;
   }
   public void setGcode(int gcode) {
      this.gcode = gcode;
   }
   
   public String getGname() {
      return gname;
   }
   public void setGname(String gname) {
      this.gname = gname;
   }
   
   public String getGcat() {
      return gcat;
   }
   public void setGcat(String gcat) {
      this.gcat = gcat;
   }
   public String getGcomp() {
      return gcomp;
   }
   public void setGcomp(String gcomp) {
      this.gcomp = gcomp;
   }
   public String getGimg() {
      return gimg;
   }
   public void setGimg(String gimg) {
      this.gimg = gimg;
   }
   public String getGfee() {
      return gfee;
   }
   public void setGfee(String gfee) {
      this.gfee = gfee;
   }
   public Date getGupdate() {
      return gupdate;
   }
   public void setGupdate(Date gupdate) {
      this.gupdate = gupdate;
   }
   
   @Override
   public String toString() {
      return "GameDTO [gcode=" + gcode + ", gname=" + gname + ", gcat=" + gcat + ", gcomp=" + gcomp + ", gimg=" + gimg
            + ", gfee=" + gfee + ", gupdate=" + gupdate + "]";
   }
   
   



}