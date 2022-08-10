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
	public List<GameDTO> getList() {
		return mapper.getList();
	}
	
	@Override
	public int insert(GameDTO gdto) {
		return mapper.insert(gdto);
	}
	
	@Override
	public int delete(int gcode) {
		return mapper.delete(gcode);
	}
	
	@Override
	public int update(GameDTO gdto) {
		return mapper.update(gdto);
	}
	
	@Override
	public GameDTO getgame(int gcode) {
		return mapper.getgame(gcode);
	}

}
