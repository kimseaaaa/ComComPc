package kr.mr.mapper;

import java.util.List;

import kr.mr.model.GameDTO;
import kr.mr.model.GameRankDTO;


public interface GameRankMapper {
	
	//전체리스트
	public List<GameRankDTO> getgamerankList();
	
	//등록
	public int gamerankinsert(GameRankDTO grdto);
	
	//갱신
	public int gamerankdelete();

}
