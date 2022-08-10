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
	
	//메뉴 전체 리스트
	@Override
	public List<FoodDTO> FoodList() {
		return mapper.FoodList();
	}
	
	//메뉴 추가
	@Override
	public int FoodAdd(FoodDTO fDto) {
		return mapper.FoodAdd(fDto);
	}
	
	//메뉴 삭제
	@Override
	public int FoodDelete(int fcode) {
		return mapper.FoodDelete(fcode);
	}
	
	//메뉴 정보 조회
	@Override
	public FoodDTO FoodView(int fcode) {
		return mapper.FoodView(fcode);
	}

	//메뉴 정보 수정
	@Override
	public int FoodUpdate(FoodDTO fDto) {
		return mapper.FoodUpdate(fDto);
	}
	
	//메뉴 Best 리스트
	@Override
	public List<FoodDTO> FoodBestList() {
		return mapper.FoodBestList();
	}
	
	//메뉴 검색 결과
	@Override
	public List<FoodDTO> FoodSearchList(String keyword) {
		return mapper.FoodSearchList(keyword);
	}

}
