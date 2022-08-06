package kr.mr.service;

import java.util.List;

import kr.mr.model.FoodDTO;

public interface FoodService {
	
	//메뉴 전체 리스트
	public List<FoodDTO> FoodList(); 
	
	//메뉴 추가
	public int FoodAdd(FoodDTO fDto);
	
	//메뉴 삭제
	public int FoodDelete(int fcode);
	
	//메뉴 정보 조회
	public FoodDTO FoodView(int fcode);
	
	//메뉴 정보 수정
	public int FoodUpdate(FoodDTO fDto);
	
	//메뉴 Best 리스트
	public List<FoodDTO> FoodBestList();
	
	//메뉴 검색 결과
	public List<FoodDTO> FoodSearchList(String keyword);
}
