package kr.mr.mapper;

import java.util.List;

import kr.mr.model.FoodOrderDTO;

public interface FoodOrderMapper {
	
	//cart db 저장
	public void cartInsert(FoodOrderDTO fodto);
	
	//처리가 안된 리스트 가져오기
	public List<FoodOrderDTO> folist();
	
	//주문 전달완료처리
	public int orderOk(int fodcode);

	//처리된 리스트 가져오기
	public List<FoodOrderDTO> endfolist();
	
	//좌석번호로 검색
	public List<FoodOrderDTO> seatnumSFOList(int seatnum);
	
	//아이디로 검색
	public List<FoodOrderDTO> idSFOList(String fodid);

}
