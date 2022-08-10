package kr.mr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.GameMapper;
import kr.mr.model.GameDTO;

@Service
public class GameServiceImpl implements GameService{
	
	@Autowired
	private GameMapper mapper;
	
	@Override
	public List<GameDTO> getgameList() {
		return mapper.getgameList();
	}
	
	@Override
	public int gameinsert(GameDTO gdto) {
		return mapper.gameinsert(gdto);
	}
	
	@Override
	public int gamedelete(int gcode) {
		return mapper.gamedelete(gcode);
	}
	
	@Override
	public int gameupdate(GameDTO gdto) {
//		System.out.println("mapper : "+gdto.toString());
		return mapper.gameupdate(gdto);
	}
	
	@Override
	public GameDTO getgame(int gcode) {
		return mapper.getgame(gcode);
	}
	
	@Override
	public List<GameDTO> gamesearch(String gname) {
		return mapper.gamesearch(gname);
	}
	

}
