package kr.mr.service;

import java.util.List;

import kr.mr.model.SeatDTO;

public interface SeatService {
	//전체리스트
	public List<SeatDTO> listseat();
	
	//고장여부 변경
	public int fixseat(SeatDTO sdto);
	public int fixseatOk(SeatDTO sdto);
	
	//점유 아이디 변경
	public int updateseat(SeatDTO sdto);
	
	//해당좌석번호 정보
	public SeatDTO infoseat(int seatnum);
	
	// 사이드바에서 점유좌석 수 
	public int ajaxSeatCnt();
}
