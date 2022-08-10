package kr.mr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.TimeOrderMapper;
import kr.mr.model.TimeOrderDTO;

@Service
public class TimeOrderServiceImpl implements TimeOrderService{
	
	@Autowired
	private TimeOrderMapper mapper;
	
	private int remainingMyTime;
	
	// 등록
	@Override
	public int timeinsert(TimeOrderDTO todto) {
		
		return mapper.timeinsert(todto);
	}

	//수정
	@Override
	public int timeupdate(TimeOrderDTO todto) {
		
		return mapper.timeupdate(todto);
	}
	
	//남은 시간 가져오기
	@Override
	public int remainingMyTime() {
		return remainingMyTime;
	}
	
	//남은 시간 등록하기
	@Override
	public void puyMyTime(int mytime) {
		remainingMyTime = mytime;
	}

	

}
