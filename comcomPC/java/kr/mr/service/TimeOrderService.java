package kr.mr.service;

import kr.mr.model.TimeOrderDTO;

public interface TimeOrderService {

	//등록
	public int timeinsert(TimeOrderDTO todto);

	//수정
	public int timeupdate(TimeOrderDTO todto);
	
	//남은 시간 가져오기
	public int remainingMyTime();
	
	//남은 시간 등록하기
	public void puyMyTime(int mytime);
	
}
