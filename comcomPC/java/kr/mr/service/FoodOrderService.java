package kr.mr.service;

import java.util.List;
import java.util.Map;

import kr.mr.model.ClientDTO;
import kr.mr.model.FoodOrderDTO;

public interface FoodOrderService {
	
	//카트 초기화
	public void newcart();
	
	//카트 가져오기
	public Map<Integer,FoodOrderDTO> getfocart();
	
	//카트에 저장하기
	public void cartadd(int fcode, ClientDTO cldto);
	
	//카트에서 지우기
	public void cartdelete(int fcode);
	
	//카트에서 수량 줄이기
	public void cartminus(int fcode, ClientDTO cldto);
	
	//DB에 저장하기
	public void cartInsert(ClientDTO cldto);
	
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
