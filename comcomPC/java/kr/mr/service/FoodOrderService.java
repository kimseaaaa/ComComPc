package kr.mr.service;

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

}
