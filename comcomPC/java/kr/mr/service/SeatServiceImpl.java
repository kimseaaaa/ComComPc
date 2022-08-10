package kr.mr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.SeatMapper;
import kr.mr.model.SeatDTO;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatMapper mapper;
	
	@Override
	public int fixseat(SeatDTO sdto) {
		return mapper.seatfix(sdto);
	}
	@Override
	public int fixseatOk(SeatDTO sdto) {
		return mapper.seatfixOk(sdto);
	}
	
	@Override
	public SeatDTO infoseat(int seatnum) {
		return mapper.getseatInfo(seatnum);
	}
	
	@Override
	public List<SeatDTO> listseat() {
		return mapper.getseatList();
	}
	
	@Override
	public int updateseat(SeatDTO sdto) {
		return mapper.seatupdate(sdto);
	}
	// 사이드바에서 점유좌석 수 
	@Override
	public int ajaxSeatCnt() {

		return mapper.ajaxSeatCnt();
	}
}
