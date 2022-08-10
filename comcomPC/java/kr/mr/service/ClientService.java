package kr.mr.service;

import java.util.List;

import kr.mr.model.ClientDTO;
import kr.mr.model.GameDTO;

public interface ClientService {
	//전체 리스트 
	public List<ClientDTO> clgetList();
	
	//등록
	public int clinsert(ClientDTO cldto);
	
	//삭제
	public int cldelete(String id);
	
	//수정
	public int clupdate(ClientDTO cldto);
	
	//해당 아이디의 고객 가져오기
	public ClientDTO getclient(String id);
	
	//마이페이지 수정
	public int myupdate(ClientDTO cldto);
	
	//검색
	public List<ClientDTO> clsearch(String keyword);
	
	//비밀번호 초기화
	public int clreset(ClientDTO cldto);
	
	//로그인
	public ClientDTO clientLogin(ClientDTO cldto);
	
	//난수좌석 함수
	public int randomseat(ClientDTO cldto);
	
	// 로그아웃
	public int clientLogout(ClientDTO cldto);
	public int clientLogout2(ClientDTO cldto);	
	
	//회원 전체 아이디 조회
	public List<String> clientIdList();

}

