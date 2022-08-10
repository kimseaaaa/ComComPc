package kr.mr.mapper;

import java.util.List;

import kr.mr.model.GameNewDTO;
import kr.mr.model.GameRankDTO;


public interface GameNewMapper {
	
	//전체리스트
	public List<GameNewDTO> getgamenewList();
	
	//등록
	public int gamenewinsert(GameNewDTO gndto);
	
	//전체 삭제
	public int gamenewdelete();

}
