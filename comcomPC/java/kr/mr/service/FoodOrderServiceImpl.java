package kr.mr.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.ClientMapper;
import kr.mr.mapper.FoodMapper;
import kr.mr.mapper.FoodOrderMapper;
import kr.mr.model.ClientDTO;
import kr.mr.model.FoodDTO;
import kr.mr.model.FoodOrderDTO;

@Service
public class FoodOrderServiceImpl implements FoodOrderService{
	
	@Autowired
	private FoodMapper fmapper;
	
	@Autowired
	private FoodOrderMapper fomapper;
	
	@Autowired
	private ClientMapper cmapper;
	
	// Map<음식코드,음식주문DTO>:db저장전 음식 주문 받기
	private Map<Integer,FoodOrderDTO > focart; 
	
	//카트 초기화
	@Override
	public void newcart() {
		focart = new HashMap<Integer, FoodOrderDTO>();
	}
	
	//카트 가져오기
	@Override
	public Map<Integer, FoodOrderDTO> getfocart() {
		return focart;
	}
	
	//카트에 저장하기
	@Override
	public void cartadd(int fcode, ClientDTO cldto) {
		
		if(focart==null || focart.size()==0) {//focart에 아무것도 없을떄
			focart = new HashMap<Integer, FoodOrderDTO>();
			
			//음식주문 저장
			focart.put(fcode, storedto(fcode,cldto,1));
			
		}else {//focart에 값이 있을떄
				FoodOrderDTO fodto = focart.get(fcode);
				if(fodto==null) { // 저장된 음식 주문이 아니면 추가
					focart.put(fcode, storedto(fcode,cldto,1));
					
				}else {//저장된 음식이면 수량 증가!
					focart.replace(fcode, storedto(fcode,cldto,fodto.getFodqty()+1));
				}
		
		}
	}
	
	//foodorder에 값 저장하기!
	private FoodOrderDTO storedto(int fcode,ClientDTO cldto ,int fodqty) {
		
		FoodOrderDTO fodto = new FoodOrderDTO();
		FoodDTO fdto = fmapper.FoodView(fcode);//주문한 음식정보
		
		fodto.setFodid(cldto.getId()); //주문자 id
		fodto.setFodpri(fdto.getFpri()*fodqty); // 주문 금액
		fodto.setFcode(fcode); // 주문 음식 코드
		fodto.setFodqty(fodqty); //주문 수량
		fodto.setSeatnum(cldto.getSeatnum()); //주문자 위치
		fodto.setFname(fdto.getFname());//주문한 음식명
		fodto.setFodcode(3);
		
		return fodto;
	}
	
	//카트에서 지우기
	@Override
	public void cartdelete(int fcode) {
		focart.remove(fcode);
	}
	
	//카트에서 수량 줄이기
	@Override
	public void cartminus(int fcode, ClientDTO cldto) {
		FoodOrderDTO fodto = focart.get(fcode);
		if(fodto.getFodqty()-1 >0) {
			focart.replace(fcode, storedto(fcode,cldto,fodto.getFodqty()-1));
		}else {
			cartdelete(fcode);
		}
	}
	
	//cart db 저장
	@Override
	public void cartInsert(ClientDTO cldto) {
		Collection<FoodOrderDTO> fodtolist = focart.values();
		int totfood=cldto.getTotfood();
		for(FoodOrderDTO fodto : fodtolist) {
			totfood+= fodto.getFodpri();
			fomapper.cartInsert(fodto);
		}
		cldto.setTotfood(totfood);
		cldto.setTotpri(totfood+cldto.getTotpri());
		cmapper.clFPUpdate(cldto);
	}
	
	//처리가 안된 리스트 가져오기
	@Override
	public List<FoodOrderDTO> folist() {
		return fomapper.folist();
	}
	
	//주문 전달완료처리
	@Override
	public int orderOk(int fodcode) {
		return fomapper.orderOk(fodcode);
	}
	
	//처리된 리스트 가져오기
	@Override
	public List<FoodOrderDTO> endfolist() {
		return fomapper.endfolist();
	}
	
	//좌석번호로 검색
	@Override
	public List<FoodOrderDTO> seatnumSFOList(int seatnum) {
		return fomapper.seatnumSFOList(seatnum);
	}
	
	//아이디로 검색
	@Override
	public List<FoodOrderDTO> idSFOList(String fodid) {
		return fomapper.idSFOList(fodid);
	}

}
