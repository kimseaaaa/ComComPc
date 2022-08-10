package kr.mr.service;

import java.util.List;

import kr.mr.model.GameDTO;

public interface GameService {
	//전체 리스트 
	public List<GameDTO> getList();
	//등록
	public int insert(GameDTO gdto);
	//삭제
	public int delete(int gcode);
	//수정
	public int update(GameDTO gdto);
	//해당 코드의 게임 가져오기
	public GameDTO getgame(int gcode);

}

