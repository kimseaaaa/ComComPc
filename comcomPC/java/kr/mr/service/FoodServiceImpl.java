package kr.mr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.FoodMapper;
import kr.mr.model.FoodDTO;

@Service
public class FoodServiceImpl implements FoodService{
	
	@Autowired
	private FoodMapper mapper;
	
	@Override
	public List<FoodDTO> FoodList() {
		return mapper.FoodList();
	}
	
	@Override
	public int FoodAdd(FoodDTO fDto) {
		return mapper.FoodAdd(fDto);
	}
	
	@Override
	public int FoodDelete(int fcode) {
		return mapper.FoodDelete(fcode);
	}
	
	@Override
	public FoodDTO FoodView(int fcode) {
		return mapper.FoodView(fcode);
	}

	@Override
	public int FoodUpdate(FoodDTO fDto) {
		return mapper.FoodUpdate(fDto);
	}
	
	@Override
	public List<FoodDTO> FoodBestList() {
		return mapper.FoodBestList();
	}
	
	@Override
	public List<FoodDTO> FoodSearchList(String keyword) {
		return mapper.FoodSearchList(keyword);
	}

}
