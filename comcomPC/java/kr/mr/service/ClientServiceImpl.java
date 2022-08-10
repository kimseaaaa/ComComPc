package kr.mr.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.ClientMapper;
import kr.mr.model.ClientDTO;

@Service
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientMapper mapper;
	//전체
	@Override
	public List<ClientDTO> clgetList() {
		return mapper.clgetList();
	}
	//등록
	@Override
	public int clinsert(ClientDTO cldto) {
		System.out.println(cldto.toString());
		
		return mapper.clinsert(cldto);
	}
	//삭제
	@Override
	public int cldelete(String id) {
		return mapper.cldelete(id);
	}
	
	//수정
	@Override
	public int clupdate(ClientDTO cldto) {
		return mapper.clupdate(cldto);
	}
	
	@Override
	public ClientDTO getclient(String id) {
		return mapper.getclient(id);
	}
	
	//마이페이지 수정
	@Override
	public int myupdate(ClientDTO cldto) {
		return mapper.myupdate(cldto);
	}
	
	//검색
	@Override
	public List<ClientDTO> clsearch(String keyword) {
		return mapper.clsearch(keyword);
	}
	//비밀번호 초기화
	@Override
	public int clreset(ClientDTO cldto) {
		return mapper.clreset(cldto);
	}
	
	@Override
	public ClientDTO clientLogin(ClientDTO cldto) {
		return mapper.clientLogin(cldto);
	}
	
	//회원 전체 아이디 조회
	@Override
	public List<String> clientIdList() {
		return mapper.clientIdList();
	}
	
	//난수좌석 함수
	public int randomseat(ClientDTO cldto) {
		
		int num = 0;
		
		while(true) {
			num = (int) ((Math.random()*70)+1);
			if(mapper.seatDbChk(num) == 0) break;
		}
	
		System.out.println("numttt : " + num);		
		
		// 난수 DB 충돌 시 어떻게 할지 생각해보기!
		// 좌석번호가 DB에 존재하는지 확인하는 sql 
		// return 1, 0 
		// if( 00 == 1) 난수발생 로직 실행
		// RETURN 0 
		//sql 호출 , 00 고객이 00 자리를 점유 

		cldto.setSeatnum(num); // 좌석 난수 세팅
		
		return mapper.randomseat(cldto);
	}

	// 로그아웃
	@Override
	public int clientLogout(ClientDTO cldto) {
		return mapper.clientLogout(cldto);
	}
	@Override
	public int clientLogout2(ClientDTO cldto) {
		return mapper.clientLogout2(cldto);
	}	


}		
		
