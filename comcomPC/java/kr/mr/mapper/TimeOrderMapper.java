package kr.mr.mapper;

import kr.mr.model.TimeOrderDTO;

public interface TimeOrderMapper {
	
	//등록
	public int timeinsert(TimeOrderDTO todto);
	
	//수정
	public int timeupdate(TimeOrderDTO todto);

}
