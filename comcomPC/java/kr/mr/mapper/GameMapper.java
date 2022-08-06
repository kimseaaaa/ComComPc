package kr.mr.mapper;

import java.util.List;

import kr.mr.model.GameDTO;


public interface GameMapper {
	
	//전체 리스트 
	public List<GameDTO> getgameList();
	
	//등록
	public int gameinsert(GameDTO gdto);
	
	//삭제
	public int gamedelete(int gcode);
	
	//수정
	public int gameupdate(GameDTO gdto);
	
	//해당 코드의 게임 가져오기
	public GameDTO getgame(int gcode);
	
	//게임명으로 게임찾기
	public List<GameDTO> gamesearch(String gname);

}
