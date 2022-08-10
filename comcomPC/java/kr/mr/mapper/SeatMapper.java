package kr.mr.mapper;

import java.util.List;

import kr.mr.model.SeatDTO;

public interface SeatMapper {
	
	//전체 리스트
	public List<SeatDTO> getseatList();
	
	//고장 여부
	public int seatfix(SeatDTO sdto);
	public int seatfixOk(SeatDTO sdto);
	
	//점유 아이디 변경
	public int seatupdate(SeatDTO sdto);
	
	//해당 좌석번호 정보
	public SeatDTO getseatInfo(int seatnum);
	
	// 사이드바에서 점유좌석 수 
	public int ajaxSeatCnt();
	
	//점유된 좌석 정보 목록
	public List<SeatDTO> occupyList();	
	
	
}
